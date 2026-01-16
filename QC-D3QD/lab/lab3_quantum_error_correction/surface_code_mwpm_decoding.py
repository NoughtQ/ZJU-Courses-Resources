import math
import time
import stim
import pymatching
import numpy as np
import networkx as nx
import matplotlib.pyplot as plt

class ManualMWPMDecoder:
    """
    Realize MWPM decoder with networkx step by step.
    """
    
    def __init__(self, dem: stim.DetectorErrorModel):
        self.g = nx.Graph()
        self.boundary_node = -1  # Node index for virtual boundary nodes.
        self._parse_dem_to_graph(dem)

    def _parse_dem_to_graph(self, dem: stim.DetectorErrorModel):
        """
        Parse DEM instruction of stim to construct the decoding groph.
        """
        flat_dem = dem.flattened()
        for instruction in flat_dem:
            if instruction.type == "error":
                args = instruction.args_copy()
                p = args[0]
                if p == 0:
                    continue
                weight = -math.log(p) if p > 1e-15 else 1000.0
                detectors = []
                observables = 0 
                for t in instruction.targets_copy():
                    if t.is_relative_detector_id():
                        detectors.append(t.val)
                    elif t.is_logical_observable_id(): 
                        observables ^= (1 << t.val)
                if len(detectors) == 2:
                    u, v = detectors[0], detectors[1]
                    self._add_edge_if_smaller(u, v, weight, observables)
                elif len(detectors) == 1:
                    u = detectors[0]
                    self._add_edge_if_smaller(u, self.boundary_node, weight, observables)

    def _add_edge_if_smaller(self, u, v, weight, observables):
        if self.g.has_edge(u, v):
            if self.g[u][v]['weight'] > weight:
                self.g[u][v]['weight'] = weight
                self.g[u][v]['observables'] = observables
        else:
            self.g.add_edge(u, v, weight=weight, observables=observables)

    def decode(self, detection_events: np.ndarray) -> np.ndarray:
        """
        # TODO: complete the function to decode the physical error.
        """
        num_shots = detection_events.shape[0]
        predictions = np.zeros((num_shots, 1), dtype=bool)
        # Cache for shortest paths map node -> (dists, paths)
        path_cache = {}
        # print(f"  [DEBUG] Starting decoding for {num_shots} shots...")
        # t_start = time.time()
        for i in range(num_shots):
            # if (i + 1) % 100 == 0:
            #      print(f"  [DEBUG] Processing shot {i + 1}/{num_shots} (Defects: {len(np.flatnonzero(detection_events[i]))})... Time elapsed: {time.time() - t_start:.2f}s")
            # 1. Fetch the defects
            defects = np.flatnonzero(detection_events[i])
            if len(defects) == 0:
                continue
            defect_list = list(defects)
            n_defects = len(defect_list)
            
            # 2. Calculate paths between defects
            min_distances = {} # distances between u and v in min_distances[u][v]
            shortest_paths = {} # paths between u and v in shortest_paths[u][v]
            for u in defect_list:
                if u not in self.g:
                    # set paths as empty, if the defect is isolated
                    min_distances[u] = {}
                    shortest_paths[u] = {}
                else:
                    # TODO: calculate the single-source shortest paths
                    if u in path_cache:
                         dists, paths = path_cache[u]
                    else:
                         dists, paths = nx.single_source_dijkstra(self.g, source=u, weight='weight')
                         path_cache[u] = (dists, paths)
                    min_distances[u] = dists
                    shortest_paths[u] = paths

            # 3. Construct matching graph
            matching_graph = nx.Graph()
            LARGE_CONST = 10000.0 
            for idx_i, u in enumerate(defect_list):
                # Edge type 1: defect to boundary
                # defect u is matched to the boundary and linked to u_ghost
                u_ghost = f"ghost_{u}"
                if u in min_distances and self.boundary_node in min_distances[u]:
                    w_boundary = min_distances[u][self.boundary_node]
                    matching_graph.add_edge(u, u_ghost, weight=LARGE_CONST-w_boundary)
                # Edge type 2: boundary to boundary
                for idx_j in range(idx_i + 1, n_defects):
                    v = defect_list[idx_j]
                    v_ghost = f"ghost_{v}"
                    matching_graph.add_edge(u_ghost, v_ghost, weight=LARGE_CONST)
                    # Edge type 3: defect to defect
                    if u in min_distances and v in min_distances[u]:
                         # TODO: add edge between u and v to the graph
                        w_uv = min_distances[u][v]
                        matching_graph.add_edge(u, v, weight=LARGE_CONST-w_uv)

            # 4. Perform maximum weight perfect matching
            matches = nx.max_weight_matching(matching_graph, maxcardinality=True)
            
            # 5. Determine the logic error
            predicted_flip = 0
            for node1, node2 in matches:
                # skip the boundary to boundary edge
                if isinstance(node1, str) and isinstance(node2, str):
                    continue
                start, end = None, None
                if isinstance(node1, str): # node1 is boundary
                    # defect to boundary edge
                    start = node2
                    end = self.boundary_node
                elif isinstance(node2, str): # node2 is boundary
                    # defect to boundary edge
                    start = node1
                    end = self.boundary_node
                else:
                    # defect to defect edge
                    start = node1
                    end = node2
                # calculate observables
                if start in shortest_paths and end in shortest_paths[start]:
                    path = shortest_paths[start][end]
                    for k in range(len(path) - 1):
                        u_node, v_node = path[k], path[k+1]
                        edge_data = self.g[u_node][v_node]
                        predicted_flip ^= edge_data['observables']
            predictions[i, 0] = (predicted_flip & 1)
        return predictions

def test_manual_decoder(d: int, p: float, num_shots: int) -> float:
    # 1. Construct circuit of surface code with physical error
    circuit = stim.Circuit.generated(
        "surface_code:rotated_memory_z",
        rounds=d,
        distance=d,
        after_clifford_depolarization=p,
        after_reset_flip_probability=p,
        before_measure_flip_probability=p,
        before_round_data_depolarization=p
    )

    # 2. Fetch DEM
    dem = circuit.detector_error_model()

    # 3. Initialize the decoder
    decoder = ManualMWPMDecoder(dem)

    # 4. Sample the syndrome
    sampler = circuit.compile_detector_sampler()
    detection_events, actual_flips = sampler.sample(shots=num_shots, separate_observables=True)

    # 5. Decode the error
    # print(f"  [DEBUG] Sampling finished. detection_events shape: {detection_events.shape}")
    predicted_flips = decoder.decode(detection_events)

    # 6. Calculate logical error rate (LER)
    num_errors = np.sum(np.any(predicted_flips != actual_flips, axis=1))
    return num_errors / num_shots

def test_pymatching_decoder(d: int, p: float, num_shots: int) -> float:
    # 1. Construct circuit of surface code with physical error
    circuit = stim.Circuit.generated(
        "surface_code:rotated_memory_z",
        rounds=d,
        distance=d,
        after_clifford_depolarization=p,
        after_reset_flip_probability=p,
        before_measure_flip_probability=p,
        before_round_data_depolarization=p
    )

    # 2. Fetch DEM
    dem = circuit.detector_error_model()

    # 3. Initialize the decoder
    matcher = pymatching.Matching.from_detector_error_model(dem)

    # 4. Sample the syndrome
    sampler = circuit.compile_detector_sampler()
    detection_events, actual_flips = sampler.sample(shots=num_shots, separate_observables=True)

    # 5. Decode the error
    predicted_flips = matcher.decode_batch(detection_events)

    # 6. Calculate logical error rate (LER)
    num_errors = np.sum(np.any(predicted_flips != actual_flips, axis=1))
    return num_errors / num_shots

def main():
    distances = [3, 5, 7]
    physical_error_rates = np.linspace(0.001, 0.008, 8)
    num_shots = 500

    manual_results = {}
    pymatching_results = {}
    print("-" * 60)
    for d in distances:
        print(f"Simulating code distance of {d} ...")
        manual_lers = []
        pymatching_lers = []
        t0 = time.time()
        for p in physical_error_rates:
            manual_ler = test_manual_decoder(d, p, num_shots)
            manual_lers.append(manual_ler)
            pymatching_ler = test_pymatching_decoder(d, p, num_shots)
            pymatching_lers.append(pymatching_ler)
            print(f"Given physical error rate of {p:.4f}, LER of manual decoder is {manual_ler:.5f}, LER of pymatching decoder is {pymatching_ler:.5f}")
        manual_results[d] = manual_lers
        pymatching_results[d] = pymatching_lers
        print(f"Completed code distance of {d} within {time.time()-t0:.2f}s")
        print("-" * 60)

    fig, axes = plt.subplots(1, 2, figsize=(16, 6))

    ax = axes[0]
    for d in distances:
        ax.plot(physical_error_rates, manual_results[d], marker='o', label=f'd={d}')
    ax.set_yscale('log')
    ax.set_xlabel('Physical Error Rate')
    ax.set_ylabel('Logical Error Rate (LER)')
    ax.set_title('Manual MWPM Decoder')
    ax.grid(True, which="both", ls="-", alpha=0.4)
    ax.legend()
    
    ax = axes[1]
    for d in distances:
        ax.plot(physical_error_rates, pymatching_results[d], marker='o', label=f'd={d}')
    ax.set_yscale('log')
    ax.set_xlabel('Physical Error Rate')
    ax.set_title('Pymatching MWPM Decoder')
    ax.grid(True, which="both", ls="-", alpha=0.4)
    ax.legend()

    plt.tight_layout()
    plt.savefig("decode_ler.png")

if __name__ == "__main__":
    main()

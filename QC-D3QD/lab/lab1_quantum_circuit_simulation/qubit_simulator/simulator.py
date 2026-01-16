import numpy as np
import matplotlib.pyplot as plt
from collections import Counter
from sys import getsizeof
from typing import Optional, List, Tuple, Dict
from .gates import Gates


class QubitSimulator:
    """
    A class that represents a qubit simulator.
    """

    def __init__(self, num_qubits: int):
        """
        Initialize the simulator with given number of qubits.

        :param num_qubits: Number of qubits.
        :raises ValueError: If the number of qubits is negative.
        """
        if num_qubits < 0:
            raise ValueError("Number of qubits must be non-negative.")

        self.num_qubits = num_qubits
        self.state_vector = np.zeros(2**num_qubits, dtype=complex)
        self.state_vector[0] = 1
        self.circuit: List[Tuple[str, int, Optional[int]]] = []

    def _validate_qubit_index(
        self, target_qubit: int, control_qubit: Optional[int] = None
    ):
        """
        Validates the qubit indices.

        :param target_qubit: Index of the target qubit to validate.
        :param control_qubit: Index of the control qubit to validate.
        :raises IndexError: If the qubit index is out of range.
        """
        if target_qubit < 0 or target_qubit >= self.num_qubits:
            raise IndexError(f"Target qubit index {target_qubit} out of range.")
        if control_qubit is not None and (
            control_qubit < 0 or control_qubit >= self.num_qubits
        ):
            raise IndexError(f"Control qubit index {control_qubit} out of range.")

    def _get_gate_name(
        self, theta: float, phi: float, lambda_: float, inverse: bool
    ) -> str:
        """
        Constructs the name for a U gate or its inverse.

        :param theta: Angle theta.
        :param phi: Angle phi.
        :param lambda_: Angle lambda.
        :param inverse: Whether the gate is an inverse.
        :return: String representing the gate name.
        """
        return f"U{'†' if inverse else ''}({theta:.2f}, {phi:.2f}, {lambda_:.2f})"

    def _apply_gate(
        self,
        gate_name: str,
        gate: np.ndarray,
        target_qubit: int,
        control_qubit: Optional[int] = None,
    ):
        """
        Applies the given gate to the target qubit.

        :param gate_name: Name of the gate.
        :param gate: Matrix representing the gate.
        :param target_qubit: Index of the target qubit.
        :param control_qubit: Index of the control qubit (if controlled gate).
        """
        # Validate the target and control qubit indices
        self._validate_qubit_index(target_qubit, control_qubit)
        # Validate the gate
        Gates._validate_gate(gate)
        if control_qubit is not None:
            operator = Gates.create_controlled_gate(
                gate, control_qubit, target_qubit, self.num_qubits
            )
        else:
            operator = np.eye(1)
            for qubit in range(self.num_qubits):
                operator = np.kron(
                    operator,
                    gate if qubit == target_qubit else np.eye(2),
                )
        self.state_vector = operator @ self.state_vector
        self.circuit.append((gate_name, target_qubit, control_qubit))

    def h(self, target_qubit: int):
        """
        Applies Hadamard gate to the target qubit.

        :param target_qubit: Index of the target qubit.
        """
        self._apply_gate("H", Gates.H, target_qubit)

    def t(self, target_qubit: int):
        """
        Applies π/8 gate to the target qubit.

        :param target_qubit: Index of the target qubit.
        """
        self._apply_gate("T", Gates.T, target_qubit)

    def x(self, target_qubit: int):
        """
        Applies Not gate to the target qubit.

        :param target_qubit: Index of the target qubit.
        """
        self._apply_gate("X", Gates.X, target_qubit)

    def cx(self, control_qubit: int, target_qubit: int):
        """
        Applies Controlled-Not gate to the target qubit.

        :param control_qubit: Index of the control qubit.
        :param target_qubit: Index of the target qubit.
        """
        self._apply_gate("X", Gates.X, target_qubit, control_qubit)

    def u(
        self,
        target_qubit: int,
        theta: float,
        phi: float,
        lambda_: float,
        inverse: Optional[bool] = False,
    ):
        """
        Applies Generic gate to the target qubit.

        :param target_qubit: Index of the target qubit.
        :param theta: Angle theta.
        :param phi: Angle phi.
        :param lambda_: Angle lambda.
        :param inverse: Whether to apply the inverse of the gate.
        """
        gate = (
            Gates.create_inverse_gate(Gates.U(theta, phi, lambda_))
            if inverse
            else Gates.U(theta, phi, lambda_)
        )
        self._apply_gate(
            self._get_gate_name(theta, phi, lambda_, inverse), gate, target_qubit
        )

    def cu(
        self,
        control_qubit: int,
        target_qubit: int,
        theta: float,
        phi: float,
        lambda_: float,
        inverse: Optional[bool] = False,
    ):
        """
        Applies Controlled-Generic gate to the target qubit.

        :param control_qubit: Index of the control qubit.
        :param target_qubit: Index of the target qubit.
        :param theta: Angle theta.
        :param phi: Angle phi.
        :param lambda_: Angle lambda.
        :param inverse: Whether to apply the inverse of the gate.
        """
        gate = (
            Gates.create_inverse_gate(Gates.U(theta, phi, lambda_))
            if inverse
            else Gates.U(theta, phi, lambda_)
        )
        self._apply_gate(
            self._get_gate_name(theta, phi, lambda_, inverse),
            gate,
            target_qubit,
            control_qubit,
        )

    def measure(self, shots: int = 1, basis: Optional[np.ndarray] = None) -> List[str]:
        """
        Measures the state of the qubits.

        :param shots: Number of measurements.
        :param basis: Optional basis transformation.
        :return: List of measurement results.
        :raises ValueError: If the number of shots is negative.
        """
        if shots < 0:
            raise ValueError("Number of shots must be non-negative.")
        if basis is not None:
            Gates._validate_gate(basis)
            state_vector = basis @ self.state_vector
        else:
            state_vector = self.state_vector
        probabilities = np.abs(state_vector) ** 2
        counts = np.round(probabilities * shots).astype(int)
        unique_states = [format(i, f"0{self.num_qubits}b") for i in range(len(counts))]
        results = [
            state for state, count in zip(unique_states, counts) for _ in range(count)
        ]
        diff = sum(counts) - shots
        if diff > 0:
            idx_to_remove = np.random.choice(len(results))
            results.pop(idx_to_remove)
        elif diff < 0:
            idx_to_add = np.random.choice(len(counts), p=probabilities)
            results.append(format(idx_to_add, f"0{self.num_qubits}b"))
        return results

    def run(
        self, shots: int = 100, basis: Optional[np.ndarray] = None
    ) -> Dict[str, int]:
        """
        Runs the simulation and returns measurement results.

        :param shots: Number of measurements.
        :param basis: Optional basis transformation.
        :return: Dictionary of measurement results.
        """
        results = self.measure(shots, basis)
        return dict(Counter(results))

    def reset(self):
        """
        Resets the simulator to its initial state.
        """
        self.__init__(self.num_qubits)

    def plot_wavefunction(self):
        """
        Plots the wavefunction's amplitude and phase using a phase circle plot.
        """
        amplitude = np.abs(self.state_vector)
        phase = np.angle(self.state_vector)
        labels = [
            format(i, f"0{self.num_qubits}b") for i in range(len(self.state_vector))
        ]
        fig, ax = plt.subplots()
        ax.set_aspect("equal", "box")
        for i, (amp, phi) in enumerate(zip(amplitude, phase)):
            x = amp * np.cos(phi)
            y = amp * np.sin(phi)
            ax.scatter(x, y)
            ax.annotate(
                labels[i],
                (x, y),
                textcoords="offset points",
                xytext=(0, 10),
                ha="center",
            )
        ax.set_xlim(-1.1, 1.1)
        ax.set_ylim(-1.1, 1.1)
        ax.axhline(0, color="black", linewidth=0.5)
        ax.axvline(0, color="black", linewidth=0.5)
        plt.title("Amplitude and Phase of Quantum States")
        plt.xlabel("Real Component (Cosine of Phase * Amplitude)")
        plt.ylabel("Imaginary Component (Sine of Phase * Amplitude)")
        plt.show()

    def __str__(self) -> str:
        """
        Returns a string representation of the circuit.

        :return: String representing the circuit.
        """
        separator_length = sum(
            (len(gate_name) + 3 for gate_name, _, _ in self.circuit), 1
        )
        lines = ["-" * separator_length]
        qubit_lines = [["|"] for _ in range(self.num_qubits)]
        for gate_name, target_qubit, control_qubit in self.circuit:
            gate_name_length = len(gate_name)
            gate_name_str = f" {gate_name} ".center(gate_name_length + 2, " ")
            for i in range(self.num_qubits):
                if control_qubit == i:
                    qubit_lines[i].append(" @ ".center(gate_name_length + 2, " "))
                elif target_qubit == i:
                    qubit_lines[i].append(gate_name_str)
                else:
                    qubit_lines[i].append(" " * (gate_name_length + 2))
                qubit_lines[i].append("|")
        lines += ["".join(line) for line in qubit_lines]
        lines += ["-" * separator_length]
        return "\n".join(lines)

    def __getsize__(self) -> int:
        """
        Returns the total memory size of the instance.

        :return: Total memory size in bytes.
        """
        return getsizeof(self) + sum(map(getsizeof, self.__dict__.values()))

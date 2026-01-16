package com.neuroflow.io;

import com.google.gson.Gson;
import com.neuroflow.structure.ComputationalGraph;
import com.neuroflow.structure.Node;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class GraphLoader {

    public static ComputationalGraph load(String filePath) throws IOException {
        Gson gson = new Gson();
        try (FileReader reader = new FileReader(filePath)) {
            GraphDefinition def = gson.fromJson(reader, GraphDefinition.class);
            return buildGraph(def);
        }
    }

    private static ComputationalGraph buildGraph(GraphDefinition def) {
        ComputationalGraph graph = new ComputationalGraph(def.getGraphId());

        // Add nodes
        for (Node node : def.getNodes()) {
            if (graph.getNode(node.getId()) != null) {
                throw new IllegalArgumentException("Duplicate node ID: " + node.getId());
            }
            graph.addNode(node);
        }

        // Add edges
        if (def.getEdges() != null) {
            for (GraphDefinition.EdgeDefinition edge : def.getEdges()) {
                Node from = graph.getNode(edge.getFrom());
                Node to = graph.getNode(edge.getTo());

                if (from == null) {
                    throw new IllegalArgumentException("Unknown source node: " + edge.getFrom());
                }
                if (to == null) {
                    throw new IllegalArgumentException("Unknown target node: " + edge.getTo());
                }

                from.addOutgoingEdge(to.getId());
                to.addIncomingEdge(from.getId());
            }
        }

        checkCycles(graph);

        return graph;
    }

    private static void checkCycles(ComputationalGraph graph) {
        Set<String> visited = new HashSet<>();
        Set<String> recursionStack = new LinkedHashSet<>();

        for (Node node : graph.getNodes()) {
            hasCycle(node, graph, visited, recursionStack);
        }
    }

    private static void hasCycle(Node node, ComputationalGraph graph, Set<String> visited,
            Set<String> recursionStack) {
        String id = node.getId();
        if (recursionStack.contains(id)) {
            // Cycle detected. Reconstruct path.
            List<String> cyclePath = new ArrayList<>();
            boolean inCycle = false;
            for (String s : recursionStack) {
                if (s.equals(id)) {
                    inCycle = true;
                }
                if (inCycle) {
                    cyclePath.add(s);
                }
            }
            cyclePath.add(id);
            throw new CycleDetectedException(cyclePath);
        }

        if (visited.contains(id)) {
            return;
        }

        visited.add(id);
        recursionStack.add(id);

        for (String neighborId : node.getOutgoingEdges()) {
            Node neighbor = graph.getNode(neighborId);
            if (neighbor != null) {
                hasCycle(neighbor, graph, visited, recursionStack);
            }
        }

        recursionStack.remove(id);
    }
}

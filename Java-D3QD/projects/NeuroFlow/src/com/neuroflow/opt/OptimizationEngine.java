package com.neuroflow.opt;

import com.neuroflow.structure.ComputationalGraph;
import com.neuroflow.structure.Node;

public class OptimizationEngine {

    /**
     * Strategy 1: Topological Sort Optimization
     * Goal: Minimize peak memory usage by prioritizing nodes that release memory
     * Heuristic: Memory Delta = (Total Input Size) - (Total Output Size)
     * Explanation:
     * - Nodes with a high positive delta consume large input tensors (releasing
     * upstream memory while producing small output tensors.
     * - Configuring the scheduler to prioritize these nodes
     * accelerates the reclamation of memory occupied by large intermediate tensors.
     */
    public static void optimize(ComputationalGraph graph) {
        // 1. Node Fusion (Strategy 2)
        fuseNodes(graph);

        // 2. Topological Priority (Strategy 1)
        for (Node node : graph.getNodes()) {
            long inputSize = 0;
            for (String parentId : node.getIncomingEdges()) {
                Node parent = graph.getNode(parentId);
                if (parent != null) {
                    inputSize += parent.getOutputSize();
                }
            }
            long outputSize = node.getOutputSize();

            int priority = (int) (inputSize - outputSize);
            node.setPriority(priority);
        }
    }

    private static void fuseNodes(ComputationalGraph graph) {
        boolean fused;
        do {
            fused = false;
            // Iterate copy to allow modification
            for (Node node : new java.util.ArrayList<>(graph.getNodes())) {
                if (node.getOutgoingEdges().size() == 1) {
                    String childId = node.getOutgoingEdges().get(0);
                    Node child = graph.getNode(childId);

                    if (child != null && child.getIncomingEdges().size() == 1
                            && "relu".equalsIgnoreCase(child.getTaskType())) {
                        // Found Candidate for Fusion
                        String newType = null;
                        if ("matrix_multiply".equalsIgnoreCase(node.getTaskType())) {
                            newType = "fused_matmul_relu";
                        } else if ("add".equalsIgnoreCase(node.getTaskType())) {
                            newType = "fused_add_relu";
                        }

                        if (newType != null) {
                            // Perform Fusion
                            node.setTaskType(newType);
                            // Child's outgoing become Node's outgoing
                            node.getOutgoingEdges().clear();
                            node.getOutgoingEdges().addAll(child.getOutgoingEdges());

                            // Update downstream nodes to point to 'node' instead of 'child'
                            for (String downstreamId : child.getOutgoingEdges()) {
                                Node downstream = graph.getNode(downstreamId);
                                java.util.List<String> downInputs = downstream.getIncomingEdges();
                                int idx = downInputs.indexOf(childId);
                                if (idx != -1) {
                                    downInputs.set(idx, node.getId());
                                }
                            }

                            // Fused!
                            graph.removeNode(childId);
                            fused = true;
                        }
                    }
                }
            }
        } while (fused);
    }
}

package com.neuroflow.core;

import com.neuroflow.monitor.GlobalStats;
import com.neuroflow.structure.Node;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.Future;
// import simulator.TaskSimulator;

public class NodeTask implements Callable<double[]>, Comparable<NodeTask> {
    private final Node node;
    private final List<Future<double[]>> inputs;

    public static volatile boolean SIMULATE_FAILURE = false;
    private static final java.util.Random random = new java.util.Random();

    public NodeTask(Node node, List<Future<double[]>> inputs) {
        this.node = node;
        this.inputs = inputs;
    }

    @Override
    public double[] call() throws Exception {
        GlobalStats.incrementActiveThreads();
        try {
            if (SIMULATE_FAILURE && random.nextDouble() < 0.5) { // 50% failure chance
                throw new RuntimeException("Simulated Node Failure: " + node.getId());
            }

            // Resolve inputs (simulate fetching tensors)
            if (inputs != null) {
                for (Future<double[]> input : inputs) {
                    input.get(); // Ensure dependencies are met
                }
            }

            long startTime = System.currentTimeMillis();

            // Perform computation
            double[] result;
            String type = node.getTaskType() != null ? node.getTaskType().toLowerCase() : "unknown";
            int[] dims = node.getOutputDims();
            int rows = (dims != null && dims.length > 0) ? dims[0] : 100;
            int cols = (dims != null && dims.length > 1) ? dims[1] : 100;

            if (inputs == null || inputs.isEmpty()) {
                // Source node
                result = MatrixOps.randomMatrix(rows, cols);
                // Simulate load time for source nodes
                try {
                    Thread.sleep(node.getComputeTimeMs());
                } catch (InterruptedException ignored) {
                }
            } else {
                // Process inputs
                double[] input1 = inputs.get(0).get();

                switch (type) {
                    case "matrix_multiply":
                        if (inputs.size() > 1) {
                            double[] input2 = inputs.get(1).get();
                            int common = (int) Math.sqrt(input1.length);
                            result = MatrixOps.multiply(input1, common, common, input2, common, common);
                        } else {
                            double[] weights = MatrixOps.randomMatrix(cols, rows); // transient weight, acceptable alloc
                            int common = (int) Math.sqrt(input1.length);
                            result = MatrixOps.multiply(input1, common, common, weights, common, common);
                        }
                        break;
                    case "fused_matmul_relu":
                        double[] matmulResult;
                        if (inputs.size() > 1) {
                            double[] input2 = inputs.get(1).get();
                            int common = (int) Math.sqrt(input1.length);
                            matmulResult = MatrixOps.multiply(input1, common, common, input2, common, common);
                        } else {
                            double[] weights = MatrixOps.randomMatrix(cols, rows);
                            int common = (int) Math.sqrt(input1.length);
                            matmulResult = MatrixOps.multiply(input1, common, common, weights, common, common);
                        }
                        // In-place ReLU on the same buffer
                        result = MatrixOps.relu(matmulResult);
                        break;
                    case "add":
                        if (inputs.size() > 1) {
                            result = MatrixOps.add(input1, inputs.get(1).get());
                        } else {
                            result = MatrixOps.add(input1, input1);
                        }
                        break;
                    case "fused_add_relu":
                        double[] addResult;
                        if (inputs.size() > 1) {
                            addResult = MatrixOps.add(input1, inputs.get(1).get());
                        } else {
                            addResult = MatrixOps.add(input1, input1);
                        }
                        result = MatrixOps.relu(addResult);
                        break;
                    case "relu":
                        result = MatrixOps.relu(input1);
                        break;
                    case "softmax":
                        result = MatrixOps.softmax(input1);
                        break;
                    default:
                        // Fallback
                        result = new double[rows * cols];
                        try {
                            Thread.sleep(node.getComputeTimeMs());
                        } catch (InterruptedException ignored) {
                        }
                }
            }

            long endTime = System.currentTimeMillis();

            // Record validation
            com.neuroflow.structure.NodeExecutionMetadata meta = new com.neuroflow.structure.NodeExecutionMetadata(
                    node.getId(),
                    startTime,
                    endTime,
                    endTime - startTime,
                    node.getOutputSize());
            node.setMetadata(meta);

            return result;
        } finally {
            GlobalStats.decrementActiveThreads();
            GlobalStats.incrementFinishedNodes();
        }
    }

    @Override
    public int compareTo(NodeTask o) {
        // Higher priority executes first
        return Integer.compare(o.node.getPriority(), this.node.getPriority());
    }

    public Node getNode() {
        return node;
    }
}

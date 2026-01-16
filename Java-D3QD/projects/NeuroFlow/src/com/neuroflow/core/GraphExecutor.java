package com.neuroflow.core;

import com.neuroflow.monitor.GlobalStats;
import com.neuroflow.structure.ComputationalGraph;
import com.neuroflow.structure.Node;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ConcurrentHashMap;
// import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.RunnableFuture;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

public class GraphExecutor {
    private final ExecutorService executor;
    private final ComputationalGraph graph;
    // Track execution results: NodeID -> Future
    private final Map<String, Future<double[]>> nodeResults = new ConcurrentHashMap<>();

    // Dynamic In-Degree map
    // private final Map<String, AtomicInteger> inDegrees = new
    // ConcurrentHashMap<>();

    public GraphExecutor(ComputationalGraph graph) {
        this.graph = graph;
        // Use a custom ThreadPoolExecutor to support priority-based task execution.
        this.executor = new ThreadPoolExecutor(
                4, 4,
                0L, TimeUnit.MILLISECONDS,
                new PriorityBlockingQueue<>()) {
            @Override
            protected <T> RunnableFuture<T> newTaskFor(Callable<T> callable) {
                return new ComparableFutureTask<>(callable);
            }
        };
    }

    // Map to track remaining consumers for memory release
    private final Map<String, AtomicInteger> outDegrees = new ConcurrentHashMap<>();

    public Map<String, Future<double[]>> execute() throws InterruptedException {
        // Build the DAG using CompletableFutures
        Map<String, CompletableFuture<double[]>> futures = new ConcurrentHashMap<>();

        // Initialize outDegrees for memory releasing
        for (Node node : graph.getNodes()) {
            outDegrees.put(node.getId(), new AtomicInteger(node.getOutgoingEdges().size()));
            futures.put(node.getId(), new CompletableFuture<>());
        }

        // Chain dependencies
        for (Node node : graph.getNodes()) {
            CompletableFuture<double[]> current = futures.get(node.getId());

            // The action to SUBMIT to the priority executor
            Runnable submitAction = () -> {
                // Prepare inputs (parents are guaranteed ready)
                List<Future<double[]>> inputs = new ArrayList<>();
                for (String parentId : node.getIncomingEdges()) {
                    inputs.add(futures.get(parentId));
                }

                NodeTask task = NodeTaskFactory.createTask(node, inputs);

                // Wrapper for execution logic (Retries + Mem + Signal CF)
                Callable<double[]> execLogic = () -> {
                    try {
                        double[] result = null;
                        int retries = 3;
                        while (retries > 0) {
                            try {
                                result = task.call();
                                break;
                            } catch (Exception e) {
                                retries--;
                                if (retries == 0)
                                    throw e;
                                System.out
                                        .println("Retrying task " + node.getId() + " (" + retries + " attempts left)");
                            }
                        }

                        // Memory: Allocate
                        long allocated = node.getOutputSize() * 8;
                        GlobalStats.allocateMemory(allocated);

                        // Memory: Free Parents
                        for (String parentId : node.getIncomingEdges()) {
                            AtomicInteger rc = outDegrees.get(parentId);
                            if (rc.decrementAndGet() == 0) {
                                Node parent = graph.getNode(parentId);
                                GlobalStats.freeMemory(parent.getOutputSize() * 8);
                            }
                        }

                        current.complete(result);
                        return result;
                    } catch (Exception e) {
                        current.completeExceptionally(e);
                        throw e;
                    }
                };

                // Submit to Priority Executor
                executor.submit(new GraphTask(task, execLogic));
            };

            // Dependency Logic
            List<CompletableFuture<double[]>> parents = new ArrayList<>();
            for (String parentId : node.getIncomingEdges()) {
                parents.add(futures.get(parentId));
            }

            if (parents.isEmpty()) {
                submitAction.run();
            } else {
                CompletableFuture
                        .allOf(parents.toArray(new CompletableFuture[0]))
                        .thenRun(submitAction); // Run submission in the triggering thread
            }
        }

        // Wait for all
        try {
            CompletableFuture
                    .allOf(futures.values().toArray(new CompletableFuture[0])).join();
        } catch (Exception e) {
            System.err.println("Execution finished with errors: " + e.getMessage());
        }

        executor.shutdown();

        // Result Map
        for (Map.Entry<String, CompletableFuture<double[]>> entry : futures.entrySet()) {
            nodeResults.put(entry.getKey(), entry.getValue());
            graph.getNode(entry.getKey()).setOutput(entry.getValue());
        }

        return nodeResults;
    }

    // Removed submitNode/propagateFailure. kept GraphTask/ComparableFutureTask for
    // priority support.

    // Cleanup unused methods
    // private void cleanup() {
    // }

    private static class GraphTask implements Callable<double[]>, Comparable<GraphTask> {
        private final NodeTask inner;
        private final Callable<double[]> wrapper;

        public GraphTask(NodeTask inner, Callable<double[]> wrapper) {
            this.inner = inner;
            this.wrapper = wrapper;
        }

        @Override
        public double[] call() throws Exception {
            return wrapper.call();
        }

        @Override
        public int compareTo(GraphTask o) {
            return inner.compareTo(o.inner);
        }
    }

    // Needed for the custom thread pool
    private static class ComparableFutureTask<V> extends FutureTask<V>
            implements Comparable<ComparableFutureTask<V>> {
        private final Comparable<Object> task;

        @SuppressWarnings("unchecked")
        public ComparableFutureTask(Callable<V> callable) {
            super(callable);
            this.task = (Comparable<Object>) callable;
        }

        @Override
        public int compareTo(ComparableFutureTask<V> o) {
            return this.task.compareTo(o.task);
        }
    }
}

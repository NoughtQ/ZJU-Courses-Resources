package com.neuroflow;

import com.neuroflow.core.GraphExecutor;
import com.neuroflow.io.DotExporter;
import com.neuroflow.io.CycleDetectedException;
import com.neuroflow.io.GraphLoader;
import com.neuroflow.io.ResultWriter;
import com.neuroflow.monitor.GlobalStats;
import com.neuroflow.monitor.PerformanceMonitor;
import com.neuroflow.opt.OptimizationEngine;
import com.neuroflow.structure.ComputationalGraph;
import com.neuroflow.structure.Node;
import com.neuroflow.structure.NodeExecutionMetadata;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Future;

public class Main {
    public static void main(String[] args) {
        String graphFile = null;
        String reportDir = null;
        boolean generateDot = false;
        boolean benchmark = false;
        int iterations = 1;

        // Parse arguments
        for (int i = 0; i < args.length; i++) {
            if ("--graph".equals(args[i]) && i + 1 < args.length) {
                graphFile = args[i + 1];
            } else if ("--reportDir".equals(args[i]) && i + 1 < args.length) {
                reportDir = args[i + 1];
            } else if ("--dot".equals(args[i])) {
                generateDot = true;
            } else if ("--unstable".equals(args[i])) {
                com.neuroflow.core.NodeTask.SIMULATE_FAILURE = true;
            } else if ("--benchmark".equals(args[i])) {
                benchmark = true;
            } else if ("--iter".equals(args[i]) && i + 1 < args.length) {
                try {
                    iterations = Integer.parseInt(args[i + 1]);
                } catch (NumberFormatException e) {
                    System.err.println("Invalid number for iterations");
                    System.exit(1);
                }
            }
        }

        if (graphFile == null || (reportDir == null && !benchmark)) {
            System.err.println(
                    "Usage: java -jar NeuroFlow.jar --graph <file> --reportDir <dir> [--dot] [--unstable] [--benchmark] [--iter <N>]");
            System.exit(1);
        }

        try {
            if (reportDir != null) {
                File reportDirFile = new File(reportDir);
                if (!reportDirFile.exists()) {
                    reportDirFile.mkdirs();
                }
            }

            if (benchmark) {
                runBenchmark(graphFile, iterations);
                return;
            }

            // Normal Execution
            System.out.println("Loading graph from " + graphFile);
            ComputationalGraph graph = GraphLoader.load(graphFile);
            System.out.println("Graph loaded: " + graph.getGraphId() + ", " + graph.getNodeCount() + " nodes");

            if (generateDot) {
                String dotFile = reportDir + "/" + graph.getGraphId() + ".dot";
                DotExporter.export(graph, dotFile);
            }

            executeRun(graph, true, reportDir);

        } catch (CycleDetectedException e) {
            System.err.println("ERROR: Cycle Detected in Graph!");
            System.err.println("Path: " + String.join(" -> ", e.getCycle()));
            System.exit(1);
        } catch (Exception e) {
            System.err.println("ERROR: " + e.getMessage());
            e.printStackTrace();
            System.exit(1);
        }
    }

    private static void executeRun(ComputationalGraph graph, boolean optimize, String reportDir) throws Exception {
        // Optimization
        if (optimize) {
            System.out.println("Running optimization...");
            OptimizationEngine.optimize(graph);
        } else {
            System.out.println("Running baseline (no optimization)...");
        }

        // Setup Monitor
        System.out.println("Starting execution...");
        GlobalStats.finishedNodes = 0;
        GlobalStats.peakMemoryMb = 0;

        PerformanceMonitor monitor = new PerformanceMonitor(graph.getNodeCount());
        Thread monitorThread = new Thread(monitor);
        monitorThread.start();

        // Execution
        GraphExecutor executor = new GraphExecutor(graph);
        long start = System.currentTimeMillis();

        Map<String, Future<double[]>> results = executor.execute();

        long end = System.currentTimeMillis();
        long totalTime = end - start;

        monitor.stop();
        monitorThread.join(2000);

        System.out.println("Execution finished. Generating report...");

        List<ResultWriter.NodeExecution> executionOrder = new ArrayList<>();
        for (Node node : graph.getNodes()) {
            NodeExecutionMetadata meta = node.getMetadata();
            if (meta != null) {
                ResultWriter.NodeExecution item = new ResultWriter.NodeExecution(
                        meta.nodeId(),
                        meta.startTimeMs(),
                        meta.endTimeMs(),
                        meta.durationMs(),
                        meta.outputSize());
                executionOrder.add(item);
            }
        }
        executionOrder.sort((a, b) -> Long.compare(a.startTimeMs(), b.startTimeMs()));

        if (reportDir != null) {
            ResultWriter.writeReport(reportDir, graph, executionOrder, totalTime, monitor.getSnapshots());
        }
    }

    private static void runBenchmark(String graphFile, int iterations) throws Exception {
        System.out.println("=== NeuroFlow Benchmark (" + iterations + " iterations) ===");

        // 1. Baseline Run
        System.out.println("\n[1/2] Baseline Run:");
        long totalBaseTime = 0;
        long totalBaseMem = 0;
        for (int i = 0; i < iterations; i++) {
            System.out.print("Iter " + (i + 1) + ": ");
            ComputationalGraph baselineGraph = GraphLoader.load(graphFile);
            RunResult res = executeRunAndReturn(baselineGraph, false);
            System.out.println(res.durationMs + " ms, " + res.peakMemoryMb + " MB");
            totalBaseTime += res.durationMs;
            totalBaseMem += res.peakMemoryMb;
            System.gc();
            Thread.sleep(200);
        }
        double avgBaseTime = totalBaseTime / (double) iterations;
        double avgBaseMem = totalBaseMem / (double) iterations;

        // 2. Optimized Run
        System.out.println("\n[2/2] Optimized Run:");
        long totalOptTime = 0;
        long totalOptMem = 0;
        for (int i = 0; i < iterations; i++) {
            System.out.print("Iter " + (i + 1) + ": ");
            ComputationalGraph optGraph = GraphLoader.load(graphFile);
            RunResult res = executeRunAndReturn(optGraph, true);
            System.out.println(res.durationMs + " ms, " + res.peakMemoryMb + " MB");
            totalOptTime += res.durationMs;
            totalOptMem += res.peakMemoryMb;
            System.gc();
            Thread.sleep(200);
        }
        double avgOptTime = totalOptTime / (double) iterations;
        double avgOptMem = totalOptMem / (double) iterations;

        System.out.println("\n=== Results (Average) ===");
        System.out.println("Metric        | Baseline   | Optimized  | Improvement");
        System.out.println("--------------|------------|------------|------------");
        System.out.printf("Time (ms)     | %-10.2f | %-10.2f | %s%n",
                avgBaseTime, avgOptTime,
                formatImprovement(avgBaseTime, avgOptTime));
        System.out.printf("Peak Mem (MB) | %-10.2f | %-10.2f | %s%n",
                avgBaseMem, avgOptMem,
                formatImprovement(avgBaseMem, avgOptMem));
    }

    private static String formatImprovement(double base, double opt) {
        if (base == 0)
            return "N/A";
        double imp = (base - opt) / base * 100.0;
        return String.format("%.2f%%", imp);
    }

    private record RunResult(long durationMs, long peakMemoryMb) {
    }

    private static RunResult executeRunAndReturn(ComputationalGraph graph, boolean optimize) throws Exception {
        if (optimize)
            OptimizationEngine.optimize(graph);

        GlobalStats.reset();

        PerformanceMonitor monitor = new PerformanceMonitor(graph.getNodeCount());
        Thread monitorThread = new Thread(monitor);
        monitorThread.start();

        GraphExecutor executor = new GraphExecutor(graph);
        long start = System.currentTimeMillis();
        executor.execute();
        long end = System.currentTimeMillis();

        monitor.stop();
        monitorThread.join(1000);

        return new RunResult(end - start, GlobalStats.peakMemoryMb);
    }
}

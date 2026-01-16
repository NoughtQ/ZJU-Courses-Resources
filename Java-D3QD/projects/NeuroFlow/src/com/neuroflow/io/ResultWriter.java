package com.neuroflow.io;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.annotations.SerializedName;
import com.neuroflow.monitor.GlobalStats;
import com.neuroflow.monitor.PerformanceMonitor;
import com.neuroflow.structure.ComputationalGraph;
import java.io.FileWriter;
import java.io.IOException;
import java.util.List;

public class ResultWriter {

    public static void writeReport(String dir, ComputationalGraph graph,
            List<NodeExecution> executionOrder,
            long totalTime,
            List<PerformanceMonitor.Snapshot> snapshots) throws IOException {

        // Calculate max concurrency and avg utilization from snapshots
        int maxActive = 0;
        long sumActive = 0;
        for (PerformanceMonitor.Snapshot s : snapshots) {
            maxActive = Math.max(maxActive, s.activeThreads());
            sumActive += s.activeThreads();
        }

        String avgThreadUtilization;
        // Avg utilization = (sumActive / count) / 4_threads * 100%
        if (!snapshots.isEmpty()) {
            double avgPool = (double) sumActive / snapshots.size();
            double util = (avgPool / 4.0) * 100.0;
            avgThreadUtilization = String.format("%.2f%%", util);
        } else {
            avgThreadUtilization = "0.00%";
        }

        Metrics metrics = new Metrics(GlobalStats.peakMemoryMb, maxActive, avgThreadUtilization, snapshots);
        Report report = new Report(graph.getGraphId(), totalTime, executionOrder, metrics);

        // File Name: <graph_id>_<timestamp>.json
        String filename = String.format("%s/%s_%d.json", dir, report.graphId(),
                System.currentTimeMillis());

        try (FileWriter writer = new FileWriter(filename)) {
            Gson gson = new GsonBuilder().setPrettyPrinting().create();
            gson.toJson(report, writer);
        }
    }

    private record Report(
        @SerializedName("graph_id") String graphId,
        @SerializedName("total_time_ms") long totalTimeMs,
        @SerializedName("execution_order") List<NodeExecution> executionOrder,
        @SerializedName("performance_metrics") Metrics performanceMetrics) {
    }

    private record Metrics(
        @SerializedName("peak_memory_mb") long peakMemoryMb,
        @SerializedName("max_concurrency") int maxConcurrency,
        @SerializedName("avg_thread_utilization") String avgThreadUtilization,
        @SerializedName("parallelism_curve") List<PerformanceMonitor.Snapshot> parallelismCurve) {
    }

    // We need this class available for Node to use or separate.
    public record NodeExecution(
        @SerializedName("node_id") String nodeId,
        @SerializedName("start_time_ms") long startTimeMs,
        @SerializedName("end_time_ms") long endTimeMs,
        @SerializedName("duration_ms") long durationMs,
        @SerializedName("output_size") long outputSize) {
    }
}

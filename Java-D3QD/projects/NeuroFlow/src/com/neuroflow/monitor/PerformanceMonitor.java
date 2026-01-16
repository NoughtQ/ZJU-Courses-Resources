package com.neuroflow.monitor;

import java.util.ArrayList;
import java.util.List;

public class PerformanceMonitor implements Runnable {
    private final long startTime;
    private final int totalNodes;
    private final List<Snapshot> snapshots = new ArrayList<>();
    private volatile boolean running = true;

    public PerformanceMonitor(int totalNodes) {
        this.totalNodes = totalNodes;
        this.startTime = System.currentTimeMillis();
    }

    @Override
    public void run() {
        while (running) {
            long now = System.currentTimeMillis();
            long elapsed = now - startTime;

            int active = GlobalStats.activeThreads;
            int finished = GlobalStats.finishedNodes;
            long peak = GlobalStats.peakMemoryMb;

            // Log status: [time=0231ms] active=3 finished=12 peakMem=128MB
            System.out.printf("[time=%04dms] active=%d finished=%d peakMem=%dMB%n", elapsed, active,
                    finished, peak);

            snapshots.add(new Snapshot(elapsed, active, finished));

            if (finished >= totalNodes) {
                running = false;
                break;
            }

            try {
                Thread.sleep(10);
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                running = false;
            }
        }
    }

    public void stop() {
        running = false;
    }

    public List<Snapshot> getSnapshots() {
        return snapshots;
    }

    public record Snapshot(
        @com.google.gson.annotations.SerializedName("timestamp_ms") long timestampMs,
        @com.google.gson.annotations.SerializedName("active_threads") int activeThreads,
        @com.google.gson.annotations.SerializedName("finished_nodes") int finishedNodes) {
    }
}

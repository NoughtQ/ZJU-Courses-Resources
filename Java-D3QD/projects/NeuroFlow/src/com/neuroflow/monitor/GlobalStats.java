package com.neuroflow.monitor;

import java.util.concurrent.atomic.AtomicLong;

public class GlobalStats {
    public static volatile int activeThreads = 0;
    public static volatile int finishedNodes = 0;
    public static volatile long peakMemoryMb = 0;

    public static synchronized void incrementActiveThreads() {
        activeThreads++;
    }

    public static synchronized void decrementActiveThreads() {
        activeThreads--;
    }

    public static synchronized void incrementFinishedNodes() {
        finishedNodes++;
    }

    public static synchronized void updatePeakMemory(long currentMemory) {
        if (currentMemory > peakMemoryMb) {
            peakMemoryMb = currentMemory;
        }
    }

    public static AtomicLong currentMemoryBytes = new AtomicLong(0);

    public static void allocateMemory(long bytes) {
        long current = currentMemoryBytes.addAndGet(bytes);
        // B -> MB conversion
        updatePeakMemory(current / 1024 / 1024);
    }

    public static void freeMemory(long bytes) {
        currentMemoryBytes.addAndGet(-bytes);
    }

    public static void reset() {
        activeThreads = 0;
        finishedNodes = 0;
        peakMemoryMb = 0;
        currentMemoryBytes.set(0);
    }
}

package com.neuroflow.io;

import java.util.List;

public class CycleDetectedException extends RuntimeException {
    private final List<String> cycle;

    public CycleDetectedException(List<String> cycle) {
        super("Cycle detected: " + formatCycle(cycle));
        this.cycle = cycle;
    }

    public List<String> getCycle() {
        return cycle;
    }

    private static String formatCycle(List<String> cycle) {
        if (cycle == null || cycle.isEmpty()) {
            return "Unknown";
        }
        return String.join(" -> ", cycle);
    }

    @Override
    public String getMessage() {
        return "Cycle detected in graph: " + formatCycle(cycle);
    }
}

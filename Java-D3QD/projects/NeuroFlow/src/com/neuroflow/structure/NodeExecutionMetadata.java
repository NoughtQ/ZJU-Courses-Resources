package com.neuroflow.structure;

public record NodeExecutionMetadata(
    String nodeId,
    long startTimeMs,
    long endTimeMs,
    long durationMs,
    long outputSize) {
}

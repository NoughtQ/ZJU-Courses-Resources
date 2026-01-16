package com.neuroflow.structure;

import com.google.gson.annotations.SerializedName;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Future;

public class Node {
    private String id;

    @SerializedName("task_type")
    private String taskType;

    @SerializedName("output_dims")
    private int[] outputDims;

    @SerializedName("compute_time_ms")
    private int computeTimeMs;

    // Runtime fields
    private transient List<String> incomingEdges = new ArrayList<>();
    private transient List<String> outgoingEdges = new ArrayList<>();
    private transient Future<double[]> output;
    private transient int priority; // For optimization
    private transient NodeExecutionMetadata metadata;

    public void setMetadata(NodeExecutionMetadata metadata) {
        this.metadata = metadata;
    }

    public NodeExecutionMetadata getMetadata() {
        return metadata;
    }

    public Node() {
        // No-args constructor for Gson
    }

    public Node(String id, String taskType, int[] outputDims, int computeTimeMs) {
        this.id = id;
        this.taskType = taskType;
        this.outputDims = outputDims;
        this.computeTimeMs = computeTimeMs;
    }

    public String getId() {
        return id;
    }

    public String getTaskType() {
        return taskType;
    }

    public void setTaskType(String taskType) {
        this.taskType = taskType;
    }

    public int[] getOutputDims() {
        return outputDims;
    }

    public int getComputeTimeMs() {
        return computeTimeMs;
    }

    public void setComputeTimeMs(int computeTimeMs) {
        this.computeTimeMs = computeTimeMs;
    }

    public List<String> getIncomingEdges() {
        return incomingEdges;
    }

    public List<String> getOutgoingEdges() {
        return outgoingEdges;
    }

    public void addIncomingEdge(String fromNodeId) {
        incomingEdges.add(fromNodeId);
    }

    public void addOutgoingEdge(String toNodeId) {
        outgoingEdges.add(toNodeId);
    }

    public Future<double[]> getOutput() {
        return output;
    }

    public void setOutput(Future<double[]> output) {
        this.output = output;
    }

    public int getPriority() {
        return priority;
    }

    public void setPriority(int priority) {
        this.priority = priority;
    }

    public long getOutputSize() {
        if (outputDims == null || outputDims.length == 0) {
            return 0;
        }
        long size = 1;
        for (int dim : outputDims) {
            size *= dim;
        }
        return size;
    }
}

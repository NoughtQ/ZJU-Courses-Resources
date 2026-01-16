package com.neuroflow.structure;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class ComputationalGraph {
    private String graphId;
    private final Map<String, Node> nodes = new HashMap<>();

    public ComputationalGraph(String graphId) {
        this.graphId = graphId;
    }

    public void addNode(Node node) {
        nodes.put(node.getId(), node);
    }

    public Node getNode(String id) {
        return nodes.get(id);
    }

    public Collection<Node> getNodes() {
        return nodes.values();
    }

    public String getGraphId() {
        return graphId;
    }

    public int getNodeCount() {
        return nodes.size();
    }

    public void removeNode(String id) {
        nodes.remove(id);
    }
}

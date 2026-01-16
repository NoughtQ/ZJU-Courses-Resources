package com.neuroflow.io;

import com.google.gson.annotations.SerializedName;
import com.neuroflow.structure.Node;
import java.util.List;

public class GraphDefinition {
    @SerializedName("graph_id")
    private String graphId;

    private String description;

    private List<Node> nodes;

    private List<EdgeDefinition> edges;

    public String getGraphId() {
        return graphId;
    }

    public String getDescription() {
        return description;
    }

    public List<Node> getNodes() {
        return nodes;
    }

    public List<EdgeDefinition> getEdges() {
        return edges;
    }

    public static class EdgeDefinition {
        private String from;
        private String to;

        public String getFrom() {
            return from;
        }

        public String getTo() {
            return to;
        }
    }
}

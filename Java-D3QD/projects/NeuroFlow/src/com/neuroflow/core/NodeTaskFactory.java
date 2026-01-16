package com.neuroflow.core;

import com.neuroflow.structure.Node;
import java.util.List;
import java.util.concurrent.Future;

public class NodeTaskFactory {
    public static NodeTask createTask(Node node, List<Future<double[]>> inputs) {
        return new NodeTask(node, inputs);
    }
}

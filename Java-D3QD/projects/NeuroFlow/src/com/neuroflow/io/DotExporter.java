package com.neuroflow.io;

import com.neuroflow.structure.ComputationalGraph;
import com.neuroflow.structure.Node;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

public class DotExporter {

    public static void export(ComputationalGraph graph, String filename) {
        try (PrintWriter writer = new PrintWriter(new FileWriter(filename))) {
            writer.println("digraph NeuroFlow {");
            writer.println("  rankdir=LR;");
            writer.println("  node [shape=box, style=filled, color=lightblue];");

            for (Node node : graph.getNodes()) {
                String label = String.format("%s\\n(%s)", node.getId(), node.getTaskType());
                writer.printf("  \"%s\" [label=\"%s\"];%n", node.getId(), label);

                for (String childId : node.getOutgoingEdges()) {
                    writer.printf("  \"%s\" -> \"%s\";%n", node.getId(), childId);
                }
            }

            writer.println("}");
            System.out.println("DOT file generated: " + filename);
        } catch (IOException e) {
            System.err.println("Failed to write DOT file: " + e.getMessage());
        }
    }
}

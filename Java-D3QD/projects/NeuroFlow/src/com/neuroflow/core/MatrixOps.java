package com.neuroflow.core;

import org.ejml.simple.SimpleMatrix;
import java.util.Random;

/**
 * Utility class for simulating real matrix operations using EJML.
 */
public class MatrixOps {
    private static final Random random = new Random();

    public static double[] randomMatrix(int rows, int cols) {
        double[] output = new double[rows * cols];
        for (int i = 0; i < output.length; i++) {
            output[i] = random.nextDouble() - 0.5;
        }
        return output;
    }

    public static double[] multiply(double[] a, int aRows, int aCols,
            double[] b, int bRows, int bCols) {
        if (aCols != bRows) {
            throw new IllegalArgumentException("Matrix dimension mismatch: " + aCols + " != " + bRows);
        }

        SimpleMatrix maxA = new SimpleMatrix(aRows, aCols, true, a);
        SimpleMatrix maxB = new SimpleMatrix(bRows, bCols, true, b);

        SimpleMatrix maxC = maxA.mult(maxB);

        return maxC.getDDRM().data;
    }

    public static double[] add(double[] a, double[] b) {
        int len = Math.min(a.length, b.length);
        SimpleMatrix matA = new SimpleMatrix(1, len, true, a);
        SimpleMatrix matB = new SimpleMatrix(1, len, true, b);
        SimpleMatrix res = matA.plus(matB);

        return res.getDDRM().data;
    }

    public static double[] relu(double[] input) {
        double[] output = new double[input.length];
        for (int i = 0; i < input.length; i++) {
            output[i] = Math.max(0, input[i]);
        }
        return output;
    }

    public static double[] softmax(double[] input) {
        double[] output = new double[input.length];
        double sum = 0;
        for (double v : input) {
            sum += Math.exp(v);
        }
        for (int i = 0; i < input.length; i++) {
            output[i] = Math.exp(input[i]) / sum;
        }
        return output;
    }
}

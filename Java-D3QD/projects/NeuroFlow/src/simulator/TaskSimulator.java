package simulator;

import java.util.Arrays;

/** 计算模拟器：产生 CPU/内存负载，返回 double[] */
public final class TaskSimulator {
    private TaskSimulator() {
        throw new UnsupportedOperationException();
    }

    public static double[] matrixMultiply(int[] outDims, int ms) {
        sleep(ms);
        double[] arr = new double[outDims[0] * outDims[1]];
        for (int i = 0; i < arr.length; i++)
            arr[i] = Math.random();
        return arr;
    }

    public static double[] relu(int[] dims, int ms) {
        sleep(ms);
        double[] arr = new double[dims[0] * dims[1]];
        for (int i = 0; i < arr.length; i++)
            arr[i] = Math.max(0, Math.random() - 0.5);
        return arr;
    }

    public static double[] add(int[] dims, int ms) {
        sleep(ms);
        double[] arr = new double[dims[0] * dims[1]];
        Arrays.fill(arr, Math.random());
        return arr;
    }

    public static double[] softmax(int[] dims, int ms) {
        sleep(ms);
        int len = dims[0] * dims[1];
        double[] arr = new double[len];
        double sum = 0;
        for (int i = 0; i < len; i++) {
            arr[i] = Math.exp(Math.random());
            sum += arr[i];
        }
        for (int i = 0; i < len; i++)
            arr[i] /= sum;
        return arr;
    }

    private static void sleep(int ms) {
        try {
            Thread.sleep(ms);
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
        }
    }
}

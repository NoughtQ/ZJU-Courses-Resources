package PersonalGameLibraryManager.src;

import java.util.Scanner;

public class XORCipher {
    private static final String DEFAULT_KEY = "PersonalGameLibrary";

    public static byte[] encrypt(byte[] data, String key) {
        if (data == null || key == null) return data;

        byte[] keyBytes = key.getBytes();
        byte[] result = new byte[data.length];

        for (int i = 0; i < data.length; i++) {
            result[i] = (byte) (data[i] ^ keyBytes[i % keyBytes.length]);
        }
        return result;
    }

    public static byte[] decrypt(byte[] data, String key) {
        return encrypt(data, key); // symmetric
    }

    public static String getKeyFromUser() {
        Scanner in = new Scanner(System.in);
        System.out.print("请输入加密密钥（直接回车使用默认密钥）：");
        String key = in.nextLine();
        return key.isEmpty() ? DEFAULT_KEY : key;
    }
}
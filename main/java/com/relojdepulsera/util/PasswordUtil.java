package com.relojdepulsera.util;

import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.security.spec.KeySpec;
import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

public class PasswordUtil {

    private static final String ENCRYPT_ALGO = "AES/GCM/NoPadding";
    private static final int TAG_LENGTH_BIT = 128;
    private static final int IV_LENGTH_BYTE = 12;
    private static final int SALT_LENGTH_BYTE = 16;

    private static final int ITERATION_COUNT = 65536;
    private static final int KEY_LENGTH = 256;

    private static final SecureRandom secureRandom = new SecureRandom();

    private static byte[] getRandomBytes(int length) {
        byte[] bytes = new byte[length];
        secureRandom.nextBytes(bytes);
        return bytes;
    }

    private static SecretKey getAESKeyFromPassword(char[] password, byte[] salt) throws Exception {
        SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA256");
        KeySpec spec = new PBEKeySpec(password, salt, ITERATION_COUNT, KEY_LENGTH);
        byte[] keyBytes = factory.generateSecret(spec).getEncoded();
        return new SecretKeySpec(keyBytes, "AES");
    }

    public static String encrypt(String username, String password) {
        try {
            byte[] salt = getRandomBytes(SALT_LENGTH_BYTE);
            byte[] iv = getRandomBytes(IV_LENGTH_BYTE);

            SecretKey key = getAESKeyFromPassword(username.toCharArray(), salt);

            Cipher cipher = Cipher.getInstance(ENCRYPT_ALGO);
            GCMParameterSpec gcmSpec = new GCMParameterSpec(TAG_LENGTH_BIT, iv);
            cipher.init(Cipher.ENCRYPT_MODE, key, gcmSpec);

            byte[] cipherText = cipher.doFinal(password.getBytes(StandardCharsets.UTF_8));

            ByteBuffer buffer = ByteBuffer.allocate(iv.length + salt.length + cipherText.length);
            buffer.put(iv);
            buffer.put(salt);
            buffer.put(cipherText);

            return Base64.getEncoder().encodeToString(buffer.array());
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }

    public static String decrypt(String encryptedPassword, String username) {
        try {
            byte[] decoded = Base64.getDecoder().decode(encryptedPassword);

            ByteBuffer buffer = ByteBuffer.wrap(decoded);

            byte[] iv = new byte[IV_LENGTH_BYTE];
            buffer.get(iv);

            byte[] salt = new byte[SALT_LENGTH_BYTE];
            buffer.get(salt);

            byte[] cipherText = new byte[buffer.remaining()];
            buffer.get(cipherText);

            SecretKey key = getAESKeyFromPassword(username.toCharArray(), salt);

            Cipher cipher = Cipher.getInstance(ENCRYPT_ALGO);
            GCMParameterSpec gcmSpec = new GCMParameterSpec(TAG_LENGTH_BIT, iv);
            cipher.init(Cipher.DECRYPT_MODE, key, gcmSpec);

            byte[] plainText = cipher.doFinal(cipherText);

            return new String(plainText, StandardCharsets.UTF_8);
        } catch (Exception ex) {
            System.err.println("Decryption failed for username: " + username + ", error: " + ex.getMessage());
            ex.printStackTrace();
            return null;
        }
    }
}

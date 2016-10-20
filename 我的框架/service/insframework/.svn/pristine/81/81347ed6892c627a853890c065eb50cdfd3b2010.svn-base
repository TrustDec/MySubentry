package com.insframework.common.utils;



import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;


/**
 * 对称加密工具
 */
public class SecurityUtil {
	
	//*******秘钥，误改*******
	private static final String SECRUITY_AES_KEY = "INSFRAMEWORK*SECURITY*KEY*2015";
	
	/**
	 * 加密字符串
	 * 
	 * @param content
	 *            加密内容	 
	 * @return
	 */
	public static String encrypt(String data) {
		try {

			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			kgen.init(128, new SecureRandom(SECRUITY_AES_KEY.getBytes()));
			SecretKey secretKey = kgen.generateKey();

			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec keySpec = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			byte[] byteContent = data.getBytes("UTF-8");
			cipher.init(Cipher.ENCRYPT_MODE, keySpec);

			byte[] result = cipher.doFinal(byteContent);

			return Base64.encode(result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 解密字符串
	 * 
	 * @param data
	 *            解密内容	
	 * @return
	 */
	public static String decrypt(String data) {
		try {

			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			kgen.init(128, new SecureRandom(SECRUITY_AES_KEY.getBytes()));
			SecretKey secretKey = kgen.generateKey();
			byte[] enCodeFormat = secretKey.getEncoded();
			SecretKeySpec keySpec = new SecretKeySpec(enCodeFormat, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, keySpec);

			byte[] result = cipher.doFinal(Base64.decode(data));

			return new String(result, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}	

}

package com.needmall.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class OpenCrypt {
	// 암호화
	public static byte[] getSHA256(String source, String salt) {
		byte byteData[]=null;
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(source.getBytes());
			md.update(salt.getBytes());
			byteData = md.digest();
		}catch(NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return byteData;
	}
}

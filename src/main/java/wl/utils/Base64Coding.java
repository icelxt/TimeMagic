package wl.utils;

import java.io.UnsupportedEncodingException;
import java.util.Base64;

import org.apache.commons.lang3.StringUtils;

public class Base64Coding {

	public static String encrypt(String key) {
		String encode = null;
		if (StringUtils.isNoneBlank(key)) {
			try {
				encode = Base64.getEncoder().encodeToString(key.getBytes("utf-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return encode;
	}

	public static String Decrypt(String key) {
		// byte[] decode = Base64.getUrlDecoder().decode(key);
		String decode = null;
		if (StringUtils.isNoneBlank(key)) {
			try {
				decode = new String(Base64.getDecoder().decode(key), "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return decode;
	}
}

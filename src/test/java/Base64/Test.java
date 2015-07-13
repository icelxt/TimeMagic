package Base64;

import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.HashMap;

import wl.utils.Base64Util;
import wl.utils.MD5Util;
import wl.utils.RSAUtil;

public class Test {

	@org.junit.Test
	public void test1() {
		String encrypt = Base64Util.encrypt("username:username,psw:123456");
		System.out.println(encrypt);
	}

	@org.junit.Test
	public void test2() {
		String decrypt = Base64Util.Decrypt("dXNlcm5hbWU6dXNlcm5hbWUscHN3OjEyMzQ1Ng==");
		System.out.println(decrypt);
	}

	@org.junit.Test
	public void test3() {
		String string2md5 = MD5Util.string2MD5("username:username,psw:123456");
		System.out.println(string2md5);
		String encrypt = Base64Util.encrypt(string2md5);
		System.out.println(encrypt);
	}

	@org.junit.Test
	public void test4() {
		String decrypt = Base64Util.Decrypt("NTM1YzM0NDY4Y2Q1OWM1ZmZhMDE0NDQ2OGNjOGUyNDk=");
		System.out.println(decrypt);
		String convertMD5 = MD5Util.convertMD5(decrypt);
		System.out.println(convertMD5);
	}

	@org.junit.Test
	public void test5() {
		HashMap<String, Object> map = RSAUtil.getKeys();
		RSAPublicKey publicKey = (RSAPublicKey) map.get("public");
		RSAPrivateKey privateKey = (RSAPrivateKey) map.get("private");
		// 模
		String modulus = publicKey.getModulus().toString();
		// 公钥指数
		String public_exponent = publicKey.getPublicExponent().toString();
		// 私钥指数
		String private_exponent = privateKey.getPrivateExponent().toString();
		// 明文
		String ming = "123456789";
		// 使用模和指数生成公钥和私钥
		RSAPublicKey pubKey = RSAUtil.getPublicKey(modulus, public_exponent);
		RSAPrivateKey priKey = RSAUtil.getPrivateKey(modulus, private_exponent);
		// 加密后的密文
		String mi = null;
		try {
			mi = RSAUtil.encryptByPublicKey(ming, pubKey);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.err.println(mi);
		// 解密后的明文
		try {
			ming = RSAUtil.decryptByPrivateKey(mi, priKey);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// System.err.println(ming);
	}

	@org.junit.Test
	public void test6() {
		HashMap<String, Object> map = RSAUtil.getKeys();
		RSAPublicKey publicKey = (RSAPublicKey) map.get("public");
		RSAPrivateKey privateKey = (RSAPrivateKey) map.get("private");
		String ming = "123456789";
		
	}
}

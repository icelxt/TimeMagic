package Base64;

import wl.utils.Base64Coding;
import wl.utils.MD5Util;

public class Test {

	@org.junit.Test
	public void test1() {
		String encrypt = Base64Coding.encrypt("username:username,psw:123456");
		System.out.println(encrypt);
	}

	@org.junit.Test
	public void test2() {
		String decrypt = Base64Coding.Decrypt("dXNlcm5hbWU6dXNlcm5hbWUscHN3OjEyMzQ1Ng==");
		System.out.println(decrypt);
	}

	@org.junit.Test
	public void test3() {
		String string2md5 = MD5Util.string2MD5("username:username,psw:123456");
		System.out.println(string2md5);
		String encrypt = Base64Coding.encrypt(string2md5);
		System.out.println(encrypt);
	}

	@org.junit.Test
	public void test4() {
		String decrypt = Base64Coding.Decrypt("NTM1YzM0NDY4Y2Q1OWM1ZmZhMDE0NDQ2OGNjOGUyNDk=");
		System.out.println(decrypt);
		String convertMD5 = MD5Util.convertMD5(decrypt);
		System.out.println(convertMD5);
	}

}

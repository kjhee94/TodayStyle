package kr.or.iei.common;

import java.security.MessageDigest;

import org.springframework.stereotype.Component;

@Component
public class SHA256Util {

	public String encryptionData(String data, String salt) throws Exception {
		
		//알고리즘 선언
		MessageDigest mDigest = MessageDigest.getInstance("SHA-256");
		
		//문자열 세팅
		String str = data+salt;
		
		mDigest.update(str.getBytes());
		
		byte [] encryptMsg = mDigest.digest();
		
		StringBuffer hexString = new StringBuffer();
		
		for(byte b : encryptMsg) {
			//16진수로 변환
			hexString.append(String.format("%02X", b));
		}
		System.out.println(hexString.toString());
		
		return hexString.toString();
	}
}

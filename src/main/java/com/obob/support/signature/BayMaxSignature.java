package com.obob.support.signature;

import java.security.PrivateKey;
import java.security.PublicKey;

import com.springcryptoutils.core.signature.Base64EncodedSigner;
import com.springcryptoutils.core.signature.Base64EncodedSignerImpl;
import com.springcryptoutils.core.signature.Base64EncodedVerifier;
import com.springcryptoutils.core.signature.Base64EncodedVerifierImpl;

/**
 * 
 * 超能陆战队的签名类
 * @author wenqiang
 * 2015年5月21日 下午5:05:40
 */
public class BayMaxSignature {
	
	public enum SignaureAlgorithm{
		SHA1withRSA;
	}
	
	/**
	 * 获取签名的对象
	 * @return Base64EncodedSigner
	 * @author wenqiang
	 * 2015年5月21日 下午5:09:29
	 */
	public static Base64EncodedSigner getSignerInstance(SignaureAlgorithm algorithm,PrivateKey priKey){
		Base64EncodedSignerImpl signer = new Base64EncodedSignerImpl();
		if(algorithm != null)
			//默认为SHA1withRSA
			signer.setAlgorithm(algorithm.name());
		signer.setPrivateKey(priKey);
		return signer;
	}
	
	/**
	 * 获取验证签名的对象
	 * @return Base64EncodedVerifier
	 * @author wenqiang
	 * 2015年5月21日 下午5:13:33
	 */
	public static Base64EncodedVerifier getVerifierInstance(SignaureAlgorithm algorithm,PublicKey pubkey){
		Base64EncodedVerifierImpl verifier = new Base64EncodedVerifierImpl();
		if(algorithm != null)
			//默认为SHA1withRSA
			verifier.setAlgorithm(algorithm.name());
		verifier.setPublicKey(pubkey);
		return verifier;
		
	}
	
	/**
	 * 签名
	 * @return String
	 * @author wenqiang
	 * 2015年5月21日 下午5:15:13
	 */
	public static String sign(String message,PrivateKey prikey,SignaureAlgorithm algorithm){
		Base64EncodedSigner signer = getSignerInstance(algorithm, prikey);
		return signer.sign(message);
	}
	
	/**
	 * 验证签名
	 * @return String
	 * @author wenqiang
	 * 2015年5月21日 下午5:17:15
	 */
	public static boolean verify(String message,String signature,PublicKey pubkey,SignaureAlgorithm algorithm){
		Base64EncodedVerifier verfier = getVerifierInstance(algorithm, pubkey);
		return verfier.verify(message, signature);
	}
	
}

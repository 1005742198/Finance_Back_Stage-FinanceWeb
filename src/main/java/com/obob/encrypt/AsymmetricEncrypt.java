package com.obob.encrypt;

import java.security.Key;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.UnrecoverableEntryException;

import org.apache.commons.lang3.StringUtils;

import com.obob.support.signature.BayMaxSignature;
import com.springcryptoutils.core.cipher.Mode;
import com.springcryptoutils.core.cipher.asymmetric.Base64EncodedCipherer;
import com.springcryptoutils.core.cipher.asymmetric.Base64EncodedCiphererImpl;
import com.springcryptoutils.core.key.PrivateKeyFactoryBean;
import com.springcryptoutils.core.key.PublicKeyFactoryBean;
import com.springcryptoutils.core.keystore.Base64EncodedKeyStoreFactoryBean;

/**
 * 
 * 非对称加密解密(RSA)
 * @author wenqiang
 * 2015年5月21日 下午4:27:28
 */
public class AsymmetricEncrypt {

	/**
	 * 
	 * @return Base64EncodedCipherer
	 * @author wenqiang
	 * 2015年5月21日 下午4:34:55
	 */
	public static Base64EncodedCipherer getInstance(Key key,Mode mode){
		Base64EncodedCiphererImpl cipherer = new Base64EncodedCiphererImpl();
		cipherer.setKey(key);
		cipherer.setMode(mode);
		return cipherer;
	}
	
	/**
	 * 加密
	 * @return String
	 * @author wenqiang
	 * 2015年5月21日 下午4:37:43
	 */
	public static String encryptStr(Key key,String message){
		Base64EncodedCipherer cipherer = getInstance(key, Mode.ENCRYPT);
		return cipherer.encrypt(message);
	}
	
	/**
	 * 解密
	 * @return String
	 * @author wenqiang
	 * 2015年5月21日 下午4:38:21
	 */
	public static String decryptStr(Key key,String message){
		Base64EncodedCipherer cipherer = getInstance(key, Mode.DECRYPT);
		return cipherer.encrypt(message);
	}
	
	/**
	 * 得到KeyStore对象包含公钥私钥 jsf文件
	 * @return KeyStore
	 * @author wenqiang
	 * 2015年5月21日 下午4:44:22
	 */
	public static KeyStore getKeyStore(String keystorefile,String password){
		Base64EncodedKeyStoreFactoryBean storeFactory = new Base64EncodedKeyStoreFactoryBean();
		storeFactory.setBase64EncodedKeyStoreFile(keystorefile);
		if(StringUtils.isNotBlank(password))
			storeFactory.setPassword(password);
		try {
			storeFactory.afterPropertiesSet();
			KeyStore keystore = (KeyStore) storeFactory.getObject();
			return keystore;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 获取公钥
	 * @return PublicKey
	 * @author wenqiang
	 * 2015年5月21日 下午4:46:35
	 */
	public static PublicKey getPublicKey(KeyStore keystore,String alias){
		PublicKeyFactoryBean pkeyFactory = new PublicKeyFactoryBean();
		if(StringUtils.isNotBlank(alias))
			pkeyFactory.setAlias(alias);
		
		pkeyFactory.setKeystore(keystore);
		try {
			pkeyFactory.afterPropertiesSet();
			PublicKey pkey = (PublicKey) pkeyFactory.getObject();
			return pkey;
		} catch (KeyStoreException e) {
			e.printStackTrace();
		}
		return null;
	
	}
	
	/**
	 * 获取私钥
	 * @return PrivateKey
	 * @author wenqiang
	 * 2015年5月21日 下午4:48:49
	 */
	public static PrivateKey getPrivateKey(KeyStore keystore,String alias,String password){
		PrivateKeyFactoryBean priKeyFactory = new PrivateKeyFactoryBean();
		if(StringUtils.isNotBlank(alias))
			priKeyFactory.setAlias(alias);
		
		priKeyFactory.setKeystore(keystore);
		
		if(StringUtils.isNotBlank(password))
			priKeyFactory.setPassword(password);
		
		try {
			priKeyFactory.afterPropertiesSet();
			PrivateKey prikey = (PrivateKey) priKeyFactory.getObject();
			return prikey;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnrecoverableEntryException e) {
			e.printStackTrace();
		} catch (KeyStoreException e) {
			e.printStackTrace();
		}
		return null;
		
	}
	
	public static void main(String[] args) {
		String keystorefile = "/u3+7QAAAAIAAAABAAAAAQAEdGVzdAAAASazcnA7AAACvTCCArkwDgYKKwYBBAEq"+
	            "AhEBAQUABIICpXWgVfoBjEXhW7TUr4i8npIcnRfWKy8i5Mly28DaiNQIcbUmqVol"+
	            "hfjbmoz930cT+puKpVmt+Rv28MEWEHDH3JFixM7aQgjmMsXL4z0AE/cgW0bn5C3P"+
	            "LBrvG3Ieq0Kj1ZebLuBtHM92LwrkctTq3dvy6sCQHLtpefInmdjqfAbJnls/y2RX"+
	            "PoNwwwu6yIWw6GnXQ41TjhIOcXhmog4e7aH+2Ch+6vFsnNf0hHDdGI/PPvGnIvf9"+
	            "kGb1a9894sy1xApi1oV/OzH3ZZ8WKlXZmycke3QtVfREFRv22400tayoFyQzCbNE"+
	            "jNpzExRhHd5W1fEaVBXIjw73eB8l31XgIQlBFnUBkBXkQ56nYPRL6ODPNIYEYJSE"+
	            "XJnN8POgc+TFEisP4MK4fzr7pb5iVBokbWMS6ixCayaUSksn/U8mtAQSSy3Wx8KS"+
	            "0S+HvHCv7g8qflLuQD3TC7dBF4ai8O7U4TXljqugW53UzmcSHbY+3js2R3SYdOxI"+
	            "1CZ+Ly59WYHsAwtVhor1QFqmx1GwI/OJFy5cdd0Kcn2IKcQwEuTZcNEL7ZzBSrKQ"+
	            "WQ/Vysn2rHr/iWZBg7H/8Ybk3yBoPvn9xi6IFOV74a9EPn3eb8h4yF6yFLieIKXo"+
	            "2pM1BFmvkbQYcg8HhWWb8ppJC5He2j6LCmhMBciVY5ltSXe8siyPqGi1uSNeqduv"+
	            "O+JGfCgpcAezpGL2KFCbcHyISPlhDERKWdI560OR8ytQXmX996OcM34aRl0D+cgL"+
	            "hblZOzXCv9bj9ePWMTytF/YeVebsjU4clxLWnGBU9hbkvdBTf8q795DAcbqnL6QC"+
	            "mo+1wq8OZTxRcF2Er97A3QCSrvK5hWrG2rkUcw55TSPeoaobj6YgYOnv1dpuHCXs"+
	            "6J8V/b4FGCDn2XAcgEUOAAAAAQAFWC41MDkAAAI5MIICNTCCAZ6gAwIBAgIES3GF"+
	            "tjANBgkqhkiG9w0BAQUFADBfMQswCQYDVQQGEwJJVDELMAkGA1UECBMCUk0xDTAL"+
	            "BgNVBAcTBFJvbWUxDTALBgNVBAoTBE5vbmUxDTALBgNVBAsTBE5vbmUxFjAUBgNV"+
	            "BAMTDU1pcmtvIENhc2VydGEwHhcNMTAwMjA5MTU1NjM4WhcNMTAwNTEwMTU1NjM4"+
	            "WjBfMQswCQYDVQQGEwJJVDELMAkGA1UECBMCUk0xDTALBgNVBAcTBFJvbWUxDTAL"+
	            "BgNVBAoTBE5vbmUxDTALBgNVBAsTBE5vbmUxFjAUBgNVBAMTDU1pcmtvIENhc2Vy"+
	            "dGEwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAKjtmUJ2Y06oi/e90tgfvNLt"+
	            "TadWre36dsKvhrhxaXtcGC54cjaN/r2iAlLnTrqJN9K7cWYHI5Rh1bYZzOSGY2PX"+
	            "6DoLis5OsDzP/9rXZRMVfNynLsjTeIkG579qht6j6JAtyvHIdH5hrDjE32xx/X78"+
	            "iLTYMAuXb+Uo8VNZTft7AgMBAAEwDQYJKoZIhvcNAQEFBQADgYEApXFvvASzzw4G"+
	            "VmbJB1os/PnKAD82WpDDP6pjDOE4ALAzJoP71uqvLffr4qRBmMOMX6IGmLBckYRS"+
	            "axQ8OCU6QBU4RU1cY/xxrXgfKditL8SAY4Ll07uwoilBJqxM9clT0AtYwxTgS5KF"+
	            "7bw6Q7mk5Ki1d9hpmBBn+HGB9+MCqTCz/VETRUu45lQPtwUuwvOmff2WHg==";
		String password = "password";//对于该秘钥文件是唯一的
		String alias = "test";//对于该秘钥文件是唯一的
		//KeyStore
		KeyStore keystore = getKeyStore(keystorefile, password);
		//PrivateKey
		PrivateKey prikey = getPrivateKey(keystore, alias, password);
		//Publickey
		PublicKey pubkey = getPublicKey(keystore, alias);
		
		String str = "woshiwenqiang";
		String encryptStr = encryptStr(prikey, str);
		System.out.println(">>>>>>待加密的字符串为:"+str+" 加密后为:"+encryptStr);
		String decryptStr = decryptStr(pubkey, encryptStr);
		System.out.println(">>>>>>>待解密的字符串为:"+encryptStr+" 解密后为:"+decryptStr);
		
		/**
		 * 签名
		 */
		String signature = BayMaxSignature.sign(encryptStr, prikey, null);
		System.out.println(">>>>>>>>>签名为:"+signature);
		
		/**
		 * 验证签名
		 */
		boolean verifyRs = BayMaxSignature.verify(encryptStr, signature, pubkey, null);
		System.out.println(">>>>>>>验证签名的结果为:"+verifyRs);
		
	}
	
}

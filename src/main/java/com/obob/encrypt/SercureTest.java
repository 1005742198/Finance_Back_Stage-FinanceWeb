package com.obob.encrypt;

import java.security.KeyStore;
import java.security.PrivateKey;
import java.security.PublicKey;

import org.apache.commons.codec.binary.Base64;

import com.springcryptoutils.core.cipher.Mode;
import com.springcryptoutils.core.cipher.symmetric.Base64EncodedCiphererImpl;
import com.springcryptoutils.core.cipher.symmetric.Base64EncodedKeyGeneratorImpl;
import com.springcryptoutils.core.key.PrivateKeyFactoryBean;
import com.springcryptoutils.core.key.PublicKeyFactoryBean;
import com.springcryptoutils.core.keystore.Base64EncodedKeyStoreFactoryBean;
import com.springcryptoutils.core.signature.Base64EncodedSignerImpl;
import com.springcryptoutils.core.signature.Base64EncodedVerifierImpl;


/**
 * 
 * 加密解密，签名测试类
 * @author wenqiang
 * 2015年5月21日 下午2:27:16
 */
public class SercureTest {
	
	public static void main(String[] args) throws Exception{
	/*	DigesterImpl dig = new DigesterImpl();
		dig.setAlgorithm("SHA1");//40
		//dig.setAlgorithm("MD5");//32
		dig.afterPropertiesSet();
		System.out.println(dig.digest("wenqiang"));*/
		
		/**
		 * 对称key 支持DESede/CBC/PKCS5Padding算法   对称加解密
		 */
		/*Base64EncodedCiphererImpl bciper = new Base64EncodedCiphererImpl();
		bciper.setMode(Mode.ENCRYPT);
		String initializationVector = new String(Base64.encodeBase64("11131111".getBytes()));//必须8位
		Base64EncodedKeyGeneratorImpl keygenerator = new Base64EncodedKeyGeneratorImpl();
		keygenerator.afterPropertiesSet();
		String key = keygenerator.generate();
		System.out.println(Base64.decodeBase64(key).length);
		String str = "wenqiang";
		//byte[] EncryptionIV = { 0x11, 0x22, 0x4F, 0x58, (byte) 0x88,  0x10, 0x40, 0x38};
		String enstr = bciper.encrypt(key, initializationVector, str);
		System.out.println(">>>>>>>加密的字符串为:"+str+" 加密后的字符串为:"+enstr);
		
		bciper.setMode(Mode.DECRYPT);
		String destr = bciper.encrypt(key, initializationVector, enstr);
		System.out.println(">>>>>>>>解密的字符串为:"+enstr+"解密后的字符串为:"+destr);*/
		
		//System.out.println("11111111".getBytes("utf-8").length);
		/**
		 * 非对称加密解密
		 */
		Base64EncodedKeyStoreFactoryBean storeFactory = new Base64EncodedKeyStoreFactoryBean();
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
		storeFactory.setBase64EncodedKeyStoreFile(keystorefile);
		storeFactory.setPassword("password");
		storeFactory.afterPropertiesSet();
		
		//keyStore
		KeyStore keystore = (KeyStore) storeFactory.getObject();
		
		/**
		 * 生成公钥
		 */
		PublicKeyFactoryBean pkeyFactory = new PublicKeyFactoryBean();
		pkeyFactory.setAlias("test");
		pkeyFactory.setKeystore(keystore);
		pkeyFactory.afterPropertiesSet();
		PublicKey pkey = (PublicKey) pkeyFactory.getObject();
		System.out.println(pkey.getEncoded());
		
		/**
		 * 生成私钥
		 */
		PrivateKeyFactoryBean priKeyFactory = new PrivateKeyFactoryBean();
		priKeyFactory.setAlias("test");
		priKeyFactory.setKeystore(keystore);
		priKeyFactory.setPassword("password");
		priKeyFactory.afterPropertiesSet();
		PrivateKey prikey = (PrivateKey) priKeyFactory.getObject();
		
		//生成Ciper实例 默认是RSA
		com.springcryptoutils.core.cipher.asymmetric.Base64EncodedCiphererImpl bciper = new com.springcryptoutils.core.cipher.asymmetric.Base64EncodedCiphererImpl();
		/**
		 * 加密
		 */
		bciper.setKey(prikey);
		bciper.setMode(Mode.ENCRYPT);
		String str = "mishi123";
		String enstr = bciper.encrypt("mishi123");
		System.out.println(">>>>>>>加密的字符串:"+str+"加密后为:"+enstr);
		
		/**
		 * 解密
		 */
		bciper.setKey(pkey);
		bciper.setMode(Mode.DECRYPT);
		String destr = bciper.encrypt(enstr);
		System.out.println(">>>>>>解密的字符串:"+enstr+"解密后为:"+destr);	
		
		
		/**
		 * 生成签名
		 */
		Base64EncodedSignerImpl bsinger = new Base64EncodedSignerImpl();
		bsinger.setPrivateKey(prikey);
		//签名串
		String singstr = bsinger.sign(enstr);
		System.out.println("签名串为:" + singstr);
		
		/**
		 * 验证签名
		 */
		Base64EncodedVerifierImpl bverify = new Base64EncodedVerifierImpl();
		bverify.setPublicKey(pkey);
		boolean flag = bverify.verify(enstr, singstr);
		System.out.println(">>>>>>>>>>验证签名结果为:"+flag);
		
	}
}

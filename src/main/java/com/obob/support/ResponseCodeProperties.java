/**
 * 
 */
package com.obob.support;

import java.io.IOException;
import java.util.Properties;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

/**
 * 读取response code 配置文件
 * @author yuhui.tang
 * 2013-5-2 下午8:05:46
 */
public class ResponseCodeProperties {
	
	private static Properties props;
	static {
		loadProperties();
	}
	
	/**
	 * 加载
	 */
	public static synchronized void loadProperties(){
		Resource resource = new ClassPathResource("/responsecode.properties");
		try {
			props = PropertiesLoaderUtils.loadProperties(resource);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	/**
	 * 根据Key读取value
	 * @param key
	 * @return
	 */
	public static String getProperty(int key){
		return props.getProperty(String.valueOf(key));
	}
	/**
	 * 根据key读value，如果没有匹配，则返回默认值
	 * @param key 
	 * @param defaultValue 默认值
	 * @return
	 */
	public static String getProperty(int key ,String defaultValue){
		return props.getProperty(String.valueOf(key), defaultValue);
	}
}

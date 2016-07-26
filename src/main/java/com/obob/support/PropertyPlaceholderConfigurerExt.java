/**
 * 
 */
package com.obob.support;

import java.util.Properties;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import com.obob.encrypt.SymmetricEncrypt;


/**
 * 配置文件加载扩展
 * 
 * @author yuhui.tang 2013-4-28 上午3:46:55
 */
public class PropertyPlaceholderConfigurerExt extends
		PropertyPlaceholderConfigurer {
	private static String DbUrl ="Core_DB.url";
	private static String DbUserKey ="Core_DB.user";
	private static String DbPasswdKey ="Core_DB.password";
	@Override
	protected void processProperties(
			ConfigurableListableBeanFactory beanFactory, Properties props)
			throws BeansException {
		//-----------解决用户、密码恢复的问题
		String url = props.getProperty(DbUrl);
		String user = props.getProperty(DbUserKey);
		String password = props.getProperty(DbPasswdKey);
		if(StringUtils.isNotBlank(url)) {
			props.setProperty(DbUrl, SymmetricEncrypt.decryptStr(url));
		}
		if(StringUtils.isNotBlank(user)) {
			props.setProperty(DbUserKey,SymmetricEncrypt.decryptStr(user));
		}
		if(StringUtils.isNotBlank(password)) {
			props.setProperty(DbPasswdKey,SymmetricEncrypt.decryptStr(password));
		}
		super.processProperties(beanFactory, props);
	}

}

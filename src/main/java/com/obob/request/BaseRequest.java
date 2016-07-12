package com.obob.request;

import java.io.Serializable;

/**
 * 请输入类用途描述，与人方便自己方便
 * @author Administrator
 * 2016年5月16日 下午5:57:14
 */
public class BaseRequest implements Serializable{
	
	private static final long serialVersionUID = 1924945947916541591L;

	private String version;
	
	private String pageUrl;
	
	private String sequence;
	
	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getPageUrl() {
		return pageUrl;
	}

	public void setPageUrl(String pageUrl) {
		this.pageUrl = pageUrl;
	}

	public String getSequence() {
		return sequence;
	}

	public void setSequence(String sequence) {
		this.sequence = sequence;
	}

	
}

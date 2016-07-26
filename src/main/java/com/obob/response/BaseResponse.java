package com.obob.response;

import java.io.Serializable;

/**
 * 基础响应对象. 
 * 
 * @author bo.yang
 */
public class BaseResponse implements Serializable {

	private static final long serialVersionUID = -7265114321041173317L;
	
	private int retcode;
	private String msg;
	private Object data;
	
	public int getRetcode() {
		return retcode;
	}
	public BaseResponse setRetcode(int retcode) {
		this.retcode = retcode;
		return this;
	}
	public String getMsg() {
		return msg;
	}
	public BaseResponse setMsg(String msg) {
		this.msg = msg;
		return this;
	}
	public Object getData() {
		return data;
	}
	public BaseResponse setData(Object data) {
		this.data = data;
		return this;
	}
	
	public static BaseResponse build(){
		return new BaseResponse();
	}
}

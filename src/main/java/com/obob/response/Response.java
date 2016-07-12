package com.obob.response;

import java.io.Serializable;

/**
 * 基础响应对象. 
 * 
 * @author bo.yang
 */
public class Response implements Serializable {

	private static final long serialVersionUID = -7265114321041173317L;
	
	private int retcode;
	private String msg;
	private Object data;
	
	public int getRetcode() {
		return retcode;
	}
	public Response setRetcode(int retcode) {
		this.retcode = retcode;
		return this;
	}
	public String getMsg() {
		return msg;
	}
	public Response setMsg(String msg) {
		this.msg = msg;
		return this;
	}
	public Object getData() {
		return data;
	}
	public Response setData(Object data) {
		this.data = data;
		return this;
	}
	
	public static Response build(){
		return new Response();
	}
}

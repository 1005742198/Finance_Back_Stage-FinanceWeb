/**
 * 异常基类
 */
package com.obob.exception;

import com.obob.response.BaseResponse;
import com.obob.support.ResponseCodeProperties;


/**
 * baymax程序逻辑异常类
 * 用于逻辑判断抛出异常
 * @author yuhui.tang
 * 2015-05-18
 */
public class BayMaxBaseException extends RuntimeException {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7002036086093717394L;
	public final static int _Error_Default_Code = -3400000;
	/**
	 * 错误返回码
	 */
	private int retCode = _Error_Default_Code ;
	/**
	 * 异常
	 */
	private Throwable cause;
	/**
	 * 异常描述
	 */
	private String causeMessage;
	/**
	 * yuhui.tang add 2015-06-02 11:04
	 */
	private BaseResponse response;
	/**
	 * 异常类型
	 */
	private ExceptionType exceptionType;
	
	public BayMaxBaseException(Throwable cause) {
		super();
		this.cause = cause;
	}
	
	public BayMaxBaseException(int retCode, Throwable cause, String causeMessage) {
		super();
		this.retCode = retCode;
		this.cause = cause;
		this.causeMessage = causeMessage;
	}
	
	public BayMaxBaseException(int retCode, Throwable cause) {
		super();
		this.retCode = retCode;
		this.cause = cause;
		this.causeMessage = cause == null ? ResponseCodeProperties.getProperty(retCode) : cause.getMessage();
	}
	
	public BayMaxBaseException(int retCode, Throwable cause, String causeMessage,
			ExceptionType exceptionType) {
		super();
		this.retCode = retCode;
		this.cause = cause;
		this.causeMessage = causeMessage;
		this.exceptionType = exceptionType;
	}
	
	public BayMaxBaseException(int retCode, Throwable cause, BaseResponse response) {
		super();
		this.retCode = retCode;
		this.cause = cause;
		this.causeMessage = cause==null?"":cause.getMessage();// ResponseCodeProperties.getProperty(retCode);
		this.response = response;
	}
	
	public int getRetCode() {
		return retCode;
	}

	public BayMaxBaseException setRetCode(int retCode) {
		this.retCode = retCode;
		return this;
	}

	public Throwable getCause() {
		return cause;
	}

	public BayMaxBaseException setCause(Throwable cause) {
		this.cause = cause;
		return this;
	}

	public String getCauseMessage() {
		return causeMessage;
	}

	public BayMaxBaseException setCauseMessage(String causeMessage) {
		this.causeMessage = causeMessage;
		return this;
	}

	public ExceptionType getExceptionType() {
		return exceptionType;
	}

	public BayMaxBaseException setExceptionType(ExceptionType exceptionType) {
		this.exceptionType = exceptionType;
		return this;
	}

	public BaseResponse getResponse() {
		return response;
	}

	public BayMaxBaseException setResponse(BaseResponse response) {
		this.response = response;
		return this;
	}
	
	public BaseResponse toResponse() {
		return response;
	}

	@Override
	public String getMessage() {
		return this.causeMessage;
	}
}
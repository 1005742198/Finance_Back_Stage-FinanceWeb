package com.obob.exception;

public class NoRowAffectException extends RuntimeException {

	public NoRowAffectException() {
		super();
		
	}

	public NoRowAffectException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		
	}

	public NoRowAffectException(String message, Throwable cause) {
		super(message, cause);
		
	}

	public NoRowAffectException(String message) {
		super(message);
		
	}

	public NoRowAffectException(Throwable cause) {
		super(cause);
		
	}

	/**
	 * @author peng.liu
	 * 2016年1月13日 上午11:10:31
	 */
	private static final long serialVersionUID = -8602131013548940325L;

}

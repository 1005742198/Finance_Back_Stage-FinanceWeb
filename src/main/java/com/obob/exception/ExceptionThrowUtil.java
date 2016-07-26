/**
* @author yuhui.tang 
* @date 2015年6月2日 上午11:08:46 
 */
package com.obob.exception;

import org.apache.commons.lang3.StringUtils;

import com.obob.response.BaseResponse;
import com.obob.response.ResponseCodeBase;
import com.obob.support.ResponseCodeProperties;

/**
 * 异常信息抛出工具
 * @author yuhui.tang
 * 2015年6月2日 上午11:08:46
 */
public class ExceptionThrowUtil {
	/**
	 * 根据指定的code，得到一个Exception
	 * @return BayMaxBaseException
	 * @author yuhui.tang
	 * 2015年6月3日 上午9:53:43
	 */
	public static BayMaxBaseException obtainException(BaseResponse response,int retCode){
		return  createException(response,retCode,null);
	}
	public static BayMaxBaseException obtainException(BaseResponse response,int retCode,String msg){
		return  createException(response,retCode,msg);
	}
	/**
	 * 空参数
	 * @return void
	 * @author yuhui.tang
	 * 2015年6月2日 上午11:12:41
	 */
	public static BayMaxBaseException emptyParameterException(BaseResponse response){
		return  createException(response,ResponseCodeBase.SYSTEM_PARAMETERS_EMPTY,null);
	}
	/**
	 * token 失效
	 * @return void
	 * @author yuhui.tang
	 * 2015年6月2日 上午11:12:53
	 */
	public static BayMaxBaseException tokenInvalidException(BaseResponse response){
		return  createException(response,ResponseCodeBase.TOKEN_INVALID,null);
	}
	/**
	 * 空记录
	 * @return BayMaxBaseException
	 * @author yuhui.tang
	 * 2015年6月3日 上午9:52:00
	 */
	public static BayMaxBaseException emptyRecordException(BaseResponse response){
		return  createException(response,ResponseCodeBase.RECORD_IS_NULL,null);
	}
	/**
	 * 构造/赋值BayMaxBaseException
	 * 请输入方法用途描述，与人方便自己方便
	 * @return BayMaxBaseException
	 * @author yuhui.tang
	 * 2015年6月3日 上午9:48:43
	 */
	private static BayMaxBaseException createException(BaseResponse response,int retCode,String msg){
		if(StringUtils.isBlank(msg)) msg = ResponseCodeProperties.getProperty(retCode);
		BayMaxBaseException exception = new BayMaxBaseException(retCode,null,
				msg);
		if(response!=null){
			//exception.setRetCode(response.getRetcode()).setCauseMessage(response.getMsg());
			exception.setResponse(response);
		}
		else{
			response = BaseResponse.build();
			response.setRetcode(exception.getRetCode()).setMsg(exception.getCauseMessage());
			exception.setResponse(response);
		}
		return exception; 
	}
}

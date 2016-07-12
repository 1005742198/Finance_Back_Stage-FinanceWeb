/**
* @author Administrator 
* @date 2016年5月16日 下午5:32:26 
 */
package com.obob.response;


/**
 * 请输入类用途描述，与人方便自己方便
 * @author Administrator
 * 2016年5月16日 下午5:32:26
 */
public enum RetCode {
	
	SUCCESS(0, "成功"),
	SYSTEM_ERROR(50000,"系统处理异常"),
	SYSTEM_PARAMETERS_EMPTY(50002,"传入参数为空"),
	SYSTEM_HTTPMETHOD_ERROR(50003,"不支持此访问方式"),
	
	//用户 10开头与用户相关
	USER_PHNOENO_INVALID(10000,"手机号已失效"),
	USER_MOBILE_EXIST(10001,"用户手机号已存在"),
	USER_NOT_EXIST(10003,"用户不存在"),
	BANKCARD_NOT_EXIST(10004,"用户尚未绑卡"),
	USER_STATUS_ERROR(10007,"用户已冻结"),
	USER_NOT_LOGIN(10028,"用户未登录"),
	PICCODE_VALID_FAILURE(10029,"图片验证码验证失败"),
	//SALE_AGENT_NOT_EXIE(10030,"承销机构不存在"),
	NOT_AGREE_PROTOCOL(10031,"用户不同意协议"),
	USER_ALREADY_BINDCARD(10032,"用户已绑卡"),
	USER_BINDCARD_FAILURE(10033,"用户绑卡失败"),
	USER_THIDCARD_ALREADY_BINDINGSUCCESS(10034,"此卡已绑定成功"),
	USER_THIDCARD_HANDING(10035,"此卡正在绑定处理中"),
	USER_THIDCARD_ALREADY_BINDINGFAIL(10036,"此卡已绑定失败，请重新绑卡"),
	
	SALEAGENT_NOT_EXIST(10040,"承销商不存在"),
	USER_NOTHOLD_PROJECTASSET(10041,"用户不持有该项目资产"),
	USER_ALREADY_FREEZE(10042,"此手机号已冻结"),
	USER_TRADEPASSWOD_ERROR(20001,"交易密码错误"),
	USER_TRADERECORD_NOT_EXIST(30001,"交易记录不存在"),
	//11开头与项目相关
	PROJECT_NOT_EXIST(11001,"项目不存在"),
	PROJECT_ALREADY_COMPLETE(11002,"项目已完成，投资人可进入'我的投资'查看项目详情及投资情况"),
	ORDERAPPLY_NOT_EXIST(70003,"订单不存在"),
	OTHER_ERROR(99999,"其他错误");
	
	
	private int code;
	private String message;
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	private RetCode(int code, String message) {
		this.code = code;
		this.message = message;
	}


}

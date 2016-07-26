package com.obob.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

import com.alibaba.fastjson.JSONObject;
import com.obob.exception.BayMaxBaseException;


public abstract class BaseController {
	protected final static String _PAGEINDEX = "pageCurrent";
	protected final static String _PAGESIZE = "pageSize";
	
	public JSONObject resultSuccess() {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("statusCode", "200");
		jsonObj.put("message", "操作成功");
		return jsonObj;
	}
	/**
	 * 增加传入异常
	 * @param e
	 * @return
	 */
	public JSONObject resultError(Exception e) {
		if(e == null){
			return this.resultError();
		}
		else{
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("statusCode", "300");
			if(e instanceof BayMaxBaseException){
				BayMaxBaseException exception = (BayMaxBaseException) e;
				jsonObj.put("message", StringUtils.isBlank(exception.getMessage())?"操作失败，请重试":exception.getMessage());
			}
			else{
				String msg = getErrorMsg(e);
				jsonObj.put("message", StringUtils.isBlank(msg)?"操作失败，请重试":msg);
			}
			return jsonObj;
		}
	}
	
	public JSONObject resultError() {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("statusCode", "300");
		jsonObj.put("message", "操作失败，请重试");
		return jsonObj;
	}
	
	public JSONObject resultError(String msg) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("statusCode", "300");
		jsonObj.put("message", msg);
		return jsonObj;
	}
	public JSONObject resultError(JSONObject json) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("statusCode", "300");
		jsonObj.put("message", json.get("msg"));
		return jsonObj;
	}
	
	protected Map<String, Object> paramToMap(HttpServletRequest request) {
		Map<String, Object> map = new HashMap<String, Object>();
		Enumeration<String> keys = request.getParameterNames();
		while(keys.hasMoreElements()) {
			String key = keys.nextElement();
			String value = request.getParameter(key);
			if(StringUtils.isNotEmpty(value))
				map.put(key, value);
		}
		if(StringUtils.isEmpty(request.getParameter(_PAGEINDEX))) {
			map.put(_PAGEINDEX, 1);
		}
		if(StringUtils.isEmpty(request.getParameter(_PAGESIZE))) {
			map.put(_PAGESIZE, 20);
		}
		String orderField = request.getParameter("orderField");
		String orderDirection = request.getParameter("orderDirection");
		if(StringUtils.isNotEmpty(orderField)) {
			 map.put("sortColumns", orderField + " " + (StringUtils.isNotEmpty(orderDirection) ? orderDirection : "")); //排序
		}
		return map;
	}
	/**
	 * 根据exception类型返回错误信息描述
	 * @param e
	 * @return
	 */
	protected abstract String getErrorMsg(Exception e);
	
}

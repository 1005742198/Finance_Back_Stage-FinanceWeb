package com.obob.controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.obob.response.BaseResponse;
import com.obob.response.RetCode;

@RestController
@RequestMapping("/user")
public class UserController extends BaseController {
	
	@RequestMapping("/login")
	public String login(String userName,ModelMap map) {
		map.addAttribute("hello", userName);
		return "index";
//		return BaseResponse.build().setRetcode(RetCode.SUCCESS.getCode()).setMsg(RetCode.SUCCESS.getMessage()).setData("hello " + userName);
	}
	
	@RequestMapping("/findpsw")
	public BaseResponse findpsw(String userName) {
		return BaseResponse.build().setRetcode(RetCode.SUCCESS.getCode()).setMsg(RetCode.SUCCESS.getMessage()).setData("hello " + userName);
	}
	
	@RequestMapping("/getmenus")
	public BaseResponse getMenu() {
		return BaseResponse.build().setRetcode(RetCode.SUCCESS.getCode()).setMsg(RetCode.SUCCESS.getMessage()).setData("hello ");
	}

	@Override
	protected String getErrorMsg(Exception e) {
		// TODO Auto-generated method stub
		return null;
	}
}

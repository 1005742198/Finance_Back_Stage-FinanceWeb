package com.obob.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.obob.response.Response;
import com.obob.response.RetCode;

@RestController
@RequestMapping("/")
public class HelloController {
	
	@RequestMapping("hello")
	public Response hello(String userName) {
		return Response.build().setRetcode(RetCode.SUCCESS.getCode()).setMsg(RetCode.SUCCESS.getMessage()).setData("hello " + userName);
	}
}

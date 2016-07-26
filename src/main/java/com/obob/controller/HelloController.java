package com.obob.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.obob.response.BaseResponse;
import com.obob.response.RetCode;

@Controller
@RequestMapping("/hello")
public class HelloController extends BaseController {
	
	@RequestMapping("byjson")
	public BaseResponse hello(String userName) {
		return BaseResponse.build().setRetcode(RetCode.SUCCESS.getCode()).setMsg(RetCode.SUCCESS.getMessage()).setData("hello " + userName);
	}

	@Override
	protected String getErrorMsg(Exception e) {
		// TODO Auto-generated method stub
		return null;
	}
	@RequestMapping(value = "/bypage" , method=RequestMethod.POST)
	public ModelAndView welcome(String userName) {
		ModelAndView model = new ModelAndView("index");
		model.addObject("userName", userName);
		return model;
	}
}

package com.qhrc.exam.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qhrc.exam.constant.ResultType;
import com.qhrc.exam.service.UserService;

@Controller
public class LogoutController {
	
	@Autowired
    UserService userService;
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
    @ResponseBody
    public String logout(HttpSession session){
		return ResultType.SUCCESS;
    }
}

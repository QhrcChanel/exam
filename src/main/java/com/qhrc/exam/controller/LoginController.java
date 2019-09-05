package com.qhrc.exam.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qhrc.exam.constant.ResultType;
import com.qhrc.exam.domain.User;
import com.qhrc.exam.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
    UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public String login(User user, HttpSession session){
		User dbUser = userService.getUserByAcctName(user.getAcctName());
		
		if(dbUser == null) {
			return ResultType.USER_NOT_EXIST;
		}
		if(user.getPassword().equals(dbUser.getPassword())) {
			return ResultType.SUCCESS;
		}else {
			return ResultType.WRONG_PASSWORD;
		}
    }
}

package com.qhrc.exam.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qhrc.exam.domain.User;
import com.qhrc.exam.service.UserService;

@Controller
public class HelloController {
	
	private static Logger log=LoggerFactory.getLogger(HelloController.class);
	
	@Autowired
    UserService userService;
	
    @RequestMapping(value = "/hello")
    @ResponseBody
    public String hello(){
    	log.info("测试 log配置");
        return "hello world";
    }
    
    @RequestMapping(value = "/user/{userId}")
    @ResponseBody
    public String helloUser(@PathVariable("userId")Integer userId){
        User user = userService.getUserById(userId);
        return "hello "+user.getUserName()+",密码："+user.getPassword();
    }
}

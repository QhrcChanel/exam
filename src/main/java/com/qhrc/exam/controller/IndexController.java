package com.qhrc.exam.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class IndexController {
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
    public String init(HttpSession session){
		return "index";
	}
}

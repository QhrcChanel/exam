package com.qhrc.exam.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.qhrc.exam.constant.ResultType;
import com.qhrc.exam.domain.Question;
import com.qhrc.exam.domain.QuestionCate;
import com.qhrc.exam.domain.QuestionQuery;
import com.qhrc.exam.domain.QuestionType;
import com.qhrc.exam.service.QuestionCateService;
import com.qhrc.exam.service.QuestionService;
import com.qhrc.exam.service.QuestionTypeService;

@Controller
public class QuestionController {
	
	@Autowired
    QuestionService quesService;
	
	@Autowired
    QuestionTypeService quesTypeService;
	
	@Autowired
    QuestionCateService quesCateService;
	
	@RequestMapping(value = "/viewQuesList", method = RequestMethod.GET)
    public String viewQuesList(HttpSession session){
		return "question/viewQuesList";
	}
	
	@RequestMapping(value = "/datatable", method = RequestMethod.GET)
    public String datatable(HttpSession session){
		return "datatable";
	}
	
	@RequestMapping(value = "/queryQues", method = RequestMethod.POST)
	@ResponseBody
    public String queryQues(QuestionQuery questionQuery, HttpSession session){
		List<Question> quesList = quesService.queryQuesByParams(questionQuery);
		return JSON.toJSONString(quesList);
	}
	
	@RequestMapping(value = "/editQues", method = RequestMethod.POST)
	@ResponseBody
    public String queryQuesCate(Question question, HttpSession session){
		int result = quesService.modifyQuestion(question);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/queryQuesType", method = RequestMethod.POST)
	@ResponseBody
    public String queryQuesType(HttpSession session){
		List<QuestionType> quesTypeList = quesTypeService.queryQuesType();
		return JSON.toJSONString(quesTypeList);
	}
	
	@RequestMapping(value = "/queryQuesCate", method = RequestMethod.POST)
	@ResponseBody
    public String queryQuesCate(HttpSession session){
		List<QuestionCate> quesCateList = quesCateService.queryQuesCate();
		return JSON.toJSONString(quesCateList);
	}
	
	@RequestMapping(value = "/addQues", method = RequestMethod.POST)
	@ResponseBody
    public String addQues(ArrayList<Question> quesList, HttpSession session){
		for(Question ques : quesList) {
			System.out.println(ques.getQuesTitle() + "---" + 
							ques.getQuesTypeId() + "---" +
							ques.getQuesCateId() + "---" +
							ques.getQuesRightAnswer());
		}
		quesService.addQuestionList(quesList);
		return ResultType.SUCCESS;
	}
}

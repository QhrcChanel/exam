package com.qhrc.exam.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qhrc.exam.constant.ResultType;
import com.qhrc.exam.domain.Question;
import com.qhrc.exam.service.QuestionService;

@Controller
public class QuestionController {
	
	@Autowired
    QuestionService quesService;
	
	@RequestMapping(value = "/viewQues", method = RequestMethod.GET)
    public String viewQues(String quesTitle, Integer quesTypeId, Integer quesCateId, HttpSession session){
		List<Question> quesList = quesService.queryQuesByParams(quesTitle, quesTypeId, quesCateId);
		for(Question ques : quesList) {
			System.out.println(ques.getQuesTitle() + "---" + 
							ques.getQuesTypeId() + "---" +
							ques.getQuesCateId() + "---" +
							ques.getQuesRightAnswer());
		}
		return "question/viewQues";
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

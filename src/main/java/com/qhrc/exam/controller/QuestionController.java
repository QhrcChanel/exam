package com.qhrc.exam.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.qhrc.exam.constant.ResultType;
import com.qhrc.exam.domain.DatatableResult;
import com.qhrc.exam.domain.Question;
import com.qhrc.exam.domain.QuestionCate;
import com.qhrc.exam.domain.QuestionCondition;
import com.qhrc.exam.domain.QuestionType;
import com.qhrc.exam.service.QuestionCateService;
import com.qhrc.exam.service.QuestionService;
import com.qhrc.exam.service.QuestionTypeService;
import com.qhrc.exam.common.JsonHelper;

@Controller
public class QuestionController {
	
	@Autowired
    QuestionService quesService;
	
	@Autowired
    QuestionTypeService quesTypeService;
	
	@Autowired
    QuestionCateService quesCateService;
	
	@RequestMapping(value = "/quesList", method = RequestMethod.GET)
    public String viewQuesList(HttpSession session){
		return "question/quesList";
	}
	
	@RequestMapping(value = "/queryQues", method = RequestMethod.POST)
	@ResponseBody
    public String queryQues(String paramStr, HttpSession session){
		HashMap<String, String> paramMap = JsonHelper.JsonStrToHashMap(paramStr); 
		QuestionCondition questionCondition = new QuestionCondition();
		questionCondition.setIDisplayStart(Integer.parseInt(paramMap.get("iDisplayStart")));
		questionCondition.setIDisplayLength(Integer.parseInt(paramMap.get("iDisplayLength")));
		questionCondition.setQuesTitle(paramMap.get("quesTitle").trim());
		questionCondition.setQuesRightAnswer(paramMap.get("quesRightAnswer").trim());
		
		int quesTypeId = paramMap.get("quesTypeId") == null ? 0 : Integer.parseInt(paramMap.get("quesTypeId"));
		int quesCateId = paramMap.get("quesCateId") == null ? 0 : Integer.parseInt(paramMap.get("quesCateId"));
		questionCondition.setQuesTypeId(quesTypeId);
		questionCondition.setQuesCateId(quesCateId);
		
		List<Question> quesList = quesService.queryQuesByParams(questionCondition);
		int totalNum = quesService.queryQuesNumByParams(questionCondition);
		
		DatatableResult<Question> quesResult = new DatatableResult<Question>();
		quesResult.setSEcho(Integer.parseInt(paramMap.get("sEcho")));
		quesResult.setITotalDisplayRecords(totalNum);
		quesResult.setITotalRecords(totalNum);
		quesResult.setAaData(quesList);
		return JSON.toJSONString(quesResult);
	}
	
	@RequestMapping(value = "/editQues", method = RequestMethod.POST)
	@ResponseBody
    public String editQues(Question question, HttpSession session){
		int result = quesService.modifyQuestion(question);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/removeQues", method = RequestMethod.POST)
	@ResponseBody
    public String removeQues(Question question, HttpSession session){
		int result = quesService.remove(question);
		return String.valueOf(result);
	}
	
	@RequestMapping(value = "/addQues", method = RequestMethod.POST)
	@ResponseBody
    public String addQues(Question question, HttpSession session){
		int result = quesService.addQues(question);
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
	
	@RequestMapping(value = "/addQuesList", method = RequestMethod.POST)
	@ResponseBody
    public String addQues(ArrayList<Question> quesList, HttpSession session){
		for(Question ques : quesList) {
			System.out.println(ques.getQuesTitle() + "---" + 
							ques.getQuesTypeId() + "---" +
							ques.getQuesCateId() + "---" +
							ques.getQuesRightAnswer());
		}
		quesService.addQuesList(quesList);
		return ResultType.SUCCESS;
	}
}

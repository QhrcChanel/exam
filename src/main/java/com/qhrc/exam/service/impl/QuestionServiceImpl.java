package com.qhrc.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qhrc.exam.dao.IQuestionDao;
import com.qhrc.exam.domain.Question;
import com.qhrc.exam.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
    IQuestionDao questionDao;
	
	@Override
	public void addQuestionList(List<Question> quesList) {
		questionDao.insertQuesList(quesList);
	}

	@Override
	public List<Question> queryQuesByParams(String quesTitle, Integer quesTypeId, Integer quesCateId) {
		return questionDao.selectQuesByParmas(quesTitle, quesTypeId, quesCateId);
	}
}

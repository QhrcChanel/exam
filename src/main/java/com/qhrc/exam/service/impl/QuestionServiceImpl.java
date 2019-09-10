package com.qhrc.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qhrc.exam.dao.IQuestionDao;
import com.qhrc.exam.dao.IQuestionTypeDao;
import com.qhrc.exam.domain.Question;
import com.qhrc.exam.domain.QuestionQuery;
import com.qhrc.exam.domain.QuestionType;
import com.qhrc.exam.service.QuestionService;
import com.qhrc.exam.service.QuestionTypeService;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
    IQuestionDao questionDao;
	
	@Override
	public void addQuestionList(List<Question> quesList) {
		questionDao.insertQuesList(quesList);
	}

	@Override
	public List<Question> queryQuesByParams(QuestionQuery questionQuery) {
		int currIndex = (questionQuery.getPageNum() - 1) * questionQuery.getPageSize();
		return questionDao.selectQuesByParmas(currIndex, questionQuery.getPageSize(), 
			questionQuery.getQuesTitle(), questionQuery.getQuesTypeId(), questionQuery.getQuesCateId());
	}
}

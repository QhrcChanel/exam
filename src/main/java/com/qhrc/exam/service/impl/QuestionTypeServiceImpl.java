package com.qhrc.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qhrc.exam.dao.IQuestionTypeDao;
import com.qhrc.exam.domain.QuestionType;
import com.qhrc.exam.service.QuestionTypeService;

@Service
public class QuestionTypeServiceImpl implements QuestionTypeService {
	
	@Autowired
    IQuestionTypeDao questionTypeDao;
	
	@Override
	public List<QuestionType> queryQuesType() {
		return questionTypeDao.selectQuesType();
	}
}

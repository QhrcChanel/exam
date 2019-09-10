package com.qhrc.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qhrc.exam.dao.IQuestionCateDao;
import com.qhrc.exam.domain.QuestionCate;
import com.qhrc.exam.service.QuestionCateService;

@Service
public class QuestionCateServiceImpl implements QuestionCateService {
	
	@Autowired
    IQuestionCateDao questionCateDao;
	
	@Override
	public List<QuestionCate> queryQuesCate() {
		return questionCateDao.selectQuesCate();
	}
}

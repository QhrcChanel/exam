package com.qhrc.exam.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qhrc.exam.dao.IQuestionDao;
import com.qhrc.exam.domain.Question;
import com.qhrc.exam.domain.QuestionCondition;
import com.qhrc.exam.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
    IQuestionDao questionDao;
	
	@Override
	public int addQues(Question question) {
		return questionDao.insertQues(question);
		
	}
	
	@Override
	public void addQuesList(List<Question> quesList) {
		questionDao.insertQuesList(quesList);
	}

	@Override
	public List<Question> queryQuesByParams(QuestionCondition questionCondition) {
		return questionDao.selectQuesByParmas(questionCondition.getIDisplayStart() , 
											questionCondition.getIDisplayLength(),
											questionCondition.getQuesTitle().trim(), 
											questionCondition.getQuesRightAnswer().trim(),
											questionCondition.getQuesTypeId(), 
											questionCondition.getQuesCateId());
	}
	
	@Override
	public int queryQuesNumByParams(QuestionCondition questionCondition) {
		return questionDao.selectQuesNumByParmas(
											questionCondition.getQuesTitle(), 
											questionCondition.getQuesRightAnswer(),
											questionCondition.getQuesTypeId(), 
											questionCondition.getQuesCateId());
	}

	@Override
	public int modifyQuestion(Question question) {
		return questionDao.updateQues(question);
	}

	@Override
	public int remove(Question question) {
		return questionDao.deleteQues(question);
	}
}

package com.qhrc.exam.service;

import java.util.List;

import com.qhrc.exam.domain.Question;
import com.qhrc.exam.domain.QuestionCondition;

public interface QuestionService {
	public void addQuesList(List<Question> quesList);
	public List<Question> queryQuesByParams(QuestionCondition questionCondition);
	public int queryQuesNumByParams(QuestionCondition questionCondition);
	public int modifyQuestion(Question question);
	public int addQues(Question question);
	public int remove(Question question);
}

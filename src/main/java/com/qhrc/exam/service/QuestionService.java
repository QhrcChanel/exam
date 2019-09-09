package com.qhrc.exam.service;

import java.util.List;

import com.qhrc.exam.domain.Question;

public interface QuestionService {
	public void addQuestionList(List<Question> quesList);
	public List<Question> queryQuesByParams(String quesTitle, Integer quesTypeId, Integer quesCateId);
}

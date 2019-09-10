package com.qhrc.exam.service;

import java.util.List;

import com.qhrc.exam.domain.Question;
import com.qhrc.exam.domain.QuestionQuery;

public interface QuestionService {
	public void addQuestionList(List<Question> quesList);
	public List<Question> queryQuesByParams(QuestionQuery questionQuery);
}

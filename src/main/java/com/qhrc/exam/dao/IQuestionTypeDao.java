package com.qhrc.exam.dao;

import java.util.List;

import com.qhrc.exam.domain.QuestionType;

public interface IQuestionTypeDao {
	public List<QuestionType> selectQuesType();
}

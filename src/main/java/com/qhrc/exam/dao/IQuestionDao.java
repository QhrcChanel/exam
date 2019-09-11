package com.qhrc.exam.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.qhrc.exam.domain.Question;

public interface IQuestionDao {
	public void insertQuesList(List<Question> quesList);
	public List<Question> selectQuesByParmas(@Param("currIndex")Integer currIndex,
											@Param("pageSize")Integer pageSize,
											@Param("quesTitle")String quesTitle, 
											@Param("quesTypeId")Integer quesTypeId, 
											@Param("quesCateId")Integer quesCateId);
	
	public int updateQues(Question question);
}

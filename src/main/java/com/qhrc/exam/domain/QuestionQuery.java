package com.qhrc.exam.domain;

public class QuestionQuery  {
	private String quesTitle;
	private String quesRightAnswer;
	private int quesTypeId;
	private int quesCateId;
	private String quesTypeName;
	private String quesCateName;
	
	public String getQuesTitle() {
		return quesTitle;
	}
	public void setQuesTitle(String quesTitle) {
		this.quesTitle = quesTitle;
	}
	public int getQuesTypeId() {
		return quesTypeId;
	}
	public String getQuesRightAnswer() {
		return quesRightAnswer;
	}
	public void setQuesRightAnswer(String quesRightAnswer) {
		this.quesRightAnswer = quesRightAnswer;
	}
	public void setQuesTypeId(int quesTypeId) {
		this.quesTypeId = quesTypeId;
	}
	public int getQuesCateId() {
		return quesCateId;
	}
	public void setQuesCateId(int quesCateId) {
		this.quesCateId = quesCateId;
	}
	public String getQuesTypeName() {
		return quesTypeName;
	}
	public void setQuesTypeName(String quesTypeName) {
		this.quesTypeName = quesTypeName;
	}
	public String getQuesCateName() {
		return quesCateName;
	}
	public void setQuesCateName(String quesCateName) {
		this.quesCateName = quesCateName;
	}
}

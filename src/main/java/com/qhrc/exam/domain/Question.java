package com.qhrc.exam.domain;

public class Question {
	private Integer quesId;
	private String quesTitle;
	private String quesRightAnswer;
	private Integer quesTypeId;
	private Integer quesCateId;
	private String quesTypeName;
	private String quesCateName;
	
	public Integer getQuesId() {
		return quesId;
	}
	public void setQuesId(Integer quesId) {
		this.quesId = quesId;
	}
	public String getQuesTitle() {
		return quesTitle;
	}
	public void setQuesTitle(String quesTitle) {
		this.quesTitle = quesTitle;
	}
	public String getQuesRightAnswer() {
		return quesRightAnswer;
	}
	public void setQuesRightAnswer(String quesRightAnswer) {
		this.quesRightAnswer = quesRightAnswer;
	}
	public Integer getQuesTypeId() {
		return quesTypeId;
	}
	public void setQuesTypeId(Integer quesTypeId) {
		this.quesTypeId = quesTypeId;
	}
	public Integer getQuesCateId() {
		return quesCateId;
	}
	public void setQuesCateId(Integer quesCateId) {
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

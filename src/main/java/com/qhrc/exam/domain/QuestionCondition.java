package com.qhrc.exam.domain;

public class QuestionCondition extends DatatableCondition {
	private String quesTitle;
	private String quesRightAnswer;
	private int quesTypeId;
	private int quesCateId;
	
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
	public int getQuesTypeId() {
		return quesTypeId;
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
}

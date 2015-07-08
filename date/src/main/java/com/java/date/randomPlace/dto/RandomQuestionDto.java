package com.java.date.randomPlace.dto;

public class RandomQuestionDto {
	 
	private String question_Number;
	 
	private String question;
	
	private String next_Question;
	
	private String question_Yes;
	
	private String question_No;

	public String getNext_Question() {
		return next_Question;
	}

	public void setNext_Question(String next_question) {
		this.next_Question = next_question;
	}

	public String getQuestion_Yes() {
		return question_Yes;
	}

	public void setQuestion_Yes(String question_Yes) {
		this.question_Yes = question_Yes;
	}

	public String getQuestion_No() {
		return question_No;
	}

	public void setQuestion_No(String question_No) {
		this.question_No = question_No;
	}

	public String getQuestion_Number() {
		return question_Number;
	}

	public void setQuestion_Number(String question_number) {
		this.question_Number = question_number;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}
	
	
}

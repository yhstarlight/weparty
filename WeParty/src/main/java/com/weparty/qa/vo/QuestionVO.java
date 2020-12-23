package com.weparty.qa.vo;

public class QuestionVO {

	private int question_no;
	private String question_type;
	private String question_writer_id;
	private String question_title;
	private String question_content;
	private String question_regdate;
	private String question_state;
	
	private int startrow;
	private int endrow;
	
	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getEndrow() {
		return endrow;
	}
	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}
	
	public int getQuestion_no() {
		return question_no;
	}
	public void setQuestion_no(int question_no) {
		this.question_no = question_no;
	}
	public String getQuestion_type() {
		return question_type;
	}
	public void setQuestion_type(String question_type) {
		this.question_type = question_type;
	}
	public String getQuestion_writer_id() {
		return question_writer_id;
	}
	public void setQuestion_writer_id(String question_writer_id) {
		this.question_writer_id = question_writer_id;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public String getQuestion_state() {
		return question_state;
	}
	public void setQuestion_state(String question_state) {
		this.question_state = question_state;
	}
	public String getQuestion_regdate() {
		return question_regdate;
	}
	public void setQuestion_regdate(String question_regdate) {
		this.question_regdate = question_regdate;
	}
	
}

package com.weparty.community.vo;

public class FreeBoardVO {

	private int free_board_no;
	private String free_board_writer_id;
	private String free_board_writer_nick;
	private String free_board_title;
	private String free_board_content;
	private String free_board_date;
	private int free_board_hit;
	
	private String search_keyword;
	private String search_condition;
	private int free_board_reply_cnt;
	
	private int startrow;
	private int endrow;
	
	public int getFree_board_no() {
		return free_board_no;
	}
	public void setFree_board_no(int free_board_no) {
		this.free_board_no = free_board_no;
	}
	public String getFree_board_writer_id() {
		return free_board_writer_id;
	}
	public void setFree_board_writer_id(String free_board_writer_id) {
		this.free_board_writer_id = free_board_writer_id;
	}
	public String getFree_board_writer_nick() {
		return free_board_writer_nick;
	}
	public void setFree_board_writer_nick(String free_board_writer_nick) {
		this.free_board_writer_nick = free_board_writer_nick;
	}
	public String getFree_board_title() {
		return free_board_title;
	}
	public void setFree_board_title(String free_board_title) {
		this.free_board_title = free_board_title;
	}
	public String getFree_board_content() {
		return free_board_content;
	}
	public void setFree_board_content(String free_board_content) {
		this.free_board_content = free_board_content;
	}
	public String getFree_board_date() {
		return free_board_date;
	}
	public void setFree_board_date(String free_board_date) {
		this.free_board_date = free_board_date;
	}
	public int getFree_board_hit() {
		return free_board_hit;
	}
	public void setFree_board_hit(int free_board_hit) {
		this.free_board_hit = free_board_hit;
	}
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
	public String getSearch_keyword() {
		return search_keyword;
	}
	public void setSearch_keyword(String search_keyword) {
		this.search_keyword = search_keyword;
	}
	public String getSearch_condition() {
		return search_condition;
	}
	public void setSearch_condition(String search_condition) {
		this.search_condition = search_condition;
	}
	public int getFree_board_reply_cnt() {
		return free_board_reply_cnt;
	}
	public void setFree_board_reply_cnt(int free_board_reply_cnt) {
		this.free_board_reply_cnt = free_board_reply_cnt;
	}
}

package com.weparty.community.vo;

public class InfoBoardVO {
	private int info_board_no;
	private String info_board_writer_id;
	private String info_board_writer_nick;
	private String info_board_title;
	private String info_board_new_file;
	private String info_board_origin_file;
	
	private String info_board_content;
	private String info_board_date;
	private int info_board_hit;
	
	private String search_keyword;
	private String search_condition;
	private int info_board_reply_cnt;
	
	private int startrow;
	private int endrow;
	
	public String getInfo_board_new_file() {
		return info_board_new_file;
	}
	public void setInfo_board_new_file(String info_board_new_file) {
		this.info_board_new_file = info_board_new_file;
	}
	public String getInfo_board_origin_file() {
		return info_board_origin_file;
	}
	public void setInfo_board_origin_file(String info_board_origin_file) {
		this.info_board_origin_file = info_board_origin_file;
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
	public int getInfo_board_no() {
		return info_board_no;
	}
	public void setInfo_board_no(int info_board_no) {
		this.info_board_no = info_board_no;
	}
	public String getInfo_board_writer_id() {
		return info_board_writer_id;
	}
	public void setInfo_board_writer_id(String info_board_writer_id) {
		this.info_board_writer_id = info_board_writer_id;
	}
	public String getInfo_board_writer_nick() {
		return info_board_writer_nick;
	}
	public void setInfo_board_writer_nick(String info_board_writer_nick) {
		this.info_board_writer_nick = info_board_writer_nick;
	}
	public String getInfo_board_title() {
		return info_board_title;
	}
	public void setInfo_board_title(String info_board_title) {
		this.info_board_title = info_board_title;
	}
	public String getInfo_board_content() {
		return info_board_content;
	}
	public void setInfo_board_content(String info_board_content) {
		this.info_board_content = info_board_content;
	}
	public String getInfo_board_date() {
		return info_board_date;
	}
	public void setInfo_board_date(String info_board_date) {
		this.info_board_date = info_board_date;
	}
	public int getInfo_board_hit() {
		return info_board_hit;
	}
	public void setInfo_board_hit(int info_board_hit) {
		this.info_board_hit = info_board_hit;
	}
	public int getInfo_board_reply_cnt() {
		return info_board_reply_cnt;
	}
	public void setInfo_board_reply_cnt(int info_board_reply_cnt) {
		this.info_board_reply_cnt = info_board_reply_cnt;
	}
	
	
}

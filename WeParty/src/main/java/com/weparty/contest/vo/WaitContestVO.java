package com.weparty.contest.vo;

import java.util.List;

public class WaitContestVO {
	private int wait_no;
	private String wait_writer_id;
	private String wait_title;
	private String wait_content;
	private String wait_host;
	private String wait_homepage;
	private String wait_target;
	private String wait_field;
	private String wait_poster;
	private String wait_poster_origin;
	private String wait_file;
	private String wait_file_origin;
	private String wait_startdate;
	private String wait_enddate;
	private List<String> targetList;
	
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
	public int getWait_no() {
		return wait_no;
	}
	public void setWait_no(int wait_no) {
		this.wait_no = wait_no;
	}
	public String getWait_writer_id() {
		return wait_writer_id;
	}
	public void setWait_writer_id(String wait_writer_id) {
		this.wait_writer_id = wait_writer_id;
	}
	public String getWait_title() {
		return wait_title;
	}
	public void setWait_title(String wait_title) {
		this.wait_title = wait_title;
	}
	public String getWait_content() {
		return wait_content;
	}
	public void setWait_content(String wait_content) {
		this.wait_content = wait_content;
	}
	public String getWait_host() {
		return wait_host;
	}
	public void setWait_host(String wait_host) {
		this.wait_host = wait_host;
	}
	public String getWait_homepage() {
		return wait_homepage;
	}
	public void setWait_homepage(String wait_homepage) {
		this.wait_homepage = wait_homepage;
	}
	public String getWait_target() {
		return wait_target;
	}
	public void setWait_target(String wait_target) {
		this.wait_target = wait_target;
	}
	public String getWait_field() {
		return wait_field;
	}
	public void setWait_field(String wait_field) {
		this.wait_field = wait_field;
	}
	public String getWait_poster() {
		return wait_poster;
	}
	public void setWait_poster(String wait_poster) {
		this.wait_poster = wait_poster;
	}
	public String getWait_file() {
		return wait_file;
	}
	public void setWait_file(String wait_file) {
		this.wait_file = wait_file;
	}
	public String getWait_startdate() {
		return wait_startdate;
	}
	public void setWait_startdate(String wait_startdate) {
		this.wait_startdate = wait_startdate;
	}
	public String getWait_enddate() {
		return wait_enddate;
	}
	public void setWait_enddate(String wait_enddate) {
		this.wait_enddate = wait_enddate;
	}
	public List<String> getTargetList() {
		return targetList;
	}
	public void setTargetList(List<String> targetList) {
		this.targetList = targetList;
	}
	public String getWait_poster_origin() {
		return wait_poster_origin;
	}
	public void setWait_poster_origin(String wait_poster_origin) {
		this.wait_poster_origin = wait_poster_origin;
	}
	public String getWait_file_origin() {
		return wait_file_origin;
	}
	public void setWait_file_origin(String wait_file_origin) {
		this.wait_file_origin = wait_file_origin;
	}
	
}

package com.weparty.manager.vo;

import java.util.List;

public class ManagerVO {

	private String manager_id;
	private String manager_pw;
	private String manager_name;
	private String manager_authority;
	private String manager_salt;
	private String manager_regdate;
	private List<String> authorityList;
	
	public List<String> getAuthorityList() {
		return authorityList;
	}
	public void setAuthorityList(List<String> authorityList) {
		this.authorityList = authorityList;
	}
	public String getManager_id() {
		return manager_id;
	}
	public void setManager_id(String manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_pw() {
		return manager_pw;
	}
	public void setManager_pw(String manager_pw) {
		this.manager_pw = manager_pw;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public String getManager_salt() {
		return manager_salt;
	}
	public void setManager_salt(String manager_salt) {
		this.manager_salt = manager_salt;
	}
	
	public String getManager_authority() {
		return manager_authority;
	}
	public void setManager_authority(String manager_authority) {
		this.manager_authority = manager_authority;
	}
	public String getManager_regdate() {
		return manager_regdate;
	}
	public void setManager_regdate(String manager_regdate) {
		this.manager_regdate = manager_regdate;
	}

	
}

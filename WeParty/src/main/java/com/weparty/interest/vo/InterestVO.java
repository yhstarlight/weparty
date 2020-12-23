package com.weparty.interest.vo;

import java.util.List;

public class InterestVO {
	private String interest_user_id;
	private List<String> interest;
	
	private char web = 'n';
	private char scenario = 'n';
	private char ucc = 'n';
	private char science = 'n';
	private char game = 'n';
	private char architecture = 'n';
	private char supporters = 'n';
	

	public List<String> getInterest() {
		return interest;
	}
	public void setInterest(List<String> interest) {
		this.interest = interest;
	}
	public char getWeb() {
		return web;
	}
	public void setWeb(char web) {
		this.web = web;
	}
	public char getScenario() {
		return scenario;
	}
	public void setScenario(char scenario) {
		this.scenario = scenario;
	}
	public char getUcc() {
		return ucc;
	}
	public void setUcc(char ucc) {
		this.ucc = ucc;
	}
	public char getScience() {
		return science;
	}
	public void setScience(char science) {
		this.science = science;
	}
	public char getGame() {
		return game;
	}
	public void setGame(char game) {
		this.game = game;
	}
	public char getArchitecture() {
		return architecture;
	}
	public void setArchitecture(char architecture) {
		this.architecture = architecture;
	}
	public char getSupporters() {
		return supporters;
	}
	public void setSupporters(char supporters) {
		this.supporters = supporters;
	}
	public String getInterest_user_id() {
		return interest_user_id;
	}
	public void setInterest_user_id(String interest_user_id) {
		this.interest_user_id = interest_user_id;
	}
	
	
}

package com.weparty.user.service;

import java.util.List;

import com.weparty.user.vo.UserVO;

public interface GetUserService {

	List<String> getUserId();
	
	List<String> getUserEmail();
	
	String findUser(UserVO vo);
	
	UserVO getUserInfo(String user_id);
	
	List<UserVO> getUserList(UserVO vo);
	
	int getUserCount();

}

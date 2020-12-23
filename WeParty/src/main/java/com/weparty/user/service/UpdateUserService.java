package com.weparty.user.service;

import com.weparty.user.vo.UserVO;

public interface UpdateUserService {

	void changePw(UserVO user);
	
	void changeUserInfo(UserVO user);
	
	void setUserBan(String user_id);

	void delUserBan(String user_id);
}

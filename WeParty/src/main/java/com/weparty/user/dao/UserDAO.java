package com.weparty.user.dao;

import java.util.List;

import com.weparty.user.vo.UserVO;

public interface UserDAO {
	void registerUser(UserVO vo);

	List<String> getUserId();

	List<String> getUserEmail();

	String findUser(UserVO vo);

	void changePw(UserVO user);

	UserVO getUserInfo(String user_id);

	void deleteUser(String user_id);

	void changeUserInfo(UserVO user);

	List<UserVO> getUserList(UserVO vo);

	int getUserCount();

	void setUserBan(String user_id);

	void delUserBan(String user_id);

}

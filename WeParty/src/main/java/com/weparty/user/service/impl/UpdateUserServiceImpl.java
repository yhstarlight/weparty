package com.weparty.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.user.dao.UserDAO;
import com.weparty.user.vo.UserVO;

@Service
public class UpdateUserServiceImpl implements com.weparty.user.service.UpdateUserService {

	@Autowired
	private UserDAO userDao;

	@Override
	public void changePw(UserVO user) {
		this.userDao.changePw(user);
	}

	@Override
	public void changeUserInfo(UserVO user) {
		this.userDao.changeUserInfo(user);
	}

	@Override
	public void setUserBan(String user_id) {
		this.userDao.setUserBan(user_id);
	}

	@Override
	public void delUserBan(String user_id) {
		this.userDao.delUserBan(user_id);
	}
}

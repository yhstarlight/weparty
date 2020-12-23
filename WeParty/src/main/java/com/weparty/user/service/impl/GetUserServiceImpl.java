package com.weparty.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.user.dao.UserDAO;
import com.weparty.user.service.GetUserService;
import com.weparty.user.vo.UserVO;

@Service
public class GetUserServiceImpl implements GetUserService {

	@Autowired
	private UserDAO userDao;
	
	@Override
	public List<String> getUserId() {
		return this.userDao.getUserId();
	}

	@Override
	public List<String> getUserEmail() {
		return this.userDao.getUserEmail();
	}

	@Override
	public String findUser(UserVO vo) {
		return this.userDao.findUser(vo);
	}
	
	@Override
	public UserVO getUserInfo(String user_id) {
		return this.userDao.getUserInfo(user_id);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return this.userDao.getUserList(vo);
	}

	@Override
	public int getUserCount() {
		return this.userDao.getUserCount();
	}

}

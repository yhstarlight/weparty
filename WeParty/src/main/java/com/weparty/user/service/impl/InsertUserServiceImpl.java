package com.weparty.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.user.dao.UserDAO;
import com.weparty.user.service.InsertUserService;
import com.weparty.user.vo.UserVO;

@Service
public class InsertUserServiceImpl implements InsertUserService {

	@Autowired
	private UserDAO userDao;
	
	@Override
	public void registerUser(UserVO vo) {
		this.userDao.registerUser(vo);
	}
}

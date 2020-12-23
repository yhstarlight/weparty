package com.weparty.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.user.dao.UserDAO;
import com.weparty.user.service.DeleteUserService;

@Service
public class DeleteUserServiceImpl implements DeleteUserService {
	
	@Autowired
	private UserDAO userDao;

	@Override
	public void deleteUser(String user_id) {
		this.userDao.deleteUser(user_id);
	}

}

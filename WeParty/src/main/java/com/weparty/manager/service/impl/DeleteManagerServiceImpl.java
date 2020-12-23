package com.weparty.manager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.manager.dao.ManagerDAO;
import com.weparty.manager.service.DeleteManagerSerivce;

@Service
public class DeleteManagerServiceImpl implements DeleteManagerSerivce {

	@Autowired
	private ManagerDAO managerDao;
	
	@Override
	public void deleteManager(String manager_id) {
		this.managerDao.deleteManager(manager_id);
	}

}

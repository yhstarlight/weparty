package com.weparty.manager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.manager.dao.ManagerDAO;
import com.weparty.manager.service.InsertManagerService;
import com.weparty.manager.vo.ManagerVO;

@Service
public class InsertManagerServiceImpl implements InsertManagerService {
	
	@Autowired
	private ManagerDAO managerDao;

	@Override
	public void insertManager(ManagerVO vo) {
		this.managerDao.insertManager(vo);
	}

}

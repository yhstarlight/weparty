package com.weparty.manager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.manager.dao.ManagerDAO;
import com.weparty.manager.service.UpdateManagerService;
import com.weparty.manager.vo.ManagerVO;

@Service
public class UpdateManagerServiceImpl implements UpdateManagerService {

	@Autowired
	private ManagerDAO managerDao;
	
	@Override
	public void updateManagerAuthority(ManagerVO vo) {
		this.managerDao.updateManagerAuthority(vo);
	}

	@Override
	public void updateManagerPassword(ManagerVO vo) {
		this.managerDao.updateManagerPassword(vo);
	}

}

package com.weparty.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.manager.dao.ManagerDAO;
import com.weparty.manager.service.GetManagerService;
import com.weparty.manager.vo.ManagerVO;

@Service
public class GetManagerServiceImpl implements GetManagerService {

	@Autowired
	private ManagerDAO managerDao;
	
	@Override
	public ManagerVO getManagerInfo(String manager_id) {
		return this.managerDao.getManagerInfo(manager_id);
	}

	@Override
	public List<ManagerVO> getManagerList() {
		return this.managerDao.getManagerList();
	}

	@Override
	public List<String> getManagerIdList() {
		return this.managerDao.getManagerIdList();
	}

}

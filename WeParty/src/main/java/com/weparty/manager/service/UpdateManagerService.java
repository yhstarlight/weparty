package com.weparty.manager.service;

import com.weparty.manager.vo.ManagerVO;

public interface UpdateManagerService {

	void updateManagerAuthority(ManagerVO vo);
	
	void updateManagerPassword(ManagerVO vo);
}

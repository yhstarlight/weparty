package com.weparty.manager.service;

import java.util.List;

import com.weparty.manager.vo.ManagerVO;

public interface GetManagerService {
	ManagerVO getManagerInfo(String manager_id);
	
	List<ManagerVO> getManagerList();
	
	List<String> getManagerIdList();
}

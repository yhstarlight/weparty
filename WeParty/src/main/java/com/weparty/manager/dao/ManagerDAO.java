package com.weparty.manager.dao;

import java.util.List;

import com.weparty.manager.vo.ManagerVO;

public interface ManagerDAO {

	ManagerVO getManagerInfo(String manager_id);

	List<ManagerVO> getManagerList();

	Object insertManager(ManagerVO vo);

	List<String> getManagerIdList();

	void deleteManager(String manager_id);

	void updateManagerAuthority(ManagerVO vo);

	void updateManagerPassword(ManagerVO vo);

}

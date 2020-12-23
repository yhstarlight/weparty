package com.weparty.manager.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weparty.manager.dao.ManagerDAO;
import com.weparty.manager.vo.ManagerVO;

@Repository
public class ManagerDAOImpl implements ManagerDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ManagerVO getManagerInfo(String manager_id) {
		return this.sqlSession.selectOne("manager.getManagerInfo",manager_id);
	}

	@Override
	public List<ManagerVO> getManagerList() {
		return this.sqlSession.selectList("manager.getManagerList");
	}

	@Override
	public Object insertManager(ManagerVO vo) {
		return this.sqlSession.insert("manager.insertManager",vo);
	}

	@Override
	public List<String> getManagerIdList() {
		return this.sqlSession.selectList("manager.getManagerIdList");
	}

	@Override
	public void deleteManager(String manager_id) {
		this.sqlSession.delete("manager.deleteManager",manager_id);	
	}

	@Override
	public void updateManagerAuthority(ManagerVO vo) {
		this.sqlSession.update("manager.updateManagerAuthority",vo);
	}

	@Override
	public void updateManagerPassword(ManagerVO vo) {
		this.sqlSession.update("manager.updateManagerPassword",vo);
	}

}

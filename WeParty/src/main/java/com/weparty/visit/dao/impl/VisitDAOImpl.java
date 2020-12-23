package com.weparty.visit.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weparty.visit.dao.VisitDAO;

@Repository
public class VisitDAOImpl implements VisitDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getVisitCount() {
		return this.sqlSession.selectOne("visit.getVisitCount");
	}

}

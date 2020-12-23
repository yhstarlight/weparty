package com.weparty.interest.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weparty.interest.dao.InterestDAO;
import com.weparty.interest.vo.InterestVO;

@Repository
public class InterestDAOImpl implements InterestDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void setInterest(InterestVO vo) {
		this.sqlSession.insert("interest.insertInterest",vo);
	}

	@Override
	public InterestVO getInterest(String user_id) {
		return this.sqlSession.selectOne("interest.getInterest",user_id);
	}

	@Override
	public void updateInterest(InterestVO vo) {
		this.sqlSession.update("interest.updateInterest",vo);
	}

}

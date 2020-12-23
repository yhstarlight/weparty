package com.weparty.display.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weparty.display.dao.DisplayDAO;
import com.weparty.display.vo.DisplayVO;

@Repository
public class DisplayDAOImpl implements DisplayDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public void insertDisplay(DisplayVO vo) {
		this.sqlsession.insert("display.insertDisplay",vo);
	}

	@Override
	public List<DisplayVO> getDisplayList() {
		return this.sqlsession.selectList("display.getDisplayList");
	}

	@Override
	public void deleteDisplay(int display_no) {
		this.sqlsession.delete("display.deleteDisplay",display_no);
	}

	@Override
	public String getDisplayPosterPath(int display_no) {
		return this.sqlsession.selectOne("display.getDisplayPosterPath",display_no);
	}

	@Override
	public void updateDisplay(DisplayVO vo) {
		this.sqlsession.update("display.updateDisplay",vo);
	}

}

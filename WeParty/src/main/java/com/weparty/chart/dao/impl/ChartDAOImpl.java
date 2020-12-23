package com.weparty.chart.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weparty.chart.dao.ChartDAO;
import com.weparty.chart.vo.AgeChartVO;
import com.weparty.chart.vo.FieldChartVO;
import com.weparty.chart.vo.GenderChartVO;
import com.weparty.chart.vo.InterestChartVO;
import com.weparty.chart.vo.RegDateChartVO;
import com.weparty.chart.vo.VisitChartVO;

@Repository
public class ChartDAOImpl implements ChartDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<GenderChartVO> getUserGenderList() {
		return this.sqlSession.selectList("chart.getUserGenderList");
	}

	@Override
	public InterestChartVO getUserInterestList() {
		return this.sqlSession.selectOne("chart.getUserInterestList");
	}

	@Override
	public List<FieldChartVO> getContestFieldList() {
		return this.sqlSession.selectList("chart.getContestFieldList");
	}

	@Override
	public List<AgeChartVO> getUserAgeList() {
		return this.sqlSession.selectList("chart.getUserAgeList");
	}

	@Override
	public List<RegDateChartVO> getUserRegDateList() {
		return this.sqlSession.selectList("chart.getUserRegDateList");
	}

	@Override
	public List<VisitChartVO> getVisitList() {
		return this.sqlSession.selectList("chart.getVisitList");
	}


}

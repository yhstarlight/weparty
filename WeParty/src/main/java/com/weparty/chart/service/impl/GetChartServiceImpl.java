package com.weparty.chart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.chart.dao.ChartDAO;
import com.weparty.chart.service.GetChartService;
import com.weparty.chart.vo.AgeChartVO;
import com.weparty.chart.vo.FieldChartVO;
import com.weparty.chart.vo.GenderChartVO;
import com.weparty.chart.vo.InterestChartVO;
import com.weparty.chart.vo.RegDateChartVO;
import com.weparty.chart.vo.VisitChartVO;

@Service
public class GetChartServiceImpl implements GetChartService{
	
	@Autowired
	private ChartDAO chartDao;

	@Override
	public List<GenderChartVO> getUserGenderList() {
		return this.chartDao.getUserGenderList();
	}

	@Override
	public InterestChartVO getUserInterestList() {
		return this.chartDao.getUserInterestList();
	}

	@Override
	public List<FieldChartVO> getContestFieldList() {
		return this.chartDao.getContestFieldList();
	}

	@Override
	public List<AgeChartVO> getUserAgeList() {
		return this.chartDao.getUserAgeList();
	}

	@Override
	public List<RegDateChartVO> getUserRegDateList() {
		return this.chartDao.getUserRegDateList();
	}

	@Override
	public List<VisitChartVO> getVisitList() {
		return this.chartDao.getVisitList();
	}

}

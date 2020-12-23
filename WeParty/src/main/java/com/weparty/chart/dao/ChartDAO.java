package com.weparty.chart.dao;

import java.util.List;

import com.weparty.chart.vo.AgeChartVO;
import com.weparty.chart.vo.FieldChartVO;
import com.weparty.chart.vo.GenderChartVO;
import com.weparty.chart.vo.InterestChartVO;
import com.weparty.chart.vo.RegDateChartVO;
import com.weparty.chart.vo.VisitChartVO;

public interface ChartDAO {

	List<GenderChartVO> getUserGenderList();

	InterestChartVO getUserInterestList();

	List<FieldChartVO> getContestFieldList();

	List<AgeChartVO> getUserAgeList();

	List<RegDateChartVO> getUserRegDateList();

	List<VisitChartVO> getVisitList();
}

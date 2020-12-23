package com.weparty.chart.admin.controller;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.weparty.chart.service.GetChartService;
import com.weparty.chart.vo.AgeChartVO;
import com.weparty.chart.vo.FieldChartVO;
import com.weparty.chart.vo.GenderChartVO;
import com.weparty.chart.vo.InterestChartVO;
import com.weparty.chart.vo.RegDateChartVO;
import com.weparty.chart.vo.VisitChartVO;

@Controller
@RequestMapping("/chart")
public class ChartController {

	@Inject
	private GetChartService GetChartService;
	
	@RequestMapping()
	public String ChartMain() {
		return "chart/chart";
	}
	
	@RequestMapping(value = "/genderList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String UsergenderList() {
		Gson gson = new Gson();
		List<GenderChartVO> genderList = this.GetChartService.getUserGenderList();

		return gson.toJson(genderList);
	}
	
	@RequestMapping(value = "/interestList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String UserInterestList() {
		Gson gson = new Gson();
		InterestChartVO interestList = this.GetChartService.getUserInterestList();
		
		return gson.toJson(interestList);
	}
	
	@RequestMapping(value = "/fieldList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String UserFieldList() {
		Gson gson = new Gson();
		List<FieldChartVO> fieldList = this.GetChartService.getContestFieldList();
		
		return gson.toJson(fieldList);
	}
	
	@RequestMapping(value = "/ageList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String UserAgeList() {
		Gson gson = new Gson();
		List<AgeChartVO> ageList = this.GetChartService.getUserAgeList();
		
		return gson.toJson(ageList);
	}
	
	@RequestMapping(value = "/regdateList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String UserRegDateList() {
		Gson gson = new Gson();
		List<RegDateChartVO> regdateList = this.GetChartService.getUserRegDateList();
		
		return gson.toJson(regdateList);
	}
	
	@RequestMapping(value = "/visitList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
	public @ResponseBody String VisitList() {
		Gson gson = new Gson();
		List<VisitChartVO> visitList = this.GetChartService.getVisitList();
		
		return gson.toJson(visitList);
	}
}

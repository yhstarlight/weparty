package com.weparty.dashboard.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weparty.contest.service.GetContestService;
import com.weparty.contest.vo.ApproveContestVO;
import com.weparty.contest.vo.WaitContestVO;
import com.weparty.qa.service.GetQAService;
import com.weparty.qa.vo.QuestionVO;
import com.weparty.user.service.GetUserService;
import com.weparty.visit.service.GetVisitService;

@Controller
@RequestMapping("/dashboard")
public class DashBoardController {
	
	@Autowired
	private GetUserService getUserService;
	
	@Autowired
	private GetContestService getContestService;
	
	@Autowired
	private GetQAService getQAService;
	
	@Autowired
	private GetVisitService getVisitService;
	
	@RequestMapping()
	public String DashBoard(Model m, HttpServletRequest request) {
		
		int userTotalCount = this.getUserService.getUserCount();
		int contestTotalCount = this.getContestService.allContestCount();
		int QATotalCount = this.getQAService.questionAnswerCount();
		int visitTotalCount = this.getVisitService.getVisitCount();
		int waitCountestTotalCount = this.getContestService.getCountList();
		int waitQuestionTotalCount = this.getQAService.questionWaitCount();
		
		WaitContestVO waitContestVO = new WaitContestVO();
		waitContestVO.setStartrow(1);
		waitContestVO.setEndrow(7);
		List<WaitContestVO> waitContestList = this.getContestService.getWaitContestList(waitContestVO);
		
		QuestionVO questionVO = new QuestionVO();
		questionVO.setStartrow(1);
		questionVO.setEndrow(7);
		List<QuestionVO> questionList = this.getQAService.getQuestionWaitList(questionVO);
		
		ApproveContestVO approveContestVO = new ApproveContestVO();
		approveContestVO.setStartrow(1);
		approveContestVO.setEndrow(7);
		List<ApproveContestVO> approveContestList = this.getContestService.getApproveContestList(approveContestVO);
		
		m.addAttribute("userTotalCount",userTotalCount);
		m.addAttribute("contestTotalCount",contestTotalCount);
		m.addAttribute("QATotalCount",QATotalCount);
		m.addAttribute("visitTotalCount",visitTotalCount);
		m.addAttribute("waitCountestTotalCount",waitCountestTotalCount);
		m.addAttribute("waitContestList",waitContestList);
		m.addAttribute("questionList",questionList);
		m.addAttribute("waitQuestionTotalCount",waitQuestionTotalCount);
		m.addAttribute("approveContestList",approveContestList);
		
		return "/dashboard/dashboard";
	}
}

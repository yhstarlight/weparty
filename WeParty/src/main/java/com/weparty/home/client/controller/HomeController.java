package com.weparty.home.client.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weparty.contest.service.GetContestService;
import com.weparty.contest.vo.ApproveContestVO;
import com.weparty.display.service.GetDisplayService;
import com.weparty.display.vo.DisplayVO;
import com.weparty.notice.service.GetNoticeService;
import com.weparty.notice.vo.NoticeVO;

@Controller
@RequestMapping("/home")
public class HomeController {
	
	@Autowired
	private GetDisplayService getDisplayService;
	
	@Autowired
	private GetNoticeService getNoticeService;
	
	@Autowired
	private GetContestService getContestService;

	@RequestMapping()
	public String home(Model m) {
	
		List<DisplayVO> slideShowList = this.getDisplayService.getDisplayList();
		
		NoticeVO noticeVO = new NoticeVO();
		noticeVO.setEndrow(7);
		noticeVO.setStartrow(1);
		
		List<NoticeVO> noticeList = this.getNoticeService.getNoticeList(noticeVO);
		
		ApproveContestVO contestVO = new ApproveContestVO();
		contestVO.setStartrow(1);
		contestVO.setEndrow(20);
		
		List<ApproveContestVO> contestList = this.getContestService.getApproveContestList(contestVO);
		
		m.addAttribute("slideShowList",slideShowList);
		m.addAttribute("noticeList",noticeList);
		m.addAttribute("contestList",contestList);
		
		return "home";
	}

}

package com.weparty.notice.client.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weparty.notice.service.GetNoticeService;
import com.weparty.notice.service.UpdateNoticeService;
import com.weparty.notice.vo.NoticeVO;

@Controller("com.weparty.contest.client.NoticeController")
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	private GetNoticeService getNoticeService;
	
	@Autowired
	private UpdateNoticeService updateNoticeService;
	
	@Resource(name="uploadPath")
	private String uploadPath;

	@RequestMapping("/notice_list")
	public String noticeList(Model m, HttpServletRequest request, @ModelAttribute NoticeVO vo,
			String searchKeyword) {
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		if(searchKeyword==null) {
			searchKeyword="";
		}
		vo.setSearch_keyword(searchKeyword);
		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);
		
		List<NoticeVO> list = this.getNoticeService.getNoticeList(vo);
		int totalCount = this.getNoticeService.noticeCount();
		
		int maxpage = (int) ((double) totalCount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		m.addAttribute("startpage", startpage);
		m.addAttribute("endpage", endpage);
		m.addAttribute("maxpage", maxpage);
		m.addAttribute("page", page);
		m.addAttribute("list",list);
		
		return "notice/notice_list";
	}
	
	@RequestMapping("/notice_content")
	public String noticeContent(Model m,int notice_no) {
		
		NoticeVO vo = this.getNoticeService.getNoticeContent(notice_no);
		int hit = vo.getNotice_hit()+1;
		
		vo.setNotice_hit(hit);
		vo.setNotice_no(notice_no);
		
		this.updateNoticeService.updateNoticeHit(vo);
		
		String content = vo.getNotice_content();
		content = content.replaceAll("\r\n", "<br>");
		vo.setNotice_content(content);
		
		m.addAttribute("vo",vo);
	
		return "notice/notice_content";
	}
}

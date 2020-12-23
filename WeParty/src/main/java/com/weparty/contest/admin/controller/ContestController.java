package com.weparty.contest.admin.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.net.URLEncoder;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weparty.contest.service.DeleteContestService;
import com.weparty.contest.service.GetContestService;
import com.weparty.contest.service.InsertContestService;
import com.weparty.contest.vo.AllContestVO;
import com.weparty.contest.vo.ApproveContestVO;
import com.weparty.contest.vo.CancelContestVO;
import com.weparty.contest.vo.WaitContestVO;

@Controller("com.weparty.contest.admin.ContestController")
@RequestMapping("/contest")
public class ContestController {
	
	@Resource(name="uploadPath")
	private String uploadPath;

	@Inject
	private GetContestService getContestService;
	
	@Inject
	private DeleteContestService deleteContestService;
	
	@Inject
	private InsertContestService insertContestService;

	@RequestMapping("/allList")
	public String ContestAllList(Model m, HttpServletRequest request) {
		AllContestVO vo = new AllContestVO();
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);	
		
		List<AllContestVO> list = this.getContestService.getAllContestList(vo);

		int totalCount = this.getContestService.allContestCount();
		if(totalCount == 0) {
			totalCount=1;
		}

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
		m.addAttribute("type","all");
		
		return "/contest/contest_list";
	}
	
	@RequestMapping("/approveList")
	public String ContestApproveList(Model m, HttpServletRequest request) {
		ApproveContestVO vo = new ApproveContestVO();
		vo.setApprove_field("all");
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);	
		
		List<ApproveContestVO> list = this.getContestService.getApproveContestList(vo);

		int totalCount = this.getContestService.ApproveContestCount(vo);
		if(totalCount == 0) {
			totalCount=1;
		}

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
		m.addAttribute("type","approve");
		
		return "/contest/contest_list";
	}
	
	@RequestMapping("/waitList")
	public String ContestWaitList(Model m, HttpServletRequest request) {
		WaitContestVO vo = new WaitContestVO();
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);	
		
		List<WaitContestVO> list = this.getContestService.getWaitContestList(vo);

		int totalCount = this.getContestService.getCountList();
		
		if(totalCount == 0) {
			totalCount=1;
		}

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
		m.addAttribute("type","wait");

		return "/contest/contest_list";
	}
	
	@RequestMapping("/cancelList")
	public String ContestCancelList(Model m, HttpServletRequest request) {
		CancelContestVO vo = new CancelContestVO();
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);	
		
		List<CancelContestVO> list = this.getContestService.getCancelContestList(vo);

		int totalCount = this.getContestService.cancelContestCount();
		
		if(totalCount == 0) {
			totalCount=1;
		}

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
		m.addAttribute("type","cancel");

		
		return "/contest/contest_list";
	}
	
	@RequestMapping("/wait_content")
	public String WaitContestContent(Model m,int wait_no) {
		WaitContestVO vo = this.getContestService.getContestContent(wait_no);
		
		String content = vo.getWait_content();
		content = content.replaceAll("\r\n", "<br>");
		
		vo.setWait_content(content);
		m.addAttribute("content",vo);
		
		return "/contest/contest_wait_content";
	}
	
	@RequestMapping("/approve_content")
	public String ApproveContestContent(Model m,int approve_no) {
		ApproveContestVO vo =this.getContestService.getApproveContestContent(approve_no);
		
		String content = vo.getApprove_content();
		content = content.replaceAll("\r\n", "<br>");
		
		vo.setApprove_content(content);
		m.addAttribute("content",vo);
		m.addAttribute("type","approve");
		
		return "/contest/contest_content";
	}
	
	@RequestMapping("/cancel_content")
	public String CancelContestContent(Model m, int cancel_no) {
		CancelContestVO vo = this.getContestService.getCancelContestContent(cancel_no);
		
		String content = vo.getcancel_content();
		content = content.replaceAll("\r\n", "<br>");
		
		vo.setcancel_content(content);
		m.addAttribute("content",vo);
		
		return "contest/contest_cancel_content";
	}
	
	
	@RequestMapping("/fileDownload")
	public void FileDownload(int wait_no, HttpServletResponse response, HttpServletRequest request) throws Exception {
		WaitContestVO vo = this.getContestService.getContestContent(wait_no);
		
		String downLoad = uploadPath + File.separator+ vo.getWait_file();
		File file = new File(downLoad);
		
		BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
		 
	    String header = request.getHeader("User-Agent");
	    String fileName;
	    
	    if ((header.contains("MSIE")) || (header.contains("Trident")) || (header.contains("Edge"))) {
	        fileName = URLEncoder.encode(vo.getWait_file_origin(), "UTF-8");
	    } else {
	        fileName = new String(vo.getWait_file_origin().getBytes("UTF-8"), "iso-8859-1");
	    }
	    response.setContentType("application/octet-stream");
	    response.setHeader("Content-Disposition", "attachment; filename=\""+ fileName + "\"");
	    FileCopyUtils.copy(in, response.getOutputStream());
	    in.close();
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	    }
	
	@RequestMapping("/approve_success")
	public String ContestApproveSuccess(int no, String type) {
		ApproveContestVO vo = new ApproveContestVO();

		if(type.equals("대기")) {
			WaitContestVO temp = this.getContestService.getContestContent(no);
			
			vo.setApprove_writer_id(temp.getWait_writer_id());
			vo.setApprove_title(temp.getWait_title());
			vo.setApprove_content(temp.getWait_content());
			vo.setApprove_host(temp.getWait_host());
			vo.setApprove_homepage(temp.getWait_homepage());
			vo.setApprove_target(temp.getWait_target());
			vo.setApprove_field(temp.getWait_field());
			vo.setApprove_poster_origin(temp.getWait_poster_origin());
			vo.setApprove_poster(temp.getWait_poster());
			if(temp.getWait_file()!=null) {
			vo.setApprove_file(temp.getWait_file());
			vo.setApprove_file_origin(temp.getWait_file_origin());
			}
			vo.setApprove_startdate(temp.getWait_startdate());
			vo.setApprove_enddate(temp.getWait_enddate());
			
			this.deleteContestService.DeleteWaitContest(no);
		}
		
		if(type.equals("취소")) {
			CancelContestVO temp =this.getContestService.getCancelContestContent(no);
			
			vo.setApprove_writer_id(temp.getcancel_writer_id());
			vo.setApprove_title(temp.getcancel_title());
			vo.setApprove_content(temp.getcancel_content());
			vo.setApprove_host(temp.getcancel_host());
			vo.setApprove_homepage(temp.getcancel_homepage());
			vo.setApprove_target(temp.getcancel_target());
			vo.setApprove_field(temp.getcancel_field());
			vo.setApprove_poster_origin(temp.getcancel_poster_origin());
			vo.setApprove_poster(temp.getcancel_poster());
			if(temp.getcancel_file()!=null) {
			vo.setApprove_file(temp.getcancel_file());
			vo.setApprove_file_origin(temp.getcancel_file_origin());
			}
			vo.setApprove_startdate(temp.getcancel_startdate());
			vo.setApprove_enddate(temp.getcancel_enddate());
			
			this.deleteContestService.deleteCancelContest(no);
			
		}
		
		this.insertContestService.InsertApproveContest(vo);
		
		return "redirect:/contest/approveList.mdo";
	}
	
	@RequestMapping("/cancel_success")
	public String ContestCancelSuccess(int no, String cancel_reason,String type) {
		
		CancelContestVO vo = new CancelContestVO();
		
		if(type.equals("승인")) {
			ApproveContestVO temp = this.getContestService.getApproveContestContent(no);
			
			vo.setcancel_writer_id(temp.getApprove_writer_id());
			vo.setcancel_title(temp.getApprove_title());
			vo.setcancel_content(temp.getApprove_content());
			vo.setcancel_host(temp.getApprove_host());
			vo.setcancel_homepage(temp.getApprove_homepage());
			vo.setcancel_target(temp.getApprove_target());
			vo.setcancel_field(temp.getApprove_field());
			vo.setcancel_poster_origin(temp.getApprove_poster_origin());
			vo.setcancel_poster(temp.getApprove_poster());
			if(temp.getApprove_file()!=null) {
			vo.setcancel_file(temp.getApprove_file());
			vo.setcancel_file_origin(temp.getApprove_file_origin());
			}
			vo.setcancel_startdate(temp.getApprove_startdate());
			vo.setcancel_enddate(temp.getApprove_enddate());
			vo.setCancel_reason(cancel_reason);
			
			this.deleteContestService.deleteApproveContest(no);
		}
		if(type.equals("대기")) {
		WaitContestVO temp = this.getContestService.getContestContent(no);

		vo.setcancel_writer_id(temp.getWait_writer_id());
		vo.setcancel_title(temp.getWait_title());
		vo.setcancel_content(temp.getWait_content());
		vo.setcancel_host(temp.getWait_host());
		vo.setcancel_homepage(temp.getWait_homepage());
		vo.setcancel_target(temp.getWait_target());
		vo.setcancel_field(temp.getWait_field());
		vo.setcancel_poster_origin(temp.getWait_poster_origin());
		vo.setcancel_poster(temp.getWait_poster());
		if(temp.getWait_file()!=null) {
		vo.setcancel_file(temp.getWait_file());
		vo.setcancel_file_origin(temp.getWait_file_origin());
		}
		vo.setcancel_startdate(temp.getWait_startdate());
		vo.setcancel_enddate(temp.getWait_enddate());
		vo.setCancel_reason(cancel_reason);
		
		this.deleteContestService.DeleteWaitContest(no);
		}
		
		this.insertContestService.insertCancelContest(vo);	
		
		return "contest/contest_cancelList";
	}
	
	@RequestMapping("/cancel_reason")
	public String CancelReason(Model m,String title,int no,String type) {
		m.addAttribute("title",title);
		m.addAttribute("no",no);
		m.addAttribute("type",type);
		return "/contest/cancel_reason";
	}
	
}

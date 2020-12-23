package com.weparty.contest.client.controller;

import java.io.File;
import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.weparty.contest.service.GetContestService;
import com.weparty.contest.service.InsertContestService;
import com.weparty.contest.service.UpdateContestService;
import com.weparty.contest.vo.ApproveContestVO;
import com.weparty.contest.vo.WaitContestVO;
import com.weparty.util.CalDateUtil;
import com.weparty.util.UploadFileUtil;

@Controller("com.weparty.contest.client.ContestController")
@RequestMapping("/contest")
public class ContestController {
	
	@Inject
	private InsertContestService insertContestService;
	
	@Inject
	private GetContestService getContestService;
	
	@Inject
	private UpdateContestService updateContestService;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@RequestMapping("/contest_register")
	public String contestRegister() {

		return "contest/contest_register";
	}
	
	@RequestMapping("/contest_register_success")
	public String contestRegisterSuccess(WaitContestVO vo,MultipartFile poster, MultipartFile file, HttpSession session) throws Exception {
		
		if(poster != null) {
			String uploadPosterpath = uploadPath + File.separator + "ContestPosterUpload";
			String ymdPosterPath = UploadFileUtil.calcPath(uploadPosterpath);
			String PosterName = null;
			
			PosterName = UploadFileUtil.fileUpload(uploadPosterpath, poster.getOriginalFilename(), poster.getBytes(), ymdPosterPath);
			vo.setWait_poster(File.separator + "ContestPosterUpload" + ymdPosterPath + File.separator + PosterName);
			vo.setWait_poster_origin(poster.getOriginalFilename());
		}
			
		if(!file.isEmpty()) {
			String uploadFilepath = uploadPath + File.separator + "ContestFileUpload";
			String ymdFilePath = UploadFileUtil.calcPath(uploadFilepath);
			String FileName = null;
			
			FileName = UploadFileUtil.fileUpload(uploadFilepath, file.getOriginalFilename(), file.getBytes(), ymdFilePath);
			vo.setWait_file(File.separator + "ContestFileUpload" + ymdFilePath + File.separator + FileName);
			vo.setWait_file_origin(file.getOriginalFilename());
		}
		
		String target = "";
		
		for(String t : vo.getTargetList()) {
			if(target.equals("")) {
				target = t;
			} else {
				target = target + "," + t;
			}
		}
		
		vo.setWait_target(target);
		vo.setWait_writer_id((String)session.getAttribute("login_id"));

		this.insertContestService.insertWaitContest(vo);

		return "redirect:/home.do" ;
	}
	
	@RequestMapping("/contest_list")
	public String contestListAll(Model m, String field, HttpServletRequest request, String searchKeyword) throws ParseException {
		ApproveContestVO vo = new ApproveContestVO(); 
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);
		vo.setSearch_keyword(searchKeyword);
		vo.setApprove_field(field);
		
		int totalCount = 1;
		List<ApproveContestVO> contestList = null;

		contestList = this.getContestService.getApproveContestList(vo); 
		totalCount = this.getContestService.ApproveContestCount(vo);

		int maxpage = (int) ((double) totalCount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;
		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		m.addAttribute("startpage", startpage);
		m.addAttribute("endpage", endpage);
		m.addAttribute("maxpage", maxpage);
		m.addAttribute("page", page);
		m.addAttribute("contestList",contestList);
		m.addAttribute("field",field);

		return "contest/contest_list";
	}
	
	@RequestMapping("/contest_architecture")
	public String contestArchitecutre() {
		
		return "contest/contest_architecture";
	}
	
	@RequestMapping("/contest_game")
	public String contestGame() {
		
		return "contest/contest_game";
	}
	
	@RequestMapping("/contest_picture")
	public String contestPicture() {
		
		return "contest/contest_picture";
	}
	
	@RequestMapping("/contest_scenario")
	public String contestScenario() {
		
		return "contest/contest_scenario";
	}
	
	@RequestMapping("/contest_science")
	public String contestScience() {
		
		return "contest/contest_science";
	}
	
	@RequestMapping("/contest_supporters")
	public String contestSupporters() {
		
		return "contest/contest_supporters";
	}
	
	@RequestMapping("/contest_web")
	public String contestWeb() {
		
		return "contest/contest_web";
	}

	@RequestMapping("/contest_content")
	public String contestContent(int contest_no,Model m) throws ParseException {
		
		ApproveContestVO vo = this.getContestService.getApproveContestContent(contest_no);
		int hit = vo.getApprove_hit()+1;
		vo.setApprove_hit(hit);
		vo.setApprove_no(contest_no);
		
		this.updateContestService.updateApproveContestHit(vo);		
		
		String content = vo.getApprove_content();
		content = content.replaceAll("\r\n", "<br>");
		
		vo.setApprove_content(content);
		
		int dday = CalDateUtil.calDateBetween(vo.getApprove_enddate());

		m.addAttribute("vo",vo);
		m.addAttribute("dday",dday);
		
		return "contest/contest_content";
	}
}

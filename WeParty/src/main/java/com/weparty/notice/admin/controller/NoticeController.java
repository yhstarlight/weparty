package com.weparty.notice.admin.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.weparty.notice.service.DeleteNoticeService;
import com.weparty.notice.service.GetNoticeService;
import com.weparty.notice.service.InsertNoticeService;
import com.weparty.notice.service.UpdateNoticeService;
import com.weparty.notice.vo.NoticeVO;
import com.weparty.util.UploadFileUtil;

@Controller("com.weparty.contest.admin.NoticeController")
@RequestMapping("/notice")
public class NoticeController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private InsertNoticeService insertNoticeService;
	
	@Inject
	private GetNoticeService getNoticeService;
	
	@Inject
	private DeleteNoticeService deleteNoticeService;
	
	@Inject
	private UpdateNoticeService updateNoticeService;

	@RequestMapping("/list")
	public String NoticeList(Model m, HttpServletRequest request, @ModelAttribute NoticeVO vo, String searchKeyword) {
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
		
		if(totalCount==0) {
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
		
		return "/notice/notice_list";
	}
	
	@RequestMapping("/insert")
	public String insertNotice() {
		return "/notice/notice_write";
	}
	
	@RequestMapping("/insert_success")
	public String insertSuccessNotice(MultipartFile file, NoticeVO vo) throws Exception {

		if(file != null) {
		
		String uploadFilepath = uploadPath + File.separator + "noticeFileUpload";
		String ymdFilePath = UploadFileUtil.calcPath(uploadFilepath);
		String FileName = null;
		
		FileName = UploadFileUtil.fileUpload(uploadFilepath, file.getOriginalFilename(), file.getBytes(), ymdFilePath);
		vo.setNotice_file(File.separator + "noticeFileUpload" + ymdFilePath + File.separator + FileName);
		vo.setNotice_file_origin(file.getOriginalFilename());
		} 
		
		this.insertNoticeService.insertNotice(vo);
		
		return "redirect:/notice/list.mdo";
	}
	
	@RequestMapping("/content")
	public String contentNotice(Model m,int notice_no) {
		
		NoticeVO vo = this.getNoticeService.getNoticeContent(notice_no);
		
		String content = vo.getNotice_content();
		content = content.replaceAll("\r\n", "<br>");
		vo.setNotice_content(content);
		
		m.addAttribute("vo",vo);
		
		return "/notice/notice_content";
	}
	
	@RequestMapping("/downLoadFile")
	public void downLoadNoticeFile(int notice_no, HttpServletResponse response, HttpServletRequest request) throws Exception {
			NoticeVO vo = this.getNoticeService.getNoticeContent(notice_no);
			
			String downLoad = uploadPath + File.separator+ vo.getNotice_file();
			File file = new File(downLoad);
			
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
			 
		    String header = request.getHeader("User-Agent");
		    String fileName;
		    
		    if ((header.contains("MSIE")) || (header.contains("Trident")) || (header.contains("Edge"))) {
		        fileName = URLEncoder.encode(vo.getNotice_file_origin(), "UTF-8");
		    } else {
		        fileName = new String(vo.getNotice_file_origin().getBytes("UTF-8"), "iso-8859-1");
		    }
		    response.setContentType("application/octet-stream");
		    response.setHeader("Content-Disposition", "attachment; filename=\""+ fileName + "\"");
		    FileCopyUtils.copy(in, response.getOutputStream());
		    in.close();
		    response.getOutputStream().flush();
		    response.getOutputStream().close();
	}
	
	@RequestMapping("/delete")
	public String deleteNotice(int notice_no) {
		
		NoticeVO vo = this.getNoticeService.getNoticeContent(notice_no);
		
		this.deleteNoticeService.deleteNotice(notice_no);
		
		if(vo.getNotice_file() != null) {
			File file = new File(uploadPath + File.separator+ vo.getNotice_file());
			file.delete();
		}
				
		return "redirect:/notice/list.mdo";
		
	}
	
	@RequestMapping("/edit")
	public String editNotice(Model m,int notice_no) {
		
		NoticeVO vo = this.getNoticeService.getNoticeContent(notice_no);
		
		m.addAttribute("vo",vo);
		
		return "/notice/notice_edit";
	}
	
	@RequestMapping("/edit_success")
	public String editNoticeSuccess(MultipartFile file, NoticeVO vo) throws Exception {

		NoticeVO tmp = this.getNoticeService.getNoticeContent(vo.getNotice_no());
		
		if(file != null) {
			File delFile = new File(uploadPath + File.separator+ tmp.getNotice_file());
			delFile.delete();
			
			String uploadFilepath = uploadPath + File.separator + "noticeFileUpload";
			String ymdFilePath = UploadFileUtil.calcPath(uploadFilepath);
			String FileName = null;
			
			FileName = UploadFileUtil.fileUpload(uploadFilepath, file.getOriginalFilename(), file.getBytes(), ymdFilePath);
			vo.setNotice_file(File.separator + "noticeFileUpload" + ymdFilePath + File.separator + FileName);
			vo.setNotice_file_origin(file.getOriginalFilename());
			System.out.println("널아님");
		} else {
			vo.setNotice_file(tmp.getNotice_file());
			vo.setNotice_file_origin(tmp.getNotice_file_origin());
		}
		
		this.updateNoticeService.updateNotice(vo);
	
		return "redirect:/notice/content.mdo?notice_no="+vo.getNotice_no();
	}
}

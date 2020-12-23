package com.weparty.community.client.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.weparty.community.service.DeleteCommunityService;
import com.weparty.community.service.GetCommunityService;
import com.weparty.community.service.InsertCommunityService;
import com.weparty.community.service.UpdateCommunityService;
import com.weparty.community.vo.FreeBoardVO;
import com.weparty.community.vo.InfoBoardVO;
import com.weparty.util.UploadFileUtil;

@Controller
@RequestMapping("/community")
public class CommunityControlloer {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private InsertCommunityService insertBoardService;
	
	@Inject
	private GetCommunityService getBoardService;
	
	@Inject
	private UpdateCommunityService updateBoardService;
	
	@Inject
	private DeleteCommunityService deleteBoardService;

	@RequestMapping("/freeboard_list")
	public String freeboardList(Model m, HttpServletRequest request, @ModelAttribute FreeBoardVO vo,
			String searchKeyword, String searchCondition) {
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		if(searchKeyword==null) {
			searchKeyword="";
		}
		
		if(searchCondition==null) {
			searchCondition="title";
		}
		
		vo.setSearch_condition(searchCondition);
		vo.setSearch_keyword(searchKeyword);

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);
		
		List<FreeBoardVO> boardList = getBoardService.getFreeboardList(vo);
		int totalCount = this.getBoardService.getFreeBoardCount(vo);
		
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
		m.addAttribute("boardList",boardList);
		
		return "community/freeboard_list";
	}

	
	@RequestMapping("/freeboard_content")
	public String communityContent(Model m, int free_board_no) throws ParseException {
		
		this.updateBoardService.updateFreeboardHit(free_board_no);
		FreeBoardVO vo = this.getBoardService.getFreeboardContent(free_board_no);
		
		String content = vo.getFree_board_content();
		content = content.replaceAll("\r\n", "<br>");
		vo.setFree_board_content(content);
		
		m.addAttribute("board",vo);
		
		return "community/freeboard_content";
	}
	
	@RequestMapping("/freeboard_write")
	public String communityWrite() {

		return "community/freeboard_write";
	}
		
	@RequestMapping("/freeboard_write_success.do")
	public String freeBoardWriteSuccess(FreeBoardVO vo, HttpSession session) {
		
		vo.setFree_board_writer_id((String)session.getAttribute("login_id"));
		vo.setFree_board_writer_nick((String)session.getAttribute("login_nick"));
		
		this.insertBoardService.insertFreeBoard(vo);
	
		return "redirect:/community/freeboard_list.do";
	}
	
	@RequestMapping("/freeboard_edit")
	public String freeBoardEdit(Model m, int free_board_no) {
		FreeBoardVO vo = this.getBoardService.getFreeboardContent(free_board_no);
		
		m.addAttribute("board",vo);
		
		return "community/freeboard_edit";
	}
	
	@RequestMapping("/freeboard_edit_success")
	public String freeBoardEditSuccess(FreeBoardVO vo) {
		this.updateBoardService.updateFreeboard(vo);
		return "redirect:/community/freeboard_content.do?free_board_no="+vo.getFree_board_no();
	}
	
	@RequestMapping("/freeboard_delete")
	public String freeBoardDelete(int free_board_no) {
		this.deleteBoardService.deleteFreeBoard(free_board_no);
		
		return "redirect:/community/freeboard_list.do";
	}

	
	@RequestMapping("/infoboard_list")
	public String infoboardList(HttpServletRequest request, @ModelAttribute InfoBoardVO vo,
			String searchKeyword, String searchCondition, Model m) {
	
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		if(searchKeyword==null) {
			searchKeyword="";
		}
		
		if(searchCondition==null) {
			searchCondition="title";
		}
		
		vo.setSearch_condition(searchCondition);
		vo.setSearch_keyword(searchKeyword);

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);
		
		List<InfoBoardVO> boardList = getBoardService.getInfoBoardList(vo);
		int totalCount = this.getBoardService.getInfoBoardCount(vo);

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
		m.addAttribute("boardList",boardList);
		
		return "community/infoboard_list";
	}
	
	@RequestMapping("/infoboard_write")
	public String infoBoardWrite() {
		return "community/infoboard_write";
	}
	
	@RequestMapping("/infoboard_write_success")
	public String infoBoardWriteSuccess(HttpSession session, InfoBoardVO vo, MultipartFile file) throws Exception {
		
		if(file != null) {
			
			String uploadFilepath = uploadPath + File.separator + "InfoFileUpload";
			String ymdFilePath = UploadFileUtil.calcPath(uploadFilepath);
			String FileName = null;
			
			FileName = UploadFileUtil.fileUpload(uploadFilepath, file.getOriginalFilename(), file.getBytes(), ymdFilePath);
			vo.setInfo_board_new_file(File.separator + "InfoFileUpload" + ymdFilePath + File.separator + FileName);
			vo.setInfo_board_origin_file(file.getOriginalFilename());
		} 

		vo.setInfo_board_writer_id((String)session.getAttribute("login_id"));
		vo.setInfo_board_writer_nick((String)session.getAttribute("login_nick"));

		this.insertBoardService.insertInfoBoard(vo);
		
		return "redirect:/community/infoboard_list.do";
	}
	
	@RequestMapping("/infoboard_content")
	public String infoBoardContent(Model m, int info_board_no) throws ParseException {
		
		this.updateBoardService.updateInfoBoardHit(info_board_no);
		InfoBoardVO vo = this.getBoardService.getInfoBoardContent(info_board_no);
		
		String content = vo.getInfo_board_content();
		content = content.replaceAll("\r\n", "<br>");
		vo.setInfo_board_content(content);
		
		m.addAttribute("board",vo);
		
		return "community/infoboard_content";
	}
	
	@RequestMapping("/infoFileDownload")
	public void infoFileDownload(int info_board_no, HttpServletResponse response, HttpServletRequest request) throws Exception {
		InfoBoardVO vo = this.getBoardService.getInfoBoardContent(info_board_no);
		
		String downLoad = uploadPath + File.separator+ vo.getInfo_board_new_file();
		File file = new File(downLoad);
		
		BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
		 
	    String header = request.getHeader("User-Agent");
	    String fileName;
	    
	    if ((header.contains("MSIE")) || (header.contains("Trident")) || (header.contains("Edge"))) {
	        fileName = URLEncoder.encode(vo.getInfo_board_origin_file(), "UTF-8");
	    } else {
	        fileName = new String(vo.getInfo_board_origin_file().getBytes("UTF-8"), "iso-8859-1");
	    }
	    response.setContentType("application/octet-stream");
	    response.setHeader("Content-Disposition", "attachment; filename=\""+ fileName + "\"");
	    FileCopyUtils.copy(in, response.getOutputStream());
	    in.close();
	    response.getOutputStream().flush();
	    response.getOutputStream().close();
	    }
	
	@RequestMapping("/infoboard_edit")
	public String infoBoardEdit(Model m, int info_board_no) {
		
		InfoBoardVO vo = this.getBoardService.getInfoBoardContent(info_board_no);
		
		m.addAttribute("board",vo);
		
		return "community/infoboard_edit";
	}
	
	@RequestMapping("/infoboard_delete")
	public String infoBoardDelete(int info_board_no) {
		
		InfoBoardVO vo = this.getBoardService.getInfoBoardContent(info_board_no);
		if(vo.getInfo_board_new_file()!=null) {
		File file = new File(uploadPath + File.separator+ vo.getInfo_board_new_file());
		file.delete();
		}
		
		this.deleteBoardService.deleteInfoBoard(info_board_no);
		
		return "redirect:/community/infoboard_list.do";
	}
	
	@RequestMapping("/infoboard_edit_success")
	public String infoBoardEditSuccess(MultipartFile file,InfoBoardVO vo,String deleteCheck) throws IOException, Exception {
		
		String uploadFilepath = uploadPath + File.separator + "InfoFileUpload";
		String FileName = null;
		
		InfoBoardVO board = this.getBoardService.getInfoBoardContent(vo.getInfo_board_no());
		
		if(deleteCheck.equals("true")) {
			File deleteFile = new File(uploadPath + File.separator+ board.getInfo_board_new_file());
			deleteFile.delete();
			
			if(file!=null) {
				String ymdFilePath = UploadFileUtil.calcPath(uploadFilepath);
				FileName = UploadFileUtil.fileUpload(uploadFilepath, file.getOriginalFilename(), file.getBytes(), ymdFilePath);
				vo.setInfo_board_new_file(File.separator + "InfoFileUpload" + ymdFilePath + File.separator + FileName);
				vo.setInfo_board_origin_file(file.getOriginalFilename());
			} else {
				vo.setInfo_board_origin_file(null);
				vo.setInfo_board_new_file(null);
			}
		} else {
			if(board.getInfo_board_origin_file()==null && file != null) {
				String ymdFilePath = UploadFileUtil.calcPath(uploadFilepath);
				FileName = UploadFileUtil.fileUpload(uploadFilepath, file.getOriginalFilename(), file.getBytes(), ymdFilePath);
				vo.setInfo_board_new_file(File.separator + "InfoFileUpload" + ymdFilePath + File.separator + FileName);
				vo.setInfo_board_origin_file(file.getOriginalFilename());
			} else {
				vo.setInfo_board_new_file(board.getInfo_board_new_file());
				vo.setInfo_board_origin_file(board.getInfo_board_origin_file());
			}
		}
	
		this.updateBoardService.updateInfoBoard(vo);
		
		return "redirect:/community/infoboard_list.do";
	}
}

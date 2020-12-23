package com.weparty.display.admin.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.weparty.display.service.DeleteDisplayService;
import com.weparty.display.service.GetDisplayService;
import com.weparty.display.service.InsertDisplayService;
import com.weparty.display.service.UpdateDisplayService;
import com.weparty.display.vo.DisplayVO;
import com.weparty.util.UploadFileUtil;

@Controller
@RequestMapping("display")
public class DisplayController {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Inject
	private InsertDisplayService insertDisplayService;
	
	@Inject
	private GetDisplayService getDisplayService;
	
	@Inject
	private DeleteDisplayService deleteDisplayService;
	
	@Inject
	private UpdateDisplayService updateDisplayService;

	@RequestMapping("main")
	public String DisplayMain(Model m) {
		
		List<DisplayVO> list = this.getDisplayService.getDisplayList();
		
		m.addAttribute("list",list);
		
		return "display/display";
	}
	
	@RequestMapping("/add")
	public String AddDisplay(MultipartFile add_poster, String add_link) throws Exception {
		
		DisplayVO vo = new DisplayVO();
		
		vo.setDisplay_link(add_link);	

		if(add_poster != null) {
			String uploadPosterpath = uploadPath + File.separator + "DisplayPoster";
			String PosterName = null;
			
			PosterName = UploadFileUtil.fileUpload(uploadPosterpath, add_poster.getOriginalFilename(), add_poster.getBytes(), "");
			vo.setDisplay_poster(File.separator + "DisplayPoster" + File.separator + PosterName);
			
			this.insertDisplayService.insertDisplay(vo);
		}
		
		return "redirect:/display/main.mdo";
	}
	
	@RequestMapping("/delete")
	public String DeleteDisplay(int display_no) {

		String posterPath = this.getDisplayService.getDisplayPosterPath(display_no);
		
		File file = new File(uploadPath + File.separator+ posterPath);
		file.delete();
		
		this.deleteDisplayService.deleteDisplay(display_no);
		
		return "redirect:/display/main.mdo";
	}
	
	@RequestMapping("edit")
	public String EditDisplay(MultipartFile edit_poster, String edit_link, int display_no, String change1) throws Exception {
		
		DisplayVO vo = new DisplayVO();
		
		vo.setDisplay_link(edit_link);
		vo.setDisplay_no(display_no);
		
		String posterPath = this.getDisplayService.getDisplayPosterPath(display_no);
		
		if(edit_poster == null) {
			vo.setDisplay_poster(posterPath);
		} else {
			
			File file = new File(uploadPath + File.separator+ posterPath);
			file.delete();
			
			String uploadPosterpath = uploadPath + File.separator + "DisplayPoster";
			String PosterName = null;
			
			PosterName = UploadFileUtil.fileUpload(uploadPosterpath, edit_poster.getOriginalFilename(), edit_poster.getBytes(), "");
			vo.setDisplay_poster(File.separator + "DisplayPoster" + File.separator + PosterName);
		}
		
		this.updateDisplayService.updateDisplay(vo);
		
		return "redirect:/display/main.mdo";
	}
}

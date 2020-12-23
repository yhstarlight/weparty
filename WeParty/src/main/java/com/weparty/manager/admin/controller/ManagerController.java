package com.weparty.manager.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weparty.manager.service.DeleteManagerSerivce;
import com.weparty.manager.service.GetManagerService;
import com.weparty.manager.service.InsertManagerService;
import com.weparty.manager.service.UpdateManagerService;
import com.weparty.manager.vo.ManagerVO;
import com.weparty.util.SHA256Util;

@RequestMapping("/manager")
@Controller
public class ManagerController {
	
	@Inject
	private GetManagerService getManagerSerivce;
	
	@Inject
	private InsertManagerService insertManagerService;
	
	@Inject
	private DeleteManagerSerivce deleteManagerService;
	
	@Inject
	private UpdateManagerService updateManagerService;
	
	@RequestMapping("/list")
	public String ManagerList(Model m) {
		
		List<ManagerVO> list = this.getManagerSerivce.getManagerList();
		
		m.addAttribute("list",list);
		
		return "manager/list";
	}
	
	@RequestMapping("/insert")
	public String ManagerInsertForm() {
		
		return "manager/insert";
	}
	
	@RequestMapping("/insert_success")
	public String ManagerInsertSuccess(ManagerVO vo,  HttpServletResponse response, HttpSession session) throws IOException {
		
		String salt = SHA256Util.generateSalt();
		vo.setManager_salt(salt);
		
		String password = vo.getManager_pw();
		password = SHA256Util.getEncrypt(password, salt);
		vo.setManager_pw(password);
		
		List<String> idList = this.getManagerSerivce.getManagerIdList();
		
		response.setContentType("text/html; charset=UTF-8" );
		PrintWriter out = response.getWriter();	

		for(String l : idList) {
			if(vo.getManager_id().equals(l)){
				out.println("<script>");
				out.println("alert('중복된 아이디가 존재합니다.');");
				out.println("history.back(-1);");
				out.println("</script>");
				return null;
			}
		}
		
		String authority = "";
		
		for(String t : vo.getAuthorityList()) {
			System.out.println(t);
			authority = authority + t;
		}

		vo.setManager_authority(authority);
		
		this.insertManagerService.insertManager(vo);

		return "redirect:/manager/list.mdo";
	}
	
	@RequestMapping("/delete")
	public String DeleteManager(String manager_id) {
		
		this.deleteManagerService.deleteManager(manager_id);
		
		return "redirect:/manager/list.mdo";
	}
	
	@RequestMapping("/edit")
	public String EditManager(Model m,String manager_id) {
		ManagerVO vo = this.getManagerSerivce.getManagerInfo(manager_id);
		
		m.addAttribute("vo",vo);
		return "manager/edit";
	}
	
	@RequestMapping("/edit_success")
	public void EditManagerSuccess(ManagerVO vo, HttpServletResponse response, HttpSession session) throws IOException {
		
		String authority = "";
		
		for(String t : vo.getAuthorityList()) {
			System.out.println(t);
			authority = authority + t;
		}

		vo.setManager_authority(authority);
		
		this.updateManagerService.updateManagerAuthority(vo);
		
		response.setContentType("text/html; charset=UTF-8" );
		PrintWriter out = response.getWriter();	
		
		out.println("<script>");
		out.println("opener.parent.location.reload();");
		out.println("window.close();");
		out.println("</script>");
	}

}

package com.weparty.mypage.admin.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weparty.manager.service.GetManagerService;
import com.weparty.manager.service.UpdateManagerService;
import com.weparty.manager.vo.ManagerVO;
import com.weparty.util.SHA256Util;

@Controller("com.weparty.mypage.admin.MyPageController")
@RequestMapping("/mypage")
public class MyPageController {
	
	@Inject
	private GetManagerService getManagerService; 
	
	@Inject
	private UpdateManagerService UpdateManagerService;
	
	@RequestMapping()
	public String MyPageMain(Model m,HttpSession session) {
		
		ManagerVO vo = this.getManagerService.getManagerInfo((String)session.getAttribute("mlogin_id"));
		
		m.addAttribute("vo",vo);
		
		return "mypage/mypage";
	}


	@RequestMapping("/password_edit")
	public String ManagerPasswordEdit(Model m,String stat) {
		
		m.addAttribute("stat",stat);
		
		return "mypage/password_edit";
	}
	
	@RequestMapping("/password_edit_success")
	public void ManagerPasswordEditSuccess(HttpSession session, HttpServletResponse response ,String old_pw, String new_pw) throws IOException {
		String id = (String)session.getAttribute("mlogin_id");
		
		ManagerVO info = this.getManagerService.getManagerInfo(id);
		
		response.setContentType("text/html; charset=UTF-8" );
		PrintWriter out = response.getWriter();	
		
		if(info.getManager_salt()!=null) {
			String salt = info.getManager_salt();
			old_pw = SHA256Util.getEncrypt(old_pw, salt);
		}
		
		if(old_pw.equals(info.getManager_pw())) {
				ManagerVO edit = new ManagerVO();
				
				String salt = SHA256Util.generateSalt();
				edit.setManager_salt(salt);

				new_pw = SHA256Util.getEncrypt(new_pw, salt);
				edit.setManager_pw(new_pw);
				edit.setManager_id(id);
				
				this.UpdateManagerService.updateManagerPassword(edit);
				
				out.println("<script>");
				out.println("location.href='/mypage/password_edit.mdo?stat=success'");
				out.println("</script>");

		} else {
			out.println("<script>");
			out.println("location.href='/mypage/password_edit.mdo?stat=err1'");
			out.println("</script>");
		}
	}
}

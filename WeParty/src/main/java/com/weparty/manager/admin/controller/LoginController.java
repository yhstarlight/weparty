package com.weparty.manager.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.weparty.manager.service.GetManagerService;
import com.weparty.manager.vo.ManagerVO;
import com.weparty.util.SHA256Util;

@Controller
public class LoginController {
	
	@Inject
	private GetManagerService getManagerService;
	
	@RequestMapping("/login")
	public String ManagerLogin() {
		return "/manager/login";
	}
	
	@RequestMapping("/login_success")
	public String ManagerLoginSuccess(RedirectAttributes redirect, HttpSession session,ManagerVO input) {
		ManagerVO info = this.getManagerService.getManagerInfo(input.getManager_id());
		
		String password=input.getManager_pw();
		
		if(info != null){
			if(info.getManager_salt()!=null) {
				String salt = info.getManager_salt();
				password = SHA256Util.getEncrypt(password, salt);
			}
			
			if(password.equals(info.getManager_pw())) {
				session.setAttribute("mlogin_id", input.getManager_id());
				session.setAttribute("mlogin_authority", info.getManager_authority());
				return "redirect:/dashboard.mdo";
			} else {
				redirect.addFlashAttribute("success","error3");
				redirect.addFlashAttribute("mlogin_id",input.getManager_id());
			}
		} else {
			redirect.addFlashAttribute("success","error2");
		}
		
		return "redirect:/login.mdo";
	}
	
	@RequestMapping("/logout")
	public String ManagerLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/login.mdo";
	}
}

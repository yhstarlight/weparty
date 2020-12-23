package com.weparty.user.client.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.weparty.interest.service.InsertInterestService;
import com.weparty.interest.vo.InterestVO;
import com.weparty.user.service.GetUserService;
import com.weparty.user.service.InsertUserService;
import com.weparty.user.service.UpdateUserService;
import com.weparty.user.vo.UserVO;
import com.weparty.util.MailServiceUtil;
import com.weparty.util.SHA256Util;

@Controller("com.weparty.user.client.UserController")
@RequestMapping("/user")
public class UserController {

	@Inject
	private InsertUserService insertUserService;
	
	@Inject
	private UpdateUserService updateUserService;
	
	@Inject
	private GetUserService getUserService;

	@Inject
	private InsertInterestService interestService;
	
	@Inject
	private MailServiceUtil mailService;


	@RequestMapping("/register")
	public String register() {
		return "user/register";
	}

	@RequestMapping("/register_success")
	public String registerSuccess(UserVO user, InterestVO interest) {

		InterestVO newInterest = new InterestVO();

		for (String i : interest.getInterest()) {
			if (i.equals("web"))
				newInterest.setWeb('y');
			else if (i.equals("scenario"))
				newInterest.setScenario('y');
			else if (i.equals("ucc"))
				newInterest.setUcc('y');
			else if (i.equals("science"))
				newInterest.setScience('y');
			else if (i.equals("game"))
				newInterest.setGame('y');
			else if (i.equals("architecture"))
				newInterest.setArchitecture('y');
			else if (i.equals("supporters"))
				newInterest.setSupporters('y');
		}
		
		String salt = SHA256Util.generateSalt();
		user.setUser_salt(salt);
		
		String password = user.getUser_pw();
		password = SHA256Util.getEncrypt(password, salt);
		user.setUser_pw(password);

		this.insertUserService.registerUser(user);
		
		newInterest.setInterest_user_id(user.getUser_id());
		this.interestService.setInterest(newInterest);

		return "user/register_success";
	}

	@RequestMapping("/id_check")
	public ModelAndView idCheck(String user_id) {
		List<String> idList = new ArrayList<>();

		idList = this.getUserService.getUserId();
		ModelAndView mav = new ModelAndView();

		if (user_id.length() < 5 || user_id.length() > 15) {
			mav.addObject("success", "f");
		} else if (idList.contains(user_id)) {
			mav.addObject("success", "n");
		} else {
			mav.addObject("success", "y");
		}

		mav.setViewName("/user/id_check");

		return mav;
	}

	@RequestMapping("/email_check")
	@ResponseBody
	public ModelAndView emailCheck(String email) {

		List<String> emailList = new ArrayList<>();
		ModelAndView mav = new ModelAndView();

		emailList = this.getUserService.getUserEmail();
		mav.setViewName("/user/email_check");
		if (emailList.contains(email)) {
			mav.addObject("success", "n");
			mav.addObject("dice", "n");
			return mav;
		} else {

			Random r = new Random();
			int dice = r.nextInt(4589362) + 49311;

			String tomail = email;
			String title = "WEPARTY 회원 가입 인증 이메일입니다.";
			String content = System.getProperty("line.separator") + System.getProperty("line.separator")
					+ "WEPARTY에 방문하신걸 환영합니다." + System.getProperty("line.separator")
					+ System.getProperty("line.separator") + "인증번호는 " + dice + " 입니다. "
					+ System.getProperty("line.separator") + System.getProperty("line.separator")
					+ "입력해주시고 회원 가입을 계속 진행해주세요.";
			
			mailService.mailSend(tomail, title, content);

			mav.addObject("dice", dice);
			mav.addObject("success", "y");

			return mav;
		}
	}

	@RequestMapping("/find_user")
	public String findUser() {
		return "user/find_user";
	}

	@RequestMapping("/find_id")
	public ModelAndView findId(UserVO vo) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/find_id");

		String user_id = this.getUserService.findUser(vo);

		if(user_id != null) {
				mav.addObject("user_id", user_id);
				mav.addObject("success", "y");
		} else {
			mav.addObject("success", "n");
		}
		return mav;
	}

	@RequestMapping("/find_password")
	public ModelAndView findPassword(UserVO vo) {
		UserVO changeUser = new UserVO();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/user/find_password");

		String user_id = this.getUserService.findUser(vo);

		if(user_id != null) {
				if (vo.getUser_id().equals(user_id)) {
					char pwCollection[] = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'A', 'B', 'C', 'D',
							'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
							'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
							'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '!', '@', '#', '$', '%', '^', '&', '*', '(',
							')' };
	
					String ranPw = "";
	
					for (int i = 0; i < 10; i++) {
						int selectRandomPw = (int) (Math.random() * (pwCollection.length));
																							
						ranPw += pwCollection[selectRandomPw];
					}
					
					String salt = SHA256Util.generateSalt();	
					String password = SHA256Util.getEncrypt(ranPw, salt);
	
					String tomail = vo.getUser_email();
					String title = "WEPARTY 임시 비밀번호 이메일입니다.";
					String content = System.getProperty("line.separator") + System.getProperty("line.separator")
					+ "임시 비밀번호는 " + ranPw + " 입니다. "
					+ System.getProperty("line.separator") + System.getProperty("line.separator")
					+ "로그인 후 비밀번호를 변경해주세요.";
					
					mailService.mailSend(tomail, title, content);
					
					changeUser.setUser_id(vo.getUser_id());
					changeUser.setUser_pw(password);
					changeUser.setUser_salt(salt);
					
					this.updateUserService.changePw(changeUser);
					
					mav.addObject("success", "y");
					return mav;
				} 
		}
		mav.addObject("success", "n");
		return mav;
	}

	@RequestMapping("/user_login")
	public String userLogin(UserVO vo, HttpServletResponse response, HttpSession session) throws IOException {
		
		UserVO login = this.getUserService.getUserInfo(vo.getUser_id());
			
		response.setContentType("text/html; charset=UTF-8" );
		PrintWriter out = response.getWriter();	
		if(login != null) {
			String password = vo.getUser_pw();
			if (login.getUser_salt()!=null) {
				String salt = login.getUser_salt();
				password = SHA256Util.getEncrypt(password, salt);
			}
			
			if(login.getUser_pw().equals(password)&&login.getUser_ban()=='n') {
				session.setAttribute("login_id", login.getUser_id());
				session.setAttribute("login_nick", login.getUser_nick());
				
				return "redirect:/home.do";

			} else if(login.getUser_ban()=='y'){
				out.println("<script>");
				out.println("alert('정지된 회원입니다.');");
				out.println("history.back();");
				out.println("</script>");			
			} else {
				out.println("<script>");
				out.println("alert('아이디와 비밀번호를 확인해주세요.');");
				out.println("history.back();");
				out.println("</script>");
			}
		} else {
			out.println("<script>");
			out.println("alert('아이디를 확인해주세요.');");
			out.println("history.back();");
			out.println("</script>");
		}
		return null;
	}
	
	@RequestMapping("/user_logout")
	public String userLogout(HttpSession session){
		
		if(session!=null) {
			session.invalidate();
		}
		return "redirect:/home.do";
	}
}

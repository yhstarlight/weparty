package com.weparty.mypage.client.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weparty.community.service.GetCommunityService;
import com.weparty.community.vo.AllBoardVO;
import com.weparty.contest.service.GetContestService;
import com.weparty.contest.vo.AllContestVO;
import com.weparty.contest.vo.CancelContestVO;
import com.weparty.contest.vo.WaitContestVO;
import com.weparty.interest.service.GetInterestService;
import com.weparty.interest.service.UpdateInterestService;
import com.weparty.interest.vo.InterestVO;
import com.weparty.qa.service.GetQAService;
import com.weparty.qa.vo.AnswerVO;
import com.weparty.qa.vo.QuestionVO;
import com.weparty.user.service.DeleteUserService;
import com.weparty.user.service.GetUserService;
import com.weparty.user.service.UpdateUserService;
import com.weparty.user.vo.UserVO;
import com.weparty.util.CalDateUtil;
import com.weparty.util.SHA256Util;

@Controller("com.weparty.mypage.client.MyPageController")
@RequestMapping("/mypage")
public class MyPageController {
	
	
	@Inject
	private GetUserService getUserService;
	
	@Inject
	private DeleteUserService deleteUserService;
	
	@Inject
	private GetInterestService getInterestService;
	
	@Inject
	private UpdateUserService updateUserService;

	@Inject
	private UpdateInterestService updateInterestService;
	
	@Inject
	private GetQAService getQAService;
	
	@Inject
	private GetCommunityService getCoummunityService;
	
	@Inject
	private GetContestService getContestService;
	

	
	@RequestMapping("/myPage_main")
	public String myPageMain() {
	
		return "/myPage/myPage_main";
	}
	
	@RequestMapping("/myPage_contest")
	public String myPageContest(Model m,HttpServletRequest request, HttpSession session, @ModelAttribute AllContestVO vo) {
		
		String user_id=(String)session.getAttribute("login_id");
		vo.setAll_writer_id(user_id);
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);	

		List<AllContestVO> allList = this.getContestService.getUserAllContestList(vo);

		int totalCount = this.getContestService.userAllContestCount(user_id);
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
		m.addAttribute("allList",allList);
		
		return "/myPage/myPage_contest";
	}
	
	@RequestMapping("/myPage_contest_content")
	public String myPageContestContent(Model m, int all_no, String type) throws ParseException {
		
		int dday=0;
		
		if(type.equals("대기")) {
		WaitContestVO vo = getContestService.getContestContent(all_no);
		
		String content = vo.getWait_content();
		content = content.replaceAll("\r\n", "<br>");
		vo.setWait_content(content);
		
		dday = CalDateUtil.calDateBetween(vo.getWait_enddate());
		m.addAttribute("vo",vo);
		
		}
		if(type.equals("취소")) {
		CancelContestVO vo = getContestService.getCancelContestContent(all_no);
			
		String content = vo.getcancel_content();
		content = content.replaceAll("\r\n", "<br>");
		vo.setcancel_content(content);
		
		String reason = vo.getCancel_reason();
		reason = reason.replaceAll("\r\n", "<br>");
		vo.setCancel_reason(reason);
			
		dday = CalDateUtil.calDateBetween(vo.getcancel_enddate());
		m.addAttribute("vo",vo);
		}
		
		
		m.addAttribute("dday",dday);
		m.addAttribute("type",type);
		
		return "/myPage/myPage_contest_content";
	}
	
	@RequestMapping("/myPage_community")
	public String myPageCommunity(Model m, HttpServletRequest request, HttpSession session ,@ModelAttribute AllBoardVO vo) {
		
		String user_id=(String)session.getAttribute("login_id");
		vo.setBoard_writer_id(user_id);
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);	

		List<AllBoardVO> allList = this.getCoummunityService.getAllBoardList(vo);

		int totalCount = this.getCoummunityService.getTotalCount(user_id);
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
		m.addAttribute("allList",allList);

		return "/myPage/myPage_community";
	}

	@RequestMapping("/myPage_QA")
	public String myPageQA(HttpServletRequest request, HttpSession session, Model m, @ModelAttribute QuestionVO vo) {
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);
		
		String user_id=(String)session.getAttribute("login_id");
		vo.setQuestion_writer_id(user_id);
		
		List<QuestionVO> list = this.getQAService.getQuestionList(vo);
		int totalCount = this.getQAService.questionCount(user_id);
		
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
		m.addAttribute("questionList",list);
		
		return "/myPage/myPage_QA";
	}
	
	@RequestMapping("/QA_content")
	public String QAContent(Model m,int no) {
		
		QuestionVO questionVO = this.getQAService.getQuestionContent(no);
		
		String answer_content = "";
		AnswerVO answerVO = null;
		
		String question_content = questionVO.getQuestion_content();
		question_content = question_content.replaceAll("\r\n", "<br>");
		questionVO.setQuestion_content(question_content);
		
		if(this.getQAService.getAnswerContent(no) != null) {
			answerVO = this.getQAService.getAnswerContent(no);
			answer_content = answerVO.getAnswer_content();
			answer_content = answer_content.replaceAll("\r\n", "<br>");
			answerVO.setAnswer_content(answer_content);
		}
		
		m.addAttribute("question",questionVO);
		m.addAttribute("answer",answer_content);
		
		return "/myPage/myPage_QA_content";
	}
	
	@RequestMapping("/myPage_edit")
	public String myPageEdit(Model m, HttpSession session) {
		String user_id=(String)session.getAttribute("login_id");
		
		UserVO user = this.getUserService.getUserInfo(user_id);
		InterestVO interest = this.getInterestService.getInterest(user_id);
		
		m.addAttribute("user",user);
		m.addAttribute("interest",interest);
		
		return "/myPage/myPage_edit";
	}
	
	@RequestMapping("/edit_success")
	public String editSuccess(UserVO user, InterestVO interest, HttpSession session, HttpServletResponse response) throws IOException {
		String user_id=(String)session.getAttribute("login_id");
		
		user.setUser_id(user_id);
		this.updateUserService.changeUserInfo(user);
		
		InterestVO newInterest = new InterestVO();
		newInterest.setInterest_user_id(user_id);

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
		
		this.updateInterestService.updateInterest(newInterest);
		
		if(user.getUser_pw()!="") {
			String salt = SHA256Util.generateSalt();
			user.setUser_salt(salt);
			
			String password = user.getUser_pw();
			password = SHA256Util.getEncrypt(password, salt);
			user.setUser_pw(password);
			
			this.updateUserService.changePw(user);
		}
		
		response.setContentType("text/html; charset=UTF-8" );
		PrintWriter out = response.getWriter();	
		
		out.println("<script>");
		out.println("alert('회원정보가 수정되었습니다.');");
		out.println("location.href='/mypage/myPage_edit.do'");
		out.println("</script>");
		
		return null;
	}
	
	@RequestMapping("/myPage_del")
	public String myPageDel() {
		
		return "/myPage/myPage_del";
	}
	
	@RequestMapping("/delete_user")
	public String deleteUser(HttpServletResponse response, HttpSession session,String pw) throws IOException {
		
		String id = (String)session.getAttribute("login_id");
		
		UserVO vo = this.getUserService.getUserInfo(id);
		String salt = vo.getUser_salt();
		response.setContentType("text/html; charset=UTF-8" );
		PrintWriter out = response.getWriter();	
		
		String checkPw = SHA256Util.getEncrypt(pw, salt);
		
		if(vo.getUser_pw().equals(checkPw)) {
			this.deleteUserService.deleteUser(id);
			session.invalidate();
		} else {
			out.println("<script>");
			out.println("alert('비밀번호를 확인해주세요.');");
			out.println("history.back();");
			out.println("</script>");
			
			return null;
		}
		return "redirect:/home.do";
	}
	
	
}

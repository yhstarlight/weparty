package com.weparty.qa.admin.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.weparty.qa.service.DeleteQAService;
import com.weparty.qa.service.GetQAService;
import com.weparty.qa.service.InsertQAService;
import com.weparty.qa.service.UpdateQAServcie;
import com.weparty.qa.vo.AnswerVO;
import com.weparty.qa.vo.QuestionTypeVO;
import com.weparty.qa.vo.QuestionVO;

@Controller("com.weparty.qa.admin.ContestController")
@RequestMapping("/QA")
public class QAController {
	
	@Inject
	private GetQAService getQAService;
	
	@Inject
	private InsertQAService insertQAService;
	
	@Inject
	private UpdateQAServcie updateQAService;
	
	@Inject
	private DeleteQAService deleteQAService;
	
	@RequestMapping("/allList")
	String QAAllList(Model m, HttpServletRequest request,@ModelAttribute QuestionVO vo) {
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);
		
		List<QuestionVO> list = this.getQAService.getQuestionAllList(vo);
		int totalCount = this.getQAService.questionAllCount();
		
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
		m.addAttribute("state","all");
		
		return "/QA/QA_List";
	}
	
	@RequestMapping("/waitList")
	String QAWaitList(Model m, HttpServletRequest request,@ModelAttribute QuestionVO vo) {
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);
		
		List<QuestionVO> list = this.getQAService.getQuestionWaitList(vo);
		int totalCount = this.getQAService.questionWaitCount();
		
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
		m.addAttribute("state","n");
		
		return "/QA/QA_List";
	}
	
	@RequestMapping("/content")
	String QAContent(Model m, String state, int question_no) {
		QuestionVO question = this.getQAService.getQuestionContent(question_no);
		
		String content = question.getQuestion_content();
		content = content.replaceAll("\r\n", "<br>");
		question.setQuestion_content(content);
	
		if((question.getQuestion_state()).equals("y")) {
			AnswerVO answer = this.getQAService.getAnswerContent(question_no);
			String content2 = answer.getAnswer_content();
			content2 = content2.replaceAll("\r\n", "<br>");
			answer.setAnswer_content(content2);
			m.addAttribute("answer",answer);
		}
		m.addAttribute("question",question);
		m.addAttribute("state",state);
		return "/QA/QA_content";
	}
	
	@RequestMapping("/answerList")
	String QAAnswerList(Model m, HttpServletRequest request, @ModelAttribute QuestionVO vo) {
		
		int page = 1;
		int limit = 10; 
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		vo.setStartrow((page - 1) * 10 + 1);
		vo.setEndrow(vo.getStartrow() + limit - 1);
		
		List<QuestionVO> list = this.getQAService.getQuestionAnswerList(vo);
		int totalCount = this.getQAService.questionAnswerCount();
		
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
		m.addAttribute("state","y");
		
		return "/QA/QA_List";
	}
	
	@RequestMapping("/answer_success")
	String AnswerSuccess(String content, int answer_no) {
		AnswerVO vo = new AnswerVO();
		vo.setAnswer_no(answer_no);
		vo.setAnswer_content(content);
		
		this.insertQAService.insertAnswer(vo);
		this.updateQAService.updateQuestionState(answer_no);
		
		return "redirect:/QA/content.mdo?state=answer&question_no="+answer_no;
	}
	
	@RequestMapping("/answer_update")
	String AnswerUpdate(String content, int answer_no) {
		AnswerVO vo = new AnswerVO();
		vo.setAnswer_no(answer_no);
		vo.setAnswer_content(content);
		
		this.updateQAService.updateAnswer(vo);
		
		return "redirect:/QA/content.mdo?state=answer&question_no="+answer_no;
	}
	
	@RequestMapping("/typeList")
	String QuestionTypeList(Model m) {
		List<QuestionTypeVO> list =  this.getQAService.getQuestionType();
		
		m.addAttribute("list",list);
		
		return "QA/questionType";
	}
	
	@RequestMapping("/insertType")
	String InsertQuestionType(Model m, String insert) {
		
		this.insertQAService.insertQuestionType(insert);
		
		List<QuestionTypeVO> list =  this.getQAService.getQuestionType();
		
		m.addAttribute("list",list);
		
		return "redirect:/QA/typeList.mdo";
	}
	
	@RequestMapping("/updateType")
	String updateQuestionType(Model m, String update, int question_type_no) {
		
		QuestionTypeVO vo = new QuestionTypeVO();
		
		vo.setQuestion_type_no(question_type_no);
		vo.setQuestion_type_name(update);
		
		this.updateQAService.updateQuestionType(vo);
		
		List<QuestionTypeVO> list =  this.getQAService.getQuestionType();
		
		m.addAttribute("list",list);
		
		return "redirect:/QA/typeList.mdo";
	}
	
	@RequestMapping(value="/deleteType")
	String deteQuestionType(Model m, int question_type_no) {
		
		this.deleteQAService.deleteQuestionType(question_type_no);
		
		List<QuestionTypeVO> list =  this.getQAService.getQuestionType();
		m.addAttribute("list",list);
		
		return "redirect:/QA/typeList.mdo";
	}
}

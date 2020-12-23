package com.weparty.qa.client.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.weparty.qa.service.GetQAService;
import com.weparty.qa.service.InsertQAService;
import com.weparty.qa.vo.QuestionTypeVO;
import com.weparty.qa.vo.QuestionVO;


@Controller("com.weparty.qa.client.ContestController")
@RequestMapping("/QA")
public class QAController {
	
	@Inject
	private GetQAService getQAService;
	
	@Inject
	private InsertQAService insertQuestionService;
	
	@RequestMapping("/send_question")
	public ModelAndView SendQuestion() {
		
		List<QuestionTypeVO> questionTypeList = this.getQAService.getQuestionType();
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("questionTypeList",questionTypeList);
		mav.setViewName("QA/send_question");
		
		return mav;
	}
	
	@RequestMapping("/send_question_success")
	public String SendQuestionSuccess(HttpSession session, QuestionVO vo) {
		
		vo.setQuestion_writer_id((String)session.getAttribute("login_id"));
		
		this.insertQuestionService.insertQuestion(vo);

		return "redirect:/home.do";
	}
	
}

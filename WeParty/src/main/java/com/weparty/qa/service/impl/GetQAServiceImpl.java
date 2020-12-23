package com.weparty.qa.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.qa.dao.QADAO;
import com.weparty.qa.service.GetQAService;
import com.weparty.qa.vo.AnswerVO;
import com.weparty.qa.vo.QuestionTypeVO;
import com.weparty.qa.vo.QuestionVO;

@Service
public class GetQAServiceImpl implements GetQAService {

	@Autowired
	private QADAO qaDao;

	@Override
	public List<QuestionVO> getQuestionList(QuestionVO vo) {
		return this.qaDao.getQuestionList(vo);
	}

	@Override
	public int questionCount(String user_id) {
		return this.qaDao.questionCount(user_id);
	}

	@Override
	public QuestionVO getQuestionContent(int question_no) {
		return this.qaDao.getQuestionContent(question_no);
	}
	
	@Override
	public List<QuestionTypeVO> getQuestionType() {
		return this.qaDao.getQuestionType();
	}

	@Override
	public List<QuestionVO> getQuestionAllList(QuestionVO vo) {
		return this.qaDao.getQuestionAllList(vo);
	}

	@Override
	public int questionAllCount() {
		return this.qaDao.questionAllCount();
	}

	@Override
	public List<QuestionVO> getQuestionWaitList(QuestionVO vo) {
		return this.qaDao.getQuestionWaitList(vo);
	}

	@Override
	public int questionWaitCount() {
		return this.qaDao.questionWaitCount();
	}

	@Override
	public AnswerVO getAnswerContent(int answer_no) {
		return this.qaDao.getAnswerContent(answer_no);
	}

	@Override
	public List<QuestionVO> getQuestionAnswerList(QuestionVO vo) {
		return this.qaDao.getQuestionAnswerList(vo);
	}

	@Override
	public int questionAnswerCount() {
		return this.qaDao.questionAnswerCount();
	}
	
}

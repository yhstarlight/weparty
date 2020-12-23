package com.weparty.qa.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.qa.dao.QADAO;
import com.weparty.qa.service.UpdateQAServcie;
import com.weparty.qa.vo.AnswerVO;
import com.weparty.qa.vo.QuestionTypeVO;

@Service
public class UpdateQAService implements UpdateQAServcie {
	
	@Autowired
	private QADAO QADao;

	@Override
	public void updateQuestionState(int question_no) {
		this.QADao.updateQuestionState(question_no);
	}

	@Override
	public void updateAnswer(AnswerVO vo) {
		this.QADao.updateAnswer(vo);
	}

	@Override
	public void updateQuestionType(QuestionTypeVO vo) {
		this.QADao.updateQuestionType(vo);
	}

}

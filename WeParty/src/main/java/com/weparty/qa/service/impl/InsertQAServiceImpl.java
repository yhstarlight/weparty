package com.weparty.qa.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.qa.dao.QADAO;
import com.weparty.qa.service.InsertQAService;
import com.weparty.qa.vo.AnswerVO;
import com.weparty.qa.vo.QuestionVO;

@Service
public class InsertQAServiceImpl implements InsertQAService{
	
	@Autowired
	private QADAO questionDao;

	@Override
	public void insertQuestion(QuestionVO vo) {
		this.questionDao.insertQuestion(vo);
	}

	@Override
	public void insertAnswer(AnswerVO vo) {
		this.questionDao.insertAnswer(vo);
	}

	@Override
	public void insertQuestionType(String question_type_name) {
		this.questionDao.insertQuestionType(question_type_name);
	}

}

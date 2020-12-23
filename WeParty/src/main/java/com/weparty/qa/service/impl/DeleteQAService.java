package com.weparty.qa.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.qa.dao.QADAO;

@Service
public class DeleteQAService implements com.weparty.qa.service.DeleteQAService {

	@Autowired
	private QADAO QADao;
	
	@Override
	public void deleteQuestionType(int question_type_no) {
		this.QADao.deleteQuestionType(question_type_no);
	}

}

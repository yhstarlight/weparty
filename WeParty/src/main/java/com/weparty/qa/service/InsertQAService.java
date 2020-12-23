package com.weparty.qa.service;

import com.weparty.qa.vo.AnswerVO;
import com.weparty.qa.vo.QuestionVO;

public interface InsertQAService {
	void insertQuestion(QuestionVO vo);
	
	void insertAnswer(AnswerVO vo);
	
	void insertQuestionType(String question_type_name);
}

package com.weparty.qa.service;

import com.weparty.qa.vo.AnswerVO;
import com.weparty.qa.vo.QuestionTypeVO;

public interface UpdateQAServcie {
	void updateQuestionState(int question_no);
	
	void updateAnswer(AnswerVO vo);
	
	void updateQuestionType(QuestionTypeVO vo);
}

package com.weparty.qa.service;

import java.util.List;

import com.weparty.qa.vo.AnswerVO;
import com.weparty.qa.vo.QuestionTypeVO;
import com.weparty.qa.vo.QuestionVO;

public interface GetQAService {
	
	//Question
	List<QuestionVO> getQuestionList(QuestionVO vo);
	
	List<QuestionVO> getQuestionAllList(QuestionVO vo);
	
	List<QuestionVO> getQuestionWaitList(QuestionVO vo);
	
	List<QuestionVO> getQuestionAnswerList(QuestionVO vo);
	
	int questionCount(String user_id);
	
	int questionAllCount();
	
	int questionWaitCount();
	
	int questionAnswerCount();
	
	QuestionVO getQuestionContent(int question_no);
	
	//QuestionType
	List<QuestionTypeVO> getQuestionType();
	
	//Answer
	AnswerVO getAnswerContent(int answer_no);
}

package com.weparty.qa.dao;

import java.util.List;

import com.weparty.qa.vo.AnswerVO;
import com.weparty.qa.vo.QuestionTypeVO;
import com.weparty.qa.vo.QuestionVO;

public interface QADAO {

	void insertQuestion(QuestionVO vo);

	List<QuestionVO> getQuestionList(QuestionVO vo);

	int questionCount(String user_id);

	QuestionVO getQuestionContent(int question_no);
	
	List<QuestionTypeVO> getQuestionType();

	List<QuestionVO> getQuestionAllList(QuestionVO vo);

	int questionAllCount();

	List<QuestionVO> getQuestionWaitList(QuestionVO vo);

	int questionWaitCount();

	void insertAnswer(AnswerVO vo);

	void updateQuestionState(int question_no);

	AnswerVO getAnswerContent(int answer_no);

	List<QuestionVO> getQuestionAnswerList(QuestionVO vo);

	int questionAnswerCount();

	void updateAnswer(AnswerVO vo);

	void insertQuestionType(String question_type_name);

	void updateQuestionType(QuestionTypeVO vo);

	void deleteQuestionType(int question_type_no);

}

package com.weparty.qa.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weparty.qa.dao.QADAO;
import com.weparty.qa.vo.AnswerVO;
import com.weparty.qa.vo.QuestionTypeVO;
import com.weparty.qa.vo.QuestionVO;

@Repository
public class QADAOImpl implements QADAO {
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public void insertQuestion(QuestionVO vo) {
		this.sqlsession.insert("question.insertQuestion",vo);
	}

	@Override
	public List<QuestionVO> getQuestionList(QuestionVO vo) {
		return this.sqlsession.selectList("question.getQuestionList",vo);
	}

	@Override
	public int questionCount(String user_id) {
		return this.sqlsession.selectOne("question.questionCount",user_id);
	}

	@Override
	public QuestionVO getQuestionContent(int question_no) {
		return this.sqlsession.selectOne("question.questionConetent",question_no);
	}
	
	@Override
	public List<QuestionTypeVO> getQuestionType() {
		return this.sqlsession.selectList("question_type.getQuestionType");
	}

	@Override
	public List<QuestionVO> getQuestionAllList(QuestionVO vo) {
		return this.sqlsession.selectList("question.getQuestionAllList",vo);
	}

	@Override
	public int questionAllCount() {
		return this.sqlsession.selectOne("question.questionAllCount");
	}

	@Override
	public List<QuestionVO> getQuestionWaitList(QuestionVO vo) {
		return this.sqlsession.selectList("question.getQuestionWaitList",vo);
	}

	@Override
	public int questionWaitCount() {
		return this.sqlsession.selectOne("question.questionWaitCount");
	}

	@Override
	public void insertAnswer(AnswerVO vo) {
		this.sqlsession.insert("answer.insertAnswer",vo);
	}

	@Override
	public void updateQuestionState(int question_no) {
		this.sqlsession.update("question.updateQuestionState",question_no);
	}

	@Override
	public AnswerVO getAnswerContent(int answer_no) {
		return this.sqlsession.selectOne("answer.getAnswerContent",answer_no);
	}

	@Override
	public List<QuestionVO> getQuestionAnswerList(QuestionVO vo) {
		return this.sqlsession.selectList("question.getQuestionAnswerList",vo);
	}

	@Override
	public int questionAnswerCount() {
		return this.sqlsession.selectOne("question.questionAnswerCount");
	}

	@Override
	public void updateAnswer(AnswerVO vo) {
		this.sqlsession.update("answer.updateAnswer",vo);
	}

	@Override
	public void insertQuestionType(String question_type_name) {
		this.sqlsession.insert("question_type.insertQuestionType",question_type_name);
	}

	@Override
	public void updateQuestionType(QuestionTypeVO vo) {
		this.sqlsession.update("question_type.updateQuestionType",vo);
	}

	@Override
	public void deleteQuestionType(int question_type_no) {
		this.sqlsession.delete("question_type.deleteQuestionType",question_type_no);
	}

}

package com.weparty.community.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weparty.community.dao.BoardDAO;
import com.weparty.community.vo.AllBoardVO;
import com.weparty.community.vo.FreeBoardVO;
import com.weparty.community.vo.InfoBoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<AllBoardVO> getAllBoardList(AllBoardVO vo) {
		return this.sqlSession.selectList("all_board.getAllBoardList",vo);
	}

	@Override
	public int getTotalCount(String id) {
		return this.sqlSession.selectOne("all_board.getTotalCount",id);
	}
	
	@Override
	public void insertFreeBoard(FreeBoardVO vo) {
		this.sqlSession.insert("free_board.insertFreeBoard", vo);
	}

	@Override
	public List<FreeBoardVO> getFreeBoardList(FreeBoardVO vo) {
		return this.sqlSession.selectList("free_board.getFreeBoardList",vo);
	}

	@Override
	public int getFreeBoardCount(FreeBoardVO vo) {
		return this.sqlSession.selectOne("free_board.getFreeBoardCount",vo);
	}

	@Override
	public void updateFreeboardHit(int free_board_no) {
		this.sqlSession.update("free_board.updateFreeBoardHit",free_board_no);
	}

	@Override
	public FreeBoardVO getFreeBoardContent(int free_board_no) {
		return this.sqlSession.selectOne("free_board.getFreeBoardContent",free_board_no);
	}

	@Override
	public void updateFreeBoard(FreeBoardVO vo) {
		this.sqlSession.update("free_board.updateFreeBoard",vo);
	}

	@Override
	public void deleteFreeBoard(int free_board_no) {
		this.sqlSession.delete("free_board.deleteFreeBoard",free_board_no);
	}

	@Override
	public List<FreeBoardVO> getMyFreeBoardList(FreeBoardVO vo) {
		return this.sqlSession.selectList("free_board.getMyFreeBoardList",vo);
	}

	@Override
	public int getMyBoardCount(String board_writer_id) {
		return this.sqlSession.selectOne("free_board.getMyBoardCount",board_writer_id);
	}
	
	@Override
	public void insertInfoBoard(InfoBoardVO vo) {
		this.sqlSession.insert("info_board.insertInfoBoard",vo);
	}

	@Override
	public List<InfoBoardVO> getInfoBoardList(InfoBoardVO vo) {
		return this.sqlSession.selectList("info_board.getInfoBoardList",vo);
	}

	@Override
	public int getInfoBoardCount(InfoBoardVO vo) {
		return this.sqlSession.selectOne("info_board.getInfoBoardCount",vo);
	}

	@Override
	public InfoBoardVO getInfoBoardContent(int info_board_no) {
		return this.sqlSession.selectOne("info_board.getInfoBoardContent",info_board_no);
	}

	@Override
	public void updateInfoBoardHit(int info_board_no) {
		this.sqlSession.update("info_board.updateInfoBoardHit",info_board_no);
	}

	@Override
	public void updateInfoBoard(InfoBoardVO vo) {
		this.sqlSession.update("info_board.updateInfoBoard",vo);
	}

	@Override
	public void deleteInfoBoard(int info_board_no) {
		this.sqlSession.delete("info_board.deleteInfoBoard",info_board_no);
	}

}

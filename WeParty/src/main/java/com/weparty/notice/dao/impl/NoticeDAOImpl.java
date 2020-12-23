package com.weparty.notice.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weparty.notice.dao.NoticeDAO;
import com.weparty.notice.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public void insertNotice(NoticeVO vo) {
		this.sqlsession.insert("notice.insertNotice",vo);
	}

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return this.sqlsession.selectList("notice.getNoticeList",vo);
	}

	@Override
	public int noticeCount() {
		return this.sqlsession.selectOne("notice.noticeCount");
	}

	@Override
	public NoticeVO getNoticeContent(int notice_no) {
		return this.sqlsession.selectOne("notice.getNoticeContent",notice_no);
	}

	@Override
	public void deleteNotice(int notice_no) {
		this.sqlsession.delete("notice.deleteNotice",notice_no);
	}

	@Override
	public void updateNotice(NoticeVO vo) {
		this.sqlsession.update("notice.updateNotice",vo);
	}

	@Override
	public void updateNoticeHit(NoticeVO vo) {
		this.sqlsession.update("notice.updateNoticeHit",vo);
	}
	
	
}

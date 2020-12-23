package com.weparty.notice.dao;

import java.util.List;

import com.weparty.notice.vo.NoticeVO;

public interface NoticeDAO {

	void insertNotice(NoticeVO vo);

	List<NoticeVO> getNoticeList(NoticeVO vo);

	int noticeCount();

	NoticeVO getNoticeContent(int notice_no);

	void deleteNotice(int notice_no);

	void updateNotice(NoticeVO vo);

	void updateNoticeHit(NoticeVO vo);

}

package com.weparty.notice.service;

import java.util.List;

import com.weparty.notice.vo.NoticeVO;

public interface GetNoticeService {

	List<NoticeVO> getNoticeList(NoticeVO vo);
	
	int noticeCount();
	
	NoticeVO getNoticeContent(int notice_no);
	
}

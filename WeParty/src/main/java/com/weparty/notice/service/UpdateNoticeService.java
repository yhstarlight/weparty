package com.weparty.notice.service;

import com.weparty.notice.vo.NoticeVO;

public interface UpdateNoticeService {
	void updateNotice(NoticeVO vo);
	
	void updateNoticeHit(NoticeVO vo);
}

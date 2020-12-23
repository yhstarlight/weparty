package com.weparty.notice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.notice.dao.NoticeDAO;
import com.weparty.notice.service.UpdateNoticeService;
import com.weparty.notice.vo.NoticeVO;

@Service
public class UpdateNoticeServiceImpl implements UpdateNoticeService {
	
	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public void updateNotice(NoticeVO vo) {
		this.noticeDao.updateNotice(vo);
	}

	@Override
	public void updateNoticeHit(NoticeVO vo) {
		this.noticeDao.updateNoticeHit(vo);
	}

}

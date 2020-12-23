package com.weparty.notice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.notice.dao.NoticeDAO;
import com.weparty.notice.service.DeleteNoticeService;

@Service
public class DeleteNoticeServiceImpl implements DeleteNoticeService {
	
	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public void deleteNotice(int notice_no) {
		this.noticeDao.deleteNotice(notice_no);
	}

}

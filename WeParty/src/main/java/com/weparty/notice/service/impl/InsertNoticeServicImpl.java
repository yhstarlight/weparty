package com.weparty.notice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.notice.dao.NoticeDAO;
import com.weparty.notice.service.InsertNoticeService;
import com.weparty.notice.vo.NoticeVO;

@Service
public class InsertNoticeServicImpl implements InsertNoticeService {
	
	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public void insertNotice(NoticeVO vo) {
		this.noticeDao.insertNotice(vo);
	}

}

package com.weparty.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.notice.dao.NoticeDAO;
import com.weparty.notice.service.GetNoticeService;
import com.weparty.notice.vo.NoticeVO;

@Service
public class GetNoticeServiceImpl implements GetNoticeService {

	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public List<NoticeVO> getNoticeList(NoticeVO vo) {
		return this.noticeDao.getNoticeList(vo);
	}

	@Override
	public int noticeCount() {
		return this.noticeDao.noticeCount();
	}

	@Override
	public NoticeVO getNoticeContent(int notice_no) {
		return this.noticeDao.getNoticeContent(notice_no);
	}
}

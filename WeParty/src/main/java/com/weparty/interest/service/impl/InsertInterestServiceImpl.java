package com.weparty.interest.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.interest.dao.InterestDAO;
import com.weparty.interest.service.InsertInterestService;
import com.weparty.interest.vo.InterestVO;

@Service
public class InsertInterestServiceImpl implements InsertInterestService {

	@Autowired
	private InterestDAO interestDao;
	
	@Override
	public void setInterest(InterestVO vo) {
		this.interestDao.setInterest(vo);
	}

}

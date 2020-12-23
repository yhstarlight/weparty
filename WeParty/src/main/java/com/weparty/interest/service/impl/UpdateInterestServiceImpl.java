package com.weparty.interest.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.interest.dao.InterestDAO;
import com.weparty.interest.service.UpdateInterestService;
import com.weparty.interest.vo.InterestVO;

@Service
public class UpdateInterestServiceImpl implements UpdateInterestService {

	@Autowired
	private InterestDAO interestDao;

	@Override
	public void updateInterest(InterestVO vo) {
		this.interestDao.updateInterest(vo);
	}
	
	
}

package com.weparty.interest.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.interest.dao.InterestDAO;
import com.weparty.interest.service.GetInterestService;
import com.weparty.interest.vo.InterestVO;

@Service
public class GetInterestServiceImpl implements GetInterestService {

	@Autowired
	private InterestDAO InteresetDao;
	
	@Override
	public InterestVO getInterest(String user_id) {
		return this.InteresetDao.getInterest(user_id);
	}

}

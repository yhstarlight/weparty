package com.weparty.visit.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.visit.dao.VisitDAO;
import com.weparty.visit.service.GetVisitService;

@Service
public class GetVisitServiceImpl implements GetVisitService {
	@Autowired
	private VisitDAO visitDao;

	@Override
	public int getVisitCount() {
		return this.visitDao.getVisitCount();
	}
	
	
}

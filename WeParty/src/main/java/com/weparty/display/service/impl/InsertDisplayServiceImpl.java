package com.weparty.display.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.display.dao.DisplayDAO;
import com.weparty.display.service.InsertDisplayService;
import com.weparty.display.vo.DisplayVO;

@Service
public class InsertDisplayServiceImpl implements InsertDisplayService {
	
	@Autowired
	private DisplayDAO displayDAO;

	@Override
	public void insertDisplay(DisplayVO vo) {
		this.displayDAO.insertDisplay(vo);
	}

}

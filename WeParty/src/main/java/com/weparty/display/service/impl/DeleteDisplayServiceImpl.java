package com.weparty.display.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.display.dao.DisplayDAO;
import com.weparty.display.service.DeleteDisplayService;

@Service
public class DeleteDisplayServiceImpl implements DeleteDisplayService {

	@Autowired
	private DisplayDAO displayDAO;
	
	@Override
	public void deleteDisplay(int display_no) {
		this.displayDAO.deleteDisplay(display_no);
	}

}

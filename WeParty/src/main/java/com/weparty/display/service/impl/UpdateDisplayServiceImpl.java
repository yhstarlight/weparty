package com.weparty.display.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.weparty.display.dao.DisplayDAO;
import com.weparty.display.service.UpdateDisplayService;
import com.weparty.display.vo.DisplayVO;

@Service
public class UpdateDisplayServiceImpl implements UpdateDisplayService {

	@Autowired
	private DisplayDAO displayDAO;

	@Override
	public void updateDisplay(DisplayVO vo) {
		this.displayDAO.updateDisplay(vo);
	}

}

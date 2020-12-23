package com.weparty.display.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.weparty.display.dao.DisplayDAO;
import com.weparty.display.service.GetDisplayService;
import com.weparty.display.vo.DisplayVO;

@Service
public class GetDisplayServiceImple implements GetDisplayService {
	
	@Inject
	private DisplayDAO displayDAO;

	@Override
	public List<DisplayVO> getDisplayList() {
		return this.displayDAO.getDisplayList();
	}

	@Override
	public String getDisplayPosterPath(int display_no) {
		return this.displayDAO.getDisplayPosterPath(display_no);
	}

}

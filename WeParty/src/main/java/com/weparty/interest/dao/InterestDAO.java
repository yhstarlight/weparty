package com.weparty.interest.dao;

import com.weparty.interest.vo.InterestVO;

public interface InterestDAO {

	void setInterest(InterestVO vo);

	InterestVO getInterest(String user_id);

	void updateInterest(InterestVO vo);
}

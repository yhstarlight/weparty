package com.weparty.user.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.weparty.user.dao.UserDAO;
import com.weparty.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public void registerUser(UserVO vo) {
		this.sqlSession.insert("user.register",vo);
	}

	@Override
	public List<String> getUserId() {
		return this.sqlSession.selectList("user.getUserId");
	}

	@Override
	public List<String> getUserEmail() {
		return this.sqlSession.selectList("user.getUserEmail");
	}

	@Override
	public String findUser(UserVO vo) {
		return this.sqlSession.selectOne("user.findUser",vo);
	}

	@Override
	public void changePw(UserVO user) {
		this.sqlSession.update("user.changePw",user);
	}

	@Override
	public UserVO getUserInfo(String user_id) {
		return this.sqlSession.selectOne("user.getUserInfo",user_id);
	}

	@Override
	public void deleteUser(String user_id) {
		this.sqlSession.delete("user.deleteUser",user_id);
	}

	@Override
	public void changeUserInfo(UserVO user) {
		this.sqlSession.update("user.changeUserInfo",user);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return this.sqlSession.selectList("user.getUserList",vo);
	}

	@Override
	public int getUserCount() {
		return this.sqlSession.selectOne("user.getUserCount");
	}

	@Override
	public void setUserBan(String user_id) {
		this.sqlSession.update("user.setUserBan",user_id);
	}

	@Override
	public void delUserBan(String user_id) {
		this.sqlSession.update("user.delUserBan",user_id);
	}

}

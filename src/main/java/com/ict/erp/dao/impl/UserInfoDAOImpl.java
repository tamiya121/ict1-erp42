package com.ict.erp.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.erp.dao.UserInfoDAO;
import com.ict.erp.vo.UserInfo;

@Repository
public class UserInfoDAOImpl implements UserInfoDAO{

	@Autowired
	private SqlSession ss;
	
	@Override
	public List<UserInfo> selectUserInfoList(UserInfo ui) {
		return ss.selectList("SQL.USERINFO.selectUserInfoList",ui);
	}

	@Override
	public UserInfo selectUserInfo(Integer uiNum) {
		return ss.selectOne("SQL.USERINFO.selectUserInfo",uiNum);
	}

	@Override
	public int insertUserInfo(UserInfo ui) {
		return ss.insert("SQL.USERINFO.insertUserInfo",ui);
	}

	@Override
	public int updateUserInfo(UserInfo ui) {
		return ss.update("SQL.USERINFO.updateUserInfo",ui);
	}

	@Override
	public int deleteUserInfo(Integer uiNum) {
		return ss.delete("SQL.USERINFO.deleteUserInfo",uiNum);
	}
}
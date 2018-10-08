package com.ict.erp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.erp.dao.UserInfoDAO;
import com.ict.erp.service.UserInfoService;
import com.ict.erp.vo.UserInfo;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoDAO uidao;
	
	@Override
	public List<UserInfo> selectUserInfoList(UserInfo ui) {
		return uidao.selectUserInfoList(ui);
	}

	@Override
	public UserInfo selectUserInfo(Integer uiNum) {
		return uidao.selectUserInfo(uiNum);
	}

	@Override
	public int insertUserInfo(UserInfo ui) {
		return uidao.insertUserInfo(ui);
	}

	@Override
	public int updateUserInfo(UserInfo ui) {
		return uidao.updateUserInfo(ui);
	}

	@Override
	public int deleteUserInfo(Integer uiNum) {
		return uidao.deleteUserInfo(uiNum);
	}

}

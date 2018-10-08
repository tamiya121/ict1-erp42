package com.ict.erp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ict.erp.service.UserInfoService;
import com.ict.erp.vo.UserInfo;

@Controller
public class UserInfoController {

	@Autowired
	private UserInfoService uis;
	
	//전체select
	@RequestMapping(value="/userinfo", method=RequestMethod.GET)
	@ResponseBody
	public List<UserInfo> selectUserInfoList(@ModelAttribute UserInfo ui){
		System.out.println(ui);
		return uis.selectUserInfoList(ui);
	}
	
	//단일select
	@RequestMapping(value="/userinfo/{uiNum}", method=RequestMethod.GET)
	@ResponseBody
	public UserInfo selectUserInfo(@PathVariable Integer uiNum) {
		System.out.println(uiNum);
		return uis.selectUserInfo(uiNum);
	}
	
	//insert
	@RequestMapping(value="/userinfo",method=RequestMethod.POST)
	@ResponseBody
	public Integer insertUserInfo(@RequestBody UserInfo ui) {
		System.out.println(ui);
		return uis.insertUserInfo(ui);
	}
	
	//update
	@RequestMapping(value="/userinfo/{uiNum}",method=RequestMethod.PUT)
	@ResponseBody
	public Integer updateUserInfo(@RequestBody UserInfo ui,@PathVariable Integer uiNum) {
		ui.setUiNum(uiNum);
		return uis.updateUserInfo(ui);
	}
	
	//delete
	@RequestMapping(value="/userinfo/{uiNum}",method=RequestMethod.DELETE)
	@ResponseBody
	public Integer deleteUserInfo(@PathVariable Integer uiNum) {
		System.out.println(uiNum);
		return uis.deleteUserInfo(uiNum);
	}
}

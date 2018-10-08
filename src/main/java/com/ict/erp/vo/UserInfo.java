package com.ict.erp.vo;

import org.apache.ibatis.type.Alias;

@Alias("ui")
public class UserInfo {
	private Integer uiNum;
	private String uiId;
	private String uiPwd;
	private String uiRPwd;
	private String uiName;
	private Integer uiBir;
	private String uiTran;
	private String uiEmail;
	private String uiPhone;
	private String uiAddress;
	private String uiDAddress;
	private String uiDesc;	
	
	public UserInfo() {}
	
	public UserInfo(Integer uiNum, String uiId, String uiPwd, String uiRPwd, String uiName, Integer uiBir, String uiTran,
			String uiEmail, String uiPhone, String uiAddress, String uiDAddress, String uiDesc) {
		super();
		this.uiNum = uiNum;
		this.uiId = uiId;
		this.uiPwd = uiPwd;
		this.uiRPwd = uiRPwd;
		this.uiName = uiName;
		this.uiBir = uiBir;
		this.uiTran = uiTran;
		this.uiEmail = uiEmail;
		this.uiPhone = uiPhone;
		this.uiAddress = uiAddress;
		this.uiDAddress = uiDAddress;
		this.uiDesc = uiDesc;
	}
	public Integer getUiNum() {
		return uiNum;
	}
	public void setUiNum(Integer uiNum) {
		this.uiNum = uiNum;
	}
	public String getUiId() {
		return uiId;
	}
	public void setUiId(String uiId) {
		this.uiId = uiId;
	}
	public String getUiPwd() {
		return uiPwd;
	}
	public void setUiPwd(String uiPwd) {
		this.uiPwd = uiPwd;
	}
	public String getUiRPwd() {
		return uiRPwd;
	}
	public void setUiRPwd(String uiRPwd) {
		this.uiRPwd = uiRPwd;
	}
	public String getUiName() {
		return uiName;
	}
	public void setUiName(String uiName) {
		this.uiName = uiName;
	}
	public Integer getUiBir() {
		return uiBir;
	}
	public void setUiBir(Integer uiBir) {
		this.uiBir = uiBir;
	}
	public String getUiTran() {
		return uiTran;
	}
	public void setUiTran(String uiTran) {
		this.uiTran = uiTran;
	}
	public String getUiEmail() {
		return uiEmail;
	}
	public void setUiEmail(String uiEmail) {
		this.uiEmail = uiEmail;
	}
	public String getUiPhone() {
		return uiPhone;
	}
	public void setUiPhone(String uiPhone) {
		this.uiPhone = uiPhone;
	}
	public String getUiAddress() {
		return uiAddress;
	}
	public void setUiAddress(String uiAddress) {
		this.uiAddress = uiAddress;
	}
	public String getUiDAddress() {
		return uiDAddress;
	}
	public void setUiDAddress(String uiDAddress) {
		this.uiDAddress = uiDAddress;
	}
	public String getUiDesc() {
		return uiDesc;
	}
	public void setUiDesc(String uiDesc) {
		this.uiDesc = uiDesc;
	}
	@Override
	public String toString() {
		return "UserInfo [uiNum=" + uiNum + ", uiId=" + uiId + ", uiPwd=" + uiPwd + ", uiRPwd=" + uiRPwd + ", uiName="
				+ uiName + ", uiBir=" + uiBir + ", uiTran=" + uiTran + ", uiEmail=" + uiEmail + ", uiPhone=" + uiPhone
				+ ", uiAddress=" + uiAddress + ", uiDAddress=" + uiDAddress + ", uiDesc=" + uiDesc + "]";
	}
	
	
}

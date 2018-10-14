<%@page import="com.ict.erp.vo.UserInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<html>
<head>
    <link rel="stylesheet" href="/css/bootstrap.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<script>
var AjaxUtil = function(conf) {
	var xhr = new XMLHttpRequest();
	var url = conf.url;
	var method = conf.method?conf.method:'GET';
	var param = conf.param?conf.param:'{}';
	
	var success = conf.success?conf.success:function(res) {
		alert(res);
	}
	
	var error = conf.error?conf.error:function(res) {
		alert(res);
	}
	
	xhr.onreadystatechange = function() {
		if(xhr.readyState==4) {
			if(xhr.status=="200") {
				success(xhr.responseText);
			}else {
				error(xhr.responseText);
			}
		}
	}
	xhr.open(method,url);
	if(method!='GET') {
		xhr.setRequestHeader('Content-type','application/json;charset=utf-8');
	}
	this.send = function() {
		xhr.send(param);
	}
}
</script>

<body>
<style>
table, th, td {
    border: 3px solid #bcbcbc;
  }
  .jb-th-1 {
    width: 100px;
  }
</style>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/menu/left.jsp" />
		<div id="page-content-wrapper">
			<div>
				<a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Toggle Menu</a>
			</div>
		</div>
	</div>
<div class="container">
    <form id="boardForm" name="boardForm" method="post">
		<table class="table table-striped table-hover">
		
		<tr>
			<th colspan="2"><h1>회원가입</h1></th>
		</tr>
		
		<tr>	
			<td>아이디</td>
			<td><input type="text" id="uiId" placeholder="ID 3글자 이상 입력"required></td>
			
		</tr>
		<tr>	
			<td>비밀번호</td>
			<td><input type="password" id="uiPwd" placeholder="비밀번호 3글자 이상 입력" required></td>
		</tr>
		<tr>	
			<td>비밀번호재확인</td>
			<td><input type="password" id="uiRPwd" placeholder="비밀번호 확인" required></td>
		</tr>
		<tr>	
			<td>이름</td>
			<td><input type="text" id="uiName" placeholder="이름 2글자 이상 입력" required></td>
		</tr>
		<tr>	
			<td>생년월일</td>
			<td><input type="text" id="uiBir" placeholder="ex)19901212" required></td>
		</tr>
		<tr>	
			<td>성별</td>
			<td><input type="text" id="uiTran" placeholder="남/여" required></td>
		</tr>
		<tr>	
			<td>이메일</td>
			<td><input type="email" id="uiEmail" placeholder="30자 이내 입력" required></td>
		</tr>
		<tr>	
			<td>주소</td>
			<td><input type="text" id="uiAddress" placeholder="30자 이내 입력" required></td>
		</tr>
		<tr>	
			<td>상세주소</td>
			<td><input type="text" id="uiDAddress" placeholder="30자 이내 입력" required></td>
		</tr>
		<tr>	
			<td>연락처</td>
			<td><input type="text" id="uiPhone" placeholder="-없이 입력" required></td>
		</tr>	
		<tr>
			<td>기타사항</td>
			<td><input type="text" id="uiDesc" placeholder="300자 이내 입력" required></td>
		</tr>
</table>

<center><a href='#' style="WIDTH: 60pt; HEIGHT: 30pt" onclick="saveUserInfo()" class="btn btn-success">등록</a></center>     
<script>
function saveUserInfo() {
	var uiId = document.querySelector("#uiId").value;
	var uiPwd = document.querySelector("#uiPwd").value;
	var uiRPwd = document.querySelector("#uiRPwd").value;
	var uiName = document.querySelector("#uiName").value;
	var uiBir = document.querySelector("#uiBir").value;
	var uiTran = document.querySelector("#uiTran").value;
	var uiEmail = document.querySelector("#uiEmail").value;
	var uiAddress = document.querySelector("#uiAddress").value;
	var uiDAddress = document.querySelector("#uiDAddress").value;
	var uiPhone = document.querySelector("#uiPhone").value;
	var uiDesc = document.querySelector("#uiDesc").value;
	
	
	if (uiId.trim().length < 3) {
		alert("ID를 3글자 이상 입력해주세요");
		uiId = "";
		return ;
	}
	if (uiPwd.trim().length < 3) {
		alert("비밀번호 3글자 이상 입력해주세요");
		uiPwd = "";
		return;
	}
	if (uiRPwd != uiPwd) {
		alert("비밀번호가 다릅니다");
		uiRPwd = "";
		return ;
	}
	if (uiName.trim().length < 2) {
		alert("이름을 2글자 이상 입력해주세요");
		uiName = "";
		return ;
	}
	
	
	if (uiBir.trim().length != 8) {
		alert("ex)90년 1월 1일 -> 19900101");
		uiBir = "";
		return ;
	}
	if (uiTran.trim().length != 1) {
		alert("남/여로 구분하여 입력해주세요");
		uiTran = "";
		return ;
	}
	
	if (uiAddress.trim().length > 30) {
		alert("주소를 30자 이내로 입력해주세요");
		uiAddress = "";
		return ;
	}
	if (uiDAddress.trim().length > 30) {
		alert("상세주소를 30자 이내로 입력해주세요");
		uiDAddress = "";
		return ;
	}
	
		
	var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	if(regExp.test(uiPhone)==false) {
		alert("연락처 ex)01000000000");
		uiPhone = "";
		return ;
	}
	if (uiDesc.trim().length > 300) {
		alert("기타사항을 300자 이내로 입력해주세요");
		uiDesc = "";
		return ;
	}
	if (uiEmail.trim().length ==0) {
		alert("이메일을 입력해주세요.");
		uiEmail = "";		
		return ;
	}
	var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
	if(exptext.test(uiEmail)==false){
		alert("이메일 형식에 맞게 입력해주세요.");
		uiEmail = "";		
		return ;
	}
	
	
	var params = {uiId:uiId, uiPwd:uiPwd, uiRPwd:uiRPwd, uiName:uiName, uiBir:uiBir, uiTran:uiTran, uiEmail:uiEmail, uiAddress:uiAddress, uiDAddress:uiDAddress, uiPhone:uiPhone, uiDesc:uiDesc};
	params = JSON.stringify(params);
	
	var conf = {
				url : '/userinfo/',
				method : 'POST',
				param : params,
				success : function(res) {
					if(res=='1') {
						alert('회원가입이 완료되었습니다~!');
						location.href='/url/userinfo:list';
					}
				}
	}
	var au = new AjaxUtil(conf);
	au.send();
	
}
</script>
</form>
</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/menu/bottom.jsp" />
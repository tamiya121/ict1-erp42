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
		var method = conf.method ? conf.method : 'GET';
		var param = conf.param ? conf.param : '{}';

		var success = conf.success ? conf.success : function(res) {
			alert(res);
		}

		var error = conf.error ? conf.error : function(res) {
			alert(res);
		}

		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4) {
				if (xhr.status == "200") {
					success(xhr.responseText);
				} else {
					error(xhr.responseText);
				}
			}
		}
		xhr.open(method, url);
		if (method != 'GET') {
			xhr.setRequestHeader('Content-type',
					'application/json;charset=utf-8');
		}
		this.send = function() {
			xhr.send(param);
		}
	}
</script>

<body>
	<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
}

th:nth-child(2n), td:nth-child(2n) {
	background-color: #bbdefb;
}

th:nth-child(2n+1), td:nth-child(2n+1) {
	background-color: #e3f2fd;
}
</style>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/menu/left.jsp" />
		<div id="page-content-wrapper">
			<div>
				<a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">M
					E N U</a>
			</div>

			<div class="container">

				<table class="table table-striped table-hover">

					<tr>
						<th colspan="2"><h1>회원가입</h1></th>
					</tr>

					<tr>
						<td>아이디</td>
						<td><input type="text" id="uiId" size="100"
							style="background-color: transparent; border: 0 solid black; text-align: right; text-align: center"
							placeholder="ID 3글자 이상 입력" required></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" id="uiPwd" size="100"
							style="background-color: transparent; border: 0 solid black; text-align: right; text-align: center"
							placeholder="비밀번호 3글자 이상 입력" required></td>
					</tr>
					<tr>
						<td>비밀번호재확인</td>
						<td><input type="password" id="uiRPwd" size="100"
							style="background-color: transparent; border: 0 solid black; text-align: right; text-align: center"
							placeholder="비밀번호 확인" required></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" id="uiName" size="100"
							style="background-color: transparent; border: 0 solid black; text-align: right; text-align: center"
							placeholder="이름 2글자 이상 입력" required></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td><input type="date" id="uiBir" size="100"
							style="background-color: transparent; border: 0 solid black; text-align: right; text-align: center"
							required></td>
					</tr>
					<tr>
						<td>성별</td>
						<td><input type="text" id="uiTran" size="100"
							style="background-color: transparent; border: 0 solid black; text-align: right; text-align: center"
							placeholder="남/여" required></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="email" id="uiEmail" size="100"
							style="background-color: transparent; border: 0 solid black; text-align: right; text-align: center"
							placeholder="30자 이내 입력" required></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" id="uiAddress" size="100"
							style="background-color: transparent; border: 0 solid black; text-align: right; text-align: center"
							placeholder="30자 이내 입력" required></td>
					</tr>
					<tr>
						<td>상세주소</td>
						<td><input type="text" id="uiDAddress" size="100"
							style="background-color: transparent; border: 0 solid black; text-align: right; text-align: center"
							placeholder="30자 이내 입력" required></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" id="uiPhone" size="100"
							style="background-color: transparent; border: 0 solid black; text-align: right; text-align: center"
							placeholder="ex)010-0000-0000" required></td>
					</tr>
					<tr>
						<td>기타사항</td>
						<td><input type="text" id="uiDesc" size="100"
							style="background-color: transparent; border: 0 solid black; text-align: right; text-align: center"
							placeholder="300자 이내 입력" required></td>
					</tr>
				</table>
			</div>
		</div>

		<center>
			<a href='#' style="WIDTH: 60pt; HEIGHT: 30pt"
				onclick="saveUserInfo()" class="btn btn-success">등록</a>
		</center>
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

				var id = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/
				if (id.test(uiId) == false) {
					alert("ID를 8~24자 영문대소문자, 숫자 혼합하여 사용해주세요");
					uiId = "";
					$("#uiId").focus();
					return;
				}
				var pwd = /^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]|.*[0-9]).{8,24}$/
				if (pwd.test(uiPwd) == false) {
					alert("패스워드를 8~24자 영문대소문자, 숫자 혼합하여 사용해주세요");
					uiPwd = "";
					$("#uiPwd").focus();
					return;
				}
				if (uiRPwd != uiPwd) {
					alert("비밀번호가 다릅니다");
					uiRPwd = "";
					$("#uiRPwd").focus();
					return;
				}

				var name = /^[가-힣]+$/;
				if (name.test(uiName) == false) {
					alert("이름은 한글만 가능합니다");
					return;
				}

				if (uiBir.trim().length == 0) {
					alert("생년월일을 입력해주세요");
					uiBir = "";
					$("#uiBir").focus();
					return;
				}
				if (uiTran.trim().length != 1) {
					alert("남/여로 구분하여 입력해주세요");
					uiTran = "";
					$("#uiTran").focus();
					return;
				}

				if (uiAddress.trim().length > 30) {
					alert("주소를 30자 이내로 입력해주세요");
					uiAddress = "";
					$("#uiAddress").focus();
					return;
				}
				if (uiDAddress.trim().length > 30) {
					alert("상세주소를 30자 이내로 입력해주세요");
					uiDAddress = "";
					$("#uiDAddress").focus();
					return;
				}

				var phone = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
				if (phone.test(uiPhone) == false) {
					alert("연락처를 확인해주세요");
					uiPhone = "";
					$("#uiPhone").focus();
					return;
				}
				if (uiDesc.trim().length > 300) {
					alert("기타사항을 300자 이내로 입력해주세요");
					uiDesc = "";
					$("#uiDesc").focus();
					return;
				}
				if (uiEmail.trim().length == 0) {
					alert("이메일을 입력해주세요.");
					uiEmail = "";
					$("#uiEmail").focus();
					return;
				}
				var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
				if (exptext.test(uiEmail) == false) {
					alert("이메일 형식에 맞게 입력해주세요.");
					uiEmail = "";
					$("#uiEmail").focus();
					return;
				}

				var params = {
					uiId : uiId,
					uiPwd : uiPwd,
					uiRPwd : uiRPwd,
					uiName : uiName,
					uiBir : uiBir,
					uiTran : uiTran,
					uiEmail : uiEmail,
					uiAddress : uiAddress,
					uiDAddress : uiDAddress,
					uiPhone : uiPhone,
					uiDesc : uiDesc
				};
				params = JSON.stringify(params);

				var conf = {
					url : '/userinfo/',
					method : 'POST',
					param : params,
					success : function(res) {
						if (res == '1') {
							alert('회원가입이 완료되었습니다~!');
							location.href = '/url/userinfo:list';
						}
					}
				}
				var au = new AjaxUtil(conf);
				au.send();

			}
		</script>

	</div>
</body>
</html>
<jsp:include page="/WEB-INF/views/menu/bottom.jsp" />
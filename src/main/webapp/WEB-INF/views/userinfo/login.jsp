<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
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
<form onsubmit="saveUserInfo()">
<table border="1">
		
		<tr>
			<th colspan="13">회원가입</th>
		</tr>
		
		<tr>	
			<td>아이디</td>
			<td><input type="text" id="uiId" required></td>
			
		</tr>
		<tr>	
			<td>비밀번호</td>
			<td><input type="password" id="uiPwd" required></td>
		</tr>
		<tr>	
			<td>비밀번호재확인</td>
			<td><input type="password" id="uiRPwd" required></td>
		</tr>
		<tr>	
			<td>이름</td>
			<td><input type="text" id="uiName" required></td>
		</tr>
		<tr>	
			<td>생년월일</td>
			<td><input type="text" id="uiBir" required></td>
		</tr>
		<tr>	
			<td>성별</td>
			<td><input type="text" id="uiTran" required></td>
		</tr>
		<tr>	
			<td>이메일</td>
			<td><input type="email" id="uiEmail" required></td>
		</tr>
		<tr>	
			<td>주소</td>
			<td><input type="text" id="uiAddress" required></td>
		</tr>
		<tr>	
			<td>상세주소</td>
			<td><input type="text" id="uiDAddress" required></td>
		</tr>
		<tr>	
			<td>연락처</td>
			<td><input type="text" id="uiPhone" required></td>
		</tr>	
		<tr>
			<td>기타사항</td>
			<td><input type="text" id="uiDesc" required></td>
		</tr>
</table>
<button>등록</button>	
</form>
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
		
	}
	if (uiPwd.trim().length < 3) {
		alert("비밀번호 3글자 이상 입력해주세요");
		uiPwd = "";
		
	}
	if (uiRPwd != uiPwd) {
		alert("비밀번호가 다릅니다");
		uiRPwd = "";
		
	}
	if (uiName.trim().length < 2) {
		alert("이름을 2글자 이상 입력해주세요");
		uiName = "";
		
	}
	if (uiBir.trim().length != 8) {
		alert("ex)90년 1월 1일 -> 19900101");
		uiBir = "";
		
	}
	if (uiTran.trim().length != 1) {
		alert("남/여로 구분하여 입력해주세요");
		uiTran = "";
		
	}
	if (uiAddress.trim().length > 30) {
		alert("주소를 30자 이내로 입력해주세요");
		uiAddress = "";
	}
	if (uiDAddress.trim().length > 30) {
		alert("상세주소를 30자 이내로 입력해주세요");
		uiDAddress = "";
	}
	if (uiPhone.trim().length > 12) {
		alert("연락처 ex)01000000000");
		uiPhone = "";
		
	}
	if (uiDesc.trim().length > 300) {
		alert("기타사항을 300자 이내로 입력해주세요");
		uiDesc = "";
		
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
						location.href='/url/userinfo:list1';
					}
				}
	}
	var au = new AjaxUtil(conf);
	au.send();
	
}
</script>
</body>
</html>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
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
<div class="container">
    <form id="boardForm" name="boardForm" method="post">
        <table class="table table-striped table-hover">
		
		<thead>
				<tr>
					<td>&nbsp</td>	
				</tr>	
			</thead>
		<tr>	
			<td>번호</td>
			<td>${ui.uiNum}</td>
			
		</tr>
		<tr>	
			<td>아이디</td>
			<td><input type="text" id="uiId" value="${ui.uiId }"></td>
			
		</tr>
		<tr>	
			<td>비밀번호</td>
			<td><input type="password" id="uiPwd" value="${ui.uiPwd }"></td>
		</tr>
		<tr>	
			<td>비밀번호재확인</td>
			<td><input type="password" id="uiRPwd" value="${ui.uiRPwd }"></td>
		</tr>
		<tr>	
			<td>이름</td>
			<td><input type="text" id="uiName" value="${ui.uiName }"></td>
		</tr>
		<tr>	
			<td>생년월일</td>
			<td><input type="text" id="uiBir" value="${ui.uiBir }"></td>
		</tr>
		<tr>	
			<td>성별</td>
			<td><input type="text" id="uiTran" value="${ui.uiTran }"></td>
		</tr>
		<tr>	
			<td>이메일</td>
			<td><input type="email" id="uiEmail" value="${ui.uiEmail }"></td>
		</tr>
		<tr>	
			<td>주소</td>
			<td><input type="text" id="uiAddress" value="${ui.uiAddress }"></td>
		</tr>
		<tr>	
			<td>상세주소</td>
			<td><input type="text" id="uiDAddress" value="${ui.uiDAddress }"></td>
		</tr>
		<tr>	
			<td>연락처</td>
			<td><input type="text" id="uiPhone" value="${ui.uiPhone }"></td>
		</tr>	
		<tr>
			<td>기타사항</td>
			<td><input type="text" id="uiDesc" value="${ui.uiDesc }"></td>
		</tr>
</table>
		
		<div>            
            <a href='#' onclick="updateUserInfo(${ui.uiNum})" class="btn btn-success">수정</a>     
            <a href='#' onclick="deleteUserInfo(${ui.uiNum})" class="btn btn-success">삭제</a>            
         </div>
		</form>
		 	
</div>
</body>


			
<script>			
function updateUserInfo(uiNum) {
	var uiId = document.querySelector('#uiId').value;
	var uiPwd = document.querySelector('#uiPwd').value;
	var uiRPwd = document.querySelector('#uiRPwd').value;
	var uiName = document.querySelector('#uiName').value;
	var uiBir = document.querySelector('#uiBir').value;
	var uiTran = document.querySelector('#uiTran').value;
	var uiEmail = document.querySelector('#uiEmail').value;
	var uiAddress = document.querySelector('#uiAddress').value;
	var uiDAddress = document.querySelector('#uiDAddress').value;
	var uiPhone = document.querySelector('#uiPhone').value;
	var uiDesc = document.querySelector('#uiDesc').value;
	var params = {uiId:uiId, uiPwd:uiPwd, uiRPwd:uiRPwd, uiName:uiName, uiBir:uiBir, uiTran:uiTran, uiEmail:uiEmail, uiAddress:uiAddress, uiDAddress:uiDAddress, uiPhone:uiPhone, uiDesc:uiDesc};
	params = JSON.stringify(params);
	
	var conf = {
			url : '/userinfo/' + uiNum,
			method : 'PUT',
			param : params,
			success : function(res) {
				if(res=='1') {
					alert('변경이 완료되었습니다~!');
					location.href='/url/userinfo:list1';
				}
			
			}
}		
	var au = new AjaxUtil(conf);
	au.send();
}

function deleteUserInfo(uiNum){			
	var conf={url:'/userinfo/'+uiNum,
			method:'DELETE',
			success:function(res){
			if(res=='1'){
				alert("삭제가 완료되었습니다~!");
				location.href='/url/userinfo:list1';
			}		  
		}
	
	}
	var au=new AjaxUtil(conf);
	au.send();	
}
</script>
</html>	
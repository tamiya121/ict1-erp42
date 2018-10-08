
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
	
	window.addEventListener('load',function() {
		var conf = {
				url : '/userinfo',
				success : function(res) {
					res = JSON.parse(res);
					var html = '';
					for(var ui of res) {
						html += '<tr>';
						html += '<td>' + ui.uiNum + '</td>';
						html += '<td><input type="text" id="uiId' + ui.uiNum +'" value="' + ui.uiId + '"></td>';
						html += '<td><input type="password" id="uiPwd' + ui.uiNum +'" value="' + ui.uiPwd + '"></td>';
						html += '<td><input type="password" id="uiRPwd' + ui.uiNum +'" value="' + ui.uiRPwd + '"></td>';
						html += '<td><input type="text" id="uiName' + ui.uiNum +'" value="' + ui.uiName + '"></td>';
						html += '<td><input type="text" id="uiBir' + ui.uiNum +'" value="' + ui.uiBir + '"></td>';
						html += '<td><input type="text" id="uiTran' + ui.uiNum +'" value="' + ui.uiTran + '"></td>';
						html += '<td><input type="text" id="uiEmail' + ui.uiNum +'" value="' + ui.uiEmail + '"></td>';
						html += '<td><input type="text" id="uiAddress' + ui.uiNum +'" value="' + ui.uiAddress + '"></td>';
						html += '<td><input type="text" id="uiDAddress' + ui.uiNum +'" value="' + ui.uiDAddress + '"></td>';
						html += '<td><input type="text" id="uiPhone' + ui.uiNum +'" value="' + ui.uiPhone + '"></td>';
						html += '<td><input type="text" id="uiDesc' + ui.uiNum +'" value="' + ui.uiDesc + '"></td>';
						html += '<td><button onclick="updateUserInfo(' + ui.uiNum +')">수정</button><button onclick="deleteUserInfo(' + ui.uiNum + ')">삭제</button></td>';
						html += '</tr>';
					}
					document.querySelector('#uiBody').insertAdjacentHTML('beforeend',html);
					
				}
		}
		var au = new AjaxUtil(conf);
		au.send();
	});
</script>
<body>
uiName : <input type="text" name="uiName">
<button>검색</button>
<table border="1">
	<thead>
		<tr>
			<th colspan="2">회원가입</th>
		</tr>
		<tr>
			<td>uiNum</td>
		</tr>
		<tr>	
			<td>uiId</td>
		</tr>
		<tr>	
			<td>uiPwd</td>
		</tr>
		<tr>	
			<td>uiRPwd</td>
		</tr>
		<tr>	
			<td>uiName</td>
		</tr>
		<tr>	
			<td>uiBir</td>
		</tr>
		<tr>	
			<td>uiTran</td>
		</tr>
		<tr>	
			<td>uiEmail</td>
		</tr>
		<tr>	
			<td>uiAddress</td>
		</tr>
		<tr>	
			<td>uiDAddress</td>
		</tr>
		<tr>	
			<td>uiPhone</td>
		</tr>
		<tr>	
			<td>uiDesc</td>
		</tr>
		<tr>	
			<td>수정/삭제</td>
		</tr>
		</thead>
		<tbody id="uiBody">
		</tbody>
</table>
<button onclick="addUserInfo()">정보입력</button>
<script>
function addUserInfo() {
	
	var html = '<tr>';
		html += '<td>&nbsp;</td>';
		html += '<td><input type="text" id="uiId" value=""></td>';	
		html += '<td><input type="password" id="uiPwd" value=""></td>';
		html += '<td><input type="password" id="uiRPwd" value=""></td>';
		html += '<td><input type="text" id="uiName" value=""></td>';
		html += '<td><input type="text" id="uiBir" value=""></td>';
		html += '<td><input type="text" id="uiTran" value=""></td>';
		html += '<td><input type="text" id="uiEmail" value=""></td>';
		html += '<td><input type="text" id="uiAddress" value=""></td>';
		html += '<td><input type="text" id="uiDAddress" value=""></td>';
		html += '<td><input type="text" id="uiPhone" value=""></td>';
		html += '<td><input type="text" id="uiDesc" value=""></td>';
		html += '<td><button onclick="saveUserInfo()">회원가입</button></td>';
		html += '</tr>';
		
		
		document.querySelector('#uiBody').insertAdjacentHTML('beforeend',html);
		
		}
		
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
	var params = {uiId:uiId, uiPwd:uiPwd, uiRPwd:uiRPwd, uiName:uiName, uiBir:uiBir, uiTran:uiTran, uiEmail:uiEmail, uiAddress:uiAddress, uiDAddress:uiDAddress, uiPhone:uiPhone, uiDesc:uiDesc};
	params = JSON.stringify(params);
	
	var conf = {
				url : '/userinfo/',
				method : 'POST',
				param : params,
				success : function(res) {
					if(res=='1') {
						alert('저장완료');
						
					}
				}
	}
	var au = new AjaxUtil(conf);
	au.send();
	
}

function updateUserInfo(uiNum) {
	var uiId = document.querySelector("#uiId" + uiNum).value;
	var uiPwd = document.querySelector("#uiPwd" + uiNum).value;
	var uiRPwd = document.querySelector("#uiRPwd" + uiNum).value;
	var uiName = document.querySelector("#uiName" + uiNum).value;
	var uiBir = document.querySelector("#uiBir" + uiNum).value;
	var uiTran = document.querySelector("#uiTran" + uiNum).value;
	var uiEmail = document.querySelector("#uiEmail" + uiNum).value;
	var uiAddress = document.querySelector("#uiAddress" + uiNum).value;
	var uiDAddress = document.querySelector("#uiDAddress" + uiNum).value;
	var uiPhone = document.querySelector("#uiPhone" + uiNum).value;
	var uiDesc = document.querySelector("#uiDesc" + uiNum).value;
	var params = {uiId:uiId, uiPwd:uiPwd, uiRPwd:uiRPwd, uiName:uiName, uiBir:uiBir, uiTran:uiTran, uiEmail:uiEmail, uiAddress:uiAddress, uiDAddress:uiDAddress, uiPhone:uiPhone, uiDesc:uiDesc};
	params = JSON.stringify(params);
	
	var conf = {
			url : '/userinfo/' + uiNum,
			method : 'PUT',
			param : params,
			success : function(res) {
				alert(res);
			
			}
}
	var au = new AjaxUtil(conf);
	au.send();
	}

	function deleteUserInfo(uiNum) {
	var conf = {
			url : '/userinfo/' + uiNum,
			method : 'DELETE',
			success : function(res) {
				if(res=='1') {
					alert('삭제완료');
					location.href='/url/userinfo:list';
				}
			}
	}
	var au = new AjaxUtil(conf);
	au.send();
}


</script>
</body>
</html>	
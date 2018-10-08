
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
		var url = con.url;
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
		if(method!="GET") {
			xhr.setRequestHeader('Content-type','application/json;charset=utf-8');
		}
		this.send = function() {
			xhr.send(param);
		}
	}
	
	window.addEventListener('load',function() {
		var conf = {
				url : '/userInfo',
				success : function(res) {
					res = JSON.parse(res);
					var html = '';
					for(var ui of res) {
						html += '<tr>';
						?
						?
						html += '</tr>';
					}
					document.querySelector('#uiBody'.insertAdjacentHTML('beforeend',html);
					
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
			<th>uiNum</th>
			<th>uiId</th>
			<th>uiPwd</th>
			<th>uiRPwd</th>
			<th>uiName</th>
			<th>uiBir</th>
			<th>uiTran</th>
			<th>uiEmail</th>
			<th>uiAddress</th>
			<th>uiDAddress</th>
			<th>uiPhone</th>
			<th>uiDesc</th>
			<th>수정/삭제</th>
		</tr>
		</thead>
		<tbody id="uiBody">
		</tbody>
</table>
<button onclick="addUserInfo()">추가</button>
<script>
function addUserInfo() {
	
	var html = '<tr>';
		html += '<td><input type="text" id="uiId" value=""></td>';	
		html += '<td><input type="text" id="uiPwd" value=""></td>';
		html += '<td><input type="text" id="uiRPwd" value=""></td>';
		html += '<td><input type="text" id="uiName" value=""></td>';
		html += '<td><input type="text" id="uiBir" value=""></td>';
		html += '<td><input type="text" id="uiTran" value=""></td>';
		html += '<td><input type="text" id="uiEmail" value=""></td>';
		html += '<td><input type="text" id="uiAddress" value=""></td>';
		html += '<td><input type="text" id="uiDAddress" value=""></td>';
		html += '<td><input type="text" id="uiPhone" value=""></td>';
		html += '<td><input type="text" id="uiDesc" value=""></td>';
		html += '<td><button onclick="saveUserInfo()">저장</button></td>';
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
				url : '/userInfo/',
				method : 'POST',
				param : params,
				success : function(res) {
					if(res=='1') {
						alert('저장완료');
						initList();
					}
				}
	}
	var au = new AjaxUtil(conf);
	au.send();
	
}

function updateUserInfo(uiNum) {
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
			url : '/userInfo/' + uiNum,
			method : 'PUT',
			param : params,
			success : function(res) {
				alert(res);
			
			}
}
	var au = new AjaxUtil(conf);
	au.send();
	}

	function deletUserInfo(uiNum) {
	var conf = {
			url : '/userInfo/' + uiNum,
			method : 'DELETE',
			success : function(res) {
				if(res=='1') {
					alert('삭제완료');
					location.href='/url/userInfo:list';
				}
			}
	}
	var au = new AjaxUtil(conf);
	au.send();
}


</script>
</body>
</html>	
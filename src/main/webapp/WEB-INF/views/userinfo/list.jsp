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
	
	window.addEventListener('load',function() {
		var conf = {
				url : '/userinfo',
				success : function(res) {
					res = JSON.parse(res);
					var html = '';
					for(var ui of res) {
						html += '<tr>';
						html += '<td><a href="/userinfo/'+ui.uiNum+'">'+ ui.uiNum +'</td>';
						html += '<td>' + ui.uiId +'</td>';
						html += '<td>' + ui.uiPwd + '</td>';
						html += '<td>' + ui.uiRPwd + '</td>';
						html += '<td>' + ui.uiName + '</td>';
						html += '<td>' + ui.uiBir + '</td>';
						html += '<td>' + ui.uiTran + '</td>';
						html += '<td>' + ui.uiEmail + '</td>';
						html += '<td>' + ui.uiAddress + '</td>';
						html += '<td>' + ui.uiDAddress + '</td>';
						html += '<td>' + ui.uiPhone + '</td>';
						html += '<td>' + ui.uiDesc + '</td>';
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
  thead tr {
    background-color: #0d47a1;
    color: #ffffff;
  }
  tbody tr:nth-child(2n) {
    background-color: #bbdefb;
  }
  tbody tr:nth-child(2n+1) {
    background-color: #e3f2fd;
  }
</style>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/menu/left.jsp" />
		<div id="page-content-wrapper">
			<div>
				<a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">M E N U</a>
			</div>
		
	<div class="3w-container">
		
			<table class="table table-striped table-hover">
			
				
					<tr>
						<th colspan="13"><h1>리스트</h1></th>
					</tr>
					<tr>
						<td>번호</td>
						<td>아이디</td>
						<td>비밀번호</td>
						<td>비밀번호재확인</td>
						<td>이름</td>
						<td>생년월일</td>
						<td>성별</td>
						<td>이메일</td>
						<td>주소</td>
						<td>상세주소</td>
						<td>연락처</td>
						<td>기타사항</td>
					</tr>
				
				<tbody id="uiBody">
				</tbody>

			</table>
		
	</div>
</div>
</div>


</body>
</html>
<jsp:include page="/WEB-INF/views/menu/bottom.jsp" />
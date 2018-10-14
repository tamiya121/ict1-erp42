<%@page import="com.ict.erp.vo.UserInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<body>
	<div id="wrapper">
		<jsp:include page="/WEB-INF/views/menu/left.jsp" />
		<div id="page-content-wrapper">
			<div>
				<a href="#menu-toggle" class="btn btn-secondary" id="menu-toggle">Toggle Menu</a>
			</div>
		</div>
	</div>
</body>
<jsp:include page="/WEB-INF/views/menu/bottom.jsp" />
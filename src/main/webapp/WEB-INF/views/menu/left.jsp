<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String rPath = request.getContextPath();
%>
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand active" >
                    
                </li>
                <li>
                    <a href="<%=rPath%>/url/userinfo:login"><h1>회원가입</h1></a>
                </li>
                <br>
                <li>
                    <a href="<%=rPath%>/url/userinfo:list"><h1>리스트</h1></a>
                </li>
                
                
                
            </ul>
        </div>
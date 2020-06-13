<%@page import="lfq.test.jsp.JspUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <jsp:useBean id="chk" scope="page" class="lfq.test.jsp.JspUserDao" />
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

.content{
	height: 400px;-
	width: 800px;
	
}

</style>
<meta charset="UTF-8">
<title>用户登录</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>

<%@include file="index_101_head.inc" %>
<div class="content">



<%
//内置对象session基本用法之二，获取会话变量：
session.invalidate();
response.sendRedirect("login_301.jsp");

%>
	
	
</div>
<%@include file="index_101_footer.txt" %>
</body>
</html>
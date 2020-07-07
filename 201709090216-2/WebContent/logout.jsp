<%@page import="lfq.test.jsp.JspUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <jsp:useBean id="chk" scope="page" class="lfq.test.jsp.JspUserDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户登录</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>

<div class="right">



<%
//内置对象session基本用法之二，获取会话变量：
session.invalidate();
response.sendRedirect("login.jsp");

%>
	
	
</div>
</body>
</html>
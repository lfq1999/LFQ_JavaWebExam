<%@page import="lfq.test.jsp.JspUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <jsp:useBean id="chk" scope="page" class="lfq.test.jsp.JspUserDao" />
<!DOCTYPE html>
<html>
<head>
</style>
<meta charset="UTF-8">
<title>用户登录</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>

<div class="content">



<%
//内置对象session基本用法之二，获取会话变量：
String username =(String)session.getAttribute("username");
//检查用户是否登录,并为管理员，
if(username==null){
//内置对象response基本用法之一，重定向：
request.setAttribute("ts","请登录！");
request.getRequestDispatcher("login.jsp").forward(request, response);
}
%>



	<h1>登录成功</h1>
	<p>欢迎您：<%=session.getAttribute("username") %></p>
	
	
	<a href="logout.jsp">注销</a>
	
</div>
</body>
</html>
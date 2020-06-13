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
		JspUser jspuser = new JspUser();
		jspuser.setUsername(request.getParameter("name"));
		jspuser.setPassword(request.getParameter("password"));
		
		if(jspuser.getUsername()==""){
			request.setAttribute("ts","用户名为空!");
			request.getRequestDispatcher("login_301.jsp").forward(request, response);
		}else{
			if(chk.check(jspuser)){
				session.setAttribute("username", jspuser.getUsername());
				request.getRequestDispatcher("main_301.jsp").forward(request, response);
			}else{
				request.setAttribute("ts","用户名与密码错误!");
				request.getRequestDispatcher("login_301.jsp").forward(request, response);
			}
		}
	%>
	
	
	<div class="show"></div>
	
</div>
<%@include file="index_101_footer.txt" %>
</body>
</html>
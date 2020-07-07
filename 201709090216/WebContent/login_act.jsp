<%@page import="lfq.test.jsp.JspUser"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <jsp:useBean id="chk" scope="page" class="lfq.test.jsp.JspUserDao" />
     
     <jsp:useBean id="user" scope="page" class="lfq.test.jsp.JspUser" />
     <jsp:setProperty name="user" property="*" />
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
	System.out.println(user.getClass().getName());
%>

<div class="content">
	<%
		JspUser jspuser = new JspUser();
		jspuser.setUsername(request.getParameter("name"));
		jspuser.setPassword(request.getParameter("password"));
		
		if(jspuser.getUsername()==""){
			request.setAttribute("ts","用户名为空!");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}else{
			if(chk.check(jspuser)){
				session.setAttribute("username", jspuser.getUsername());
				request.getRequestDispatcher("main.jsp").forward(request, response);
			}else{
				request.setAttribute("ts","用户名与密码错误!");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
	%>
	
	
	<div class="show"></div>
	
</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生信息查询</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>

<div class="right">
	
	<h1>用户提交的信息：</h1>
	<p>姓名：<%=request.getAttribute("name") %></p>
	<p>班级：<%=request.getAttribute("mclass") %></p>
</div>
</body>
</html>
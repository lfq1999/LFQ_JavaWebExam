<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>学生信息查询</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>

<%@include file="index_101_head.inc" %>
<div class="content">
	
	<h1>用户提交的信息：</h1>
	<p>姓名：<%=request.getAttribute("name") %></p>
	<p>班级：<%=request.getAttribute("mclass") %></p>
</div>
<%@include file="index_101_footer.txt" %>
</body>
</html>
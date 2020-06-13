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
	<h1 style="text-align: center">请输入学生信息</h1>
	<form action="studentServlet" method="post">
	<table align="center">
	<tr><td>姓名：</td><td><input type="text" name="name"/></td></tr>
	<tr><td>班级：</td><td><input type="text" name="mclass"/></td></tr>
	<tr><td><input type="submit" value="提交"/></td><td align="center"><input type="reset" value="重置"/></td></tr>
	</table>
	</form>
	
	
</div>
<%@include file="index_101_footer.txt" %>
</body>
</html>
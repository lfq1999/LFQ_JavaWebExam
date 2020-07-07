<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h1 style="text-align: center">用户登录</h1>
		<form action="login_act.jsp" method="post">
			<table align="center">
				<tr>
					<td>用户名：</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td><input type="submit" value="提交" /></td>
					<td align="center"><input type="reset" value="重置" /></td>
				</tr>
			</table>
		</form>

		<div class="show" style="text-align: center">
			<p style="color: red;">
				<%
				String ts = (String)request.getAttribute("ts");

					if(ts==null){
						ts="";
					}

				%>
				<%=ts %>
			</p>
		</div>

	</div>
</body>
</html>
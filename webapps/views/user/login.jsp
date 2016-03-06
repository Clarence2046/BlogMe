<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>登录页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="jsFiles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- <link href="jsFiles/bootstrap/css/bootstrap-theme.css" rel="stylesheet"> -->

<script type="text/javascript" src="jsFiles/jquery/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="jsFiles/bootstrap/js/bootstrap.js"></script>
</head>

<body >

	<div style="width: 100%;height: 100%;z-index: -1;position: absolute;">
		<img alt=""  class="img-responsive" height="80%" src="images/back44.jpg">
	</div>
	<div style="height: 25%"></div>
	<div  style="margin-left: 20%;">
	<form action="visitme/doLogin" method="post">
		<table   class="table" style="width: 25%;">
			<tr>
				<td align="center" colspan="2">用户登录<br />
				<font size="1" color="red">${error }</font></td>
			</tr>

			<tr>
				<td>账号</td>
				<td><input type="text" name="loginUser.loginName"  class="form-control"
					value="${registerUser.loginName }" placeholder="登录名/邮箱" /></td>
			</tr>
			<tr>
				<td>密码</td>
				<td><input type="password" name="loginUser.password" class="form-control" value=""></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"  class="btn btn-primary" value="登录">
				<input type="button"  class="btn btn-primary" value="注册">
				</td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>

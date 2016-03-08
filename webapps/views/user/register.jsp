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

<title>用户注册</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="jsFiles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="jsFiles/validationEngine/css/validationEngine.jquery.css"
	rel="stylesheet">
<!-- <link href="jsFiles/bootstrap/css/bootstrap-theme.css" rel="stylesheet"> -->

<script type="text/javascript" src="jsFiles/jquery/jquery-1.11.3.js"></script>
<script type="text/javascript" src="jsFiles/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript"
	src="jsFiles/validationEngine/js/jquery.validationEngine-zh_CN.js"></script>
<script type="text/javascript"
	src="jsFiles/validationEngine/js/jquery.validationEngine.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#frm").validationEngine();

	})
</script>

</head>
<style>
<!--
tr td {
	text-align: right;
}
-->
</style>
<body style="background-color: #d3eae7">


<div  style="height:80%; margin: 5% auto;width: 60%">
	 <div style="height: 25%"></div>
	<form action="visitme/doRegister" method="post" id="frm">
		<table  class="table table-responsive" style="width: 300px;margin-left: 20%;">
			<tr>
				<td><label style="color: red">*</label>用户名</td>
				<td><input type="text" name="registerUser.username"  class="form-control validate[required,minSize[4],custom[onlyLetterSp],ajax[checkUsernameAjax]]"/></td>
			</tr>
			<tr>
				<td><label style="color: red">*</label>登录名</td>
				<td><input type="text" name="registerUser.loginName"  class="form-control validate[required,minSize[4],custom[onlyLetterNumber],ajax[checkUsernameAjax]]"/></td>
			</tr>
			<tr>
				<td><label style="color: red">*</label>密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
				<td><input type="password" name="registerUser.password" class="form-control validate[required]" id="password"> </td>
			</tr>
			<tr>
				<td><label style="color: red">*</label>确认密码</td>
				<td><input type="password" name="confirmpassword" class="form-control validate[required,equals[password]]"
					id="confirmpassword"></td>
			</tr>
			<tr>
				<td>邮&nbsp;&nbsp;&nbsp;&nbsp;箱</td>
				<td><input type="text" name="registerUser.email" class="form-control validate[custom[email]]"></td>
			</tr>
			<tr>
				<td>手机号</td>
				<td><input type="text" name="registerUser.phone" class="form-control validate[custom[mobile]]"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" class="btn btn-lg btn-info btn-block"   value="立即注册"></td>
			</tr>
		</table>
	</form>
	</div>
	<br>
</body>
</html>

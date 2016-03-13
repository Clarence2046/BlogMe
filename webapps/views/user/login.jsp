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
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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

		$("#imgyzm").bind("click", function() {
			$("#imgyzm").attr("src", "index/yzm?" + Math.random());

		});
	})
</script>

</head>

<!-- <body style="background-color: #d3eae7"> -->
<body >
	<div style="background-image: url('images/back51.jpg');height: 100%;width: 100%;margin-top: 0;display: inline-block;">
	<!-- 	<div  style="height:80%; margin: 5% auto;background-image: url('images/back44.jpg');width: 60%"> -->
	<div style="height: 70%; margin-left:45%;margin-top:5%;  width: 50%;background-image: url('images/logback.jpg') no-repeat;">
 		<div style="display: inline-block;width: 20%;height: 100%;"></div>
		<div style="display: inline-block;">
			<form action="visitme/doLogin" method="post" id="frm">
				<table class="table table-responsive"
					style="width: 300px; margin-left: 10%;">
					<tr>
						<td align="center" colspan="2">
						<span style="text-shadow:2px 2px 4px #000000;color: white;font-size: 22">用户登录</span><br />
						 <font size="1" color="red">${error }</font></td>
					</tr>

					<tr>
						<td align="right">账&nbsp;&nbsp;&nbsp;&nbsp;号</td>
						<td><input type="text" name="loginUser.loginName"
							class="form-control validate[required]"
							value="${registerUser.loginName }" placeholder="登录名/邮箱" /></td>
					</tr>
					<tr>
						<td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码</td>
						<td><input type="password" name="loginUser.password"
							class="form-control validate[required]" value=""></td>
					</tr>
					<tr>
						<td width="50px" align="right">验证码</td>
						<td><input type="text" name="yzm" id="yzm"
							class="form-control validate[required]"
							style="width: 50%; display: inline-block;" value=""> <img
							alt="" src="index/yzm" id="imgyzm"></td>
					</tr>
					<tr>
						<td colspan="2" align="center">
							<input type="submit" class="btn" value="登录"  style="background-image: url('images/logback.jpg')" > 
							
							<input type="button" class="btn" value="注册" onclick="regist()" style="background-image: url('images/logback.jpg')">
							<script type="text/javascript">
							function regist(){
								window.location.href="http://localhost/Galaxy/register";
							}
							
							</script>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	</div>
</body>
</html>

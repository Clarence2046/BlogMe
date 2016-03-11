<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

<title>主页</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!-- <link href="jsFiles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="jsFiles/bootstrap/css/navbar-fixed-top.css" rel="stylesheet">

<script type="text/javascript" src="jsFiles/jquery/jquery-1.11.3.js"></script>
<script type="text/javascript" src="jsFiles/bootstrap/js/bootstrap.js"></script> -->

</head>
<style>
<!--
.back { /*  background-image: url('images/background.jpg');*/
	/* background-color: #d3eae7; */
}
-->
</style>
<body>
	<nav class="navbar navbar-inverse   navbar-fixed-top ">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">Galaxy</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<c:forEach items="${auths }" var="auth">
					<li><a href="${auth.value }">${auth.key }</a></li>
				</c:forEach>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="../navbar/">Default</a></li>
				
				<li class="dropdown">
	              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><label class="glyphicon glyphicon-list" style="cursor: pointer;"></label> <span class="caret"></span></a>
	              <ul class="dropdown-menu" >
	                <li style="margin-left: 30px"><a href="home/userspace"><label class="glyphicon glyphicon-user" style="cursor: pointer;"></label>个人信息</a></li>
					<li style="margin-left: 30px"><a href="logout" ><label class="glyphicon glyphicon-log-out" style="cursor: pointer;"></label>退出</a></li>
					
	               <!--  <li role="separator" class="divider"></li>
	                <li class="dropdown-header">Nav header</li> -->
	              </ul>
	            </li>
				
				
			</ul>
		</div>
		<!--/.nav-collapse -->
	</div>
	</nav>
</body>
</html>

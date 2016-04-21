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

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="jsFiles/galaxy/css/taylor-1.0.css" rel="stylesheet">
<script type="text/javascript" src="jsFiles/jquery/jquery-2.2.0.min.js"></script>

<style type="text/css">
.test {
	width: 0;
	height: 0;
	border-top: 6px solid transparent;
	border-right: 8px solid white;
	border-bottom: 6px solid transparent;
	float: right;
	margin-top: 0px;
	position: static;
}

</style>


</head>
<div class="content_bottom">
		<div class="left" style="width: 100%; border-right: thin dashed #aaa;padding-right: 15px">
			<!-- <div align="left" class="title">所有文章</div> -->
			<div id="new_article" style="width: 100%">
				 ${aboutme.blogContent }
			</div>
			
			
		
		</div>
		<%-- 清除浮动  是外部div根据内部内容自动变大 --%>
		<div style="clear: both; height: 1px; width: 100%; overflow: hidden; margin-top: -1px;"></div>
	</div>
<body>

</body>
</html>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<link href="jsFiles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="jsFiles/bootstrap/css/bootstrap-theme.css" rel="stylesheet">
<link href="jsFiles/bootstrap/css/navbar-fixed-top.css" rel="stylesheet">

<script type="text/javascript" src="jsFiles/jquery/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="jsFiles/bootstrap/js/bootstrap.js"></script>

<link rel="stylesheet"
	href="jsFiles/kindeditor-4.1.10/themes/default/default.css" />
<script charset="utf-8"
	src="jsFiles/kindeditor-4.1.10/kindeditor-min.js"></script>
<script charset="utf-8" src="jsFiles/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
			resizeType : 1,
			allowPreviewEmoticons : false,
			uploadJson:'views/blog/upload/upload_json.jsp',
			fileManagerJson:'views/blog/upload/file_manager_json.jsp',
			allowImageUpload : true,
			allowFileManager:true
		});
	});
	
	$(document).ready(function(){
		$("#listBlogContents img").attr("width","150px");
		$("#listBlogContents img").attr("height","150px");
		
		
	});
	
</script>

</head>

<!-- <body style="background-image: url('images/background.jpg');"> -->
<body style="background-color: #d3eae7;">

	<jsp:include page="../blogme/header.jsp"></jsp:include>
	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="col placeholders">
			<div class="col-xs-12 col-sm-3 placeholder">
				
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">最新文章</h3>
					</div>
					<div class="panel-body">
						<ul class="list-group" style="list-style-type: none;">
							<c:forEach  items="${blogs }"  var="blog" end="4">
								<li><a href="blog/blogDetail?blogId=${blog.blogId }"> ${blog.blogTitle }</a></li>
							</c:forEach>
							<!-- <li><a href="javascript:void(0)"> WdatePicker</a></li>
							<li><a href="javascript:void(0)"> KEditor</a></li>
							<li><a href="javascript:void(0)"> ... </a></li> -->
						</ul>
					</div>
				</div>
				<div class="panel panel-default">
					<!-- <div class="panel-heading">
					<h3 class="panel-title">面板标题</h3>
				</div> -->
					<div class="panel-body">这是一个基本的面板</div>
				</div>
				<div class="panel ">
					<!-- <div class="panel-heading">
					<h3 class="panel-title">面板标题</h3>
				</div> -->
					<div class="panel-body">这是一个基本的面板</div>
				</div>
			</div>

			<div class="col-xs-12 col-sm-8 placeholder">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">列表展示</h3>
					</div>
					<div class="panel-body">
						<c:forEach items="${blogs }" var="blog">
							<span >
							 <label style="width: 95%">题目：<a href="blog/blogDetail?blogId=${blog.blogId }">${blog.blogTitle }</a>
							 	 
							 	<%-- 
							 	<a href="blog/deleteBlog?blogId=${blog.blogId }"> <span class="glyphicon glyphicon-trash" style="float: right;"></span>
							 	</a> 
							 	--%>
							 	 <br/>
							 
								作者：<a href="javascript:void(0)">${blog.user.username }</a>
								时间：<fmt:formatDate value="${blog.publishTime }" type="date" pattern="yyyy-MM-dd HH:mm:ss" />
							 </label><br/>内容：
							 	<%-- ${fn:substring(blog.blogContent,0,255) } --%>
							</span>
							<span id="listBlogContents">
							 	<%-- ${blog.blogContent } --%>
							 	<%-- ${blog.contentWithNoHtml } --%>
							 	<a href="blog/blogDetail?blogId=${blog.blogId }">
							 	<c:choose>
							 		<c:when test="${ empty blog.contentWithNoHtml }">
							 		${blog.blogContent }
							 		</c:when>
							 		<c:otherwise>
									 	${fn:substring(blog.contentWithNoHtml,0,255) }...
							 		</c:otherwise>
							 	</c:choose>
							 	</a>
							</span>
							<hr/>
						</c:forEach>


					</div>
				</div>
			
			</div>

		</div>
	</div>
</body>
</html>

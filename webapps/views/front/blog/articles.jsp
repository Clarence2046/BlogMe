<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<link href="jsFiles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="jsFiles/bootstrap/css/bootstrap-theme.css" rel="stylesheet">
<link href="jsFiles/bootstrap/css/navbar-fixed-top.css" rel="stylesheet">
<link href="jsFiles/validationEngine/css/validationEngine.jquery.css"
	rel="stylesheet">


<script type="text/javascript" src="jsFiles/jquery/jquery-1.11.3.js"></script>
<script type="text/javascript" src="jsFiles/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript"
	src="jsFiles/validationEngine/js/jquery.validationEngine-zh_CN.js"></script>
<script type="text/javascript"
	src="jsFiles/validationEngine/js/jquery.validationEngine.js"></script>


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
			uploadJson : 'views/front/blog/upload/upload_json.jsp',
			fileManagerJson : 'views/front/blog/upload/file_manager_json.jsp',
			allowImageUpload : true,
			allowFileManager : true
		});
	});

	$(document).ready(function() {
		$("#frm").validationEngine();

		$("#listBlogContents img").attr("width", "150px");
		$("#listBlogContents img").attr("height", "150px");

	});
</script>

</head>

<!-- <body style="background-image: url('images/background.jpg');">-->
<body style="background-color: #d3eae7;">

	<jsp:include page="../home/navibar.jsp"></jsp:include>
	<div class="panel panel-default" style="width: 60%;margin: 0 auto;">
		<!-- <div class="panel-heading">
						<h3 class="panel-title">列表展示</h3>
					</div> -->
		<div class="panel-body" style="min-height: 300px">
			<c:if test="${empty allArts }">
					<span style="margin-left: 35%;">你的文档库为空, 快去发布文章吧!<a href="new_art">Go.....</a>
					</span>
			</c:if>
		
		
			<c:forEach items="${allArts }" var="blog">
				<span> <label style="width: 100%"><a
						href="blog/blogDetail?blogId=${blog.blogId }">${blog.blogTitle
							}</a> <a href="art_del?blogId=${blog.blogId }"> <span
							class="glyphicon glyphicon-trash" style="float: right;"></span>
					</a> <br /> </label><br />
				</span>
				<span id="listBlogContents"><c:choose>
						<c:when test="${ empty blog.contentWithNoHtml }">
							 		${blog.blogContent }
							 		</c:when>
						<c:otherwise>
									 	${fn:substring(blog.contentWithNoHtml,0,255) }...
							 		</c:otherwise>
					</c:choose> </span>
				<br />
				<br />

				<span style="width: 1100px"> &nbsp; <span
					style="float: right;"> <fmt:formatDate
							value="${blog.publishTime }" type="date"
							pattern="yyyy-MM-dd HH:mm:ss" /> &nbsp;&nbsp;&nbsp;&nbsp; <a
						href="javascript:void(0)"><label
							class="glyphicon glyphicon-zoom-in"></label>阅读(${blog.views })</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:void(0)"><label
							class="glyphicon glyphicon-pencil"></label>评论(${fn:length(blog.comments)})</a>
				</span>
				</span>
				<hr />
			</c:forEach>


		</div>
	</div>
</body>
</html>

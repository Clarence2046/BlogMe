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
			allowImageUpload : false,
			items : [ 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor',
					'bold', 'italic', 'underline', 'removeformat', '|',
					'justifyleft', 'justifycenter', 'justifyright',
					'insertorderedlist', 'insertunorderedlist', '|',
					'emoticons', 'image', 'link' ]
		});
	});
</script>

</head>

<body>
	<jsp:include page="../blogme/header.jsp"></jsp:include>

	<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
		<div class="col placeholders">
			<div class="col-xs-12 col-sm-3 placeholder">
				<div class="panel ">
					<div class="panel-body">
						<div class="thumbnail" style="width: 65%">
							<img src="images/lanyangyang.jpg" alt="通用的占位符缩略图">
						</div>

						<div class="caption">
							<h4>用户名</h4>
							<p>像风一样无声无息。</p>
							<p>积分:120 等级:3</p>
						</div>

					</div>
				</div>
				<div class="panel ">
					<div class="panel-heading">
						<h3 class="panel-title">最新文章</h3>
					</div>
					<div class="panel-body">
						<ul class="list-group" style="list-style-type: none;">
							<li><a href="javascript:void(0)"> WdatePicker</a></li>
							<li><a href="javascript:void(0)"> KEditor</a></li>
							<li><a href="javascript:void(0)"> ... </a></li>
						</ul>
					</div>
				</div>
				<div class="panel ">
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
				<div class="panel">
					<div class="panel-heading">
						<h3 class="panel-title">列表展示</h3>
					</div>
					<div class="panel-body"></div>
				</div>
				<div class="panel">
					<div class="panel-heading">
						<h3 class="panel-title">发布信息</h3>
					</div>
					<div class="panel-body">
					
						<form action="blog/publishBlog" method="post">
							<table class="table">
							<tr>
								<td><label  class="text-primary">主题</label> <input type="text" name="blog.blogTitle"></td>
							</tr>
							<tr>
								<td>
									<textarea name="content" style="width:98%;height:200px;visibility:hidden;">KindEditor</textarea>
								</td>
							</tr>
							<tr>
								<td align="center">
									<input type="submit" class="btn btn-primary"  value="发布"/>
								</td>
							</tr>
							</table>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>

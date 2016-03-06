<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
			uploadJson : 'views/blog/upload/upload_json.jsp',
			fileManagerJson : 'views/blog/upload/file_manager_json.jsp',
			allowImageUpload : true,
			allowFileManager : true
		});
	});
	
	
	$(document).ready(function(){
		var width = parseInt($("#blogDetail img").css("width"));
		
		if(width>500){
			$("#blogDetail img").attr("width","90%");
		}
		
		
		
	});
</script>

</head>

<body style="background-image: url('images/background.jpg');">
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
							<h4>${theBlog.user.username }</h4>
							<p>像风一样无声无息。</p>
							<p>积分:120 等级:3</p>
						</div>

					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">最新文章</h3>
					</div>
					<div class="panel-body">
						<ul class="list-group" style="list-style-type: none;">
							<c:forEach items="${blogs }" var="blog" end="4">
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
				<div class="panel panel-default">
					<!-- <div class="panel-heading">
					<h3 class="panel-title">面板标题</h3>
				</div> -->
					<div class="panel-body">这是一个基本的面板</div>
				</div>
			</div>

			<div class="col-xs-12 col-sm-8 placeholder">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">${theBlog.blogTitle }</h3>
					</div>
					<div class="panel-body">
						<span> <label>
								作者：<a href="javascript:void(0)">${theBlog.user.username }</a> 时间：<fmt:formatDate
									value="${theBlog.publishTime }" type="date"
									pattern="yyyy-MM-dd HH:mm:ss" />
								查看：${theBlog.views+1 }次
						</label><br /> 
						<span id="blogDetail">
						${theBlog.blogContent }
						</span>
						</span>
						<hr />


					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">评论</h3>
					</div>
					<div class="panel-body">
						<span id="commentArea">
						
							<c:forEach items="${theBlog.comments }" var="comment">
							<span><a href="javascript:void(0)">${comment.user.username }</a>
							 <fmt:formatDate value="${comment.commentTime }"  type="date" pattern="yyyy-MM-dd HH:mm:ss"/> 
							 <br/>
							 ${comment.commentContent }
							</span><hr/>
							</c:forEach>
						</span>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">发表评论</h3>
					</div>
					<div class="panel-body">

						<form action="blog/commentBlog" method="post">
							<input type="hidden"  name="comment.blogId" value="${theBlog.blogId }"/>
							<table class="table">
								<tr>
									<td><textarea name="content"
											style="width: 98%; height: 200px; visibility: hidden;">KindEditor</textarea>
									</td>
								</tr>
								<tr>
									<td align="center"><input type="button"  onclick="ajaxCommentBlog()"
										class="btn btn-primary" value="评论" /></td>
								</tr>
								
							</table>
							<script type="text/javascript">
							<!--
								function ajaxCommentBlog(){
								
								//alert(editor.html());
								$.ajax({
									url:'blog/commentBlog',
									type:'POST',
									data:{'blogId':${theBlog.blogId},'content':editor.html()},
									dataType:"json",
									success:  function(data){
										
										var appentComment = '<span><a href="javascript:void(0)">'+${loginUser.username}+'</a>'
											+' <fmt:formatDate value="<\%=new Date() %>"  type="date" pattern="yyyy-MM-dd HH:mm:ss"/> '
										 +'<br/>'+editor.html()+'</span><hr/>';
										
										
										$("#commentArea").append(appentComment);
										
									},
									error:function(){
										alert("error");
									}
								}); 
							
							
							}
							//-->
							</script>
						</form>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>

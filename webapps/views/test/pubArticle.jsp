<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<!-- <link href="jsFiles/bootstrap/css/navbar-fixed-top.css" rel="stylesheet"> -->

<script type="text/javascript" src="jsFiles/jquery/jquery-1.11.3.js"></script>
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
			uploadJson : 'views/front/blog/upload/upload_json.jsp',
			fileManagerJson : 'views/front/blog/upload/file_manager_json.jsp',
			allowImageUpload : true,
			allowFileManager : true,
			afterChange : function() {
				K('.word_count1').html(this.count());
				K('.word_count2').html(this.count('text'));
				K('.word_count3').html((200-this.count('text'))>0?(200-this.count('text')):0);
			}
		});
	});

	$(document).ready(function() {
		$("#listBlogContents img").attr("width", "150px");
		$("#listBlogContents img").attr("height", "150px");

	});
</script>

</head>

<!-- <body style="background-image: url('images/background.jpg');"> -->
<body style="background-color: #d3eae7;">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">发布新文章</h3>
		</div>
		<div class="panel-body">
			<form action="pub_art" method="post" id="frm">
				<input type="hidden" name="personalBlog" value="true">
				<table class="table">
					<tr>
						<td><label class="text-primary">主题</label> <input type="text"
							name="blog.blogTitle" class="validate[required]" id="subject"></td>
					</tr>
					<tr>
						<td><label class="text-primary">分类</label> 
							<input type="hidden" name="parentTypeId" >
							<c:forEach  items="${parents }" var="parent">
								<a class="btn" onclick="chooseParent(${parent.typeId})" id="${parent.typeId}">${parent.description }</a>
							</c:forEach>
						</td>
					</tr>
					<script type="text/javascript">
					<!--
						function chooseParent(parentid){
							var acts = $(".active");
							//console.log(acts.length);
							if(acts.length>0){
								for ( var i = 0; i < acts.length; i++) {
									var act = acts[i];
									//console.log(act.id);
									
									if(act.id!=parentid){
										$(act).removeClass("active");
										$(act).css("background-color","white");
										$("input[name=parentTypeId]").val();
									}
								}
							}
							
							if($("#"+parentid+"").hasClass("active")){
								$("#"+parentid+"").removeClass("active");
								$("#"+parentid+"").css("background-color","white");
								$("input[name=parentTypeId]").val();
								//显示所有标签
								$.ajax({
									url:"all_art",
									type:"post",
									success:function(data){
										//console.log(data.children);
										$("#children").text("");
										var children = data.children;
										for ( var i = 0; i < children.length; i++) {
											var child = children[i];
											$("#children").append("<a class='btn' id='"+child.typeId+"' onclick='chooseChild("+child.typeId+")'>"+child.description+"</a>");
											//$("#"+child.typeId+"").bind("click",chooseChild(child.typeId));
										}
									}
								});
								
							}else{
								$("#"+parentid+"").addClass("active");
								$("#"+parentid+"").css("background-color","#9fc5e8");
								$("input[name=parentTypeId]").val(parentid);
								//显示对应标签
								$.ajax({
									url:"spe_art?pid="+parentid,
									type:"post",
									success:function(data){
										//console.log(data.children);
										$("#children").text("");
										var children = data.children;
										for ( var i = 0; i < children.length; i++) {
											var child = children[i];
											$("#children").append("<a class='btn' id='"+child.typeId+"' onclick='chooseChild("+child.typeId+")'>"+child.description+"</a>");
											/* $("#"+child.typeId+"").bind("click",function chooseChl(){
												chooseChild(child.typeId);
											}); */
										}
									}
								});
							}
						
						}
					
						function chooseChild(childid){
							var acts = $("#children .active");
							//console.log("__"+childid);
							if(acts.length>0){
								for ( var i = 0; i < acts.length; i++) {
									var act = acts[i];
									//console.log("__child "+act.id);
									
									if(act.id!=childid){
										$(act).removeClass("active");
										$(act).css("background-color","white");
										$("input[name=childid]").val();
									}
								}
							}
							
							if($("#"+childid+"").hasClass("active")){
								$("#"+childid+"").removeClass("active");
								$("#"+childid+"").css("background-color","white");
								$("input[name=childid]").val();
							}else{
								$("#"+childid+"").addClass("active");
								$("#"+childid+"").css("background-color","#9fc5e8");
								$("input[name=childid]").val(childid);
							}
						}
					//-->
					</script>
					<tr>
						<td><label class="text-primary">标签</label> 
							<input type="hidden" name="childid">
							<span id="children">
							<c:forEach  items="${children }" var="child">
								<a class="btn">${child.description }</a>
							</c:forEach>
							</span>
							<input type="text" class="form-control" placeholder="添加新的标签" style="width: 200px;display: inline-block;" name="newDescription" onblur="checkExist()" >
						</td>
					</tr>
					<script type="text/javascript">
					<!--
							function checkExist(){
								var newd = $("input[name=newDescription]").val();
								if(newd==null || newd.trim()==""){
									return;
								}
								console.log(newd);
								$.ajax({
									url:"ajaxCheckClassify",
									data:{"newd":newd},
									type:"post",
									success:function(data){
										if(data.result){
											alert("分类标签已经存在");
											$("input[name=newDescription]").val("");
										}
										
									}
								});
								
							}
					//-->
					</script>
					<tr>
						<td><textarea name="content" style="width: 98%; height: 450px; visibility: hidden;"></textarea>
						<input type="hidden" name="blog.blogContent" id="blogc">
						<input type="hidden" name="blog.contentWithNoHtml" id="cwnh">
						<br>
						 <span style="font-size: 14px;box-shadow:2px 2px 2px navy;">您当前输入了 <span class="word_count2">0</span> 个字,至少还需要输入 <span class="word_count3">0</span> 个字.
						 </span>
						</td>
					</tr>
					<tr>
						<td align="center"><input type="button" onclick="publishArt()"
							class="btn btn-primary" value="发布" /></td>
					</tr>
					<script type="text/javascript">
					<!--
						function publishArt(){
							var subject = $("#subject").val();
							if(subject==null||""==subject.trim()){
								alert("请输入主题");
								return;
							}
						
							var count = editor.count("text");
							if(count<2){
								alert("请至少输入200个字");
								return;
							}else{
								$("#cwnh").val(editor.text().replace(" ",""));
								$("#blogc").val(editor.html());
								
								
								$("#frm").submit();
							}
						}
					//-->
					</script>
				</table>
			</form>
		</div>
	</div>
</body>
</html>

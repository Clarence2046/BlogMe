<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<script type="text/javascript">
function doGo(url){
	
	var u = encodeURI(url);
	window.location.href = u;
	
}

</script>

</head>


<body>
	<div class="content_bottom">
		<div class="left" style="width: 64%;border-right: thin dashed #aaa;padding-right: 15px">
			<div align="left" class="title">所有文章</div>
			<div id="new_article" style="width: 100%">
				<c:forEach items="${articles }" begin="0" end="5" varStatus="status" var="article">
					<div style="clear: both;height: 160px">
						<p style="font-size: medium;">
							<a href="javascript:void(0)" onclick="doGo('art_d?art=${article.blogId }&t=${highlight}')" >${article.blogTitle }</a> <br />
							<font size="2" color="#aaa">时间：${article.publishTime } 作者：${article.user.username } 分类：${article.classify.description }</font>
						</p>
						<div>
							<div style="float: left;">
								<img alt="" src="images/back4.jpg" width="150px" height="100px"
									style="">
							</div>
							<div style="margin-left: 160px;height: 75px;">
								<p><c:if test="${fn:length(article.contentWithNoHtml)>50 }">
									${fn:substring(article.contentWithNoHtml,0,50) }
									</c:if>
									<c:if test="${fn:length(article.contentWithNoHtml)<=50 }">
										${article.contentWithNoHtml }
									</c:if>...
								</p>
								
							</div>
							<div style="float: right;">
								<a class="btnr labelm" href="javascript:void(0)" onclick="doGo('art_d?art=${article.blogId }&t=${highlight}')" >阅读全文</a>
							</div>
						</div>
					</div>
					<div style="border-bottom-style: dashed;border-bottom-width: thin;margin-top: 20px;border-bottom-color: #aaa;"></div>
				</c:forEach>
			</div>
			<br />
		</div>
		<div class="right" style="width: 32%;margin-left: 15px">
			<div style="margin-bottom: 5px;text-align: center;">
				<form action="${viewPage }" method="post">
					<input type="hidden" id="page"  name="page" value="${viewPage }">
					<input type="text" id="searchTerm"  class="searchBox" name="term" maxlength="10" value="${highlight }">&nbsp;&nbsp;<button class="btn">搜索</button>
				</form>
			</div>
			<div class="title">分类标签</div>
			<div style="min-height: 50px">
				<c:forEach items="${classifies }" var="classify">
					<c:choose>
						<c:when test="${choosedType == classify.typeId}">
							<a href="liug?tid=${classify.typeId }" class="btnm labelm active" target="_blank">${classify.description }</a>
						</c:when>
						<c:otherwise>
							<a href="liug?tid=${classify.typeId }" class="btnm labelm" target="_blank">${classify.description }</a>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
			<div class="title">热门文章</div>
			<div style="height: 249px">
				<c:forEach items="${hotarticles }" var="hotart" begin="0" end="8">
					<a href="art_d?art=${hotart.blogId }" > ${hotart.blogTitle }</a>
					<div class="sep_solid"></div>
				</c:forEach>
			</div>
			<div class="title">评论最多</div>
			<div style="height: 249px"></div>
			
			<div align="left" class="title" style="margin-top: 15px">友情链接</div>
			<div style="margin-top: 10px;overflow: hidden;" id="recommend">
				<!-- <span class="inshadow" style="width: 80px;height: 30px"></span> -->
				<a href="http://www.baidu.com" class="btnm labelm" target="_blank">百度一下</a>
				<a href="http://www.baidu.com" class="btnm labelm" target="_blank">百度云盘</a>
				<a href="http://www.baidu.com" class="btnm labelm" target="_blank">CSDN</a>
				<a href="http://www.atool.org/colorpicker.php" class="btnm labelm"
					target="_blank">颜色选择</a> <a href="http://share.baidu.com/code"
					class="btnm labelm" target="_blank">百度分享</a> <a
					href="http://www.onmpw.com/index.html" class="btnm labelm"
					target="_blank">迹忆博客</a>
			</div>

		</div>
		<%-- 清除浮动  是外部div根据内部内容自动变大 --%>
		<div
			style="clear: both; height: 1px; width: 100%; overflow: hidden; margin-top: -1px;"></div>
	</div>
</body>
</html>

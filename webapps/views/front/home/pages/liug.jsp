<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<style type="text/css">
	.active_page{
		color: red;
	
	}
	
	#page a{
		font-size: 16px;
		border: 1px solid #999;
		padding-left: 10px;
		padding-right: 10px;
	}
	
	#page a:hover{
		cursor: pointer;
	}

</style>

</head>


<body>
	<div class="content_bottom">
		<div class="left" style="width: 64%;border-right: thin dashed #aaa;padding-right: 15px">
			<div align="left" class="title">所有文章</div>
			<div id="new_article" style="width: 100%">
				<c:choose>
					<c:when test="${totalPages==0 }">
						 <div style="height: 300px;width: 100%;text-align: center;margin-top: 100px;">此标签下尚无任何文章!</div>
					</c:when>
					<c:otherwise>
					
				
				<c:forEach items="${articles }" begin="0" end="${pagesize==null?7:(pagesize-1) }" varStatus="status" var="article">
					<div style="clear: both;height: 160px">
						<p style="font-size: medium;">
							<a href="javascript:void(0)" onclick="doGo('art_d?art=${article.blogId }&t=${highlight}')" >${article.blogTitle }</a> <br />
							<font size="2" color="#aaa">时间：
							<fmt:formatDate value="${article.publishTime }" pattern="yyyy-MM-dd HH:mm"/> 
							作者：${article.user.username } 分类：${article.classify.description }</font>
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
				<br />
				
				
				<script type="text/javascript">
					var pagesEnd = 5;
					var pagesBegin = 1;
					var pages = 5;
					var totalPages = ${totalPages==null?17:totalPages};
					
					function toPage(currentPage){
						
						if(currentPage%(pagesEnd-1) >= 0 && currentPage >= (pagesEnd-1)){
							$("#pageSpan").text("");
							
							if(currentPage-1 + 4 < totalPages){
								pagesEnd = (currentPage-1 + 4);
								pagesBegin = currentPage-1;
								for(var i=currentPage-1; i<= (currentPage-1 + 4);i++){
									$("#pageSpan").append("<a onclick='gogo("+i+")' id='page"+i+"'>"+i+"</a> ");
								}
							}else{
								pagesBegin = totalPages - pages + 1;
								pagesEnd = totalPages;
								for(var i=totalPages - pages + 1; i<= totalPages;i++){
									$("#pageSpan").append("<a onclick='gogo("+i+")' id='page"+i+"'>"+i+"</a> ");
								}
							}
							$("#page"+currentPage).addClass("active_page");
							
						}else{
							$("#pageSpan .active_page").removeClass("active_page");
							
							$("#page"+currentPage).addClass("active_page");
						}
						
						$("#beginSpan").text("");
						
						if(currentPage==1){
							$("#beginSpan").append("<a id='firstPage'>首页</a>");
						}else if(currentPage>1){
							$("#beginSpan").append("<a onclick='toPre(1)' id='firstPage'>首页</a> ");
							$("#beginSpan").append("<a onclick='toPre("+(currentPage-1)+")' id='prePage'>上一页</a>");
						}
						
						$("#endSpan").text("");
						if(currentPage >= totalPages){
							$("#endSpan").append("<a id='endPage'>尾页</a>");
						}else{
							$("#endSpan").append("<a onclick='gogo("+(currentPage+1)+")' id='nextPage'>下一页</a> ");
							$("#endSpan").append("<a onclick='gogo("+(totalPages)+")' id='endPage'>尾页</a>");
						}
						
						$("#note").text("起始页:"+pagesBegin+"  结束页:"+pagesEnd+"");
					}
					
					function toPre(currentPage){
						
						if(currentPage-pagesBegin <=1){
							$("#pageSpan").text("");
							
							if(currentPage-4 < 1){
								pagesEnd = pages;
								pagesBegin = 1;
								for(var i = 1; i<= pages ;i++){
									$("#pageSpan").append("<a onclick='gogo("+i+")' id='page"+i+"'>"+i+"</a> ");
								}
							}else{
								pagesEnd =  currentPage+1;
								pagesBegin = currentPage-3;
								for(var i=currentPage-3; i<= currentPage+1;i++){
									$("#pageSpan").append("<a onclick='gogo("+i+")' id='page"+i+"'>"+i+"</a> ");
								}
							}
							$("#page"+currentPage).addClass("active_page");
							
						}else{
							$("#pageSpan .active_page").removeClass("active_page");
							
							$("#page"+currentPage).addClass("active_page");
							
						}
						
						$("#beginSpan").text("");
						
						if(currentPage==1){
							$("#beginSpan").append("<a id='firstPage'>首页</a>");
						}else if(currentPage>1){
							$("#beginSpan").append("<a onclick='toPre(1)' id='firstPage'>首页</a> ");
							$("#beginSpan").append("<a onclick='toPre("+(currentPage-1)+")' id='prePage'>上一页</a>");
						}
						
						$("#endSpan").text("");
						if(currentPage >= totalPages){
							$("#endSpan").append("<a id='endPage'>尾页</a>");
						}else{
							$("#endSpan").append("<a onclick='gogo("+(currentPage+1)+")' id='nextPage'>下一页</a> ");
							$("#endSpan").append("<a onclick='gogo("+(totalPages)+")' id='endPage'>尾页</a>");
						}
						
						
						$("#note").text("起始页:"+pagesBegin+"  结束页:"+pagesEnd+"");
					}
					
					
					toPage(${currentPage==null?1:currentPage});
					
					function gogo(page){
						$("#curpage").val(page);
						$("#doPage").submit();
					}
				</script>
				<div id="page"  style="clear: both;height: 160px;text-align: center;">
					<span id="beginSpan">
					<c:if test="${1==currentPage }">
						<a  id="firstPage">首页</a>
					</c:if>
					<c:if test="${1 <currentPage }">
						<a  onclick="gogo(1)" id="firstPage">首页</a>
					</c:if>
					</span>
					
					<span id="pageSpan">
					<c:forEach begin="1" end="${totalPages>=5?5 :totalPages  }" varStatus="pp">
						<c:if test="${(pp.index)==currentPage }">
							<a  id="page${pp.index }" class="active_page">${pp.index}</a> 
						</c:if>
						<c:if test="${(pp.index)!=currentPage }">
							<a  onclick='gogo(${pp.index})' id="page${pp.index}" >${pp.index}</a> 
						</c:if>
					</c:forEach>
					</span>
					<span id="endSpan">
					<c:if test="${totalPages==currentPage && totalPages>5}">
						<a  id="endPage">尾页</a>
					</c:if>
					<c:if test="${totalPages > currentPage  && totalPages>5}">
						<a onclick="gogo(${currentPage-1})" id="nextPage">下一页</a> 
						<a onclick="gogo(${totalPages})" id="endPage">尾页</a>
					</c:if>
					
					</span>
				</div>
				<div  id="note" style="clear: both;height: 160px;text-align: center;">
				</div>
				</c:otherwise>
				</c:choose>
			</div>
			
			<form action="liug" method="post" id="doPage">
				<input type="hidden"  value="${choosedType }"  name="tid" alt="选中的分类编号">
				<input type="hidden"  value="${term }"  name="term" alt="搜索的关键字">
				<input type="hidden"  value="${currentPage }"  name="currentPage" id="curpage" alt="分页当前页">
			</form>
		
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
				<c:forEach items="${hotarticles }" var="hotart" begin="0" end="7">
					<a href="art_d?art=${hotart.blogId }" > ${hotart.blogTitle }</a>
					<div class="sep_solid"></div>
				</c:forEach>
			</div>
			<div class="title">评论最多</div>
			<div style="min-height: 249px">
				<!-- 多说热评文章 start -->
			<div class="ds-top-threads" data-range="daily" data-num-items="5"></div>
			<!-- 多说热评文章 end -->
			<!-- 多说公共JS代码 start (一个网页只需插入一次) -->
			<script type="text/javascript">
			var duoshuoQuery = {short_name:"lgsy"};
				(function() {
					var ds = document.createElement('script');
					ds.type = 'text/javascript';ds.async = true;
					ds.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') + '//static.duoshuo.com/embed.js';
					ds.charset = 'UTF-8';
					(document.getElementsByTagName('head')[0] 
					 || document.getElementsByTagName('body')[0]).appendChild(ds);
				})();
				</script>
			<!-- 多说公共JS代码 end -->
			
			</div>
			
			<div class="title">关注我</div>
			<div style="height: 249px;text-align: center;"><img alt="" width="200" height="200" src="images/weixins.png" style="margin-top: 20px;">
			<br/>
			<font style="font-size: 12px;">扫一扫,关注我们</font></div>
			
			<div align="left" class="title" style="margin-top: 15px">友情链接</div>
			<div style="margin-top: 10px;overflow: hidden;" id="recommend">
				<!-- <span class="inshadow" style="width: 80px;height: 30px"></span> -->
				<a href="http://lgsy.duoshuo.com/admin/" class="btnm labelm" target="_blank">百度一下</a>
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

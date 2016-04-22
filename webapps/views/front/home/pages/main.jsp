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

</head>


<body>
	<div id="leftDiv1" class="left">
		<div align="left" class="title">文章分类</div>
		<div>
			<c:forEach items="${classifies }" var="classify" varStatus="status">
				<a href="${classify.url }?tid=${classify.typeId }" target="_blank"> ${classify.description }</a>
				<div class="sep_solid"></div>
			</c:forEach>
		</div>
		<div align="left" class="title" style="margin-top: 15px">热门文章</div>
		<div>
			<c:forEach items="${hotarticles }" begin="0" end="4" var="article" varStatus="status">
				<a href="art_d?art=${article.blogId }">${ article.blogTitle}</a>
				<div class="sep_solid"></div>
			</c:forEach>
		</div>
		<div align="left" class="title" style="margin-top: 15px">友情链接</div>
		<div style="margin-top: 10px;overflow: hidden;" id="recommend">
			<!-- <span class="inshadow" style="width: 80px;height: 30px"></span> -->
			<a href="http://lgsy.duoshuo.com/admin/" class="btnm labelm" target="_blank">我的多说</a>
			<a href="http://www.baidu.com" class="btnm labelm" target="_blank">百度一下</a>
			<a href="http://www.baidu.com" class="btnm labelm" target="_blank">百度云盘</a>
			<a href="http://www.baidu.com" class="btnm labelm" target="_blank">CSDN</a>
			<a href="http://www.atool.org/colorpicker.php" class="btnm labelm"
				target="_blank">颜色选择</a> <a href="http://share.baidu.com/code"
				class="btnm labelm" target="_blank">百度分享</a> <a
				href="http://www.onmpw.com/index.html" class="btnm labelm"
				target="_blank">迹忆博客</a>
		</div>

		<%-- 百度分享 --%>
		<div class="bdsharebuttonbox">
			<a href="#" class="bds_more" data-cmd="more"></a><a href="#"
				class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#"
				class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#"
				class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#"
				class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a href="#"
				class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
		</div>
		<script>
			window._bd_share_config = {
				"common" : {
					"bdSnsKey" : {},
					"bdText" : "",
					"bdMini" : "2",
					"bdMiniList" : false,
					"bdPic" : "",
					"bdStyle" : "1",
					"bdSize" : "24"
				},
				"share" : {},
				"image" : {
					"viewList" : [ "qzone", "tsina", "tqq", "renren", "weixin" ],
					"viewText" : "分享到：",
					"viewSize" : "16"
				},
				"selectShare" : {
					"bdContainerClass" : null,
					"bdSelectMiniList" : [ "qzone", "tsina", "tqq", "renren",
							"weixin" ]
				}
			};
			with (document)
				0[(getElementsByTagName('head')[0] || body)
						.appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='
						+ ~(-new Date() / 36e5)];
		</script>

	</div>

	<div id="centerDiv" class="center">
		<div class="holder">
			<img alt="" src="images/holder.jpg" width="100%" height="100%">

		</div>
		<div id="seperator2" style="width: 100%; margin: 0 auto; height: 1%"></div>
		<div class="content_bottom">
			<div class="left" style="width: 100%">
				<div align="left" class="title">最新文章</div>
				<div id="new_article" style="width: 100%">
					<c:forEach items="${articles }" begin="0" end="5" varStatus="status" var="article">
						<div style="clear: both;height: 160px">
							<p style="font-size: medium;">
								<a href="art_d?art=${article.blogId }" target="_blank">${ article.blogTitle}</a> <br />
								<font size="2" color="#aaa">时间：${ article.publishTime} 作者：${ article.user.username}  分类：${ article.classify.description}</font>
							</p>
							<div>
								<div style="float: left;">
									<img alt="" src="images/back4.jpg" width="150px" height="100px"
										style="">
								</div>
								<div style="margin-left: 160px;height: 75px">
									<p>
										<c:if test="${fn:length(article.contentWithNoHtml)>50 }">
										${fn:substring(article.contentWithNoHtml,0,50) }
										</c:if>
										<c:if test="${fn:length(article.contentWithNoHtml)<=50 }">
											${article.contentWithNoHtml }
										</c:if>
										...
									</p>
								</div>
								<div style="float: right;">
									<a class="btnr labelm" href="art_d?art=${article.blogId }" target="_blank">阅读全文</a>
								</div>
							</div>
						</div>
						<div
							style="border-bottom-style: dashed;border-bottom-width: thin;margin-top: 20px;border-bottom-color: #aaa;"></div>
					</c:forEach>
				</div>

				<br />
			</div>
			<div class="right">
				<div class="title"></div>
				<div></div>

			</div>
			<%-- 清除浮动  是外部div根据内部内容自动变大 --%>
			<div
				style="clear: both; height: 1px; width: 100%; overflow: hidden; margin-top: -1px;"></div>
		</div>
		<%-- 清除浮动  是外部div根据内部内容自动变大 --%>
		<div
			style="clear: both; height: 1px; width: 100%; overflow: hidden; margin-top: -1px;"></div>
	</div>

	<div id="rightDiv1" class="right">
		<div class="title">推荐文章</div>
		<div style="height: 249px;">
			<c:forEach begin="1" end="5" varStatus="status">
				<a href="home"> 银河系漫游指南 ${status.index }</a>
				<br />
			</c:forEach>
		</div>
		<div class="title">统计信息</div>
		<div style="min-height: 249px;">
			<!-- 多说最新评论 start -->
			<div class="ds-recent-comments" data-num-items="5" data-show-avatars="1" data-show-time="1" data-show-title="1" data-show-admin="1" data-excerpt-length="70"></div>
			<!-- 多说最新评论 end -->
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
		<div style="height: 249px;text-align: center;"><img alt="" width="160" height="160" src="images/weixins.png">
			<br/>
			<font style="font-size: 12px;">扫一扫,关注我们</font>
		</div>
	</div>
</body>
</html>

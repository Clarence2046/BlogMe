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

<script type="text/javascript" src="jsFiles/jquery/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="jsFiles/bootstrap/js/bootstrap.js"></script>

</head>
<style>
<!--
.title {
	background-color: #EBEBEB;
	border-radius: 0px 8px 8px 0px;
	/* -webkit-box-shadow: #666 0px 0px 10px;
	-moz-box-shadow: #666 0px 0px 10px;
	box-shadow: #666 0px 0px 10px; */
	margin-bottom: 5px;
}

.inshadow {
	border-radius: 4px 4px;
	-webkit-box-shadow: inset #D3D3D3 0px 0px 10px;
	-moz-box-shadow: inset #D3D3D3 0px 0px 10px;
	box-shadow: inset #D3D3D3 0px 0px 10px;
}

.outshadow {
	border-radius: 4px 4px;
	-webkit-box-shadow: #666 0px 0px 10px;
	-moz-box-shadow: #666 0px 0px 10px;
	box-shadow: #666 0px 0px 10px;
}

.content {
	margin-left: auto;
	height: 100%;
	height: auto;
	overflow: hidden;
	margin-top: 50px;
}

.content .banner {
	width: 80%;
	height: 25%;
	margin: 0 auto;
	border-radius: 4px 4px;
}

.content .main_content {
	background-color: white;
	width: 80%;
	margin: 0 auto;
	height: auto;
	overflow: hidden;
}

.content .main_content .left {
	background-color: white;
	width: 20%;
	height: 100%;
	height: auto;
	min-height: 420px;
	display: inline-block;
	float: left;
	/* border-right-style: dashed;
	border-right-width: thin;
	border-left-style: dashed;
	border-left-width: thin; */
	/* border-radius: 8px 8px;
	-webkit-box-shadow: #666 0px 0px 10px;
	-moz-box-shadow: #666 0px 0px 10px;
	box-shadow: #666 0px 0px 10px; */
}

.content .main_content .center {
	background-color: white;
	width: 60%;
	height: 100%;
	height: auto;
	min-height: 420px;
	display: inline-block;
	float: left;
}

.content .main_content .holder {
	width: 98%;
	height: 260px;
	background-color: white;
	margin: 0 auto;
}

.content .main_content .center .content_bottom {
	width: 98%;
	height: 54%;
	height: auto;
	min-height: 54%;
	background-color: white;
	margin: 0 auto;
}

.content .main_content .center .content_bottom  .left {
	width: 100%;
	height: 100%;
	height: auto;
	min-height: 200px;
	background-color: white;
	display: inline-block;
	float: left;
}

.content .main_content .center .content_bottom  .right {
	width: 0%;
	height: 100%;
	height: auto;
	min-height: 200px;
	background-color: white;
	display: inline-block;
	float: right;
}

.content .main_content .right {
	background-color: white;
	width: 20%;
	height: 100%;
	height: auto;
	min-height: 420px;
	display: inline-block;
	float: left;
	width: 20%;
	height: 100%;
	height: auto;
	min-height: 420px;
	display: inline-block;
	/* 	border-right-style: dashed;
	border-right-width: thin;
	border-left-style: dashed;
	border-left-width: thin; */
	/* border-radius: 8px 8px;
	-webkit-box-shadow: #666 0px 0px 10px;
	-moz-box-shadow: #666 0px 0px 10px;
	box-shadow: #666 0px 0px 10px; */
}

.content .footer {
	height: 8%;
	width: 100%;
	margin: 0 auto;
	background-color: #EBEBEB;
	text-align: center;
}

a {
	color: #668B8B;
	line-height: normal;
}

a:HOVER {
	color: #f26868;
	text-decoration: none;
}

.labelm {
	border: 1px solid #ccc;
	margin: 8px;
	float: left;
}

.btnm {
	padding: 5px 10px;
	border-radius: 5px;
	text-align: center;
	font-size: 12px;
	float: left;
	margin-top: 10px;
}

.btnr {
	padding: 5px 10px;
	border-radius: 5px;
	text-align: center;
	font-size: 12px;
	float: right;
	margin-top: 10px;
}

#recommend a:hover {
	background-color: #f26868;
	text-decoration: none;
}

.sep_dash {
	border-bottom-style: dashed;
	border-bottom-width: thin;
	margin-top: 5px;
	border-bottom-color: #aaa;
}

.sep_solid {
	width:98%;
	border-bottom-style: solid;
	border-bottom-width: thin;
	margin-top: 5px;
	border-bottom-color: #e8e8e8;
}
-->
</style>

<script type="text/javascript">
function go(url){
	window.location.href=url;
}

$(function(){
	$("#recommend a").bind("mouseover",function(){
	});
	
	
})
</script>

<body>
	<jsp:include page="navibar.jsp"></jsp:include>
	<%--
  		加了属性float:浮动元素
  	  	让大div根据内部div中内容自动变大：外部div添加overflow：hidden
  	 	或者清除浮动 
  	 	<div style="clear:both;"></div>
  		<div style="clear:both;height:1px;width:100%; overflow:hidden; margin-top:-1px;"></div>
  	 --%>

	<!-- background-image:url('images/home2.jpg');background-repeat:no-repeat;background-attachment:fixed; background-color: gray; -->
	<div class="content">
		
		<%-- 头部  ：设置logo之类 --%>
		<div id="headerDiv" class="banner">
			<!-- <div align="left" class="title">title</div> -->
		    <div style="background-image: url('images/logo.png'); width: 440px; height: 120px; float: left; margin-top: 10px;"></div>
			<div style="background-image: url('images/san.jpg'); width: 279px; height: 108px; float: left; margin-bottom: 10px;margin-left: 10%"></div>
			<div style="background-image: url('images/mingyan.png'); width: 110px; height: 100px; float: left; margin-top: 10px;"></div>

		</div>
		<div id="seperator1" style="width: 80%; margin: 0 auto; height: 10px"></div>

		<%-- content 展示 --%>
		<div id="contentDiv" class="main_content">
			<div id="leftDiv1" class="left">
				<div align="left" class="title">文章分类</div>
				<div>
					<c:forEach begin="1" end="5" varStatus="status">
	  				 	<a href="home" target="_blank">分类  ${status.index }</a>
	  				 	<div class="sep_solid"></div>
					</c:forEach>
				</div>
				<div align="left" class="title"  style="margin-top: 15px">热门文章</div>
				<div>
					<c:forEach begin="1" end="5" varStatus="status">
	  				 	<a href="home">火星移民  ${status.index }</a>
	  				 	<div class="sep_solid"></div>
					</c:forEach>
				</div>
				<div align="left" class="title" style="margin-top: 15px">友情链接</div>
				<div style="margin-top: 10px;overflow: hidden;" id="recommend">
					<!-- <span class="inshadow" style="width: 80px;height: 30px"></span> -->
					<a href="http://www.baidu.com" class="btnm labelm" target="_blank">百度一下</a>
					<a href="http://www.baidu.com" class="btnm labelm" target="_blank">百度云盘</a>
					<a href="http://www.baidu.com"  class="btnm labelm" target="_blank">CSDN</a>
					<a href="http://www.atool.org/colorpicker.php" class="btnm labelm"target="_blank">颜色选择</a>
					<a href="http://share.baidu.com/code" class="btnm labelm"target="_blank">百度分享</a>
				</div>
				
				<%-- 百度分享 --%>
				<div class="bdsharebuttonbox">
					<a href="#" class="bds_more" data-cmd="more"></a><a href="#"
						class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a><a href="#"
						class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a><a href="#"
						class="bds_tqq" data-cmd="tqq" title="分享到腾讯微博"></a><a href="#"
						class="bds_renren" data-cmd="renren" title="分享到人人网"></a><a
						href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
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
							"viewList" : [ "qzone", "tsina", "tqq", "renren",
									"weixin" ],
							"viewText" : "分享到：",
							"viewSize" : "16"
						},
						"selectShare" : {
							"bdContainerClass" : null,
							"bdSelectMiniList" : [ "qzone", "tsina", "tqq",
									"renren", "weixin" ]
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
						<div style="width: 100%">
							<c:forEach begin="1" end="5" varStatus="status">
								<div style="clear: both;height: 160px">
									<p style="font-size: medium;">
				  				 		<a href="home" target="_blank">宇宙大爆炸经典理论  ${status.index }</a>
				  				 		<br/>
				  				 		<font size="2" color="#aaa">时间：2016-01-01 作者：admin 分类：未分类</font>
				  				 	</p>
				  				 	<div>
				  				 		<div style="float: left;">
				  				 			<img alt="" src="images/back4.jpg" width="150px" height="100px" style=""> 
				  				 		</div>
				  				 		<div style="margin-left: 160px">
				  				 			<p>
				  				 			“大爆炸宇宙论”（The Big Bang
											Theory）认为：宇宙是由一个致密炽热的奇点于137亿年前一次大爆炸后膨胀形成的。[1]
											1927年，比利时天文学家和宇宙学家勒梅特...
											</p>
											<a class="btnr labelm" target="_blank" >阅读全文</a>
										</div>	
				  				 	</div>
								</div>
								<div style="border-bottom-style: dashed;border-bottom-width: thin;margin-top: 5px;border-bottom-color: #aaa;"></div>
							</c:forEach>
						</div>
						
						<br/>
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
				<div>
					<c:forEach begin="1" end="5" varStatus="status">
	  				   <a href="home"> 银河系漫游指南 ${status.index }</a> <br />
					</c:forEach>
				</div>
			</div>
		</div>

		<%-- 页脚 展示 --%>
		<div id="footerDiv" class="footer">
			版权所有<br />备案号：201601012234

		</div>
	</div>

	<%-- 百度分享 --%>
	<script>
		window._bd_share_config = {
			"common" : {
				"bdSnsKey" : {},
				"bdText" : "",
				"bdMini" : "2",
				"bdMiniList" : false,
				"bdPic" : "",
				"bdStyle" : "1",
				"bdSize" : "16"
			},
			"slide" : {
				"type" : "slide",
				"bdImg" : "3",
				"bdPos" : "right",
				"bdTop" : "139.5"
			},
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

</body>
</html>

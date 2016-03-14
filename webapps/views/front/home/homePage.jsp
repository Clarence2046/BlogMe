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

</head>

<script type="text/javascript">
function go(url){
	window.location.href=url;
}

$(function(){
	$("#recommend a").bind("mouseover",function(){
	});
	
	
	var navItem= {
			items:'home|liug|suiy|hnbc|zhaj|gyuw|lius'
	};
	activeNav(navItem);
})


function activeNav(navItems){
	var trueUrl='${trueUrl}';
	var url = window.location.href;
	var indexq = url.indexOf("?");
	var urlwithnoparam=url;
	if(indexq>0){
		urlwithnoparam = url.substring(0,indexq);
	}
	console.log(urlwithnoparam);
	var splits = urlwithnoparam.split("/");
	var location = splits[splits.length-1];
	console.log(location);
	
	$(".nav ul li .active").removeClass("active");
	var lis = $(".nav ul li");
	if(typeof navItems == "object"){
		if(navItems.hasOwnProperty("items")){
			var items  =navItems.items;
			var navs = items.split("|");
			for ( var nav in navs) {
				if(trueUrl == navs[nav]){
					$(lis[nav]).addClass("active");
					break;
				}
				
				console.log( navs[nav]);
				if(location == navs[nav]){
					$(lis[nav]).addClass("active");
					break;
				}
			}
			
		}
	}
	
}

</script>

<body>
	<%-- <jsp:include page="navibar.jsp"></jsp:include> --%>
	<%--
  		加了属性float:浮动元素
  	  	让大div根据内部div中内容自动变大：外部div添加overflow：hidden
  	 	或者清除浮动 
  	 	<div style="clear:both;"></div>
  		<div style="clear:both;height:1px;width:100%; overflow:hidden; margin-top:-1px;"></div>
  	 --%>

	<div class="content">
		
		<%-- 头部  ：设置logo之类 --%>
		<div id="headerDiv" class="banner" >
			<!-- <div align="left" class="title">title</div> -->
		    <div style="background-image: url('images/logo.png'); width: 440px; height: 120px; float: left; margin-top: 10px;"></div>
			<div style="background-image: url('images/san.jpg'); width: 279px; height: 108px; float: left; margin-bottom: 10px;margin-left: 10%"></div>
			<div style="background-image: url('images/mingyan.png'); width: 110px; height: 100px; float: left; margin-top: 10px;"></div>
		</div>
		<div class="nav" >
			<ul>
				<li><a href="home">首页</a></li>
				<li><a href="liug">流光</a></li>
				<li><a href="suiy">岁月</a></li>
				<li><a href="hnbc">海纳百川</a></li>
				<li><a href="zhaj">札记</a></li>
				<li><a href="gyuw">关于我</a></li>
				<li><a href="lius">留声</a></li>
			</ul>
		</div>
		<div id="seperator1" style="width: 80%; margin: 0 auto; height: 10px"></div>
		<%-- content 展示 --%>
		<div id="contentDiv" class="main_content">
			<c:if test="${viewPage == 'home' }">
				<jsp:include page="pages/main.jsp"></jsp:include>
			</c:if>
			<c:if test="${viewPage == 'liug' }">
				<jsp:include page="pages/liug.jsp"></jsp:include>
			</c:if>
			<c:if test="${viewPage == 'suiy' }">
				<jsp:include page="pages/suiy.jsp"></jsp:include>
			</c:if>
			
			<c:if test="${viewPage == 'art_detail' }">
				<jsp:include page="pages/articleDetail.jsp"></jsp:include>
			</c:if>
		
			

			
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

	<script type="text/javascript">
	
		//监听滚动条滚动事件,固定导航栏
		window.onscroll = document.onscroll = scrollFunc;

		function scrollFunc() {
			var statictop = document.getElementById("contentDiv").offsetTop;
			var top = document.documentElement.scrollTop
					|| document.body.scrollTop;
			var scrollTop = document.documentElement.scrollTop
					+ document.body.scrollTop;
			console.log(statictop + " " + top + " " + scrollTop);
			if (statictop - top < 50) {
				$(".nav").addClass("fixTop");
			} else {
				$(".nav").removeClass("fixTop");
			}

		}
	</script>

</body>
</html>

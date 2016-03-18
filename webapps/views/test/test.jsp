<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@page contentType="text/html; charset=UTF-8" deferredSyntaxAllowedAsLiteral="true" %>
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

<title>测试专用页面</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<link href="jsFiles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="jsFiles/bootstrap/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="jsFiles/bootstrap/css/dashboard.css" rel="stylesheet">
    
    <script type="text/javascript"  src="jsFiles/jquery/jquery-1.11.3.js"></script>
    <script type="text/javascript"  src="jsFiles/bootstrap/js/bootstrap.js"></script>
	
<script type="text/javascript" src="jsFiles/datepicker/WdatePicker.js"></script>
<script type="text/javascript">
	console.log(window.parent["document"]);
	console.log(window["document"]);
	console.log(window.parent["document"]["getElementsByTagName"]("frameset"));
	console.log($dp);
	var a = {
		$wdate : true,
		$crossFrame : false,
		$dpPath : "",
		position : {
			top : 'under'
		},
		lang : "auto",
		skin : "default",
		dateFmt : "yyyy-MM-dd",
		realDateFmt : "yyyy-MM-dd",
		realTimeFmt : "HH:mm:ss",
		realFullFmt : "%Date %Time",
		minDate : "1900-01-01 00:00:00",
		maxDate : "2099-12-31 23:59:59",
		startDate : "",
		alwaysUseStartDate : false,
		yearOffset : 1911,
		isShowWeek : false,
		highLineWeekDay : true,
		isShowClear : true,
		isShowToday : true,
		isShowOthers : true,
		readOnly : false,
		errDealMode : 0,
		autoPickDate : null,
		qsEnabled : true,
		disabledDates : null,
		disabledDays : null,
		opposite : false,
		onpicking : null,
		onpicked : null,
		onclearing : null,
		oncleared : null,
		eCont : null,
		vel : null,
		errMsg : "",
		quickSel : [],
		has : {}
	};
	
	var b = {
			isShowClear : false,
			dateFmt : "yyyy/MM/dd",
			realDateFmt : "yyyy-MM-dd",
			/* maxDate:"#F{$dp.$D('312')||'2016/2/10'}" */
			maxDate:"#F{getMyDate('312')||'2016/2/10'}"
	};
	var b1 = {isShowClear : false,
			realDateFmt : "yyyy/MM/dd"		
	};
	
	
	function getMyDate(id){
		var str = "2016-!@#~$%^&*()+_3-+@#$%^&*()!+11";
		str=document.getElementById("312").value;
		return str ;
	}
	
	$(function(){
		$("#sidebar ul li").bind("click",function(){
			//console.log($(this));
			var actives = $("#sidebar ul li.active");
			
			for ( var i = 0; i < actives.length; i++) {
				var active = actives[i];
				$(active).removeClass("active");
				$("#active").removeClass("test");
				$(active).bind("mouseover",function(){
					$(this).css("box-shadow","2px -1px 5px #989898");
				});
				$(active).bind("mouseleave",function(){
					//console.log($(this).css("box-shadow"));
					$(this).css("box-shadow","0px 0px 0px");
				});
				
				
				//console.log($(active).is($(this)));
				if(!$(active).is($(this))){
					$(active).find("ul").css("display","none");
					$(active).find("a").find(".glyphicon-folder-close").removeClass("glyphicon-folder-open");
				}
			}
			
			$("#act").remove();
			
			if($(this).hasClass("active")){
				$(this).removeClass("active");
				$("#active").removeClass("test");
			}else{
				$(this).addClass("active");
				$(this).prepend("<div class='test' id='act'></div>");
				if($(this).find("a").find(".glyphicon-folder-close").hasClass("glyphicon-folder-open")){
					$(this).find("a").find(".glyphicon-folder-close").removeClass("glyphicon-folder-open");
				}else{
					$(this).find("a").find(".glyphicon-folder-close").addClass("glyphicon-folder-open");
				}
				
				
				$(this).css("box-shadow","0px 0px");
				$(this).bind("mouseover",function(){
					//console.log($(this).css("box-shadow"));
					$(this).css("box-shadow","0px 0px");
				});
				
				//console.log($(this).find("ul").css("display"));
				if($(this).find("ul").css("display")=="block"){
					$(this).find("ul").css("display","none");
				}else{
					$(this).find("ul").css("display","");
				}
				
				var url = $(this).find("a").attr("visit");
				if(url!=undefined){
					console.log(url);
					$("#content").attr("src",url);
				}
			}
		});
	})
</script>

<style>
<!--
.test {
	width: 0;
	height: 0;
	border-top: 6px solid transparent;
	border-right: 8px solid white;
	border-bottom: 6px solid transparent;
	float: right;
	margin-top: 0px;
	position: static;
}

#sidebar {
	background-color: #5c5c5c;
}

#sidebar ul li {
	min-height: 30px;
	line-height: 30px;
	border-bottom-color: gray;
	border-bottom-width: thin;
	border-bottom-style: solid;
	margin-left: -40px;
}

#sidebar ul li:HOVER {
	background-color: #303030;
	box-shadow: 2px -1px 5px #989898;
}

#sidebar ul li.active {
	background-color: #989898;
}

#sidebar ul li a {
	color: white;
	margin-top: 5px;
	margin-left: 10px;
	text-decoration: none;
	cursor: default;
}

#sidebar ul li ul {
	background-color: #5c5c5c;
	list-style-type: none;
}

#sidebar ul li ul li {
	padding-left: 30px;
}

#sidebar ul li ul li:HOVER { /* 	background-color: red; */
	
}

.active {
	background-color: #989898;
}
-->
</style>
</head>

<body>
<div style="width: 1200px;box-shadow:2px -1px 2px #5c5c5c;margin-top: 20px;overflow: hidden;min-height: 600px;">
	<div style="width: 150px;float: left;min-height: 600px" id="sidebar" >
		<ul style="margin: 0px;list-style-type: none;" >
			<li> <div class='test' id='act'></div>
				<a style="margin-top: 5px;" >
					<label class="glyphicon glyphicon-home"></label>
					<span>欢迎页</span>
				</a>
			</li>
			<li>
				<a style="margin-top: 5px;margin-left: 10px" >
					<label class="glyphicon glyphicon-user" ></label>
					<span>标题二</span>
					<label style="float: right;margin-right: 13px;margin-top: 5px;" class="glyphicon glyphicon-folder-close"></label>
				</a>
				<ul  style="display: none;">
					<c:forEach  begin="1" end="5" varStatus="status">
						<li>
							<a visit="index">导航2.${status.index }</a>
						</li>
					</c:forEach>
				</ul>
			</li>
			<li>
				<a style="margin-top: 5px">
					<label class="glyphicon glyphicon-fire" ></label>
					<span>标题三</span>
					<label style="float: right;margin-right: 13px;margin-top: 5px;" class="glyphicon glyphicon-folder-close"></label>
				</a>
				<ul style="display: none;">
					<c:forEach  begin="1" end="5" varStatus="status">
						<li>
							<a visit="index">导航3.${status.index }</a>
						</li>
					</c:forEach>
				</ul>
			</li>
			<li>
				<a style="margin-top: 5px" visit="test_art">
					<label class="glyphicon glyphicon-globe" ></label>
					<span>写文章</span>
				</a>
			</li>
			<li>
				<a style="margin-top: 5px">
					<label class="glyphicon glyphicon-leaf" ></label>
					<span>标题五</span>
					<label style="float: right;margin-right: 13px;margin-top: 5px;" class="glyphicon glyphicon-folder-close"></label>
				</a>
				<ul style="display: none;">
					<c:forEach  begin="1" end="5" varStatus="status">
						<li>
							<a visit="new_art">导航5.${status.index }</a>
						</li>
					</c:forEach>
				</ul>
			</li>
			<li>
				<a style="margin-top: 5px" visit="home">
					<label class="glyphicon glyphicon-picture" ></label>
					<span>标题六</span>
				</a>
			</li>
			<li>
				<a style="margin-top: 5px" visit="home">
					<label class="glyphicon glyphicon-cog" ></label>
					<span>标题七</span>
				</a>
			</li>
		</ul>
	</div>
	<div style="float: left;width: 1050px;min-height: 600px" id="cont">
		<iframe style="border: 0;min-height:600px; width: 100%;overflow-x:hidden;" src="views/test/datepicker.jsp" id="content" >
		</iframe>
	</div>
	<script type="text/javascript" language="javascript">
	</script>
	</div>
<br/>

	<jsp:include page="../front/home/navibar.jsp"></jsp:include>
	
</body>
</html>

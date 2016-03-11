<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

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
</script>


</head>

<body>
<%-- 	<jsp:include page="../blogme/header.jsp"></jsp:include>
 --%>	测试专用页面
	<br>

	<div style="background-color:red;width: 1200px;height: auto;;margin-left: auto;margin-right: auto;">
	<div style="width: 600px;height: 150px;background-color: blue;margin-left: auto;margin-right: auto;">
	</div>
	
	<div style="width: 600px;height: 400px;background-color: green;margin-left: auto;margin-right: auto;">
	</div>
	
	</div>
	<br />

	<a href="views/test/datepicker.jsp">进入 WdatePicker测试页面</a>

	<input type="text" onfocus="WdatePicker(b)" class="wdate" id="213">
	<input type="text" onfocus="WdatePicker(b1)" class="wdate" id="312">
	
	<br/>
	时间段<br/>
	<input type="text" onfocus="WdatePicker(c1)" class="wdate" id="c1">
	<input type="text" onfocus="WdatePicker(c2)" class="wdate" id="c2">
	<script type="text/javascript">
	//日期差量,支持y M d H m s
		var c1={
			maxDate:"#F{$dp.$D('c2',{d:-5})}"	
				
		};
	
		var c2={
			minDate:"#F{$dp.$D('c1',{d:+5})}"	
			
		};
	
	</script>
	
	<hr/>
	无效天(相关属性disabledDays (0至6 分别代表 周日至周六)):<br/>
	<input id="d441" type="text" class="Wdate" onFocus="WdatePicker({disabledDays:[0,6]})"/>
	<br/>
	无效日期 disabledDates (使用正则匹配)<br/>
	<input id="d451" type="text" class="Wdate form-control" onFocus="WdatePicker({disabledDates:['5$']})"/>
	
	<br/>
	<input id="d454" type="text" class="Wdate" onFocus="WdatePicker({minDate:'%y-%M-01',maxDate:'%y-%M-%ld',disabledDates:['0[4-7]$','1[1-5]$','2[58]$'],disabledDays:[1,3,6]})"/>
	
	<button class="btn btn-primary">bbb</button>
</body>
</html>

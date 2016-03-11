<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>测试专用页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript"  src="jsFiles/datepicker/WdatePicker.js"></script>
  </head>
  
  <body>
  <jsp:include page="../front/home/navibar.jsp"></jsp:include>
   测试专用页面 >>WdatePicker测试页面<br/>
   
   <input  type="text"  id="test1"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',realDateFmt:'yyyy-MM-dd HH:mm:ss',skin:'whyGreen'})"  class="wdate"/>
   
   <button  name="nn"  value="显示真实值"  onclick="show()"></button>
   <script type="text/javascript">
   	function show(){
   		alert($("#test1").attr("realvalue"));
   	}
   </script>
   <br/>
   <input id="d422" class="Wdate" type="text" onfocus="WdatePicker({minDate:'%y-%M-{%d+1}'})"/>
  </body>
  
  
</html>

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
<%--   <jsp:include page="../front/home/navibar.jsp"></jsp:include> --%>
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
   
   测试专用页面

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

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
    
    <script type="text/javascript"  src="jsFiles/jquery/jquery-2.2.0.min.js"></script>
    <script type="text/javascript"  src="jsFiles/bootstrap/js/bootstrap.js"></script>
    
  </head>
  <style>
<!--
.title {
	background-color: fuchsia;
	border-radius: 4px 4px;
	-webkit-box-shadow: #666 0px 0px 10px;
	-moz-box-shadow: #666 0px 0px 10px;
	box-shadow: #666 0px 0px 10px;
}
-->
</style>
  
  
  <body >
  	<%-- <jsp:include page="navibar.jsp"></jsp:include> --%>
  	<!-- <div style="clear:both;height:1px;width:100%; overflow:hidden; margin-top:-1px;"></div> -->
  	<%--
  		加了属性float:浮动元素
  	  	让大div根据内部div中内容自动变大：外部div添加overflow：hidden
  	 	或者清除浮动 
  	 	<div style="clear:both;"></div>
  		<div style="clear:both;height:1px;width:100%; overflow:hidden; margin-top:-1px;"></div>
  	 --%>
  	
  	
  	<div style="background-color: gray;margin-left: auto;height: 100%;height: auto;overflow: hidden;">
  	大框架
  		<%-- 头部  ：设置logo之类 --%>
	  	<div id="headerDiv"  style="width: 80%;height:25%; background-color: lime;margin:0 auto;border-radius: 4px 4px;" align="center">
	  		<div align="left" class="title">title</div>
	  	inner div
	  	</div>
	  	<div id="seperator1" style="width: 80%;margin: 0 auto;height: 10px"></div>
	  	
	  	<%-- content 展示 --%>
	  	<div id="contentDiv" style="background-color: lime;width: 80%;margin:0 auto;height: auto;overflow: hidden;">
	  		<div id="leftDiv1" style="background-color:maroon; width: 20%;height: 100%;height:auto;min-height: 420px; display: inline-block;float: left;">
	  			<div align="left"  class="title">title</div>
	  			<div>
	  			content
	  			<c:forEach begin="1" end="5">
	  				2<br/>
	  			</c:forEach>
	  			
	  			</div>
	  		</div>
	  		
		  	<div id="centerDiv" style="background-color:orange; width: 60%;height: 100%;height:auto;min-height: 420px;display: inline-block;float: left;">
			  	<div style="width: 98%;height: 260px;background-color: red;margin:0 auto;">
			  	
			  	</div>
			  	<div id="seperator2" style="width: 100%;margin: 0 auto;height: 1%"></div>
			  	<div style="width: 98%;height: 54%;height:auto;min-height: 54%;background-color: red;margin:0 auto;">
			  		<div style="width: 49%;height: 100%;height:auto;min-height: 200px;background-color: silver;display: inline-block;float: left;">
			  			<div   class="title">title</div>
			  			<div>
			  				<c:forEach begin="1" end="5">
				  				2<br/>
				  			</c:forEach>
			  			</div>
				  	</div>
				  	<div style="width: 49%;height: 100%;height:auto;min-height: 200px;background-color: silver;display: inline-block;float: right;">
				  		<div   class="title">title</div>
				  		<div>
			  				content
			  				<c:forEach begin="1" end="5">
				  				2<br/>
				  			</c:forEach>
			  				
			  			</div>
				  	
				  	</div>
				  	<%-- 清除浮动  是外部div根据内部内容自动变大 --%>
				  	<div style="clear:both;height:1px;width:100%; overflow:hidden; margin-top:-1px;"></div>
			  	</div>
			  	<%-- 清除浮动  是外部div根据内部内容自动变大 --%>
			  	<div style="clear:both;height:1px;width:100%; overflow:hidden; margin-top:-1px;"></div>
		  	</div>
		  	
		  	<div id="rightDiv1" style="background-color:maroon; width: 20%;height: 100%;height:auto;min-height: 420px; display: inline-block;float: left;">
			  	<div   class="title">title</div>
			  	<div>
	  			content
	  			<c:forEach begin="1" end="5">
	  				2<br/>
	  			</c:forEach>
	  			</div>
		  	</div>
	  	</div>
	  	
	  	<div id="seperator2" style="width: 80%;margin: 0 auto;height: 10px"></div>
	  	<%-- 页脚 展示 --%>
	  	<div id="footerDiv" style="height: 8%;width: 80%;margin:0 auto; background-color: olive;text-align: center;">
	  		版权所有<br/>备案号：201601012234
	  	
	  	</div>
  	</div>
  </body>
</html>

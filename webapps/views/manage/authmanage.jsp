<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'common.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
    <link href="jsFiles/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="jsFiles/bootstrap/css/navbar-fixed-top.css" rel="stylesheet">
    <link href="jsFiles/bootstrap/css/dashboard.css" rel="stylesheet">
	
	<script type="text/javascript"  src="jsFiles/jquery/jquery-2.2.0.min.js"></script>
    <script type="text/javascript"  src="jsFiles/bootstrap/js/bootstrap.js"></script>

  </head>
  
  <body>
   <ol class="breadcrumb">
	  <li ><a href="javascript:void(0)">管理</a></li>
	  <li class="active">权限管理</li>
	</ol>
	

    <div class="row placeholders">
    
    </div>
    <h5 class="sub-header">权限管理</h5>
    <div class="table-responsive">
    </div>
  </body>
</html>

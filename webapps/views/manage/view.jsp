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
	  <li class="active">概览</li>
	</ol>
	

          <div class="row placeholders">
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/sky" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <div class="col-xs-6 col-sm-3 placeholder">
              <img data-src="holder.js/200x200/auto/vine" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4>Label</h4>
              <span class="text-muted">Something else</span>
            </div>
            <button type="button" class="btn btn-primary" data-toggle="collapse" 
			   data-target="#demo">
			   简单的可折叠组件
			</button>
			
			<div id="demo" class="collapse in">
			  Nihil anim keffiyeh helvetica, craft beer labore wes anderson 
			  cred nesciunt sapiente ea proident. Ad vegan excepteur butcher 
			  vice lomo.
			</div>
            
          </div>
          <h5 class="sub-header">个人信息</h5>
          <div class="table-responsive">
          		区域二
          </div>
  </body>
</html>

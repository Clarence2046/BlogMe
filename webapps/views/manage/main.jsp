<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理</title>
    
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
     <script type="text/javascript">
		$(document).ready(function(){
			var  cur = '${current}';
			$(".active").removeClass("active");
			if(cur=='usermanage'){
				$("#manage").addClass("active");
			}else if(cur =='view'){
				$("#view").addClass("active");
			}
			
			
			/* $("#useranage").click(function(){
				$("#uu").attr("src","main/usermanage");
			}); */
			
		})	;
		
		function chooseMe(url){
			$("#uu").attr("src",url);
		}
		
		function activeMe(me){
			$(".active").removeClass("active");
			$(me).addClass("active");
			
		}
    </script>

  </head>
  
  <body>
  	
  
	  <nav class="navbar navbar-inverse navbar-fixed-top">
	      <div class="container">
	        <div class="navbar-header">
	          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
	            <span class="sr-only">Toggle navigation</span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a class="navbar-brand" href="#">Galaxy</a>
	        </div>
	        <div id="navbar" class="navbar-collapse collapse">
	          <ul class="nav navbar-nav">
	            <li ><a href="#">1</a></li>
	            <li ><a href="#">2</a></li>
	            <li ><a href="home">返回前台</a></li>
	            <li class="dropdown">
	              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
	              <ul class="dropdown-menu">
	                <li><a href="#">Action</a></li>
	                <li><a href="#">Another action</a></li>
	                <li><a href="#">Something else here</a></li>
	                <li role="separator" class="divider"></li>
	                <li class="dropdown-header">Nav header</li>
	                <li><a href="#">Separated link</a></li>
	                <li><a href="#">One more separated link</a></li>
	              </ul>
	            </li>
	          </ul>
	          <ul class="nav navbar-nav navbar-right">
			      <li>
			          <form class="navbar-form navbar-left" role="search">
				        <div class="form-group">
				          <input type="text" class="form-control" placeholder="Search">
				        </div>
				        <button type="submit" class="btn btn-default">Submit</button>
				      </form>
			      </li>
	          </ul>
	        </div><!--/.nav-collapse -->
	      </div>
	    </nav>
	
	   <div class="container-fluid">
      <div class="row">
        <div class="col-sm-2 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li id="view"><a href="main">
            	<span class="glyphicon glyphicon-bookmark"> 概览 <span class="sr-only">(current)</span></span>
            	</a>
            </li>
            <li  id="manage" onclick="activeMe(this)">
            <a data-toggle="collapse"   href="#userManage"  >
            	<span class="glyphicon glyphicon-cog"> 管理</span>
            </a>
            <div id="userManage"   class="collapse">
            	<div class="panel-body">
            	<ul style="list-style-type: none;">
            		<li> <a  href="javascript:void(0)" id="usermanage"  onclick="chooseMe('main/usermanage')"><span class="glyphicon glyphicon-user"></span>用户管理</a></li>
            	 	<li> <a  href="javascript:void(0)" id="authmanage" onclick="chooseMe('main/authmanage')"><span class="glyphicon glyphicon-leaf"></span>权限管理</a> </li>
            	</ul>
            	 
            	</div>
            </div>
            </li>
            <!-- <li><a href="#">Analytics</a></li>
            <li><a href="#">Export</a></li> -->
          </ul>
          <!-- <ul class="nav nav-sidebar">
            <li><a href="">Nav item</a></li>
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
            <li><a href="">More navigation</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href="">Nav item again</a></li>
            <li><a href="">One more nav</a></li>
            <li><a href="">Another nav item</a></li>
          </ul> -->
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main" id="placeMe">
		
       <%--  <c:if test="${current eq 'view' }">
          <h5 class="page-header">预览</h5>

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
        </c:if> --%>
        <frameset>
        <iframe id="uu" src="main/view"   style="width:100%; height:95%;"  frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="no" allowtransparency="yes">
				<%-- <jsp:include page="usermanage.jsp"></jsp:include> --%>
		</iframe>
        </frameset>
        <c:if  test="${current eq 'usermanage' }">
        </c:if>
        </div>
      </div>
    </div>
	    
	    
  </body>
</html>

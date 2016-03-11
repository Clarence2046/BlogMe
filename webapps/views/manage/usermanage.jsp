<%@page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page contentType="text/html; charset=UTF-8" deferredSyntaxAllowedAsLiteral="true"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib  prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'usermanage.jsp' starting page</title>
    
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
    
    <script type="text/javascript"  src="jsFiles/datepicker/WdatePicker.js"></script>
  </head>
  
  <body>
  
	<ol class="breadcrumb">
	  <li><a href="javascript:void(0)">管理</a></li>
	  <li class="active">用户管理</li>
	</ol>

	<div class="row placeholders">
		<form action="main/usermanage?pageNum=${pages.pageNumber}"  class="form-inline" id="searchForm"  method="post">
				用户名:<input  type="text"  class="form-control"  size="14"  name="username"  value="${old_username }">
			    开始时间:<input type="text" size="12"id="beginDate" class="form-control"  name="beginDate"   value="${old_beginDate }"
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',maxDate:'#F{$dp.$D(\'endDate\')||\'%y-%M-%d\'}'})">
				结束时间:<input type="text" size="12" id="endDate" class="form-control"    name="endDate"    value="${old_endDate }"
				onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'beginDate\')}',maxDate:'%y-%M-%d',position:{top:'above'}})">
				<input  type="submit"  class="btn"  value="查询">
		</form>
	</div>
	
	<button  type="button"  class="btn btn-info glyphicon glyphicon-plus"   data-toggle="modal" data-target="#addUser">添加</button>
	<table  class="table table-bordered table-hover table-responsive">
      		<thead>
      		<tr>
				<td  width="5%">#</td>      
				<td width="10%">用户名</td>      
				<td width="10%">登录名</td>      
				<td width="15%">邮箱</td>      
				<td width="10%">手机号</td>      
				<td width="17%">创建时间</td>      
				<td width="17%">上次更新</td>      
				<td width="6%">状态</td>      
				<td width="10%" align="center">操作</td>      
      		</tr>
      		</thead>
      		<tbody  id="contents">
      		<c:forEach  items="${pages.list }" var="user"  >
      		<tr>
				<td>${user.userId }</td>      
				<td>${user.username }</td>      
				<td>${user.loginName }</td>      
				<td>${user.email }</td>      
				<td>${user.phone }</td>      
				<td>
					<fmt:formatDate value="${user.createTime }"  type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>      
				<td>
					<fmt:formatDate value="${user.updateTime }"  type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>      
				<td>${user.status==1?'正常':'冻结' }</td>      
				<td align="center"> 
						<button  class="glyphicon glyphicon-trash btn btn-info"  style="padding: 1 5 ;" title="删除"></button>  
						<button  class="glyphicon glyphicon-edit btn btn-info"  style="padding: 1 5 ;" title="编辑"  onclick="showEdit(${user.userId },'${user.username }','${user.loginName }','${user.email }','${user.phone }',${user.userType })"></button>
				</td>      
      		</tr>
      		</c:forEach>
      		</tbody>
		<tr>
			<td    align="right" style="border-right-style: hidden;">
				<!-- <select  id="pagesize"  class="form-control"   style="width: 80px">
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
					</select> -->
				</td>
			<td colspan="8" align="right">
					<input type="hidden"  id="cur"  value="${pages.pageNumber}">
					<c:choose>
							<c:when test="${pages.pageNumber == 1 }">
								<span id="pre"> <font  style="color: gray;">上一页 &nbsp;</font></span>
							</c:when>
							<c:otherwise>
								<span id="pre"><a href="javascript:void(0)"  onclick="toPage(${pages.pageNumber -1})">上一页 &nbsp;</a></span>
							</c:otherwise>
					</c:choose>
					
					<c:forEach begin="1"  end="${pages.totalPage }"  varStatus="num">
						<c:if test="${pages.pageNumber == num.index }">
							<span id="page${num.index }"> <font  style="color: gray">${num.index }&nbsp;</font><span class="sr-only">(current)</span></span>
						</c:if>
						<c:if test="${pages.pageNumber != num.index }">
							<span id="page${num.index }"><a href="javascript:void(0)"  onclick="toPage(${num.index})" >${num.index }&nbsp;</a></span>
						</c:if>
					</c:forEach>
					
					<c:choose>
							<c:when test="${pages.pageNumber == pages.totalPage }">
								<span  id="next"> <font  style="color: gray;" >下一页 &nbsp;</font></span>
							</c:when>
							<c:otherwise>
								<span  id="next"> <a href="javascript:void(0)"  onclick="toPage(${pages.pageNumber +1})" >下一页 &nbsp;</a></span>
							</c:otherwise>
					</c:choose>
					<script type="text/javascript">
							function  toPage(pageN){
								var  cur =$("#cur").val();
								var username = $("#searchForm input[name=username]").val();
								var beginDate = $("#searchForm input[name=beginDate]").val();
								var endDate = $("#searchForm input[name=endDate]").val();
								console.log(username);
								$.ajax({
									//url:"main/usermanageAjax?pageNum="+pageN+"&pageSize=5&username="+username+"&beginDate",
									url:"main/usermanageAjax",
									type:"post",
									data:{'pageNum':pageN,'pageSize':5, 'username':username, 'beginDate':beginDate,'endDate':endDate},
									success:function(data){
										console.log(data);
										console.log(data.list.length);
										console.log(data.list[0]);
										$("#contents").text("");
										for ( var temp = 0; temp < data.list.length; temp++) {
											var user = data.list[temp];
											console.log(user.userId);
											var username = (user.username==null?'':user.username);
											var loginName = (user.loginName==null?'':user.loginName);
											var email = (user.email==null?'':user.email);
											var phone = (user.phone==null?'':user.phone);
											var createTime = (user.createTime==null?'':user.createTime);
											var updateTime = (user.updateTime==null?'':user.updateTime);
											$("#contents").append("<tr>"
																			+"<td>"+user.userId +"</td>"      
																			+"<td>"+username+"</td> "
																			+"<td>"+loginName +"</td> "
																			+"<td>"+email +"</td> "     
																			+"<td>"+phone+"</td>  "    
																			+"<td>"+createTime+"</td>"      
																		    +"<td>"+updateTime +"</td>"      
																		    +"<td>"+(user.status==1?'正常':'冻结') +"</td>"      
																			+"<td  align='center'>"
																			+"<button  class='glyphicon glyphicon-trash btn btn-info'  style='padding: 1 5 ;' title='删除'></button> "  
																			+"<button id='user"+user.userId+"'  class='glyphicon glyphicon-edit btn btn-info'  style='padding: 1 5 ;' title='编辑'></button>"
																			+"</td>"
																			
															      			+"</tr>");	
											
											$("#user"+user.userId+"").attr("onclick","showEdit('"+user.userId+"','"+username+"','"+loginName+"','"+email+"','"+phone+"','"+user.userType+"')");
										};
										//设置下一页
										$("#next").text("");
										if(data.pageNumber == data.totalPage ){
												$("#next").append('<font  style="color: gray;" >下一页 &nbsp;</font>');
										}else{
												$("#next").append("<a href='javascript:void(0)'  onclick='toPage("+(data.pageNumber+1)+")'>下一页 &nbsp;</a>");
										}
										
										//设置上一页
										$("#pre").text("");
										if(data.pageNumber == 1 ){
												$("#pre").append('<font  style="color: gray;" >上一页 &nbsp;</font>');
										}else{
												$("#pre").append("<a href='javascript:void(0)'  onclick='toPage("+(data.pageNumber-1)+")'>上一页 &nbsp;</a>");
										}
										
										//数字翻页
										$("#page"+cur+"").text("");
										$("#page"+data.pageNumber+"").text("");
										$("#page"+cur+"").append("<a href='javascript:void(0)'  onclick='toPage("+cur+")'>"+cur+" &nbsp;</a>");
										$("#page"+data.pageNumber+"").append("<font  style='color: gray;'>"+ data.pageNumber+"&nbsp;</font>");
										
										$("#cur").val(data.pageNumber)
										
										$("#searchForm").attr("action","main/usermanage?pageNum="+data.pageNumber);
									}
								});
							}
					
					</script>
			</td>
		</tr>
	</table>
    
    <!-- Modal -->
	<div class="modal fade" id="addUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">添加用户</h4>
	      </div>
	      <div class="modal-body">
	       <form  action="main/addUser?type=1"  method="post"  id="addUserForm">
		    <table  align="center" class="table">
		    		<tr>
		    			<td width="10%">&nbsp;</td>
		    			<td width="20%"  align="right">用户名<label  style="color: red">*</label></td>
		    			<td width="60%"><input  class="form-control" type="text"  name="registerUser.username"/></td>
		    			<td width="10%">&nbsp;</td>
		    		</tr>
		    		<tr>
		    			<td width="10%">&nbsp;</td>
		    			<td align="right">登录名<label  style="color: red">*</label></td>
		    			<td><input class="form-control"  type="text"  name="registerUser.loginName"/></td>
		    			<td width="10%">&nbsp;</td>
		    		</tr>
		    		<tr>
		    			<td width="10%">&nbsp;</td>
		    			<td  align="right">密码<label  style="color: red">*</label></td>
		    			<td><input  class="form-control" type="password"  name="registerUser.password"></td>
		    			<td width="10%">&nbsp;</td>
		    		</tr>
		    		<tr>
		    			<td width="10%">&nbsp;</td>
		    			<td  align="right">确认密码<label  style="color: red">*</label></td>
		    			<td><input class="form-control"  type="password"  name="confirmpassword"  id="confirmpassword"></td>
		    			<td width="10%">&nbsp;</td>
		    		</tr>
		    		<tr>
		    			<td width="10%">&nbsp;</td>
		    			<td  align="right">邮箱<label  style="color: green">*</label></td>
		    			<td><input class="form-control" type="text"  name="registerUser.email"  ></td>
		    			<td width="10%">&nbsp;</td>
		    		</tr>
		    		<tr>
		    			<td width="10%">&nbsp;</td>
		    			<td  align="right">手机号<label  style="color: green">*</label></td>
		    			<td><input  class="form-control" type="text"  name="registerUser.phone"  ></td>
		    			<td width="10%">&nbsp;</td>
		    		</tr>
		    		<tr>
		    			<td width="10%">&nbsp;</td>
		    			<td  align="right">用户类型<label  style="color: red">*</label></td>
		    			<td>
		    					<select  name="registerUser.userType" class="form-control" >
										<option value="1">普通用户</option>		    			
										<option value="2">普通管理员</option>		    			
										<option value="3">超级管理员</option>		    			
		    					</select>
		    			</td>
		    			<td width="10%">&nbsp;</td>
		    		</tr>
		    </table>
		    </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary"  onclick="addUser()">添加</button>
	      </div>
	      
	      <a class="close" data-dismiss="alert" href="#" aria-hidden="true">
			   &times;
			</a>
	      <script type="text/javascript">
				function addUser(){
					if(confirm("确认添加？")){
					$("#addUserForm").submit();					
						
					}
					
				}	      
	      </script>
	    </div>
	  </div>
	</div>
	
    <!-- Modal -->
	<div class="modal fade" id="editUser" tabindex="-1" role="dialog" aria-labelledby="editUserLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="editUserLabel">更新用户</h4>
	      </div>
	      <div class="modal-body">
	       <form  action="main/addUser?type=2"  method="post"  id="editUserForm">
    			<input   type="hidden"  name="registerUser.userId"  value=""  id="hiddenUserId"/>
		    <table  align="center" class="table">
		    		<tr>
		    			<td width="10%">&nbsp;</td>
		    			<td width="20%"  align="right">用户名<label  style="color: red">*</label></td>
		    			<td width="60%"><input  class="form-control" type="text"  name="registerUser.username"/></td>
		    			<td width="10%">&nbsp;</td>
		    		</tr>
		    		<tr>
		    			<td width="10%">&nbsp;</td>
		    			<td align="right">登录名<label  style="color: red">*</label></td>
		    			<td><input class="form-control"  type="text"  name="registerUser.loginName"/></td>
		    			<td width="10%">&nbsp;</td>
		    		</tr>
		    		<tr>
		    			<td width="10%">&nbsp;</td>
		    			<td  align="right">邮箱<label  style="color: green">*</label></td>
		    			<td><input class="form-control" type="text"  name="registerUser.email"  ></td>
		    			<td width="10%">&nbsp;</td>
		    		</tr>
		    		<tr>
		    			<td width="10%">&nbsp;</td>
		    			<td  align="right">手机号<label  style="color: green">*</label></td>
		    			<td><input  class="form-control" type="text"  name="registerUser.phone"  ></td>
		    			<td width="10%">&nbsp;</td>
		    		</tr>
		    		<tr>
		    			<td width="10%">&nbsp;</td>
		    			<td  align="right">用户类型<label  style="color: red">*</label></td>
		    			<td>
		    					<select  name="registerUser.userType" class="form-control" >
										<option value="1">普通用户</option>		    			
										<option value="2">普通管理员</option>		    			
										<option value="3">超级管理员</option>		    			
		    					</select>
		    			</td>
		    			<td width="10%">&nbsp;</td>
		    		</tr>
		    </table>
		    </form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary"  onclick="updateUser()">更新</button>
	      </div>
	      <script type="text/javascript">
				function updateUser(){
					$("#editUserForm").submit();					
				}	      
	      </script>
	    </div>
	  </div>
	</div>
    <script type="text/javascript">
    			function showEdit(userId,username,loginName,email,phone,usertype){
    				var  ss = $("#editUser #editUserForm table  tr");
    				console.log(ss[0]);
    				$("#hiddenUserId").val(userId);
    				$(ss[0]).find("input").val(username);
    				$(ss[1]).find("input").val(loginName);
    				$(ss[2]).find("input").val(email);
    				$(ss[3]).find("input").val(phone);
    				$(ss[4]).find("select").val(usertype);
    				
    				$("#editUser").modal();
    				
    				
    				
    			}
    
    
    </script>
    
  </body>
</html>

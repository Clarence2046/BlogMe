<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <form  action="visitme/doLogin"  method="post">
    <table  align="center">
    		<tr>
    			<td align="center" colspan="2">用户登录<br/><font  size="1"  color="red">${error }</font></td>
    		</tr>
		    
    		<tr>
    			<td>账号</td>
    			<td><input  type="text"  name="loginUser.loginName"  value="${registerUser.loginName }"  placeholder="登录名/邮箱"/></td>
    		</tr>
    		<tr>
    			<td>密码</td>
    			<td><input  type="password"  name="loginUser.password"   value=""></td>
    		</tr>
    		<tr >
    			<td colspan="2"><input  type="submit"  value="登录"></td>
    		</tr>
    </table>
    </form>
    <br>
  </body>
</html>

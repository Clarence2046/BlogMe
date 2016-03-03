<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <style>
<!--
tr td{
 text-align: right;
}
-->
</style>
  <body>
    <form  action="visitme/doRegister"  method="post">
    <table  align="center">
    		<tr>
    			<td><label  style="color: red">*</label>用户名</td>
    			<td><input  type="text"  name="registerUser.username"/></td>
    		</tr>
    		<tr>
    			<td><label  style="color: red">*</label>登录名</td>
    			<td><input  type="text"  name="registerUser.loginName"/></td>
    		</tr>
    		<tr>
    			<td><label  style="color: red">*</label>密&nbsp;&nbsp;码</td>
    			<td><input  type="password"  name="registerUser.password"></td>
    		</tr>
    		<tr>
    			<td><label  style="color: red">*</label>确认密码</td>
    			<td><input  type="password"  name="confirmpassword"  id="confirmpassword"></td>
    		</tr>
    		<tr>
    			<td>邮箱</td>
    			<td><input  type="text"  name="registerUser.email"  ></td>
    		</tr>
    		<tr>
    			<td>手机号</td>
    			<td><input  type="text"  name="registerUser.phone"  ></td>
    		</tr>
    		<tr >
    			<td colspan="2"><input  type="submit"  value="注册"></td>
    		</tr>
    </table>
    </form>
    <br>
  </body>
</html>

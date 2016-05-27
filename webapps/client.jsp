<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
    String bp = request.getServerName() + ":" + request.getServerPort()
			+ path ;
%>

<!DOCTYPE HTML>
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'client.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
	//验证浏览器是否支持WebSocket协议  
	if (!window.WebSocket) {
		alert("WebSockeet not supported by this browser!");
	}
	var ws;
	function display() {
		ws = new WebSocket("ws://<%=bp%>/ws1");
		//监听消息  
		ws.onmessage = function(event) {
			log(event.data);
		}

		//关闭WebSocket  
		ws.onclose = function(event) {
		}
		//打开WebSocket  
		ws.onopen = function(event) {
			ws.send("Hello,Server");
		}
		ws.onerror = function(event) {
		}
	}
	var log = function(s) {
		if (document.readyState !== "complete") {
			log.buffer.pust(s);
		} else {
			document.getElementById("contendId").innerHTML += (s + "\n");
		}
	}
	function sendMsg() {
		var msg = document.getElementById("messageId");
		ws.send(msg.value);
	}
</script>
</head>

<body onload="display();">
	<div id="valueLabel"></div>
	<textarea rows="20" cols="30" id="contendId"></textarea>
	<br />
	<input name="message" id="messageId" />
	<button id="sendButton" onClick="javascript:sendMsg()">Send</button>
</body>
</html>

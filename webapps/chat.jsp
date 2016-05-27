<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String bp = request.getServerName() + ":" + request.getServerPort()
			+ path;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'chat.jsp' starting page</title>

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
.mask {
	filter: alpha(opacity = 50);
	-moz-opacity: 0.5;
	-khtml-opacity: 0.5;
	opacity: 0.5;
	background-color: #d9d9d9;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0px;
	display: none;
	z-index: 10;
}
.demo {
	background-color: white;
	width: 300px;
	height: 200px;
	position: absolute;
	z-index: 9999;
	border:5px solid #d9ead3;
	display: none;
}

.close{
	background-image: url("images/close.jpg");
	background-position: -10px -10px;
	background-attachment:fixed;
	width: 20px;
	height: 20px;
}

html,body {
	margin: 0px;
}
-->
</style>
<body>
	<button name="btn" id="btn" onclick="openChatDialog('demo')" value="点我打开聊天窗口">点我打开聊天窗口</button>
	<br>
<!-- 	<div  class="mask" id="mask"> -->
<!-- 	</div> -->
	<div id="demo" style="display: none;">
		<div style="float: left;margin-top: 40px">
			<div id="valueLabel"></div>
			<textarea rows="6" cols="30" id="contendId"></textarea>
			<br /> <input name="message" id="messageId" />
			<button id="sendButton" onClick="javascript:sendMsg()">Send</button>
		</div>
		<div  style="float: right;position: absolute;margin-left: 270px;margin-top: 0px">11
		</div>
	</div>


</body>
<script type="text/javascript">
	

	function openChatDialog(id ) {
		var body = document.getElementsByTagName("body")[0];
		var demo = document.getElementById(id);
		//console.log(demo);
		demo.style.display = "block";
		
		var maskdiv = document.getElementById("mask");
		
		if(!maskdiv){
			var maskdiv = document.createElement("div");
			maskdiv.id="mask";
			maskdiv.setAttribute("class","mask");
			
			maskdiv.style.display = "block";
			
			body.appendChild(maskdiv);
		}else{
			maskdiv.style.display = "block";
		}
		
		var h = window.innerHeight;
		var w = window.innerWidth;
		demo.style.top = h/3;
		demo.style.left = w/3;
		
// 		background-color: white;
// 		width: 300px;
// 		height: 200px;
// 		position: absolute;
// 		z-index: 9999;
// 		border:5px solid #d9ead3;
// 		display: none;

		demo.style.background = "white";
		demo.style.width = "300px";
		demo.style.height = "200px";
		demo.style.position = "absolute";
		demo.style.zIndex = "9999";
		demo.style.border = "5px solid #d9ead3";
		
		
		var  closetag = document.getElementById("closetag");
		//第一次时 closetag 为 null  ,也就是false
		if(!closetag ){
		
			var  wrap = document.createElement("div");
			//float: right;position: absolute;margin-left: 270px;margin-top: 0px
			wrap.style.float = "right";
			wrap.style.position = "absolute";
			wrap.style.marginTop = "5px";
			wrap.style.marginLeft = "260px";
			demo.appendChild(wrap);
		
			var  closetag = document.createElement("img");
			closetag.src = "images/close.jpg";
			closetag.id = "closetag";
			closetag.style.width = "30px";
			closetag.style.height = "30px";
			closetag.onclick=function(){ 
				demo.style.display = "none";
				maskdiv.style.display = "none";
			};
			wrap.appendChild(closetag);
			display();
		}
	}

	//验证浏览器是否支持WebSocket协议  
	if (!window.WebSocket) {
		alert("WebSocket not supported by this browser!");
	}
	var ws;
	function display() {
		ws = new WebSocket("ws://<%=bp%>"+"/ws1");
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
</html>

package com.galaxy.taylor.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;


@ServerEndpoint("/wsan")
public class SocketAn {
	
	private static List<SocketAn>  sockets = new ArrayList<SocketAn>();
	
	private Session session;
	
	
	@OnOpen
	public void onOpen(Session session){
		this.session = session;
		sockets.add(this);
		System.out.println("new connection...");
	}
	@OnClose
	public void onClose(){
		sockets.remove(this);
		System.out.println("connection broken...");
	}
	
	@OnMessage
	public void onMessage(String message){
		System.out.println("new message: "+message);
		for (SocketAn socket :sockets) {
			try {
				socket.send(message);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
	public void send(String message) throws IOException{
		this.session.getBasicRemote().sendText(message);
	}

}

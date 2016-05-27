package com.galaxy.taylor.config;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.CloseReason;
import javax.websocket.Endpoint;
import javax.websocket.EndpointConfig;
import javax.websocket.MessageHandler;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;

import com.galaxy.taylor.util.MessageUtil;

public class EndPointC extends Endpoint {

	/*
	 * @Resource private IUserService userService;
	 */

	private static Map<String, Session> sockets = new ConcurrentHashMap<String, Session>();
	private static Map<String, List<MessageUtil>> msgs = new ConcurrentHashMap<String, List<MessageUtil>>();

	@Override
	public void onOpen(Session session, EndpointConfig ec) {


		final Basic remote = session.getBasicRemote();
		System.out.println("programmatic open...");
		
		Principal userPrincipal = session.getUserPrincipal();
		final String name  = "admin";
		if(userPrincipal!=null){
			//name = session.getUserPrincipal().getName();
			//sockets.put(name, session);
			
		}
		
		
		//获取离线消息
		List<MessageUtil> ml = msgs.get(name);
		if(ml!=null && ml.size()>0){
			Iterator<MessageUtil> iterator = ml.iterator();
			
			while (iterator.hasNext()) {
				MessageUtil messageUtil = iterator.next();
				try {
					remote.sendText("[" + messageUtil.getFrom() + "]: " + messageUtil.getContent());
					iterator.remove();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		

		session.addMessageHandler(new MessageHandler.Whole<String>() {

			@Override
			public void onMessage(String text) {
				System.out.println(text);
				String[] infos = new String[]{};
				Basic remote2 = null;
				if (text != null && text.contains("_user_")) {
					infos = text.split("_user_");
					System.out.println("2222222");
					Session session2 = sockets.get(infos[0]);
					if(session2==null){
						try {
							remote.sendText("对方不在线");
							
							List<MessageUtil> ms = msgs.get(infos[0]);
							if(ms==null){
								 ms = new ArrayList<MessageUtil>();
								 msgs.put(infos[0], ms);
							}
							MessageUtil mu  = new MessageUtil(name, infos[0], infos[1]);
							ms.add(mu);
							
							return;
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
					remote2 = session2.getBasicRemote();
					System.out.println(session2);
				}
				try {
					if (infos.length >= 2) {
						remote.sendText("   发送给" + infos[0]+ "的消息:" + infos[1]);
						remote2.sendText("[" + name + "]: " + infos[1]);
					} else {
						remote.sendText("收到来自[" + name + "]的消息:" + text);
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
			}

		});
	}

	@Override
	public void onError(Session session, Throwable thr) {
		// TODO Auto-generated method stub
		sockets.remove(session);
		super.onError(session, thr);
	}

	@Override
	public void onClose(Session session, CloseReason closeReason) {
		// TODO Auto-generated method stub
		sockets.remove(session);
		super.onClose(session, closeReason);
	}

}

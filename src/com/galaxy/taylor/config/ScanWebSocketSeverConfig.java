package com.galaxy.taylor.config;

import java.util.HashSet;
import java.util.Set;

import javax.websocket.Endpoint;
import javax.websocket.server.ServerApplicationConfig;
import javax.websocket.server.ServerEndpointConfig;


public class ScanWebSocketSeverConfig implements ServerApplicationConfig {

	/**
	 * Return a set of ServerEndpointConfig instances that the server container
	 * will use to deploy the programmatic endpoints.
	 */
	@Override
	public Set<ServerEndpointConfig> getEndpointConfigs(
			Set<Class<? extends Endpoint>> scanned) {
		System.out.println("服务器启动中......");

		Set<ServerEndpointConfig> result = new HashSet<ServerEndpointConfig>();
		System.out.println("scaned: " + scanned);

		if (scanned.contains(EndPointC.class)) {
			result.add(ServerEndpointConfig.Builder.create(
					EndPointC.class, "/ws1").build());
		}

		return result;
	}

	/**
	 * Return a set of annotated endpoint classes that the server container must
	 * deploy.
	 */
	@Override
	public Set<Class<?>> getAnnotatedEndpointClasses(Set<Class<?>> scanned) {
		System.out.println("[ServerApplicationConfig] 服务器启动中......");
		Set<Class<?>> results = new HashSet<Class<?>>();
		/*for (Class<?> clazz : scanned) {
			if (clazz.getPackage().getName()
					.startsWith("com.cn.taylor.controller")) {
				System.out.println("find end point : " + clazz.getName());
				results.add(clazz);
			}
		}*/
		return results;
	}
}
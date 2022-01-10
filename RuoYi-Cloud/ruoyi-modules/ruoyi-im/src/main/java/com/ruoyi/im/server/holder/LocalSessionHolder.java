package com.ruoyi.im.server.holder;

import java.util.concurrent.ConcurrentHashMap;

import com.ruoyi.im.server.session.LocalSession;

// 存储在线的用户Session
public class LocalSessionHolder {

	private static ConcurrentHashMap<String, LocalSession> serverSessions = new ConcurrentHashMap<>();

	public static void addServerSession(LocalSession serverSession){
		serverSessions.putIfAbsent(serverSession.getUser().getUid(),serverSession);
	}

	public static LocalSession getServerSession(String userId){
		return serverSessions.get(userId);
	}

	public static LocalSession removeServerSession(String userId){
		return serverSessions.remove(userId);
	}

	public static ConcurrentHashMap<String, LocalSession> getAll(){
		return serverSessions;
	}

}

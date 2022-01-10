package com.ruoyi.im.server.cach;


import com.ruoyi.im.domain.SessionCache;

public interface SessionCacheSupport {
	//保存连接信息
	void save(SessionCache s);

	//获取连接信息
	SessionCache get(String sessionId);

	//删除连接信息
	void remove(String sessionId);
}

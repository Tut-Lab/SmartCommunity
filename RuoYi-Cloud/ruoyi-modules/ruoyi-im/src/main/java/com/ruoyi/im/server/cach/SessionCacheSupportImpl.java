package com.ruoyi.im.server.cach;

import java.util.concurrent.TimeUnit;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.common.redis.service.RedisService;
import com.google.gson.Gson;
import com.ruoyi.im.domain.SessionCache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

@Component
public class SessionCacheSupportImpl implements SessionCacheSupport{
	public static final String REDIS_PREFIX = "SessionCache:id:";

	@Autowired
	private RedisService redisService;

	//2小时需要重新登录（秒）
	private static final long VALIDITY_TIME = 60 * 60 * 2;

	@Override
	public void save(SessionCache sessionCache)
	{
		String key = REDIS_PREFIX + sessionCache.getSessionId();
		String value = new Gson().toJson(sessionCache);
		redisService.setCacheObject(key, value, VALIDITY_TIME, TimeUnit.SECONDS);
	}


	@Override
	public SessionCache get(String sessionId)
	{
		String key = REDIS_PREFIX + sessionId;

		String value = redisService.getCacheObject(key).toString();

		if (!StringUtils.isEmpty(value))
		{
			return JSONObject.parseObject(value, SessionCache.class);
		}
		return null;
	}

	@Override
	public void remove( String sessionId)
	{
		String key = REDIS_PREFIX + sessionId;
		redisService.deleteObject(key);
	}
}

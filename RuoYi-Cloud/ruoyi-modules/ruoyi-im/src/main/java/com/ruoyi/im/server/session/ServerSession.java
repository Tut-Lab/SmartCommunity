package com.ruoyi.im.server.session;


import com.ruoyi.im.domain.MsgDto;

public interface ServerSession {
	/**
	 * 发送消息
	 * @param pkg 消息
	 */
	boolean writeAndFlush(MsgDto pkg);

	/**
	 * 获取sessionId
	 * @return
	 */
	String getSessionId();

	/**
	 * 是否有效
	 * @return
	 */
	boolean isValid();

	/**
	 * 获获取用户
	 * @return  用户id
	 */
	String getUserId();
}

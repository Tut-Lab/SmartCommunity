package com.ruoyi.im.server.session;

import com.ruoyi.im.domain.MsgDto;
import com.ruoyi.im.domain.SessionCache;
import lombok.Data;

@Data
public class RemoteSession implements ServerSession {
	private SessionCache sessionCache;

	public RemoteSession(SessionCache sessionCache) {
		this.sessionCache = sessionCache;
	}

	@Override
	public boolean writeAndFlush(MsgDto msg) {
		long id = sessionCache.getServerNode().getId();
//		ServerPeerSender serverPeerSender = ServerRouterWorker.instance().router(id);
//		serverPeerSender.getChannel().writeAndFlush(new Gson().toJson(msg)+"\n");
		return true;
	}

	@Override
	public String getSessionId() {
		return null;
	}

	@Override
	public boolean isValid() {
		return false;
	}

	@Override
	public String getUserId() {
		return null;
	}
}

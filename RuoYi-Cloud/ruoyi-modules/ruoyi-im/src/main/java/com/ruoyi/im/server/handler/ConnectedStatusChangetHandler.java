package com.ruoyi.im.server.handler;

import com.ruoyi.im.server.cach.SessionCacheSupport;
import com.ruoyi.im.server.holder.LocalSessionHolder;
import com.ruoyi.im.server.session.LocalSession;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.util.AttributeKey;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@ChannelHandler.Sharable
public class ConnectedStatusChangetHandler extends ChannelInboundHandlerAdapter {

	private static final Logger log = LoggerFactory.getLogger(ConnectedStatusChangetHandler.class);

	public static final AttributeKey<LocalSession> SESSION_KEY = AttributeKey.valueOf("SESSION_KEY");

	@Autowired
	private SessionCacheSupport sessionCacheSupport;


	@Override
	public void channelActive(ChannelHandlerContext ctx) throws Exception {
		log.error("================新的连接建立----Status =================");
		super.channelActive(ctx);
	}


	@Override
	public void channelInactive(ChannelHandlerContext ctx) throws Exception {
		log.error("=================连接断开-----Status ====================");
		LocalSession localSession = ctx.channel().attr(SESSION_KEY).get();
		if (null != localSession)
		{
			String uid = localSession.getUser().getUid();
			LocalSessionHolder.removeServerSession(uid);
			sessionCacheSupport.remove(localSession.getSessionId());
		}
		super.channelInactive(ctx);
	}

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
		// super.exceptionCaught(ctx, cause);
		log.error("===================发生异常----Status =============");
		ctx.close();
	}


}

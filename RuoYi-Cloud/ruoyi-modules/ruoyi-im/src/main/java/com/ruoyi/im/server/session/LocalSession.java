package com.ruoyi.im.server.session;

import java.util.UUID;

import com.alibaba.fastjson.JSON;
import com.ruoyi.im.domain.Msg;
import com.ruoyi.im.domain.MsgDto;
import com.ruoyi.im.domain.User;
import com.ruoyi.im.server.holder.LocalSessionHolder;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import io.netty.util.AttributeKey;
import lombok.Data;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//@Slf4j
@Data
public class LocalSession implements ServerSession {

	private static final Logger log = LoggerFactory.getLogger(LocalSession.class);


	public static final AttributeKey<String> KEY_USER_ID = AttributeKey.valueOf("key_user_id");

	public static final AttributeKey<LocalSession> SESSION_KEY = AttributeKey.valueOf("SESSION_KEY");

	//通道
	private Channel channel;

	//用户
	private User user;

	//sessionId
	private final String sessionId;

	//是否登录
	private boolean isLogin = false;

	public LocalSession(Channel channel) {
		this.channel = channel;
		this.sessionId = buildNewSessionId();
	}

	@Override
	public boolean writeAndFlush(MsgDto msgObject) {
		String toUserId = msgObject.getToUserId();
		LocalSession localSession = LocalSessionHolder.getServerSession(toUserId);
		if(localSession== null){
			return false;
		}else {
			User user = msgObject.getUser();
			Msg msg = Msg.builder(Msg.MsgType.CHAT, user)
					.setContent(msgObject.getContent())
					.setSuccess(true)
					.setToUserId(toUserId)
					.setSendContent(msgObject.getSendContent())
					.build();
			localSession.getChannel().writeAndFlush(new TextWebSocketFrame(JSON.toJSONString(msg)));
			return true;
		}
	}

	@Override
	public String getSessionId() {
		return null;
	}
	@Override
	public boolean isValid() {
		return getUser() != null ? true : false;
	}


	@Override
	public String getUserId() {
		return user.getUid();
	}

	private static String buildNewSessionId() {
		String uuid = UUID.randomUUID().toString();
		return uuid.replaceAll("-", "");
	}
	//反向导航
	public static LocalSession getSession(ChannelHandlerContext ctx) {
		Channel channel = ctx.channel();
		return channel.attr(LocalSession.SESSION_KEY).get();
	}

	/**
	 * ServerSession 绑定会话
	 */
	public LocalSession bind() {
		log.info(" ServerSession 绑定会话 " + channel.remoteAddress());
		channel.attr(LocalSession.SESSION_KEY).set(this);
		LocalSessionHolder.addServerSession(this);
		isLogin = true;
		return this;
	}

	public static void closeSession(ChannelHandlerContext ctx) {
		LocalSession session =
				ctx.channel().attr(LocalSession.SESSION_KEY).get();

		if (null != session && session.isValid()) {
			session.close();
			LocalSessionHolder.removeServerSession(session.getUser().getUid());
		}
	}


	public synchronized void close() {
		channel.close();
	}
}

package com.ruoyi.im.server.handler;

import java.util.concurrent.ConcurrentHashMap;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.im.domain.Msg;
import com.ruoyi.im.domain.MsgDto;
import com.ruoyi.im.server.holder.LocalSessionHolder;
import com.ruoyi.im.server.session.LocalSession;
import com.ruoyi.im.server.session.ServerSession;
import com.ruoyi.im.server.manager.ServerSessionManager;
import com.google.gson.Gson;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@ChannelHandler.Sharable
public class ChatRedirectHandler extends ChannelInboundHandlerAdapter {


	private static final Logger log = LoggerFactory.getLogger(ChatRedirectHandler.class);


	@Autowired
	private ServerSessionManager serverSessionManager ;
	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
		MsgDto msgObject = JSONObject.parseObject(msg.toString(), MsgDto.class);
		//判断消息实例
		if (null == msg || (msgObject.getMsgType()!= Msg.MsgType.CHAT)) {
			super.channelRead(ctx, msg);
			return;
		}
		//反向导航
		LocalSession session = ctx.channel().attr(LocalSession.SESSION_KEY).get();

		//判断是否登录
		if (null == session || !session.isLogin()) {
			log.error("用户尚未登录，不能发送消息");
			return;
		}
		this.action(msgObject,ctx);
	}

	private void action(MsgDto msgObject,ChannelHandlerContext context) {
		String toUserId = msgObject.getToUserId();
		//判断
		if("ALL".equals(toUserId)){
			//发送本地
			ConcurrentHashMap<String, LocalSession> allLocal = LocalSessionHolder.getAll();
			for(String key : allLocal.keySet()) {
				allLocal.get(key).getChannel().writeAndFlush(new Gson().toJson(msgObject)+"\n");
			}
			/*
			//处理远程
			ConcurrentHashMap<Long, ServerPeerSender> allRemote = ServerPeerSenderHolder.getAll();
			for(Long key : allRemote.keySet()) {
				allRemote.get(key).getChannel().writeAndFlush(new Gson().toJson(msgObject)+"\n");
			}*/
		}else {

			ServerSession serverSession = serverSessionManager.getServerSession(toUserId);

			if(serverSession == null){
				this.sentNotOnlineMsg(msgObject,toUserId,context);
			}else {
				boolean result = serverSession.writeAndFlush(msgObject);
				if(!result){

				}
			}
		}

	}

	/**
	 * 告知客户端用户不在线
	 * @param msgObject
	 * @param toUserId
	 * @param context
	 */
	private void sentNotOnlineMsg(MsgDto msgObject,String toUserId,ChannelHandlerContext context) {
		Msg msg = Msg.builder(Msg.MsgType.CHAT, msgObject.getUser())
				.setContent("[" + toUserId + "] 不在线，发送失败!")
				.setSuccess(false)
				.build();
		context.channel().writeAndFlush(new Gson().toJson(msg)+"\n");
		log.error("[\" + {} + \"] 不在线，发送失败!",toUserId);
	}
}

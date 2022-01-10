package com.ruoyi.im.server.handler;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.im.domain.Msg;
import com.ruoyi.im.domain.MsgDto;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@ChannelHandler.Sharable
public class NoticeServerHandler extends ChannelInboundHandlerAdapter {

	private static final Logger log = LoggerFactory.getLogger(NoticeServerHandler.class);

	public void channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {

		MsgDto msgObject = JSONObject.parseObject(msg.toString(), MsgDto.class);
		log.info("收到服务事件通知"+msg);
		//判断消息实例
		if (null == msg || (msgObject.getMsgType()!= Msg.MsgType.SERVER_NOTICE)) {
			super.channelRead(ctx, msg);
			return;
		}
		//增加心跳handler
		ctx.pipeline().addAfter("login","clientServerHeartBeat",new ClientServerHeartBeatHandler());
		//移除登录handler
		ctx.pipeline().remove("login");
		//移除通知handler
		ctx.pipeline().remove(this);
	}
}

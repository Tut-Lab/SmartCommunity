package com.ruoyi.im.server.handler.client;

import com.ruoyi.im.server.handler.ChatRedirectHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class ServerExceptionHandler extends ChannelInboundHandlerAdapter {

	private static final Logger log = LoggerFactory.getLogger(ServerExceptionHandler.class);

	@Override
	public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception
	{
		//捕捉异常信息
		cause.printStackTrace();
		log.error(cause.getMessage());
		ctx.close();
	}

	/**
	 * 通道 Read 读取 Complete 完成
	 * 做刷新操作 ctx.flush()
	 */
	public void channelReadComplete(ChannelHandlerContext ctx) throws Exception
	{
		ctx.flush();
	}
}

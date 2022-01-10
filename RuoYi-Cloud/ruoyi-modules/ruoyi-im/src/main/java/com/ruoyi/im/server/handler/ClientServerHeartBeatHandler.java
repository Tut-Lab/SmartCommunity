package com.ruoyi.im.server.handler;

import java.util.concurrent.TimeUnit;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.ruoyi.im.domain.Msg;
import com.ruoyi.im.domain.MsgDto;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.timeout.IdleStateEvent;
import io.netty.handler.timeout.IdleStateHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class ClientServerHeartBeatHandler extends IdleStateHandler {

    private static final Logger log = LoggerFactory.getLogger(ClientServerHeartBeatHandler.class);


    private static final int READ_IDLE_GAP = 150;

    public ClientServerHeartBeatHandler() {
        super(READ_IDLE_GAP, 0, 0, TimeUnit.SECONDS);

    }

    public void channelRead(ChannelHandlerContext ctx, Object msg)
            throws Exception {
        MsgDto msgObject = JSONObject.parseObject(msg.toString(), MsgDto.class);
        //判断消息实例
        if (null == msgObject || msgObject.getMsgType()!= Msg.MsgType.HEART_PING) {
            super.channelRead(ctx, msg);
            return;
        }
        Msg pongMsg = Msg.builder()
            .setMsgType(Msg.MsgType.HEART_PONG)
            .setContent("client pong......")
            .build();
        if (ctx.channel().isActive()) {
            //logger.info(msgObject.getContent());
            //将心跳包，直接回复给客户端
            //logger.info("client pone.......");
            ctx.writeAndFlush(new Gson().toJson(pongMsg)+"\n");
        }
        super.channelRead(ctx, msg);
    }

    @Override
    protected void channelIdle(ChannelHandlerContext ctx, IdleStateEvent evt) throws Exception {
        log.info(READ_IDLE_GAP + "秒内未读到数据，关闭连接");
        //fixme 关闭连接处理
    }
}

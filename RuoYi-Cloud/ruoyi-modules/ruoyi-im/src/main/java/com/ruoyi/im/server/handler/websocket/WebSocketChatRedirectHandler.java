package com.ruoyi.im.server.handler.websocket;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.im.domain.Msg;
import com.ruoyi.im.domain.MsgDto;
import com.ruoyi.im.domain.User;
import com.ruoyi.im.server.holder.LocalSessionHolder;
import com.ruoyi.im.server.manager.ServerSessionManager;
import com.ruoyi.im.server.session.LocalSession;
import com.ruoyi.im.server.session.ServerSession;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.concurrent.ConcurrentHashMap;


@Component
@ChannelHandler.Sharable
public class WebSocketChatRedirectHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {

    private static final Logger log = LoggerFactory.getLogger(WebSocketChatRedirectHandler.class);

    @Autowired
    private ServerSessionManager serverSessionManager ;


    @Override
    protected void channelRead0(ChannelHandlerContext ctx, TextWebSocketFrame obj) throws Exception {

        String text = obj.text();
        MsgDto msgDto = JSONObject.parseObject(text, MsgDto.class);
        if(obj == null || msgDto.getMsgType() != Msg.MsgType.CHAT)
        {
            return;
        }

        LocalSession localSession = ctx.channel().attr(LocalSession.SESSION_KEY).get();

        if(null == localSession)
        {
            log.error("=================当前用户未绑定channel，进行重新绑定!===============");
            User user = msgDto.getUser();
            LocalSession serverSession = new LocalSession(ctx.channel());
            serverSession.setUser(user);
            serverSession.bind();
            serverSessionManager.addServerSession(serverSession);
            log.error(serverSession.getUser().getNickName()+"绑定channel成功!");
            this.sengLoginResponse(ctx,msgDto,true);
        }

        // 进行信息转发
        this.action(msgDto, ctx);
    }


    private void action(MsgDto msgObject,ChannelHandlerContext context) {
        String toUserId = msgObject.getToUserId();
        //判断
        if("ALL".equals(toUserId)){
            //发送本地
            ConcurrentHashMap<String, LocalSession> allLocal = LocalSessionHolder.getAll();
            for(String key : allLocal.keySet()) {
                allLocal.get(key).getChannel().writeAndFlush(new TextWebSocketFrame(JSON.toJSONString(msgObject)));
            }
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
        context.writeAndFlush(new TextWebSocketFrame(JSON.toJSONString(msg)));

        log.error("[\" + {} + \"] 不在线，发送失败!",toUserId);
    }


    private void sengLoginResponse(ChannelHandlerContext context,MsgDto msgObject,boolean validateflag) {
        Msg msg = Msg.builder(Msg.MsgType.LOGIN_RESPONSE, msgObject.getUser())
                .setSuccess(validateflag)
                .build();
        Channel channel = context.channel();
        channel.writeAndFlush(new TextWebSocketFrame(JSON.toJSONString(msg)));
    }
}

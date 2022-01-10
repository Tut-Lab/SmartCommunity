package com.ruoyi.im.server.handler.websocket;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.ruoyi.im.domain.Msg;
import com.ruoyi.im.domain.MsgDto;
import com.ruoyi.im.domain.User;
import com.ruoyi.im.server.manager.ServerSessionManager;
import com.ruoyi.im.server.session.LocalSession;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.SimpleChannelInboundHandler;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@ChannelHandler.Sharable
public class WebSocketBindServerSessionHandler extends SimpleChannelInboundHandler<TextWebSocketFrame> {

    private static final Logger log = LoggerFactory.getLogger(WebSocketBindServerSessionHandler.class);

    @Autowired
    private ServerSessionManager serverSessionManager ;

    @Autowired
    private WebSocketChatRedirectHandler webSocketChatRedirectHandler;

    @Override
    protected void channelRead0(ChannelHandlerContext ctx, TextWebSocketFrame msg) throws Exception {
        String text = msg.text();
        MsgDto msgObject = JSONObject.parseObject(text, MsgDto.class);
        User user = msgObject.getUser();
        // 判断消息实例
        if(msgObject.getMsgType() == Msg.MsgType.CONNECT_SERVER)
        {
            LocalSession serverSession = new LocalSession(ctx.channel());
            serverSession.setUser(user);
            log.error(serverSession.getUser().getNickName()+"连接netty服务成功!");
            serverSession.bind();
            serverSessionManager.addServerSession(serverSession);
            this.sengLoginResponse(ctx,msgObject,true);
            // {"msgType":"CHAT","user":{"uid":"吴磊","devId":"5f5c4cdd-fa3e-437a-99eb-90d6995fea38","token":"12306","nickName":"吴磊","platform":"WEB"},"success":true, "toUserId": "小孔", "content": "12314545"}
            // 添加聊天handler
            ctx.pipeline().addAfter("bindServerSession", "chat", webSocketChatRedirectHandler);

            // 已出bindServerSession Handler
            ctx.pipeline().remove("bindServerSession");
        }
        else
        {
            return;
        }
    }

    private boolean validateUser(String nickName, String token) {
        //fixme 验证用户登录信息
        log.info("用户{}请求登录，token为{}",nickName,token);
        return true;
    }

    private void sengLoginResponse(ChannelHandlerContext context,MsgDto msgObject,boolean validateflag) {
        Msg msg = Msg.builder(Msg.MsgType.LOGIN_RESPONSE, msgObject.getUser())
                .setSuccess(validateflag)
                .build();
        Channel channel = context.channel();
        channel.writeAndFlush(new TextWebSocketFrame(JSON.toJSONString(msg)));
    }

}

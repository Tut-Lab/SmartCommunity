package com.ruoyi.im.server.handler;

import com.alibaba.fastjson.JSONObject;
import com.ruoyi.im.domain.Msg;
import com.ruoyi.im.domain.MsgDto;
import com.ruoyi.im.domain.User;
import com.ruoyi.im.server.session.LocalSession;
import com.ruoyi.im.server.manager.ServerSessionManager;
import com.google.gson.Gson;
import io.netty.channel.Channel;
import io.netty.channel.ChannelHandler;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
@ChannelHandler.Sharable
public class LoginRequestHandler extends ChannelInboundHandlerAdapter {

    private static final Logger log = LoggerFactory.getLogger(LoginRequestHandler.class);


    @Autowired
    private ServerSessionManager serverSessionManager ;
    @Autowired
    private LogoutRequestHandler logoutRequestHandler;
    @Autowired
    private ChatRedirectHandler chatRedirectHandler ;

    @Override
    public void channelRead(ChannelHandlerContext ctx, Object msg)
            throws Exception {
        MsgDto msgObject = JSONObject.parseObject(msg.toString(), MsgDto.class);

        //判断消息实例
        if (null == msg || (msgObject.getMsgType()!= Msg.MsgType.LOGIN_REQUEST)) {
            super.channelRead(ctx, msg);
            return;
        }
        log.info("收到登录消息"+ msg);
        //fixme 验证认证信息
        User user = msgObject.getUser();
        String nickName = user.getNickName();
//        String token = user.getToken();
        String token = "";
        boolean validateflag = this.validateUser(nickName, token);
        if(!validateflag){
            this.sengLoginResponse(ctx,msgObject,validateflag);
        }
        //保存channel信息
        LocalSession serverSession = new LocalSession(ctx.channel());
        serverSession.setUser(user);
        log.error(serverSession.getUser().getNickName()+"登录成功!");
        serverSession.bind();

        //连接信息保存至redis数据库
        serverSessionManager.addServerSession(serverSession);

        this.sengLoginResponse(ctx,msgObject,true);

        //增加心跳handler
        ctx.pipeline().addAfter("login", "heartBeat",new HeartBeatServerHandler());
        //增加退出的handler
        ctx.pipeline().addAfter("login","logout",logoutRequestHandler);
        //增加聊天的handler
        ctx.pipeline().addAfter("logout", "chat",  chatRedirectHandler);
        //移除登录handler
        ctx.pipeline().remove("login");
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
        channel.writeAndFlush(new Gson().toJson(msg)+"\r\n");
    }
}

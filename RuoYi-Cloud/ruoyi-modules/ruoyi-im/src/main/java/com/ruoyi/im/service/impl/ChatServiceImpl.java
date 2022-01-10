package com.ruoyi.im.service.impl;

import com.alibaba.fastjson.JSON;
import com.ruoyi.im.domain.Msg;
import com.ruoyi.im.domain.MsgDto;
import com.ruoyi.im.server.holder.LocalSessionHolder;
import com.ruoyi.im.server.manager.ServerSessionManager;
import com.ruoyi.im.server.session.LocalSession;
import com.ruoyi.im.server.session.ServerSession;
import com.ruoyi.im.service.ChatService;
import io.netty.channel.Channel;
import io.netty.handler.codec.http.websocketx.TextWebSocketFrame;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.concurrent.ConcurrentHashMap;


@Service
public class ChatServiceImpl implements ChatService {

    private static final Logger log = LoggerFactory.getLogger(ChatServiceImpl.class);

    @Autowired
    private ServerSessionManager serverSessionManager ;


    @Override
    public int sendmsg(MsgDto msgDto) {
        String toUserId = msgDto.getToUserId();
        //判断
        if("ALL".equals(toUserId)){
            //发送本地
            ConcurrentHashMap<String, LocalSession> allLocal = LocalSessionHolder.getAll();
            for(String key : allLocal.keySet()) {
                allLocal.get(key).getChannel().writeAndFlush(new TextWebSocketFrame(JSON.toJSONString(msgDto)));
            }
            /*//处理远程
            ConcurrentHashMap<Long, ServerPeerSender> allRemote = ServerPeerSenderHolder.getAll();
            for(Long key : allRemote.keySet()) {
                allRemote.get(key).getChannel().writeAndFlush(new Gson().toJson(msgDto)+"\n");
            }*/
            return 1;
        }else {
            ServerSession serverSession = serverSessionManager.getServerSession(toUserId);
            if(serverSession == null){ // 不在线 可以放入消息队列
                String fromUid = msgDto.getUser().getUid();
                LocalSession localSession = LocalSessionHolder.getServerSession(fromUid);
                this.sentNotOnlineMsg(msgDto,toUserId,localSession.getChannel());
                return 1;
            }else {
                boolean result = serverSession.writeAndFlush(msgDto);
                if(!result){

                }
                return 1;
            }
        }
    }


    /**
     * 告知客户端用户不在线
     * @param msgObject
     * @param toUserId
     * @param channel
     */
    private void sentNotOnlineMsg(MsgDto msgObject, String toUserId, Channel channel) {
        Msg msg = Msg.builder(Msg.MsgType.CHAT, msgObject.getUser())
                .setContent("[" + toUserId + "] 不在线，发送失败!")
                .setSuccess(false)
                .build();
        channel.writeAndFlush(new TextWebSocketFrame(JSON.toJSONString(msg)));
        log.error("[\" + {} + \"] 不在线，发送失败!",toUserId);
    }
}

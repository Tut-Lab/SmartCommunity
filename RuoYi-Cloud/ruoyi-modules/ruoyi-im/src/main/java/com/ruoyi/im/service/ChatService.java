package com.ruoyi.im.service;


import com.ruoyi.im.domain.MsgDto;

public interface ChatService {
    // 点对点发送消息
    public int sendmsg(MsgDto msgDto);

}

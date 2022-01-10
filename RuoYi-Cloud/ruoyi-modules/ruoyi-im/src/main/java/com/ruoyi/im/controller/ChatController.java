package com.ruoyi.im.controller;


import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.im.domain.MsgDto;
import com.ruoyi.im.service.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/chat")
public class ChatController {

    @Autowired
    private ChatService chatService;

    @PostMapping("/chatAction")
    public AjaxResult chatAction(@RequestBody MsgDto msgDto)
    {
        int sendmsg = chatService.sendmsg(msgDto);
        return AjaxResult.success(sendmsg);
    }

    @GetMapping("/test")
    public AjaxResult test()
    {
        return AjaxResult.success(1);
    }
}

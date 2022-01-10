package com.ruoyi.im.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.util.Date;

@Data
public class SendContent {
    /** 消息类型 1-普通文本信息 2-语音信息 3-链接信息 4-视频图片信息 5-表情信息 */
    private Integer type;

    /** 聊天内容 */
    private String content;

    /** 发送时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date sendTime;
}

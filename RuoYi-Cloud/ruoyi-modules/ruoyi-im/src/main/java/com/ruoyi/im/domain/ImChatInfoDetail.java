package com.ruoyi.im.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 聊天记录对象 im_chat_info_detail
 *
 * @author ruoyi
 * @date 2021-12-11
 */
public class ImChatInfoDetail extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long chatDetailId;

    /** 聊天id */
    @Excel(name = "聊天id")
    private String chatId;

    /** 用户id */
    @Excel(name = "用户id")
    private String userId;

    /** 消息类型 1-普通文本信息 2-语音信息 3-链接信息 4-视频图片信息 5-表情信息 */
    @Excel(name = "消息类型 1-普通文本信息 2-语音信息 3-链接信息 4-视频图片信息 5-表情信息")
    private Integer type;

    /** 聊天内容 */
    @Excel(name = "聊天内容")
    private String content;

    /** 发送时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "发送时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date sendTime;

    /** 是否是最后一条信息 0-不是 1-是 */
    @Excel(name = "是否是最后一条信息 0-不是 1-是")
    private Integer latest;

    /** 是否删除 0-否 1-是 */
    @Excel(name = "是否删除 0-否 1-是")
    private Integer state;

    /** 是否撤回 0-否 1-是 */
    @Excel(name = "是否撤回 0-否 1-是")
    private Integer recall;

    /** 接收状态 1-已接受 0-未接收 */
    @Excel(name = "接收状态 1-已接受 0-未接收")
    private Integer receive;

    private Integer self;

    public Integer getSelf() {
        return self;
    }

    public void setSelf(Integer self) {
        this.self = self;
    }

    public void setChatDetailId(Long chatDetailId)
    {
        this.chatDetailId = chatDetailId;
    }

    public Long getChatDetailId()
    {
        return chatDetailId;
    }
    public void setChatId(String chatId)
    {
        this.chatId = chatId;
    }

    public String getChatId()
    {
        return chatId;
    }
    public void setUserId(String userId)
    {
        this.userId = userId;
    }

    public String getUserId()
    {
        return userId;
    }
    public void setType(Integer type)
    {
        this.type = type;
    }

    public Integer getType()
    {
        return type;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setSendTime(Date sendTime)
    {
        this.sendTime = sendTime;
    }

    public Date getSendTime()
    {
        return sendTime;
    }
    public void setLatest(Integer latest)
    {
        this.latest = latest;
    }

    public Integer getLatest()
    {
        return latest;
    }
    public void setState(Integer state)
    {
        this.state = state;
    }

    public Integer getState()
    {
        return state;
    }
    public void setRecall(Integer recall)
    {
        this.recall = recall;
    }

    public Integer getRecall()
    {
        return recall;
    }
    public void setReceive(Integer receive)
    {
        this.receive = receive;
    }

    public Integer getReceive()
    {
        return receive;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("chatDetailId", getChatDetailId())
                .append("chatId", getChatId())
                .append("userId", getUserId())
                .append("type", getType())
                .append("content", getContent())
                .append("sendTime", getSendTime())
                .append("latest", getLatest())
                .append("state", getState())
                .append("recall", getRecall())
                .append("receive", getReceive())
                .toString();
    }
}
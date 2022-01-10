package com.ruoyi.im.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 聊天列表对象 im_chat_info
 *
 * @author ruoyi
 * @date 2021-12-11
 */
public class ImChatInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String chatId;

    /** 用户id */
    @Excel(name = "用户id")
    private String userId;

    /** 朋友id */
    @Excel(name = "朋友id")
    private String friendId;

    /** 对方是否在线 1-在线 0-不在线 */
    @Excel(name = "对方是否在线 1-在线 0-不在线")
    private Integer online;

    /** 未读数 */
    @Excel(name = "未读数")
    private Integer unread;

    /** 是否删除 0-未删除 1-删除 */
    @Excel(name = "是否删除 0-未删除 1-删除")
    private Integer state;

    /** 是否隐藏 0-未隐藏 1-隐藏 */
    @Excel(name = "是否隐藏 0-未隐藏 1-隐藏")
    private Integer hide;

    /** 1-点对点聊天 2-群聊 */
    @Excel(name = "1-点对点聊天 2-群聊")
    private Integer type;

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
    public void setFriendId(String friendId)
    {
        this.friendId = friendId;
    }

    public String getFriendId()
    {
        return friendId;
    }
    public void setOnline(Integer online)
    {
        this.online = online;
    }

    public Integer getOnline()
    {
        return online;
    }
    public void setUnread(Integer unread)
    {
        this.unread = unread;
    }

    public Integer getUnread()
    {
        return unread;
    }
    public void setState(Integer state)
    {
        this.state = state;
    }

    public Integer getState()
    {
        return state;
    }
    public void setHide(Integer hide)
    {
        this.hide = hide;
    }

    public Integer getHide()
    {
        return hide;
    }
    public void setType(Integer type)
    {
        this.type = type;
    }

    public Integer getType()
    {
        return type;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("chatId", getChatId())
                .append("userId", getUserId())
                .append("friendId", getFriendId())
                .append("online", getOnline())
                .append("unread", getUnread())
                .append("state", getState())
                .append("hide", getHide())
                .append("type", getType())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
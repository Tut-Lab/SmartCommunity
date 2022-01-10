package com.ruoyi.im.domain;

import com.ruoyi.system.api.domain.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 *
 * @author ruoyi
 * @date 2021-12-11
 */
public class ImUserFriend extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String relationId;

    /** 用户id */
    @Excel(name = "用户id")
    private String userId;

    /** 朋友id */
    @Excel(name = "朋友id")
    private String friendId;

    /** 备注 */
    @Excel(name = "备注")
    private String remarkContent;

    /** 标签 */
    @Excel(name = "标签")
    private String label;

    /** 朋友权限 1-朋友圈，聊天 2-仅聊天 */
    @Excel(name = "朋友权限 1-朋友圈，聊天 2-仅聊天")
    private String authority;

    /** 1-不让他看 2-不看他 */
    @Excel(name = "1-不让他看 2-不看他")
    private String shareState;

    /** 通过什么添加好友 0-手机号 1-账号 2-群 */
    @Excel(name = "通过什么添加好友 0-手机号 1-账号 2-群")
    private String origin;

    private SysUser sysUser;

    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    public void setRelationId(String relationId)
    {
        this.relationId = relationId;
    }

    public String getRelationId()
    {
        return relationId;
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
    public void setRemarkContent(String remarkContent)
    {
        this.remarkContent = remarkContent;
    }

    public String getRemarkContent()
    {
        return remarkContent;
    }
    public void setLabel(String label)
    {
        this.label = label;
    }

    public String getLabel()
    {
        return label;
    }
    public void setAuthority(String authority)
    {
        this.authority = authority;
    }

    public String getAuthority()
    {
        return authority;
    }
    public void setShareState(String shareState)
    {
        this.shareState = shareState;
    }

    public String getShareState()
    {
        return shareState;
    }
    public void setOrigin(String origin)
    {
        this.origin = origin;
    }

    public String getOrigin()
    {
        return origin;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
                .append("relationId", getRelationId())
                .append("userId", getUserId())
                .append("friendId", getFriendId())
                .append("remarkContent", getRemarkContent())
                .append("label", getLabel())
                .append("authority", getAuthority())
                .append("shareState", getShareState())
                .append("origin", getOrigin())
                .toString();
    }
}
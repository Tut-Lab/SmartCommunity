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
public class ImAddFriendApply extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private String applyId;

    /** 请求者用户Id */
    @Excel(name = "请求者用户Id")
    private String reqUserId;

    /** 被请求者用户id */
    @Excel(name = "被请求者用户id")
    private String resUserId;

    /** 申请时的请求内容 */
    @Excel(name = "申请时的请求内容")
    private String applyContent;

    /** 备注名称 */
    @Excel(name = "备注名称")
    private String remarkContent;

    /** 申请状态 1-申请发起 2-申请通过 0-申请被拒绝 */
    @Excel(name = "申请状态 1-申请发起 2-申请通过 0-申请被拒绝")
    private Integer applyState;

    /** 通过什么添加好友 0-手机号 1-账号 2-群 */
    @Excel(name = "通过什么添加好友 0-手机号 1-账号 2-群")
    private String origin;

    // 完成添加请求时的备注
    private String myRemarkContent;

    private SysUser sysUser;

    public String getMyRemarkContent() {
        return myRemarkContent;
    }

    public void setMyRemarkContent(String myRemarkContent) {
        this.myRemarkContent = myRemarkContent;
    }

    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    public void setApplyId(String applyId)
    {
        this.applyId = applyId;
    }

    public String getApplyId()
    {
        return applyId;
    }
    public void setReqUserId(String reqUserId)
    {
        this.reqUserId = reqUserId;
    }

    public String getReqUserId()
    {
        return reqUserId;
    }
    public void setResUserId(String resUserId)
    {
        this.resUserId = resUserId;
    }

    public String getResUserId()
    {
        return resUserId;
    }
    public void setApplyContent(String applyContent)
    {
        this.applyContent = applyContent;
    }

    public String getApplyContent()
    {
        return applyContent;
    }
    public void setRemarkContent(String remarkContent)
    {
        this.remarkContent = remarkContent;
    }

    public String getRemarkContent()
    {
        return remarkContent;
    }
    public void setApplyState(Integer applyState)
    {
        this.applyState = applyState;
    }

    public Integer getApplyState()
    {
        return applyState;
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
                .append("applyId", getApplyId())
                .append("reqUserId", getReqUserId())
                .append("resUserId", getResUserId())
                .append("applyContent", getApplyContent())
                .append("remarkContent", getRemarkContent())
                .append("applyState", getApplyState())
                .append("origin", getOrigin())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
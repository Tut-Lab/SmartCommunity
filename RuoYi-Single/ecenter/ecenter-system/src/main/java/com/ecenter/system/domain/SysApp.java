package com.ecenter.system.domain;

import com.ecenter.common.annotation.Excel;
import com.ecenter.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class SysApp extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 应用id uuid */
    private String appId;

    /** 应用名称 */
    @Excel(name = "应用名称")
    private String appName;

    /** 应用地址 */
    @Excel(name = "应用地址")
    private String appUrl;

    /** 类型 */
    @Excel(name = "类型")
    private Integer type;

    public void setAppId(String appId)
    {
        this.appId = appId;
    }

    public String getAppId()
    {
        return appId;
    }
    public void setAppName(String appName)
    {
        this.appName = appName;
    }

    public String getAppName()
    {
        return appName;
    }
    public void setAppUrl(String appUrl)
    {
        this.appUrl = appUrl;
    }

    public String getAppUrl()
    {
        return appUrl;
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
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("appId", getAppId())
                .append("appName", getAppName())
                .append("appUrl", getAppUrl())
                .append("type", getType())
                .toString();
    }
}
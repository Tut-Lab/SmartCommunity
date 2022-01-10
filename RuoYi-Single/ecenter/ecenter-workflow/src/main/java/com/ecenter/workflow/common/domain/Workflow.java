package com.ecenter.workflow.common.domain;

import com.ecenter.common.annotation.Excel;
import com.ecenter.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class Workflow extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long workflowId;

    /** 流程名 */
    @Excel(name = "流程名")
    private String workflowName;

    /** 流程描述 */
    @Excel(name = "流程描述")
    private String workflowDesc;

    public void setWorkflowId(Long workflowId)
    {
        this.workflowId = workflowId;
    }

    public Long getWorkflowId()
    {
        return workflowId;
    }
    public void setWorkflowName(String workflowName)
    {
        this.workflowName = workflowName;
    }

    public String getWorkflowName()
    {
        return workflowName;
    }
    public void setWorkflowDesc(String workflowDesc)
    {
        this.workflowDesc = workflowDesc;
    }

    public String getWorkflowDesc()
    {
        return workflowDesc;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("workflowId", getWorkflowId())
                .append("workflowName", getWorkflowName())
                .append("workflowDesc", getWorkflowDesc())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
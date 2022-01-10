package com.ecenter.workflow.common.domain;

import com.ecenter.common.annotation.Excel;
import com.ecenter.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class WorkflowNode extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** $column.columnComment */
    @Excel(name = "${comment}", readConverterExp = "$column.readConverterExp()")
    private Long workflowNodeId;

    /** 流程id */
    @Excel(name = "流程id")
    private Long workflowId;

    /** 角色id */
    @Excel(name = "角色id")
    private Long roleId;

    /** 节点名称 */
    @Excel(name = "节点名称")
    private String nodeName;

    /** 角色名称 */
    @Excel(name = "角色名称")
    private String roleName;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setWorkflowNodeId(Long workflowNodeId)
    {
        this.workflowNodeId = workflowNodeId;
    }

    public Long getWorkflowNodeId()
    {
        return workflowNodeId;
    }
    public void setWorkflowId(Long workflowId)
    {
        this.workflowId = workflowId;
    }

    public Long getWorkflowId()
    {
        return workflowId;
    }
    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }

    public Long getRoleId()
    {
        return roleId;
    }
    public void setNodeName(String nodeName)
    {
        this.nodeName = nodeName;
    }

    public String getNodeName()
    {
        return nodeName;
    }
    public void setRoleName(String roleName)
    {
        this.roleName = roleName;
    }

    public String getRoleName()
    {
        return roleName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("workflowNodeId", getWorkflowNodeId())
                .append("workflowId", getWorkflowId())
                .append("roleId", getRoleId())
                .append("nodeName", getNodeName())
                .append("roleName", getRoleName())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .toString();
    }
}
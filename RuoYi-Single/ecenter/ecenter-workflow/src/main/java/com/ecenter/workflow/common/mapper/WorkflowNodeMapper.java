package com.ecenter.workflow.common.mapper;

import com.ecenter.workflow.common.domain.WorkflowNode;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WorkflowNodeMapper
{
    /**
     * 查询流程节点
     *
     * @param id 流程节点主键
     * @return 流程节点
     */
    public WorkflowNode selectWorkflowNodeById(Long id);

    /**
     * 查询流程节点列表
     *
     * @param workflowNode 流程节点
     * @return 流程节点集合
     */
    public List<WorkflowNode> selectWorkflowNodeList(WorkflowNode workflowNode);

    /**
     * 新增流程节点
     *
     * @param workflowNode 流程节点
     * @return 结果
     */
    public int insertWorkflowNode(WorkflowNode workflowNode);

    /**
     * 修改流程节点
     *
     * @param workflowNode 流程节点
     * @return 结果
     */
    public int updateWorkflowNode(WorkflowNode workflowNode);

    /**
     * 删除流程节点
     *
     * @param id 流程节点主键
     * @return 结果
     */
    public int deleteWorkflowNodeById(Long id);

    /**
     * 批量删除流程节点
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWorkflowNodeByIds(Long[] ids);

    public Long getNodeIdByWorkflowId(@Param("workflowId") Long workflowId);
}
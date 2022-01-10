package com.ecenter.workflow.common.mapper;

import com.ecenter.workflow.common.domain.Workflow;

import java.util.List;

public interface WorkflowMapper
{
    /**
     * 查询流程
     *
     * @param workflowId 流程主键
     * @return 流程
     */
    public Workflow selectWorkflowByWorkflowId(Long workflowId);

    /**
     * 查询流程列表
     *
     * @param workflow 流程
     * @return 流程集合
     */
    public List<Workflow> selectWorkflowList(Workflow workflow);

    /**
     * 新增流程
     *
     * @param workflow 流程
     * @return 结果
     */
    public int insertWorkflow(Workflow workflow);

    /**
     * 修改流程
     *
     * @param workflow 流程
     * @return 结果
     */
    public int updateWorkflow(Workflow workflow);

    /**
     * 删除流程
     *
     * @param workflowId 流程主键
     * @return 结果
     */
    public int deleteWorkflowByWorkflowId(Long workflowId);

    /**
     * 批量删除流程
     *
     * @param workflowIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteWorkflowByWorkflowIds(Long[] workflowIds);
}
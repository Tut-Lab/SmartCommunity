package com.ecenter.workflow.common.service.impl;

import com.ecenter.common.utils.DateUtils;
import com.ecenter.workflow.common.domain.Workflow;
import com.ecenter.workflow.common.mapper.WorkflowMapper;
import com.ecenter.workflow.common.service.IWorkflowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkflowServiceImpl implements IWorkflowService
{
    @Autowired
    private WorkflowMapper workflowMapper;

    /**
     * 查询流程
     *
     * @param workflowId 流程主键
     * @return 流程
     */
    @Override
    public Workflow selectWorkflowByWorkflowId(Long workflowId)
    {
        return workflowMapper.selectWorkflowByWorkflowId(workflowId);
    }

    /**
     * 查询流程列表
     *
     * @param workflow 流程
     * @return 流程
     */
    @Override
    public List<Workflow> selectWorkflowList(Workflow workflow)
    {
        return workflowMapper.selectWorkflowList(workflow);
    }

    /**
     * 新增流程
     *
     * @param workflow 流程
     * @return 结果
     */
    @Override
    public int insertWorkflow(Workflow workflow)
    {
        workflow.setCreateTime(DateUtils.getNowDate());
        return workflowMapper.insertWorkflow(workflow);
    }

    /**
     * 修改流程
     *
     * @param workflow 流程
     * @return 结果
     */
    @Override
    public int updateWorkflow(Workflow workflow)
    {
        workflow.setUpdateTime(DateUtils.getNowDate());
        return workflowMapper.updateWorkflow(workflow);
    }

    /**
     * 批量删除流程
     *
     * @param workflowIds 需要删除的流程主键
     * @return 结果
     */
    @Override
    public int deleteWorkflowByWorkflowIds(Long[] workflowIds)
    {
        return workflowMapper.deleteWorkflowByWorkflowIds(workflowIds);
    }

    /**
     * 删除流程信息
     *
     * @param workflowId 流程主键
     * @return 结果
     */
    @Override
    public int deleteWorkflowByWorkflowId(Long workflowId)
    {
        return workflowMapper.deleteWorkflowByWorkflowId(workflowId);
    }
}
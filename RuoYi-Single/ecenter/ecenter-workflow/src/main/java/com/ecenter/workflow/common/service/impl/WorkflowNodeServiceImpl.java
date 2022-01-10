package com.ecenter.workflow.common.service.impl;

import com.ecenter.common.utils.DateUtils;
import com.ecenter.workflow.common.domain.WorkflowNode;
import com.ecenter.workflow.common.mapper.WorkflowNodeMapper;
import com.ecenter.workflow.common.service.IWorkflowNodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WorkflowNodeServiceImpl implements IWorkflowNodeService
{
    @Autowired
    private WorkflowNodeMapper workflowNodeMapper;

    /**
     * 查询流程节点
     *
     * @param id 流程节点主键
     * @return 流程节点
     */
    @Override
    public WorkflowNode selectWorkflowNodeById(Long id)
    {
        return workflowNodeMapper.selectWorkflowNodeById(id);
    }

    /**
     * 查询流程节点列表
     *
     * @param workflowNode 流程节点
     * @return 流程节点
     */
    @Override
    public List<WorkflowNode> selectWorkflowNodeList(WorkflowNode workflowNode)
    {
        return workflowNodeMapper.selectWorkflowNodeList(workflowNode);
    }

    /**
     * 新增流程节点
     *
     * @param workflowNode 流程节点
     * @return 结果
     */
    @Override
    public int insertWorkflowNode(WorkflowNode workflowNode)
    {
        workflowNode.setCreateTime(DateUtils.getNowDate());
        return workflowNodeMapper.insertWorkflowNode(workflowNode);
    }

    /**
     * 修改流程节点
     *
     * @param workflowNode 流程节点
     * @return 结果
     */
    @Override
    public int updateWorkflowNode(WorkflowNode workflowNode)
    {
        workflowNode.setUpdateTime(DateUtils.getNowDate());
        return workflowNodeMapper.updateWorkflowNode(workflowNode);
    }

    /**
     * 批量删除流程节点
     *
     * @param ids 需要删除的流程节点主键
     * @return 结果
     */
    @Override
    public int deleteWorkflowNodeByIds(Long[] ids)
    {
        return workflowNodeMapper.deleteWorkflowNodeByIds(ids);
    }

    /**
     * 删除流程节点信息
     *
     * @param id 流程节点主键
     * @return 结果
     */
    @Override
    public int deleteWorkflowNodeById(Long id)
    {
        return workflowNodeMapper.deleteWorkflowNodeById(id);
    }

    @Override
    public Long getNodeIdByWorkflowId(Long workflowId) {
        return workflowNodeMapper.getNodeIdByWorkflowId(workflowId);
    }
}

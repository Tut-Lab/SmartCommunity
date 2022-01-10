package com.ecenter.workflow.common.controller;

import com.ecenter.common.annotation.Log;
import com.ecenter.common.core.controller.BaseController;
import com.ecenter.common.core.domain.AjaxResult;
import com.ecenter.common.core.page.TableDataInfo;
import com.ecenter.common.enums.BusinessType;
import com.ecenter.common.utils.poi.ExcelUtil;
import com.ecenter.workflow.common.domain.WorkflowNode;
import com.ecenter.workflow.common.service.IWorkflowNodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/workflow/node")
public class WorkflowNodeController extends BaseController
{
    @Autowired
    private IWorkflowNodeService workflowNodeService;

    /**
     * 查询流程节点列表
     */
    @PreAuthorize("@ss.hasPermi('system:node:list')")
    @GetMapping("/list")
    public TableDataInfo list(WorkflowNode workflowNode)
    {
        startPage();
        List<WorkflowNode> list = workflowNodeService.selectWorkflowNodeList(workflowNode);
        return getDataTable(list);
    }

    /**
     * 导出流程节点列表
     */
    @PreAuthorize("@ss.hasPermi('system:node:export')")
    @Log(title = "流程节点", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(WorkflowNode workflowNode)
    {
        List<WorkflowNode> list = workflowNodeService.selectWorkflowNodeList(workflowNode);
        ExcelUtil<WorkflowNode> util = new ExcelUtil<WorkflowNode>(WorkflowNode.class);
        return util.exportExcel(list, "流程节点数据");
    }

    /**
     * 获取流程节点详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:node:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(workflowNodeService.selectWorkflowNodeById(id));
    }

    /**
     * 新增流程节点
     */
    @PreAuthorize("@ss.hasPermi('system:node:add')")
    @Log(title = "流程节点", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody WorkflowNode workflowNode)
    {

        Long nodeIdByWorkflowId = workflowNodeService.getNodeIdByWorkflowId(workflowNode.getWorkflowId());
        if(nodeIdByWorkflowId == null)
        {
            workflowNode.setWorkflowNodeId(1L);
            return toAjax(workflowNodeService.insertWorkflowNode(workflowNode));
        }
        workflowNode.setWorkflowNodeId(nodeIdByWorkflowId + 1);
        return toAjax(workflowNodeService.insertWorkflowNode(workflowNode));
    }

    /**
     * 修改流程节点
     */
    @PreAuthorize("@ss.hasPermi('system:node:edit')")
    @Log(title = "流程节点", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody WorkflowNode workflowNode)
    {
        return toAjax(workflowNodeService.updateWorkflowNode(workflowNode));
    }

    /**
     * 删除流程节点
     */
    @PreAuthorize("@ss.hasPermi('system:node:remove')")
    @Log(title = "流程节点", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(workflowNodeService.deleteWorkflowNodeByIds(ids));
    }
}
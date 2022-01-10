package com.ecenter.workflow.common.controller;
import com.ecenter.common.annotation.Log;
import com.ecenter.common.core.controller.BaseController;
import com.ecenter.common.core.domain.AjaxResult;
import com.ecenter.common.core.page.TableDataInfo;
import com.ecenter.common.enums.BusinessType;

import com.ecenter.common.utils.poi.ExcelUtil;
import com.ecenter.workflow.common.domain.Workflow;
import com.ecenter.workflow.common.service.IWorkflowService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/workflow")
public class WorkflowController extends BaseController
{
    @Autowired
    private IWorkflowService workflowService;

    /**
     * 查询流程列表
     */
    @PreAuthorize("@ss.hasPermi('system:workflow:list')")
    @GetMapping("/list")
    public TableDataInfo list(Workflow workflow)
    {
        startPage();
        List<Workflow> list = workflowService.selectWorkflowList(workflow);
        return getDataTable(list);
    }

    /**
     * 导出流程列表
     */
    @PreAuthorize("@ss.hasPermi('system:workflow:export')")
    @Log(title = "流程", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(Workflow workflow)
    {
        List<Workflow> list = workflowService.selectWorkflowList(workflow);
        ExcelUtil<Workflow> util = new ExcelUtil<Workflow>(Workflow.class);
        return util.exportExcel(list, "流程数据");
    }

    /**
     * 获取流程详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:workflow:query')")
    @GetMapping(value = "/{workflowId}")
    public AjaxResult getInfo(@PathVariable("workflowId") Long workflowId)
    {
        return AjaxResult.success(workflowService.selectWorkflowByWorkflowId(workflowId));
    }

    /**
     * 新增流程
     */
    @PreAuthorize("@ss.hasPermi('system:workflow:add')")
    @Log(title = "流程", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Workflow workflow)
    {
        return toAjax(workflowService.insertWorkflow(workflow));
    }

    /**
     * 修改流程
     */
    @PreAuthorize("@ss.hasPermi('system:workflow:edit')")
    @Log(title = "流程", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Workflow workflow)
    {
        return toAjax(workflowService.updateWorkflow(workflow));
    }

    /**
     * 删除流程
     */
    @PreAuthorize("@ss.hasPermi('system:workflow:remove')")
    @Log(title = "流程", businessType = BusinessType.DELETE)
    @DeleteMapping("/{workflowIds}")
    public AjaxResult remove(@PathVariable Long[] workflowIds)
    {
        return toAjax(workflowService.deleteWorkflowByWorkflowIds(workflowIds));
    }
}
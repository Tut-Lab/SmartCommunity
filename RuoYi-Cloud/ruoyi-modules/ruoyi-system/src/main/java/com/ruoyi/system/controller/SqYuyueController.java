package com.ruoyi.system.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.system.domain.SqYuyue;
import com.ruoyi.system.service.ISqYuyueService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 用户信息Controller
 * 
 * @author zsj
 * @date 2024-04-07
 */
@RestController
@RequestMapping("/yuyue")
public class SqYuyueController extends BaseController
{
    @Autowired
    private ISqYuyueService sqYuyueService;

    /**
     * 查询用户信息列表
     */
    @RequiresPermissions("system:yuyue:list")
    @GetMapping("/list")
    public TableDataInfo list(SqYuyue sqYuyue)
    {
        startPage();
        List<SqYuyue> list = sqYuyueService.selectSqYuyueList(sqYuyue);
        return getDataTable(list);
    }

    /**
     * 导出用户信息列表
     */
    @RequiresPermissions("system:yuyue:export")
    @Log(title = "用户信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SqYuyue sqYuyue) throws IOException
    {
        List<SqYuyue> list = sqYuyueService.selectSqYuyueList(sqYuyue);
        ExcelUtil<SqYuyue> util = new ExcelUtil<SqYuyue>(SqYuyue.class);
        util.exportExcel(response, list, "用户信息数据");
    }

    /**
     * 获取用户信息详细信息
     */
    @RequiresPermissions("system:yuyue:query")
    @GetMapping(value = "/{yuyueId}")
    public AjaxResult getInfo(@PathVariable("yuyueId") String yuyueId)
    {
        return AjaxResult.success(sqYuyueService.selectSqYuyueByYuyueId(yuyueId));
    }

    /**
     * 新增用户信息
     */
    @RequiresPermissions("system:yuyue:add")
    @Log(title = "用户信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SqYuyue sqYuyue)
    {
        return toAjax(sqYuyueService.insertSqYuyue(sqYuyue));
    }

    /**
     * 修改用户信息
     */
    @RequiresPermissions("system:yuyue:edit")
    @Log(title = "用户信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SqYuyue sqYuyue)
    {
        return toAjax(sqYuyueService.updateSqYuyue(sqYuyue));
    }

    /**
     * 删除用户信息
     */
    @RequiresPermissions("system:yuyue:remove")
    @Log(title = "用户信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{yuyueIds}")
    public AjaxResult remove(@PathVariable String[] yuyueIds)
    {
        return toAjax(sqYuyueService.deleteSqYuyueByYuyueIds(yuyueIds));
    }
}

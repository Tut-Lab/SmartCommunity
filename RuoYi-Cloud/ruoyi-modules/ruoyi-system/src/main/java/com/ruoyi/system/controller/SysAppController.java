package com.ruoyi.system.controller;



import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.web.page.TableDataInfo;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.system.domain.SysApp;
import com.ruoyi.system.service.ISysAppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@RestController
@RequestMapping("/app")
public class SysAppController extends BaseController
{

    @Autowired
    private ISysAppService sysAppService;

    /**
     * 查询列表
     */
    @RequiresPermissions("system:app:list")
    @GetMapping("/list")
    public TableDataInfo list(SysApp sysApp)
    {
        startPage();
        List<SysApp> list = sysAppService.selectSysAppList(sysApp);
        return getDataTable(list);
    }

    /**
     * 导出列表
     */
    @RequiresPermissions("system:app:export")
    @Log(title = "", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public void export(HttpServletResponse response, SysApp sysApp) throws IOException {
        List<SysApp> list = sysAppService.selectSysAppList(sysApp);
        ExcelUtil<SysApp> util = new ExcelUtil<SysApp>(SysApp.class);
        util.exportExcel(response, list, "数据");

    }

    /**
     * 获取详细信息
     */
    @RequiresPermissions("system:app:query")
    @GetMapping(value = "/{appId}")
    public AjaxResult getInfo(@PathVariable("appId") String appId)
    {
        return AjaxResult.success(sysAppService.selectSysAppByAppId(appId));
    }

    /**
     * 新增
     */
    @RequiresPermissions("system:app:add")
    @Log(title = "", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysApp sysApp)
    {
        return toAjax(sysAppService.insertSysApp(sysApp));
    }

    /**
     * 修改
     */
    @RequiresPermissions("system:app:edit")
    @Log(title = "", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysApp sysApp)
    {
        return toAjax(sysAppService.updateSysApp(sysApp));
    }




    /**
     * 删除
     */
    @RequiresPermissions("system:app:remove")
    @Log(title = "", businessType = BusinessType.DELETE)
    @DeleteMapping("/{appIds}")
    public AjaxResult remove(@PathVariable String[] appIds)
    {
        return toAjax(sysAppService.deleteSysAppByAppIds(appIds));
    }

    @RequiresPermissions("system:app:list")
    @GetMapping("/getAppIdList")
    public AjaxResult getAppIdList(SysApp sysApp)
    {
        return AjaxResult.success(sysAppService.selectSysAppList(sysApp));
    }
}
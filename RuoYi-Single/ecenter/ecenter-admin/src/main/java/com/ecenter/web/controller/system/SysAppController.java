package com.ecenter.web.controller.system;

import java.util.List;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ecenter.common.annotation.Log;
import com.ecenter.common.core.controller.BaseController;
import com.ecenter.common.core.domain.AjaxResult;
import com.ecenter.common.enums.BusinessType;
import com.ecenter.system.domain.SysApp;
import com.ecenter.system.service.ISysAppService;
import com.ecenter.common.utils.poi.ExcelUtil;
import com.ecenter.common.core.page.TableDataInfo;


@RestController
@RequestMapping("/system/app")
public class SysAppController extends BaseController
{

    @Autowired
    private ISysAppService sysAppService;

    /**
     * 查询列表
     */
    @PreAuthorize("@ss.hasPermi('system:app:list')")
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
    @PreAuthorize("@ss.hasPermi('system:app:export')")
    @Log(title = "", businessType = BusinessType.EXPORT)
    @GetMapping("/export")
    public AjaxResult export(SysApp sysApp)
    {
        List<SysApp> list = sysAppService.selectSysAppList(sysApp);
        ExcelUtil<SysApp> util = new ExcelUtil<SysApp>(SysApp.class);
        return util.exportExcel(list, "数据");
    }

    /**
     * 获取详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:app:query')")
    @GetMapping(value = "/{appId}")
    public AjaxResult getInfo(@PathVariable("appId") String appId)
    {
        return AjaxResult.success(sysAppService.selectSysAppByAppId(appId));
    }

    /**
     * 新增
     */
    @PreAuthorize("@ss.hasPermi('system:app:add')")
    @Log(title = "", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysApp sysApp)
    {
        return toAjax(sysAppService.insertSysApp(sysApp));
    }

    /**
     * 修改
     */
    @PreAuthorize("@ss.hasPermi('system:app:edit')")
    @Log(title = "", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysApp sysApp)
    {
        return toAjax(sysAppService.updateSysApp(sysApp));
    }




    /**
     * 删除
     */
    @PreAuthorize("@ss.hasPermi('system:app:remove')")
    @Log(title = "", businessType = BusinessType.DELETE)
    @DeleteMapping("/{appIds}")
    public AjaxResult remove(@PathVariable String[] appIds)
    {
        return toAjax(sysAppService.deleteSysAppByAppIds(appIds));
    }

    @PreAuthorize("@ss.hasPermi('system:app:list')")
    @GetMapping("/getAppIdList")
    public AjaxResult getAppIdList(SysApp sysApp)
    {
        return AjaxResult.success(sysAppService.selectSysAppList(sysApp));
    }
}
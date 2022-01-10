package com.ruoyi.im.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.im.domain.ImChatInfo;
import com.ruoyi.im.service.IImChatInfoService;
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
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 聊天列表Controller
 *
 * @author ruoyi
 * @date 2021-12-11
 */
@RestController
@RequestMapping("/info")
public class ImChatInfoController extends BaseController
{
    @Autowired
    private IImChatInfoService imChatInfoService;

    /**
     * 查询聊天列表列表
     */
    @RequiresPermissions("im:info:list")
    @GetMapping("/list")
    public TableDataInfo list(ImChatInfo imChatInfo)
    {
        startPage();
        List<ImChatInfo> list = imChatInfoService.selectImChatInfoList(imChatInfo);
        return getDataTable(list);
    }

    /**
     * 导出聊天列表列表
     */
    @RequiresPermissions("im:info:export")
    @Log(title = "聊天列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ImChatInfo imChatInfo) throws IOException
    {
        List<ImChatInfo> list = imChatInfoService.selectImChatInfoList(imChatInfo);
        ExcelUtil<ImChatInfo> util = new ExcelUtil<ImChatInfo>(ImChatInfo.class);
        util.exportExcel(response, list, "聊天列表数据");
    }

    /**
     * 获取聊天列表详细信息
     */
    @RequiresPermissions("im:info:query")
    @GetMapping(value = "/{chatId}")
    public AjaxResult getInfo(@PathVariable("chatId") String chatId)
    {
        return AjaxResult.success(imChatInfoService.selectImChatInfoByChatId(chatId));
    }

    /**
     * 新增聊天列表
     */
    @RequiresPermissions("im:info:add")
    @Log(title = "聊天列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ImChatInfo imChatInfo)
    {
        return AjaxResult.success(imChatInfoService.insertImChatInfo(imChatInfo));
    }

    /**
     * 修改聊天列表
     */
    @RequiresPermissions("im:info:edit")
    @Log(title = "聊天列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ImChatInfo imChatInfo)
    {
        return toAjax(imChatInfoService.updateImChatInfo(imChatInfo));
    }

    /**
     * 删除聊天列表
     */
    @RequiresPermissions("im:info:remove")
    @Log(title = "聊天列表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{chatIds}")
    public AjaxResult remove(@PathVariable String[] chatIds)
    {
        return toAjax(imChatInfoService.deleteImChatInfoByChatIds(chatIds));
    }
}
package com.ruoyi.im.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.im.domain.ImChatInfoDetail;
import com.ruoyi.im.service.IImChatInfoDetailService;
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
 * 聊天记录Controller
 *
 * @author ruoyi
 * @date 2021-12-11
 */
@RestController
@RequestMapping("/detail")
public class ImChatInfoDetailController extends BaseController
{
    @Autowired
    private IImChatInfoDetailService imChatInfoDetailService;

    /**
     * 查询聊天记录列表
     */
    @RequiresPermissions("im:detail:list")
    @GetMapping("/list")
    public TableDataInfo list(ImChatInfoDetail imChatInfoDetail)
    {
        startPage();
        List<ImChatInfoDetail> list = imChatInfoDetailService.selectImChatInfoDetailList(imChatInfoDetail);
        return getDataTable(list);
    }

    /**
     * 导出聊天记录列表
     */
    @RequiresPermissions("im:detail:export")
    @Log(title = "聊天记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ImChatInfoDetail imChatInfoDetail) throws IOException
    {
        List<ImChatInfoDetail> list = imChatInfoDetailService.selectImChatInfoDetailList(imChatInfoDetail);
        ExcelUtil<ImChatInfoDetail> util = new ExcelUtil<ImChatInfoDetail>(ImChatInfoDetail.class);
        util.exportExcel(response, list, "聊天记录数据");
    }

    /**
     * 获取聊天记录详细信息
     */
    @RequiresPermissions("im:detail:query")
    @GetMapping(value = "/{chatDetailId}")
    public AjaxResult getInfo(@PathVariable("chatDetailId") Long chatDetailId)
    {
        return AjaxResult.success(imChatInfoDetailService.selectImChatInfoDetailByChatDetailId(chatDetailId));
    }

    /**
     * 新增聊天记录
     */
    @RequiresPermissions("im:detail:add")
    @Log(title = "聊天记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ImChatInfoDetail imChatInfoDetail)
    {
        return toAjax(imChatInfoDetailService.insertImChatInfoDetail(imChatInfoDetail));
    }

    /**
     * 修改聊天记录
     */
    @RequiresPermissions("im:detail:edit")
    @Log(title = "聊天记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ImChatInfoDetail imChatInfoDetail)
    {
        return toAjax(imChatInfoDetailService.updateImChatInfoDetail(imChatInfoDetail));
    }

    /**
     * 删除聊天记录
     */
    @RequiresPermissions("im:detail:remove")
    @Log(title = "聊天记录", businessType = BusinessType.DELETE)
    @DeleteMapping("/{chatDetailIds}")
    public AjaxResult remove(@PathVariable Long[] chatDetailIds)
    {
        return toAjax(imChatInfoDetailService.deleteImChatInfoDetailByChatDetailIds(chatDetailIds));
    }
}
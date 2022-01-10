package com.ruoyi.im.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.im.domain.ImAddFriendApply;
import com.ruoyi.im.domain.ImUserFriend;
import com.ruoyi.im.service.IImAddFriendApplyService;
import com.ruoyi.im.service.IImUserFriendService;
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
 * 好友申请Controller
 *
 * @author ruoyi
 * @date 2021-12-11
 */
@RestController
@RequestMapping("/apply")
public class ImAddFriendApplyController extends BaseController
{
    @Autowired
    private IImAddFriendApplyService imAddFriendApplyService;

    @Autowired
    private IImUserFriendService imUserFriendService;

    /**
     * 查询好友申请列表
     */
    // @RequiresPermissions("im:apply:list")
    @GetMapping("/list")
    public TableDataInfo list(ImAddFriendApply imAddFriendApply)
    {
        startPage();
        List<ImAddFriendApply> list = imAddFriendApplyService.selectImAddFriendApplyList(imAddFriendApply);
        return getDataTable(list);
    }

    /**
     * 查询好友申请列表
     */
    // @RequiresPermissions("im:apply:list")
    @GetMapping("/getApplyList")
    public AjaxResult getApplyList()
    {
        String userId = SecurityUtils.getUserId();
        List<ImAddFriendApply> imAddFriendApplies = imAddFriendApplyService.selectImAddFriendApplyListByResUserId(userId);
        return AjaxResult.success(imAddFriendApplies);
    }

    /**
     * 导出好友申请列表
     */
    // @RequiresPermissions("im:apply:export")
    @Log(title = "好友申请", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ImAddFriendApply imAddFriendApply) throws IOException
    {
        List<ImAddFriendApply> list = imAddFriendApplyService.selectImAddFriendApplyList(imAddFriendApply);
        ExcelUtil<ImAddFriendApply> util = new ExcelUtil<ImAddFriendApply>(ImAddFriendApply.class);
        util.exportExcel(response, list, "好友申请数据");
    }

    /**
     * 获取好友申请详细信息
     */
    // @RequiresPermissions("im:apply:query")
    @GetMapping(value = "/{applyId}")
    public AjaxResult getInfo(@PathVariable("applyId") String applyId)
    {
        return AjaxResult.success(imAddFriendApplyService.selectImAddFriendApplyByApplyId(applyId));
    }

    /**
     * 新增好友申请
     */
    // @RequiresPermissions("im:apply:add")
    @Log(title = "好友申请", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ImAddFriendApply imAddFriendApply)
    {
        return toAjax(imAddFriendApplyService.insertImAddFriendApply(imAddFriendApply));
    }

    /**
     * 修改好友申请
     */
    // @RequiresPermissions("im:apply:edit")
    @Log(title = "好友申请", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ImAddFriendApply imAddFriendApply)
    {
        return toAjax(imAddFriendApplyService.updateImAddFriendApply(imAddFriendApply));
    }

    /**
     * 删除好友申请
     */
    // @RequiresPermissions("im:apply:remove")
    @Log(title = "好友申请", businessType = BusinessType.DELETE)
    @DeleteMapping("/{applyIds}")
    public AjaxResult remove(@PathVariable String[] applyIds)
    {
        return toAjax(imAddFriendApplyService.deleteImAddFriendApplyByApplyIds(applyIds));
    }

    /**
     *
     * 完成好友添加
     */
    @PutMapping("/finishAddFriend")
    public AjaxResult finishAddFriend(@RequestBody ImAddFriendApply imAddFriendApply)
    {
        return AjaxResult.success(imAddFriendApplyService.finishAddFriend(imAddFriendApply));
    }
}
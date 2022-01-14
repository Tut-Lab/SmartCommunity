package com.ruoyi.im.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.im.domain.ImUserFriend;
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
 *
 * @author ruoyi
 * @date 2021-12-11
 */
@RestController
@RequestMapping("/friend")
public class ImUserFriendController extends BaseController
{
    @Autowired
    private IImUserFriendService imUserFriendService;

    /**
     * 查询好友列表列表
     */
    @RequiresPermissions("im:friend:list")
    @GetMapping("/list")
    public TableDataInfo list(ImUserFriend imUserFriend)
    {
        startPage();
        List<ImUserFriend> list = imUserFriendService.selectImUserFriendList(imUserFriend);
        return getDataTable(list);
    }


    @GetMapping("/friendList")
    public AjaxResult friendList()
    {
        String userId = SecurityUtils.getUserId();
        List<ImUserFriend> list = imUserFriendService.selectImUserFriendListByUserId(userId);
        return AjaxResult.success(list);
    }

    /**
     * 导出好友列表列表
     */
    // @RequiresPermissions("im:friend:export")
    @Log(title = "好友列表", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, ImUserFriend imUserFriend) throws IOException
    {
        List<ImUserFriend> list = imUserFriendService.selectImUserFriendList(imUserFriend);
        ExcelUtil<ImUserFriend> util = new ExcelUtil<ImUserFriend>(ImUserFriend.class);
        util.exportExcel(response, list, "好友列表数据");
    }

    /**
     * 获取好友列表详细信息
     */
    // @RequiresPermissions("im:friend:query")
    @GetMapping(value = "/{relationId}")
    public AjaxResult getInfo(@PathVariable("relationId") String relationId)
    {
        return AjaxResult.success(imUserFriendService.selectImUserFriendByRelationId(relationId));
    }

    /**
     * 新增好友列表
     */
    // @RequiresPermissions("im:friend:add")
    @Log(title = "好友列表", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody ImUserFriend imUserFriend)
    {
        return toAjax(imUserFriendService.insertImUserFriend(imUserFriend));
    }

    /**
     * 修改好友列表
     */
    // @RequiresPermissions("im:friend:edit")
    @Log(title = "好友列表", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody ImUserFriend imUserFriend)
    {
        return toAjax(imUserFriendService.updateImUserFriend(imUserFriend));
    }

    /**
     * 删除好友列表
     */
    // @RequiresPermissions("im:friend:remove")
    @Log(title = "好友列表", businessType = BusinessType.DELETE)
    @DeleteMapping("/{relationIds}")
    public AjaxResult remove(@PathVariable String[] relationIds)
    {
        return toAjax(imUserFriendService.deleteImUserFriendByRelationIds(relationIds));
    }

    @GetMapping("/getFriendInfo/{friendUserId}")
    public AjaxResult getFriendInfo(@PathVariable("friendUserId") String friendUserId)
    {
        String userId = SecurityUtils.getUserId();
        ImUserFriend imUserFriends = imUserFriendService.selectImUserFriendListByFriendId(userId, friendUserId);
        return AjaxResult.success(imUserFriends);
    }
}

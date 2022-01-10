package com.ruoyi.im.service;


import com.ruoyi.im.domain.ImAddFriendApply;

import java.util.List;

/**
 * 好友申请Service接口
 *
 * @author ruoyi
 * @date 2021-12-11
 */
public interface IImAddFriendApplyService
{
    /**
     * 查询好友申请
     *
     * @param applyId 好友申请主键
     * @return 好友申请
     */
    public ImAddFriendApply selectImAddFriendApplyByApplyId(String applyId);

    /**
     * 查询好友申请列表
     *
     * @param imAddFriendApply 好友申请
     * @return 好友申请集合
     */
    public List<ImAddFriendApply> selectImAddFriendApplyList(ImAddFriendApply imAddFriendApply);

    public List<ImAddFriendApply> selectImAddFriendApplyListByResUserId(String resUserId);

    /**
     * 新增好友申请
     *
     * @param imAddFriendApply 好友申请
     * @return 结果
     */
    public int insertImAddFriendApply(ImAddFriendApply imAddFriendApply);

    /**
     * 修改好友申请
     *
     * @param imAddFriendApply 好友申请
     * @return 结果
     */
    public int updateImAddFriendApply(ImAddFriendApply imAddFriendApply);

    /**
     * 批量删除好友申请
     *
     * @param applyIds 需要删除的好友申请主键集合
     * @return 结果
     */
    public int deleteImAddFriendApplyByApplyIds(String[] applyIds);

    /**
     * 删除好友申请信息
     *
     * @param applyId 好友申请主键
     * @return 结果
     */
    public int deleteImAddFriendApplyByApplyId(String applyId);

    public int finishAddFriend(ImAddFriendApply imAddFriendApply);

}
package com.ruoyi.im.service;

import com.ruoyi.im.domain.ImUserFriend;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 * @author ruoyi
 * @date 2021-12-11
 */
public interface IImUserFriendService
{
    /**
     * 查询【请填写功能名称】
     *
     * @param relationId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public ImUserFriend selectImUserFriendByRelationId(String relationId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param imUserFriend 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<ImUserFriend> selectImUserFriendList(ImUserFriend imUserFriend);


    public List<ImUserFriend> selectImUserFriendListByUserId(String userId);

    public ImUserFriend selectImUserFriendListByFriendId(String userId, String friendId);

    /**
     * 新增【请填写功能名称】
     *
     * @param imUserFriend 【请填写功能名称】
     * @return 结果
     */
    public int insertImUserFriend(ImUserFriend imUserFriend);

    /**
     * 修改【请填写功能名称】
     *
     * @param imUserFriend 【请填写功能名称】
     * @return 结果
     */
    public int updateImUserFriend(ImUserFriend imUserFriend);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param relationIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteImUserFriendByRelationIds(String[] relationIds);

    /**
     * 删除【请填写功能名称】信息
     *
     * @param relationId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteImUserFriendByRelationId(String relationId);
}
package com.ruoyi.im.service.impl;

import java.util.List;

import com.ruoyi.common.core.utils.IdUtils;
import com.ruoyi.im.domain.ImUserFriend;
import com.ruoyi.im.mapper.ImUserFriendMapper;
import com.ruoyi.im.service.IImUserFriendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ruoyi
 * @date 2021-12-11
 */
@Service
public class ImUserFriendServiceImpl implements IImUserFriendService
{
    @Autowired
    private ImUserFriendMapper imUserFriendMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param relationId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public ImUserFriend selectImUserFriendByRelationId(String relationId)
    {
        return imUserFriendMapper.selectImUserFriendByRelationId(relationId);
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param imUserFriend 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<ImUserFriend> selectImUserFriendList(ImUserFriend imUserFriend)
    {
        return imUserFriendMapper.selectImUserFriendList(imUserFriend);
    }

    @Override
    public List<ImUserFriend> selectImUserFriendListByUserId(String userId) {
        return imUserFriendMapper.selectImUserFriendListByUserId(userId);
    }

    @Override
    public ImUserFriend selectImUserFriendListByFriendId(String userId, String friendId) {

        return imUserFriendMapper.selectImUserFriendListByFriendId(userId, friendId);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param imUserFriend 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int insertImUserFriend(ImUserFriend imUserFriend)
    {
        imUserFriend.setRelationId(IdUtils.fastSimpleUUID());
        return imUserFriendMapper.insertImUserFriend(imUserFriend);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param imUserFriend 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateImUserFriend(ImUserFriend imUserFriend)
    {
        return imUserFriendMapper.updateImUserFriend(imUserFriend);
    }

    /**
     * 批量删除【请填写功能名称】
     *
     * @param relationIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteImUserFriendByRelationIds(String[] relationIds)
    {
        return imUserFriendMapper.deleteImUserFriendByRelationIds(relationIds);
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param relationId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteImUserFriendByRelationId(String relationId)
    {
        return imUserFriendMapper.deleteImUserFriendByRelationId(relationId);
    }
}
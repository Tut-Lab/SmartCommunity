package com.ruoyi.im.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import com.ruoyi.common.core.utils.IdUtils;
import com.ruoyi.im.domain.ImChatInfo;
import com.ruoyi.im.mapper.ImChatInfoMapper;
import com.ruoyi.im.service.IImChatInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 聊天列表Service业务层处理
 *
 * @author ruoyi
 * @date 2021-12-11
 */
@Service
public class ImChatInfoServiceImpl implements IImChatInfoService
{
    @Autowired
    private ImChatInfoMapper imChatInfoMapper;

    /**
     * 查询聊天列表
     *
     * @param chatId 聊天列表主键
     * @return 聊天列表
     */
    @Override
    public ImChatInfo selectImChatInfoByChatId(String chatId)
    {
        return imChatInfoMapper.selectImChatInfoByChatId(chatId);
    }

    /**
     * 查询聊天列表列表
     *
     * @param imChatInfo 聊天列表
     * @return 聊天列表
     */
    @Override
    public List<ImChatInfo> selectImChatInfoList(ImChatInfo imChatInfo)
    {
        return imChatInfoMapper.selectImChatInfoList(imChatInfo);
    }

    /**
     * 新增聊天列表
     *
     * @param imChatInfo 聊天列表
     * @return 结果
     */
    @Override
    public ImChatInfo insertImChatInfo(ImChatInfo imChatInfo)
    {
        imChatInfo.setCreateTime(DateUtils.getNowDate());
        imChatInfo.setChatId(IdUtils.fastSimpleUUID());
        imChatInfoMapper.insertImChatInfo(imChatInfo);
        return imChatInfo;
    }

    /**
     * 修改聊天列表
     *
     * @param imChatInfo 聊天列表
     * @return 结果
     */
    @Override
    public int updateImChatInfo(ImChatInfo imChatInfo)
    {
        imChatInfo.setUpdateTime(DateUtils.getNowDate());
        return imChatInfoMapper.updateImChatInfo(imChatInfo);
    }

    /**
     * 批量删除聊天列表
     *
     * @param chatIds 需要删除的聊天列表主键
     * @return 结果
     */
    @Override
    public int deleteImChatInfoByChatIds(String[] chatIds)
    {
        return imChatInfoMapper.deleteImChatInfoByChatIds(chatIds);
    }

    /**
     * 删除聊天列表信息
     *
     * @param chatId 聊天列表主键
     * @return 结果
     */
    @Override
    public int deleteImChatInfoByChatId(String chatId)
    {
        return imChatInfoMapper.deleteImChatInfoByChatId(chatId);
    }
}
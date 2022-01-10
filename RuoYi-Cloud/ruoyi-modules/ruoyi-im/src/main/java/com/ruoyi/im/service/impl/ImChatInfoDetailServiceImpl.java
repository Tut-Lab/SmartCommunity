package com.ruoyi.im.service.impl;

import java.util.List;

import com.ruoyi.im.domain.ImChatInfoDetail;
import com.ruoyi.im.mapper.ImChatInfoDetailMapper;
import com.ruoyi.im.service.IImChatInfoDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 聊天记录Service业务层处理
 *
 * @author ruoyi
 * @date 2021-12-11
 */
@Service
public class ImChatInfoDetailServiceImpl implements IImChatInfoDetailService
{
    @Autowired
    private ImChatInfoDetailMapper imChatInfoDetailMapper;

    /**
     * 查询聊天记录
     *
     * @param chatDetailId 聊天记录主键
     * @return 聊天记录
     */
    @Override
    public ImChatInfoDetail selectImChatInfoDetailByChatDetailId(Long chatDetailId)
    {
        return imChatInfoDetailMapper.selectImChatInfoDetailByChatDetailId(chatDetailId);
    }

    /**
     * 查询聊天记录列表
     *
     * @param imChatInfoDetail 聊天记录
     * @return 聊天记录
     */
    @Override
    public List<ImChatInfoDetail> selectImChatInfoDetailList(ImChatInfoDetail imChatInfoDetail)
    {
        return imChatInfoDetailMapper.selectImChatInfoDetailList(imChatInfoDetail);
    }

    /**
     * 新增聊天记录
     *
     * @param imChatInfoDetail 聊天记录
     * @return 结果
     */
    @Override
    public int insertImChatInfoDetail(ImChatInfoDetail imChatInfoDetail)
    {
        return imChatInfoDetailMapper.insertImChatInfoDetail(imChatInfoDetail);
    }

    /**
     * 修改聊天记录
     *
     * @param imChatInfoDetail 聊天记录
     * @return 结果
     */
    @Override
    public int updateImChatInfoDetail(ImChatInfoDetail imChatInfoDetail)
    {
        return imChatInfoDetailMapper.updateImChatInfoDetail(imChatInfoDetail);
    }

    /**
     * 批量删除聊天记录
     *
     * @param chatDetailIds 需要删除的聊天记录主键
     * @return 结果
     */
    @Override
    public int deleteImChatInfoDetailByChatDetailIds(Long[] chatDetailIds)
    {
        return imChatInfoDetailMapper.deleteImChatInfoDetailByChatDetailIds(chatDetailIds);
    }

    /**
     * 删除聊天记录信息
     *
     * @param chatDetailId 聊天记录主键
     * @return 结果
     */
    @Override
    public int deleteImChatInfoDetailByChatDetailId(Long chatDetailId)
    {
        return imChatInfoDetailMapper.deleteImChatInfoDetailByChatDetailId(chatDetailId);
    }
}
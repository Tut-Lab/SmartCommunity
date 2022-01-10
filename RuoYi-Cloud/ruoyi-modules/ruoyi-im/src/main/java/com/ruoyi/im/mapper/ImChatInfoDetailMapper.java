package com.ruoyi.im.mapper;


import com.ruoyi.im.domain.ImChatInfoDetail;

import java.util.List;

/**
 * 聊天记录Mapper接口
 *
 * @author ruoyi
 * @date 2021-12-11
 */
public interface ImChatInfoDetailMapper
{
    /**
     * 查询聊天记录
     *
     * @param chatDetailId 聊天记录主键
     * @return 聊天记录
     */
    public ImChatInfoDetail selectImChatInfoDetailByChatDetailId(Long chatDetailId);

    /**
     * 查询聊天记录列表
     *
     * @param imChatInfoDetail 聊天记录
     * @return 聊天记录集合
     */
    public List<ImChatInfoDetail> selectImChatInfoDetailList(ImChatInfoDetail imChatInfoDetail);

    /**
     * 新增聊天记录
     *
     * @param imChatInfoDetail 聊天记录
     * @return 结果
     */
    public int insertImChatInfoDetail(ImChatInfoDetail imChatInfoDetail);

    /**
     * 修改聊天记录
     *
     * @param imChatInfoDetail 聊天记录
     * @return 结果
     */
    public int updateImChatInfoDetail(ImChatInfoDetail imChatInfoDetail);

    /**
     * 删除聊天记录
     *
     * @param chatDetailId 聊天记录主键
     * @return 结果
     */
    public int deleteImChatInfoDetailByChatDetailId(Long chatDetailId);

    /**
     * 批量删除聊天记录
     *
     * @param chatDetailIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteImChatInfoDetailByChatDetailIds(Long[] chatDetailIds);
}
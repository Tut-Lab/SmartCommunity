package com.ruoyi.im.mapper;

import com.ruoyi.im.domain.ImChatInfo;

import java.util.List;

/**
 * 聊天列表Mapper接口
 *
 * @author ruoyi
 * @date 2021-12-11
 */
public interface ImChatInfoMapper
{
    /**
     * 查询聊天列表
     *
     * @param chatId 聊天列表主键
     * @return 聊天列表
     */
    public ImChatInfo selectImChatInfoByChatId(String chatId);

    /**
     * 查询聊天列表列表
     *
     * @param imChatInfo 聊天列表
     * @return 聊天列表集合
     */
    public List<ImChatInfo> selectImChatInfoList(ImChatInfo imChatInfo);

    /**
     * 新增聊天列表
     *
     * @param imChatInfo 聊天列表
     * @return 结果
     */
    public int insertImChatInfo(ImChatInfo imChatInfo);

    /**
     * 修改聊天列表
     *
     * @param imChatInfo 聊天列表
     * @return 结果
     */
    public int updateImChatInfo(ImChatInfo imChatInfo);

    /**
     * 删除聊天列表
     *
     * @param chatId 聊天列表主键
     * @return 结果
     */
    public int deleteImChatInfoByChatId(String chatId);

    /**
     * 批量删除聊天列表
     *
     * @param chatIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteImChatInfoByChatIds(String[] chatIds);
}
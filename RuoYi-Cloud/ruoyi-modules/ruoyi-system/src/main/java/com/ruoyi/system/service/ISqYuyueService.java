package com.ruoyi.system.service;

import java.util.List;
import com.ruoyi.system.domain.SqYuyue;

/**
 * 用户信息Service接口
 * 
 * @author zsj
 * @date 2024-04-07
 */
public interface ISqYuyueService 
{
    /**
     * 查询用户信息
     * 
     * @param yuyueId 用户信息主键
     * @return 用户信息
     */
    public SqYuyue selectSqYuyueByYuyueId(String yuyueId);

    /**
     * 查询用户信息列表
     * 
     * @param sqYuyue 用户信息
     * @return 用户信息集合
     */
    public List<SqYuyue> selectSqYuyueList(SqYuyue sqYuyue);

    /**
     * 新增用户信息
     * 
     * @param sqYuyue 用户信息
     * @return 结果
     */
    public int insertSqYuyue(SqYuyue sqYuyue);

    /**
     * 修改用户信息
     * 
     * @param sqYuyue 用户信息
     * @return 结果
     */
    public int updateSqYuyue(SqYuyue sqYuyue);

    /**
     * 批量删除用户信息
     * 
     * @param yuyueIds 需要删除的用户信息主键集合
     * @return 结果
     */
    public int deleteSqYuyueByYuyueIds(String[] yuyueIds);

    /**
     * 删除用户信息信息
     * 
     * @param yuyueId 用户信息主键
     * @return 结果
     */
    public int deleteSqYuyueByYuyueId(String yuyueId);
}

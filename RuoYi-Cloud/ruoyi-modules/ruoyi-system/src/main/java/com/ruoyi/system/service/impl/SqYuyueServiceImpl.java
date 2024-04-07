package com.ruoyi.system.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.system.mapper.SqYuyueMapper;
import com.ruoyi.system.domain.SqYuyue;
import com.ruoyi.system.service.ISqYuyueService;

/**
 * 用户信息Service业务层处理
 * 
 * @author zsj
 * @date 2024-04-07
 */
@Service
public class SqYuyueServiceImpl implements ISqYuyueService 
{
    @Autowired
    private SqYuyueMapper sqYuyueMapper;

    /**
     * 查询用户信息
     * 
     * @param yuyueId 用户信息主键
     * @return 用户信息
     */
    @Override
    public SqYuyue selectSqYuyueByYuyueId(String yuyueId)
    {
        return sqYuyueMapper.selectSqYuyueByYuyueId(yuyueId);
    }

    /**
     * 查询用户信息列表
     * 
     * @param sqYuyue 用户信息
     * @return 用户信息
     */
    @Override
    public List<SqYuyue> selectSqYuyueList(SqYuyue sqYuyue)
    {
        return sqYuyueMapper.selectSqYuyueList(sqYuyue);
    }

    /**
     * 新增用户信息
     * 
     * @param sqYuyue 用户信息
     * @return 结果
     */
    @Override
    public int insertSqYuyue(SqYuyue sqYuyue)
    {
        sqYuyue.setCreateTime(DateUtils.getNowDate());
        return sqYuyueMapper.insertSqYuyue(sqYuyue);
    }

    /**
     * 修改用户信息
     * 
     * @param sqYuyue 用户信息
     * @return 结果
     */
    @Override
    public int updateSqYuyue(SqYuyue sqYuyue)
    {
        sqYuyue.setUpdateTime(DateUtils.getNowDate());
        return sqYuyueMapper.updateSqYuyue(sqYuyue);
    }

    /**
     * 批量删除用户信息
     * 
     * @param yuyueIds 需要删除的用户信息主键
     * @return 结果
     */
    @Override
    public int deleteSqYuyueByYuyueIds(String[] yuyueIds)
    {
        return sqYuyueMapper.deleteSqYuyueByYuyueIds(yuyueIds);
    }

    /**
     * 删除用户信息信息
     * 
     * @param yuyueId 用户信息主键
     * @return 结果
     */
    @Override
    public int deleteSqYuyueByYuyueId(String yuyueId)
    {
        return sqYuyueMapper.deleteSqYuyueByYuyueId(yuyueId);
    }
}

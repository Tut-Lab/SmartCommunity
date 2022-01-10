package com.ruoyi.system.service;



import com.ruoyi.system.domain.RoleTree;
import com.ruoyi.system.domain.SysApp;

import java.util.List;

public interface ISysAppService
{
    /**
     * 查询【请填写功能名称】
     *
     * @param appId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    public SysApp selectSysAppByAppId(String appId);

    /**
     * 查询【请填写功能名称】列表
     *
     * @param sysApp 【请填写功能名称】
     * @return 【请填写功能名称】集合
     */
    public List<SysApp> selectSysAppList(SysApp sysApp);

    /**
     * 新增【请填写功能名称】
     *
     * @param sysApp 【请填写功能名称】
     * @return 结果
     */
    public int insertSysApp(SysApp sysApp);

    /**
     * 修改【请填写功能名称】
     *
     * @param sysApp 【请填写功能名称】
     * @return 结果
     */
    public int updateSysApp(SysApp sysApp);

    /**
     * 批量删除【请填写功能名称】
     *
     * @param appIds 需要删除的【请填写功能名称】主键集合
     * @return 结果
     */
    public int deleteSysAppByAppIds(String[] appIds);

    /**
     * 删除【请填写功能名称】信息
     *
     * @param appId 【请填写功能名称】主键
     * @return 结果
     */
    public int deleteSysAppByAppId(String appId);

    public List<RoleTree> selectAppList();
}
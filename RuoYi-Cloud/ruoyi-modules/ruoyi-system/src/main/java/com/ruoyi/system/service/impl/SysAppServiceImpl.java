package com.ruoyi.system.service.impl;


import com.ruoyi.common.core.utils.IdUtils;
import com.ruoyi.system.api.domain.SysRole;
import com.ruoyi.system.domain.RoleTree;
import com.ruoyi.system.domain.RoleTreeChildren;
import com.ruoyi.system.domain.SysApp;
import com.ruoyi.system.domain.SysMenu;
import com.ruoyi.system.mapper.SysAppMapper;
import com.ruoyi.system.mapper.SysMenuMapper;
import com.ruoyi.system.mapper.SysRoleMapper;
import com.ruoyi.system.mapper.SysRoleMenuMapper;
import com.ruoyi.system.service.ISysAppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Service
public class SysAppServiceImpl implements ISysAppService
{

    @Autowired
    private SysAppMapper sysAppMapper;

    @Autowired
    private SysMenuMapper menuMapper;

    @Autowired
    private SysRoleMapper sysRoleMapper;

    @Autowired
    private SysRoleMenuMapper sysRoleMenuMapper;

    /**
     * 查询【请填写功能名称】
     *
     * @param appId 【请填写功能名称】主键
     * @return 【请填写功能名称】
     */
    @Override
    public SysApp selectSysAppByAppId(String appId)
    {
        return sysAppMapper.selectSysAppByAppId(appId);
    }

    /**
     * 查询【请填写功能名称】列表
     *
     * @param sysApp 【请填写功能名称】
     * @return 【请填写功能名称】
     */
    @Override
    public List<SysApp> selectSysAppList(SysApp sysApp)
    {
        return sysAppMapper.selectSysAppList(sysApp);
    }

    /**
     * 新增【请填写功能名称】
     *
     * @param sysApp 【请填写功能名称】
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int insertSysApp(SysApp sysApp)
    {
        String uuid = IdUtils.fastSimpleUUID();
        sysApp.setAppId(uuid);
        // List<SysMenu> menus = menuMapper.selectMenuTreeByUserId(2L);
        SysMenu menu = new SysMenu();
        menu.setAppId(uuid);
        menu.setParentId(0L);
        menu.setMenuName("系统管理");
        menu.setPath("system");
        // menu.setComponent();
        menu.setVisible("0");
        menu.setStatus("0");
        // menu.setPerms();
        menu.setIsCache("0");
        menu.setIsFrame("1");
        menu.setMenuType("M");
        menu.setIcon("system");
        menu.setOrderNum("1");
        menu.setCreateTime(new Date());
        menuMapper.insertMenu(menu);

        SysMenu menu1 = new SysMenu();
        menu1.setAppId(uuid);
        menu1.setParentId(menu.getMenuId());
        menu1.setMenuName("角色管理");
        menu1.setPath("role");
        menu1.setComponent("system/role/index");
        menu1.setVisible("0");
        menu1.setStatus("0");
        menu1.setPerms("system:role:list");
        menu1.setIsCache("0");
        menu1.setIsFrame("1");
        menu1.setMenuType("C");
        menu1.setIcon("peoples");
        menu1.setOrderNum("2");
        menu1.setCreateTime(new Date());
        menuMapper.insertMenu(menu1);
        List<SysMenu> roleList = menuMapper.selectMenuByParentId(101L);
        for(SysMenu list : roleList)
        {
            list.setParentId(menu1.getMenuId());
            list.setAppId(uuid);
            list.setCreateTime(new Date());
            menuMapper.insertMenu(list);
        }
        SysMenu menu3 = new SysMenu();
        menu3.setAppId(uuid);
        menu3.setParentId(menu.getMenuId());
        menu3.setMenuName("菜单管理");
        menu3.setPath("menu");
        menu3.setComponent("system/menu/index");
        menu3.setVisible("0");
        menu3.setStatus("0");
        menu3.setPerms("system:menu:list");
        menu3.setIsCache("0");
        menu3.setIsFrame("1");
        menu3.setMenuType("C");
        menu3.setIcon("tree-table");
        menu3.setOrderNum("3");
        menu3.setCreateTime(new Date());
        menuMapper.insertMenu(menu3);
        List<SysMenu> menuList = menuMapper.selectMenuByParentId(102L);
        for(SysMenu list : menuList)
        {
            list.setParentId(menu3.getMenuId());
            list.setAppId(uuid);
            list.setCreateTime(new Date());
            menuMapper.insertMenu(list);
        }
        return sysAppMapper.insertSysApp(sysApp);
    }

    /**
     * 修改【请填写功能名称】
     *
     * @param sysApp 【请填写功能名称】
     * @return 结果
     */
    @Override
    public int updateSysApp(SysApp sysApp)
    {
        return sysAppMapper.updateSysApp(sysApp);
    }

    /**
     * 批量删除【请填写功能名称】
     *
     * @param appIds 需要删除的【请填写功能名称】主键
     * @return 结果
     */
    @Override
    @Transactional(rollbackFor = Exception.class)
    public int deleteSysAppByAppIds(String[] appIds)
    {
        List<String> strings = Arrays.asList(appIds);
        if(strings.contains("27ecdacdfa3f44799c0f4eab5de44f42") == true)
        {
            return 0;
        }
        for(String appId : appIds)
        {
            // 删除该应用下的所有菜单
            menuMapper.deleteMenuByAppId(appId);
            // 删除该应用下的角色和菜单关联表中的数据
            List<RoleTreeChildren> roleTreeChildren = sysRoleMapper.selectRoleListByAppId(appId);
            for(RoleTreeChildren children : roleTreeChildren)
            {
                sysRoleMenuMapper.deleteRoleMenuByRoleId(children.getId());
            }
            // 删除该应用下的所有角色
            sysRoleMapper.deleteRoleByAppId(appId);
        }

        return sysAppMapper.deleteSysAppByAppIds(appIds);
    }

    /**
     * 删除【请填写功能名称】信息
     *
     * @param appId 【请填写功能名称】主键
     * @return 结果
     */
    @Override
    public int deleteSysAppByAppId(String appId)
    {
        return sysAppMapper.deleteSysAppByAppId(appId);
    }

    @Override
    public List<RoleTree> selectAppList() {
        List<RoleTree> roleTrees = sysAppMapper.selectAppList();
        for(RoleTree roleTree : roleTrees)
        {
            List<RoleTreeChildren> roleTreeChildren = sysRoleMapper.selectRoleListByAppId(roleTree.getId());
            roleTree.setChildren(roleTreeChildren);
        }
        return roleTrees;
    }
}
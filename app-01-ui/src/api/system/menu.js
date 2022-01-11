import request from '@/utils/request'

import settings from '@/settings.js'

// 查询菜单列表
export function listMenu(query) {
  query.appId = settings.appId
  return request({
    url: '/system/menu/list',
    method: 'get',
    params: query
  })
}

// 查询菜单详细
export function getMenu(menuId) {
  return request({
    url: '/system/menu/' + menuId,
    method: 'get'
  })
}

// 查询菜单下拉树结构
export function treeselect() {
  return request({
    url: '/system/menu/treeselect',
    method: 'get',
    params: {
      'appId': settings.appId
    }
  })
}

// 根据角色ID查询菜单下拉树结构
export function roleMenuTreeselect(roleId, query) {
  return request({
    url: '/system/menu/roleMenuTreeselect/' + roleId,
    method: 'get',
    params: query
  })
}

// 新增菜单
export function addMenu(data) {
  data.appId = settings.appId
  return request({
    url: '/system/menu',
    method: 'post',
    data: data
  })
}

// 修改菜单
export function updateMenu(data) {
  data.appId = settings.appId;
  return request({
    url: '/system/menu',
    method: 'put',
    data: data
  })
}

// 删除菜单
export function delMenu(menuId) {
  return request({
    url: '/system/menu/' + menuId,
    method: 'delete'
  })
}
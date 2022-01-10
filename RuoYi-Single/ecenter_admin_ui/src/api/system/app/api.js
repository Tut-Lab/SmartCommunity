import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listApp(query) {
  return request({
    url: '/system/app/list',
    method: 'get',
    params: query
  })
}

// 查询【请填写功能名称】详细
export function getApp(appId) {
  return request({
    url: '/system/app/' + appId,
    method: 'get'
  })
}

// 新增【请填写功能名称】
export function addApp(data) {
  return request({
    url: '/system/app',
    method: 'post',
    data: data
  })
}

// 修改【请填写功能名称】
export function updateApp(data) {
  return request({
    url: '/system/app',
    method: 'put',
    data: data
  })
}

// 删除【请填写功能名称】
export function delApp(appId) {
  return request({
    url: '/system/app/' + appId,
    method: 'delete'
  })
}

// 导出【请填写功能名称】
export function exportApp(query) {
  return request({
    url: '/system/app/export',
    method: 'get',
    params: query
  })
}

export function getAppIdList(query) {
    return request({
      url: '/system/app/getAppIdList',
      method: 'get',
      params: query
    })
}
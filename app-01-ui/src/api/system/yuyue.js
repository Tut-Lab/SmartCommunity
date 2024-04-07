import request from '@/utils/request'

// 查询用户信息列表
export function listYuyue(query) {
  return request({
    url: '/system/yuyue/list',
    method: 'get',
    params: query
  })
}

// 查询用户信息详细
export function getYuyue(yuyueId) {
  return request({
    url: '/system/yuyue/' + yuyueId,
    method: 'get'
  })
}

// 新增用户信息
export function addYuyue(data) {
  return request({
    url: '/system/yuyue',
    method: 'post',
    data: data
  })
}

// 修改用户信息
export function updateYuyue(data) {
  return request({
    url: '/system/yuyue',
    method: 'put',
    data: data
  })
}

// 删除用户信息
export function delYuyue(yuyueId) {
  return request({
    url: '/system/yuyue/' + yuyueId,
    method: 'delete'
  })
}

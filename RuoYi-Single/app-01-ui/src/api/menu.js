import request from '@/utils/request'

import settings from '@/settings.js'

// 获取路由
export const getRouters = () => {
  return request({
    url: '/getRouters',
    method: 'get',
    params: {
      'appId': settings.appId
    }
  })
}
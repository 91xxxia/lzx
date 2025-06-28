import request from '@/utils/request'

// 查询医疗服务者标识信息列表
export function listProviders(query) {
  return request({
    url: '/FollowSys/providers/list',
    method: 'get',
    params: query
  })
}

// 查询医疗服务者标识信息详细
export function getProviders(providerId) {
  return request({
    url: '/FollowSys/providers/' + providerId,
    method: 'get'
  })
}

// 新增医疗服务者标识信息
export function addProviders(data) {
  return request({
    url: '/FollowSys/providers',
    method: 'post',
    data: data
  })
}

// 修改医疗服务者标识信息
export function updateProviders(data) {
  return request({
    url: '/FollowSys/providers',
    method: 'put',
    data: data
  })
}

// 删除医疗服务者标识信息
export function delProviders(providerId) {
  return request({
    url: '/FollowSys/providers/' + providerId,
    method: 'delete'
  })
}

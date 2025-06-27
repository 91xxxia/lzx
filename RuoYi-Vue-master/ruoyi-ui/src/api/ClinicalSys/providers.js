import request from '@/utils/request'

// 查询医疗服务者标识信息列表
export function listProviders(query) {
  return request({
    url: '/ClinicalSys/providers/list',
    method: 'get',
    params: query
  })
}

// 查询医疗服务者标识信息详细
export function getProviders(providerId) {
  return request({
    url: '/ClinicalSys/providers/' + providerId,
    method: 'get'
  })
}

// 新增医疗服务者标识信息
export function addProviders(data) {
  return request({
    url: '/ClinicalSys/providers',
    method: 'post',
    data: data
  })
}

// 修改医疗服务者标识信息
export function updateProviders(data) {
  return request({
    url: '/ClinicalSys/providers',
    method: 'put',
    data: data
  })
}

// 删除医疗服务者标识信息
export function delProviders(providerId) {
  return request({
    url: '/ClinicalSys/providers/' + providerId,
    method: 'delete'
  })
}

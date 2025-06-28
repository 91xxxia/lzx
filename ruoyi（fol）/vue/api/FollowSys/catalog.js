import request from '@/utils/request'

// 查询药物记录列表
export function listCatalog(query) {
  return request({
    url: '/FollowSys/catalog/list',
    method: 'get',
    params: query
  })
}

// 查询药物记录详细
export function getCatalog(drugId) {
  return request({
    url: '/FollowSys/catalog/' + drugId,
    method: 'get'
  })
}

// 新增药物记录
export function addCatalog(data) {
  return request({
    url: '/FollowSys/catalog',
    method: 'post',
    data: data
  })
}

// 修改药物记录
export function updateCatalog(data) {
  return request({
    url: '/FollowSys/catalog',
    method: 'put',
    data: data
  })
}

// 删除药物记录
export function delCatalog(drugId) {
  return request({
    url: '/FollowSys/catalog/' + drugId,
    method: 'delete'
  })
}

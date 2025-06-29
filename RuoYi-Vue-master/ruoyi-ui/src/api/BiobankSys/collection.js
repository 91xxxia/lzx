import request from '@/utils/request'

// 查询CRF表格列表
export function listCollection(query) {
  return request({
    url: '/BiobankSys/collection/list',
    method: 'get',
    params: query
  })
}

// 查询CRF表格详细
export function getCollection(crfId) {
  return request({
    url: '/BiobankSys/collection/' + crfId,
    method: 'get'
  })
}

// 新增CRF表格
export function addCollection(data) {
  return request({
    url: '/BiobankSys/collection',
    method: 'post',
    data: data
  })
}

// 修改CRF表格
export function updateCollection(data) {
  return request({
    url: '/BiobankSys/collection',
    method: 'put',
    data: data
  })
}

// 删除CRF表格
export function delCollection(crfId) {
  return request({
    url: '/BiobankSys/collection/' + crfId,
    method: 'delete'
  })
}

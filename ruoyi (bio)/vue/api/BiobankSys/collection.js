import request from '@/utils/request'

// 查询样本采集CRF列表
export function listCollection(query) {
  return request({
    url: '/BiobankSys/collection/list',
    method: 'get',
    params: query
  })
}

// 查询样本采集CRF详细
export function getCollection(crfId) {
  return request({
    url: '/BiobankSys/collection/' + crfId,
    method: 'get'
  })
}

// 新增样本采集CRF
export function addCollection(data) {
  return request({
    url: '/BiobankSys/collection',
    method: 'post',
    data: data
  })
}

// 修改样本采集CRF
export function updateCollection(data) {
  return request({
    url: '/BiobankSys/collection',
    method: 'put',
    data: data
  })
}

// 删除样本采集CRF
export function delCollection(crfId) {
  return request({
    url: '/BiobankSys/collection/' + crfId,
    method: 'delete'
  })
}

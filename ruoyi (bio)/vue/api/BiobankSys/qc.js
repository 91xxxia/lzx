import request from '@/utils/request'

// 查询样本质量控表列表
export function listQc(query) {
  return request({
    url: '/BiobankSys/qc/list',
    method: 'get',
    params: query
  })
}

// 查询样本质量控表详细
export function getQc(qcId) {
  return request({
    url: '/BiobankSys/qc/' + qcId,
    method: 'get'
  })
}

// 新增样本质量控表
export function addQc(data) {
  return request({
    url: '/BiobankSys/qc',
    method: 'post',
    data: data
  })
}

// 修改样本质量控表
export function updateQc(data) {
  return request({
    url: '/BiobankSys/qc',
    method: 'put',
    data: data
  })
}

// 删除样本质量控表
export function delQc(qcId) {
  return request({
    url: '/BiobankSys/qc/' + qcId,
    method: 'delete'
  })
}

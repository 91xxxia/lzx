import request from '@/utils/request'

// 查询其他潜在混杂因素列表
export function listFactors(query) {
  return request({
    url: '/EpidemSys/factors/list',
    method: 'get',
    params: query
  })
}

// 查询其他潜在混杂因素详细
export function getFactors(confoundId) {
  return request({
    url: '/EpidemSys/factors/' + confoundId,
    method: 'get'
  })
}

// 新增其他潜在混杂因素
export function addFactors(data) {
  return request({
    url: '/EpidemSys/factors',
    method: 'post',
    data: data
  })
}

// 修改其他潜在混杂因素
export function updateFactors(data) {
  return request({
    url: '/EpidemSys/factors',
    method: 'put',
    data: data
  })
}

// 删除其他潜在混杂因素
export function delFactors(confoundId) {
  return request({
    url: '/EpidemSys/factors/' + confoundId,
    method: 'delete'
  })
}

import request from '@/utils/request'

// 查询呼出气一氧化氮检测列表
export function listTests(query) {
  return request({
    url: '/ClinicalSys/tests/list',
    method: 'get',
    params: query
  })
}

// 查询呼出气一氧化氮检测详细
export function getTests(fenoId) {
  return request({
    url: '/ClinicalSys/tests/' + fenoId,
    method: 'get'
  })
}

// 新增呼出气一氧化氮检测
export function addTests(data) {
  return request({
    url: '/ClinicalSys/tests',
    method: 'post',
    data: data
  })
}

// 修改呼出气一氧化氮检测
export function updateTests(data) {
  return request({
    url: '/ClinicalSys/tests',
    method: 'put',
    data: data
  })
}

// 删除呼出气一氧化氮检测
export function delTests(fenoId) {
  return request({
    url: '/ClinicalSys/tests/' + fenoId,
    method: 'delete'
  })
}

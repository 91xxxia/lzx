import request from '@/utils/request'

// 查询实验室检查列表
export function listLabtests(query) {
  return request({
    url: '/ClinicalSys/labtests/list',
    method: 'get',
    params: query
  })
}

// 查询实验室检查详细
export function getLabtests(testId) {
  return request({
    url: '/ClinicalSys/labtests/' + testId,
    method: 'get'
  })
}

// 新增实验室检查
export function addLabtests(data) {
  return request({
    url: '/ClinicalSys/labtests',
    method: 'post',
    data: data
  })
}

// 修改实验室检查
export function updateLabtests(data) {
  return request({
    url: '/ClinicalSys/labtests',
    method: 'put',
    data: data
  })
}

// 删除实验室检查
export function delLabtests(testId) {
  return request({
    url: '/ClinicalSys/labtests/' + testId,
    method: 'delete'
  })
}

import request from '@/utils/request'

// 查询实验室检查列表
export function listLab_tests(query) {
  return request({
    url: '/ClinicalSys/lab_tests/list',
    method: 'get',
    params: query
  })
}

// 查询实验室检查详细
export function getLab_tests(testId) {
  return request({
    url: '/ClinicalSys/lab_tests/' + testId,
    method: 'get'
  })
}

// 新增实验室检查
export function addLab_tests(data) {
  return request({
    url: '/ClinicalSys/lab_tests',
    method: 'post',
    data: data
  })
}

// 修改实验室检查
export function updateLab_tests(data) {
  return request({
    url: '/ClinicalSys/lab_tests',
    method: 'put',
    data: data
  })
}

// 删除实验室检查
export function delLab_tests(testId) {
  return request({
    url: '/ClinicalSys/lab_tests/' + testId,
    method: 'delete'
  })
}

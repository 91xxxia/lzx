import request from '@/utils/request'

// 查询肺功能检查列表
export function listLung_tests(query) {
  return request({
    url: '/ClinicalSys/lung_tests/list',
    method: 'get',
    params: query
  })
}

// 查询肺功能检查详细
export function getLung_tests(lungId) {
  return request({
    url: '/ClinicalSys/lung_tests/' + lungId,
    method: 'get'
  })
}

// 新增肺功能检查
export function addLung_tests(data) {
  return request({
    url: '/ClinicalSys/lung_tests',
    method: 'post',
    data: data
  })
}

// 修改肺功能检查
export function updateLung_tests(data) {
  return request({
    url: '/ClinicalSys/lung_tests',
    method: 'put',
    data: data
  })
}

// 删除肺功能检查
export function delLung_tests(lungId) {
  return request({
    url: '/ClinicalSys/lung_tests/' + lungId,
    method: 'delete'
  })
}

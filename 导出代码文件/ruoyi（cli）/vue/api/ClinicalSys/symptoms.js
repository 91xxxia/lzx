import request from '@/utils/request'

// 查询症状及体征列表
export function listSymptoms(query) {
  return request({
    url: '/ClinicalSys/symptoms/list',
    method: 'get',
    params: query
  })
}

// 查询症状及体征详细
export function getSymptoms(symptomId) {
  return request({
    url: '/ClinicalSys/symptoms/' + symptomId,
    method: 'get'
  })
}

// 新增症状及体征
export function addSymptoms(data) {
  return request({
    url: '/ClinicalSys/symptoms',
    method: 'post',
    data: data
  })
}

// 修改症状及体征
export function updateSymptoms(data) {
  return request({
    url: '/ClinicalSys/symptoms',
    method: 'put',
    data: data
  })
}

// 删除症状及体征
export function delSymptoms(symptomId) {
  return request({
    url: '/ClinicalSys/symptoms/' + symptomId,
    method: 'delete'
  })
}

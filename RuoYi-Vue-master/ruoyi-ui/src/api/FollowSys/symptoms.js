import request from '@/utils/request'

// 查询症状列表
export function listSymptoms(query) {
  return request({
    url: '/FollowSys/symptoms/list',
    method: 'get',
    params: query
  })
}

// 查询症状详细
export function getSymptoms(symptomId) {
  return request({
    url: '/FollowSys/symptoms/' + symptomId,
    method: 'get'
  })
}

// 新增症状
export function addSymptoms(data) {
  return request({
    url: '/FollowSys/symptoms',
    method: 'post',
    data: data
  })
}

// 修改症状
export function updateSymptoms(data) {
  return request({
    url: '/FollowSys/symptoms',
    method: 'put',
    data: data
  })
}

// 删除症状
export function delSymptoms(symptomId) {
  return request({
    url: '/FollowSys/symptoms/' + symptomId,
    method: 'delete'
  })
}

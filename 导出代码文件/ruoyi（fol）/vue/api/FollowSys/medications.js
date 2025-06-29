import request from '@/utils/request'

// 查询用药列表
export function listMedications(query) {
  return request({
    url: '/FollowSys/medications/list',
    method: 'get',
    params: query
  })
}

// 查询用药详细
export function getMedications(medId) {
  return request({
    url: '/FollowSys/medications/' + medId,
    method: 'get'
  })
}

// 新增用药
export function addMedications(data) {
  return request({
    url: '/FollowSys/medications',
    method: 'post',
    data: data
  })
}

// 修改用药
export function updateMedications(data) {
  return request({
    url: '/FollowSys/medications',
    method: 'put',
    data: data
  })
}

// 删除用药
export function delMedications(medId) {
  return request({
    url: '/FollowSys/medications/' + medId,
    method: 'delete'
  })
}

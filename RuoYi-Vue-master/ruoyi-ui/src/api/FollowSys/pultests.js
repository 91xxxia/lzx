import request from '@/utils/request'

// 查询肺功能检查列表
export function listPultests(query) {
  return request({
    url: '/FollowSys/pultests/list',
    method: 'get',
    params: query
  })
}

// 查询肺功能检查详细
export function getPultests(testId) {
  return request({
    url: '/FollowSys/pultests/' + testId,
    method: 'get'
  })
}

// 新增肺功能检查
export function addPultests(data) {
  return request({
    url: '/FollowSys/pultests',
    method: 'post',
    data: data
  })
}

// 修改肺功能检查
export function updatePultests(data) {
  return request({
    url: '/FollowSys/pultests',
    method: 'put',
    data: data
  })
}

// 删除肺功能检查
export function delPultests(testId) {
  return request({
    url: '/FollowSys/pultests/' + testId,
    method: 'delete'
  })
}

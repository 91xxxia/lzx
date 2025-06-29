import request from '@/utils/request'

// 查询随访记录列表
export function listVisits(query) {
  return request({
    url: '/FollowSys/visits/list',
    method: 'get',
    params: query
  })
}

// 查询随访记录详细
export function getVisits(followupId) {
  return request({
    url: '/FollowSys/visits/' + followupId,
    method: 'get'
  })
}

// 新增随访记录
export function addVisits(data) {
  return request({
    url: '/FollowSys/visits',
    method: 'post',
    data: data
  })
}

// 修改随访记录
export function updateVisits(data) {
  return request({
    url: '/FollowSys/visits',
    method: 'put',
    data: data
  })
}

// 删除随访记录
export function delVisits(followupId) {
  return request({
    url: '/FollowSys/visits/' + followupId,
    method: 'delete'
  })
}

import request from '@/utils/request'

// 查询鼻阻力列表
export function listNasaltests(query) {
  return request({
    url: '/FollowSys/nasaltests/list',
    method: 'get',
    params: query
  })
}

// 查询鼻阻力详细
export function getNasaltests(nasalId) {
  return request({
    url: '/FollowSys/nasaltests/' + nasalId,
    method: 'get'
  })
}

// 新增鼻阻力
export function addNasaltests(data) {
  return request({
    url: '/FollowSys/nasaltests',
    method: 'post',
    data: data
  })
}

// 修改鼻阻力
export function updateNasaltests(data) {
  return request({
    url: '/FollowSys/nasaltests',
    method: 'put',
    data: data
  })
}

// 删除鼻阻力
export function delNasaltests(nasalId) {
  return request({
    url: '/FollowSys/nasaltests/' + nasalId,
    method: 'delete'
  })
}

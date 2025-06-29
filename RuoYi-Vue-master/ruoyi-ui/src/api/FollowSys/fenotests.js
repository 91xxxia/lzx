import request from '@/utils/request'

// 查询呼出气一氧化氮检测列表
export function listFenotests(query) {
  return request({
    url: '/FollowSys/fenotests/list',
    method: 'get',
    params: query
  })
}

// 查询呼出气一氧化氮检测详细
export function getFenotests(fenoId) {
  return request({
    url: '/FollowSys/fenotests/' + fenoId,
    method: 'get'
  })
}

// 新增呼出气一氧化氮检测
export function addFenotests(data) {
  return request({
    url: '/FollowSys/fenotests',
    method: 'post',
    data: data
  })
}

// 修改呼出气一氧化氮检测
export function updateFenotests(data) {
  return request({
    url: '/FollowSys/fenotests',
    method: 'put',
    data: data
  })
}

// 删除呼出气一氧化氮检测
export function delFenotests(fenoId) {
  return request({
    url: '/FollowSys/fenotests/' + fenoId,
    method: 'delete'
  })
}

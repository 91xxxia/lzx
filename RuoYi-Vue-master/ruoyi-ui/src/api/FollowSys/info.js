import request from '@/utils/request'

// 查询随访基本信息列表
export function listInfo(query) {
  return request({
    url: '/FollowSys/info/list',
    method: 'get',
    params: query
  })
}

// 查询随访基本信息详细
export function getInfo(followupId) {
  return request({
    url: '/FollowSys/info/' + followupId,
    method: 'get'
  })
}

// 新增随访基本信息
export function addInfo(data) {
  return request({
    url: '/FollowSys/info',
    method: 'post',
    data: data
  })
}

// 修改随访基本信息
export function updateInfo(data) {
  return request({
    url: '/FollowSys/info',
    method: 'put',
    data: data
  })
}

// 删除随访基本信息
export function delInfo(followupId) {
  return request({
    url: '/FollowSys/info/' + followupId,
    method: 'delete'
  })
}

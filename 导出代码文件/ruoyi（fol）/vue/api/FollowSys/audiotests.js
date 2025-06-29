import request from '@/utils/request'

// 查询听力检查列表
export function listAudiotests(query) {
  return request({
    url: '/FollowSys/audiotests/list',
    method: 'get',
    params: query
  })
}

// 查询听力检查详细
export function getAudiotests(audioId) {
  return request({
    url: '/FollowSys/audiotests/' + audioId,
    method: 'get'
  })
}

// 新增听力检查
export function addAudiotests(data) {
  return request({
    url: '/FollowSys/audiotests',
    method: 'post',
    data: data
  })
}

// 修改听力检查
export function updateAudiotests(data) {
  return request({
    url: '/FollowSys/audiotests',
    method: 'put',
    data: data
  })
}

// 删除听力检查
export function delAudiotests(audioId) {
  return request({
    url: '/FollowSys/audiotests/' + audioId,
    method: 'delete'
  })
}

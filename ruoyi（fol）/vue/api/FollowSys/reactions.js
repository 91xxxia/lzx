import request from '@/utils/request'

// 查询药物不良反应列表
export function listReactions(query) {
  return request({
    url: '/FollowSys/reactions/list',
    method: 'get',
    params: query
  })
}

// 查询药物不良反应详细
export function getReactions(reactionId) {
  return request({
    url: '/FollowSys/reactions/' + reactionId,
    method: 'get'
  })
}

// 新增药物不良反应
export function addReactions(data) {
  return request({
    url: '/FollowSys/reactions',
    method: 'post',
    data: data
  })
}

// 修改药物不良反应
export function updateReactions(data) {
  return request({
    url: '/FollowSys/reactions',
    method: 'put',
    data: data
  })
}

// 删除药物不良反应
export function delReactions(reactionId) {
  return request({
    url: '/FollowSys/reactions/' + reactionId,
    method: 'delete'
  })
}

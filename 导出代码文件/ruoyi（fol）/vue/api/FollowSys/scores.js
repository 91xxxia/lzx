import request from '@/utils/request'

// 查询调查问卷列表
export function listScores(query) {
  return request({
    url: '/FollowSys/scores/list',
    method: 'get',
    params: query
  })
}

// 查询调查问卷详细
export function getScores(questionnaireId) {
  return request({
    url: '/FollowSys/scores/' + questionnaireId,
    method: 'get'
  })
}

// 新增调查问卷
export function addScores(data) {
  return request({
    url: '/FollowSys/scores',
    method: 'post',
    data: data
  })
}

// 修改调查问卷
export function updateScores(data) {
  return request({
    url: '/FollowSys/scores',
    method: 'put',
    data: data
  })
}

// 删除调查问卷
export function delScores(questionnaireId) {
  return request({
    url: '/FollowSys/scores/' + questionnaireId,
    method: 'delete'
  })
}

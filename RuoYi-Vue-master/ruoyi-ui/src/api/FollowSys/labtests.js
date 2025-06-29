import request from '@/utils/request'

// 查询实验室检查列表
export function listLabtests(query) {
  return request({
    url: '/FollowSys/labtests/list',
    method: 'get',
    params: query
  })
}

// 查询实验室检查详细
export function getLabtests(labtestId) {
  return request({
    url: '/FollowSys/labtests/' + labtestId,
    method: 'get'
  })
}

// 新增实验室检查
export function addLabtests(data) {
  return request({
    url: '/FollowSys/labtests',
    method: 'post',
    data: data
  })
}

// 修改实验室检查
export function updateLabtests(data) {
  return request({
    url: '/FollowSys/labtests',
    method: 'put',
    data: data
  })
}

// 删除实验室检查
export function delLabtests(labtestId) {
  return request({
    url: '/FollowSys/labtests/' + labtestId,
    method: 'delete'
  })
}

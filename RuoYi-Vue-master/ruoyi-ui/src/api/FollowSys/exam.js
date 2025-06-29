import request from '@/utils/request'

// 查询体征列表
export function listExam(query) {
  return request({
    url: '/FollowSys/exam/list',
    method: 'get',
    params: query
  })
}

// 查询体征详细
export function getExam(examId) {
  return request({
    url: '/FollowSys/exam/' + examId,
    method: 'get'
  })
}

// 新增体征
export function addExam(data) {
  return request({
    url: '/FollowSys/exam',
    method: 'post',
    data: data
  })
}

// 修改体征
export function updateExam(data) {
  return request({
    url: '/FollowSys/exam',
    method: 'put',
    data: data
  })
}

// 删除体征
export function delExam(examId) {
  return request({
    url: '/FollowSys/exam/' + examId,
    method: 'delete'
  })
}

import request from '@/utils/request'

// 查询随访信息列表
export function listSummary(query) {
  return request({
    url: '/FollowSys/summary/list',
    method: 'get',
    params: query
  })
}

// 查询随访信息详细
export function getSummary(summaryId) {
  return request({
    url: '/FollowSys/summary/' + summaryId,
    method: 'get'
  })
}

// 新增随访信息
export function addSummary(data) {
  return request({
    url: '/FollowSys/summary',
    method: 'post',
    data: data
  })
}

// 修改随访信息
export function updateSummary(data) {
  return request({
    url: '/FollowSys/summary',
    method: 'put',
    data: data
  })
}

// 删除随访信息
export function delSummary(summaryId) {
  return request({
    url: '/FollowSys/summary/' + summaryId,
    method: 'delete'
  })
}

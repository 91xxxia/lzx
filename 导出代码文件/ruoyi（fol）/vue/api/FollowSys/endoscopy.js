import request from '@/utils/request'

// 查询电子鼻咽喉镜列表
export function listEndoscopy(query) {
  return request({
    url: '/FollowSys/endoscopy/list',
    method: 'get',
    params: query
  })
}

// 查询电子鼻咽喉镜详细
export function getEndoscopy(endoscopyId) {
  return request({
    url: '/FollowSys/endoscopy/' + endoscopyId,
    method: 'get'
  })
}

// 新增电子鼻咽喉镜
export function addEndoscopy(data) {
  return request({
    url: '/FollowSys/endoscopy',
    method: 'post',
    data: data
  })
}

// 修改电子鼻咽喉镜
export function updateEndoscopy(data) {
  return request({
    url: '/FollowSys/endoscopy',
    method: 'put',
    data: data
  })
}

// 删除电子鼻咽喉镜
export function delEndoscopy(endoscopyId) {
  return request({
    url: '/FollowSys/endoscopy/' + endoscopyId,
    method: 'delete'
  })
}

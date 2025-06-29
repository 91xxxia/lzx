import request from '@/utils/request'

// 查询其他辅助治疗列表
export function listOthertreatments(query) {
  return request({
    url: '/FollowSys/othertreatments/list',
    method: 'get',
    params: query
  })
}

// 查询其他辅助治疗详细
export function getOthertreatments(treatmentId) {
  return request({
    url: '/FollowSys/othertreatments/' + treatmentId,
    method: 'get'
  })
}

// 新增其他辅助治疗
export function addOthertreatments(data) {
  return request({
    url: '/FollowSys/othertreatments',
    method: 'post',
    data: data
  })
}

// 修改其他辅助治疗
export function updateOthertreatments(data) {
  return request({
    url: '/FollowSys/othertreatments',
    method: 'put',
    data: data
  })
}

// 删除其他辅助治疗
export function delOthertreatments(treatmentId) {
  return request({
    url: '/FollowSys/othertreatments/' + treatmentId,
    method: 'delete'
  })
}

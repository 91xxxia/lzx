import request from '@/utils/request'

// 查询肺功能检查列表
export function listLungtests(query) {
  return request({
    url: '/ClinicalSys/lungtests/list',
    method: 'get',
    params: query
  })
}

// 查询肺功能检查详细
export function getLungtests(lungId) {
  return request({
    url: '/ClinicalSys/lungtests/' + lungId,
    method: 'get'
  })
}

// 新增肺功能检查
export function addLungtests(data) {
  return request({
    url: '/ClinicalSys/lungtests',
    method: 'post',
    data: data
  })
}

// 修改肺功能检查
export function updateLungtests(data) {
  return request({
    url: '/ClinicalSys/lungtests',
    method: 'put',
    data: data
  })
}

// 删除肺功能检查
export function delLungtests(lungId) {
  return request({
    url: '/ClinicalSys/lungtests/' + lungId,
    method: 'delete'
  })
}

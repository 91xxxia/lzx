import request from '@/utils/request'

// 查询其他辅助治疗列表
export function listTreatments(query) {
  return request({
    url: '/ClinicalSys/treatments/list',
    method: 'get',
    params: query
  })
}

// 查询其他辅助治疗详细
export function getTreatments(treatmentId) {
  return request({
    url: '/ClinicalSys/treatments/' + treatmentId,
    method: 'get'
  })
}

// 新增其他辅助治疗
export function addTreatments(data) {
  return request({
    url: '/ClinicalSys/treatments',
    method: 'post',
    data: data
  })
}

// 修改其他辅助治疗
export function updateTreatments(data) {
  return request({
    url: '/ClinicalSys/treatments',
    method: 'put',
    data: data
  })
}

// 删除其他辅助治疗
export function delTreatments(treatmentId) {
  return request({
    url: '/ClinicalSys/treatments/' + treatmentId,
    method: 'delete'
  })
}

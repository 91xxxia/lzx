import request from '@/utils/request'

// 查询患者基本信息列表
export function listPatients(query) {
  return request({
    url: '/ClinicalSys/patients/list',
    method: 'get',
    params: query
  })
}

// 查询患者基本信息详细
export function getPatients(patientId) {
  return request({
    url: '/ClinicalSys/patients/' + patientId,
    method: 'get'
  })
}

// 新增患者基本信息
export function addPatients(data) {
  return request({
    url: '/ClinicalSys/patients',
    method: 'post',
    data: data
  })
}

// 修改患者基本信息
export function updatePatients(data) {
  return request({
    url: '/ClinicalSys/patients',
    method: 'put',
    data: data
  })
}

// 删除患者基本信息
export function delPatients(patientId) {
  return request({
    url: '/ClinicalSys/patients/' + patientId,
    method: 'delete'
  })
}

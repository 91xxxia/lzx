import request from '@/utils/request'

// 查询疾病诊断列表
export function listDiagnoses(query) {
  return request({
    url: '/ClinicalSys/diagnoses/list',
    method: 'get',
    params: query
  })
}

// 查询疾病诊断详细
export function getDiagnoses(diagnosisId) {
  return request({
    url: '/ClinicalSys/diagnoses/' + diagnosisId,
    method: 'get'
  })
}

// 新增疾病诊断
export function addDiagnoses(data) {
  return request({
    url: '/ClinicalSys/diagnoses',
    method: 'post',
    data: data
  })
}

// 修改疾病诊断
export function updateDiagnoses(data) {
  return request({
    url: '/ClinicalSys/diagnoses',
    method: 'put',
    data: data
  })
}

// 删除疾病诊断
export function delDiagnoses(diagnosisId) {
  return request({
    url: '/ClinicalSys/diagnoses/' + diagnosisId,
    method: 'delete'
  })
}

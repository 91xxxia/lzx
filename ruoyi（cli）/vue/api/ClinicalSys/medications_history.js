import request from '@/utils/request'

// 查询既往用药史列表
export function listMedications_history(query) {
  return request({
    url: '/ClinicalSys/medications_history/list',
    method: 'get',
    params: query
  })
}

// 查询既往用药史详细
export function getMedications_history(medHisId) {
  return request({
    url: '/ClinicalSys/medications_history/' + medHisId,
    method: 'get'
  })
}

// 新增既往用药史
export function addMedications_history(data) {
  return request({
    url: '/ClinicalSys/medications_history',
    method: 'post',
    data: data
  })
}

// 修改既往用药史
export function updateMedications_history(data) {
  return request({
    url: '/ClinicalSys/medications_history',
    method: 'put',
    data: data
  })
}

// 删除既往用药史
export function delMedications_history(medHisId) {
  return request({
    url: '/ClinicalSys/medications_history/' + medHisId,
    method: 'delete'
  })
}

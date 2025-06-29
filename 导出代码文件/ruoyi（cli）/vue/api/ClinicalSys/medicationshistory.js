import request from '@/utils/request'

// 查询既往用药史列表
export function listMedicationshistory(query) {
  return request({
    url: '/ClinicalSys/medicationshistory/list',
    method: 'get',
    params: query
  })
}

// 查询既往用药史详细
export function getMedicationshistory(medHisId) {
  return request({
    url: '/ClinicalSys/medicationshistory/' + medHisId,
    method: 'get'
  })
}

// 新增既往用药史
export function addMedicationshistory(data) {
  return request({
    url: '/ClinicalSys/medicationshistory',
    method: 'post',
    data: data
  })
}

// 修改既往用药史
export function updateMedicationshistory(data) {
  return request({
    url: '/ClinicalSys/medicationshistory',
    method: 'put',
    data: data
  })
}

// 删除既往用药史
export function delMedicationshistory(medHisId) {
  return request({
    url: '/ClinicalSys/medicationshistory/' + medHisId,
    method: 'delete'
  })
}

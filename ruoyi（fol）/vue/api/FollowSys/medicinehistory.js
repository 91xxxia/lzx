import request from '@/utils/request'

// 查询既往用药史列表
export function listMedicinehistory(query) {
  return request({
    url: '/FollowSys/medicinehistory/list',
    method: 'get',
    params: query
  })
}

// 查询既往用药史详细
export function getMedicinehistory(medHistId) {
  return request({
    url: '/FollowSys/medicinehistory/' + medHistId,
    method: 'get'
  })
}

// 新增既往用药史
export function addMedicinehistory(data) {
  return request({
    url: '/FollowSys/medicinehistory',
    method: 'post',
    data: data
  })
}

// 修改既往用药史
export function updateMedicinehistory(data) {
  return request({
    url: '/FollowSys/medicinehistory',
    method: 'put',
    data: data
  })
}

// 删除既往用药史
export function delMedicinehistory(medHistId) {
  return request({
    url: '/FollowSys/medicinehistory/' + medHistId,
    method: 'delete'
  })
}

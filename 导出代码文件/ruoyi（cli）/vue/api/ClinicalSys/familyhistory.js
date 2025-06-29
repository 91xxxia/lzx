import request from '@/utils/request'

// 查询家族史列表
export function listFamilyhistory(query) {
  return request({
    url: '/ClinicalSys/familyhistory/list',
    method: 'get',
    params: query
  })
}

// 查询家族史详细
export function getFamilyhistory(famId) {
  return request({
    url: '/ClinicalSys/familyhistory/' + famId,
    method: 'get'
  })
}

// 新增家族史
export function addFamilyhistory(data) {
  return request({
    url: '/ClinicalSys/familyhistory',
    method: 'post',
    data: data
  })
}

// 修改家族史
export function updateFamilyhistory(data) {
  return request({
    url: '/ClinicalSys/familyhistory',
    method: 'put',
    data: data
  })
}

// 删除家族史
export function delFamilyhistory(famId) {
  return request({
    url: '/ClinicalSys/familyhistory/' + famId,
    method: 'delete'
  })
}

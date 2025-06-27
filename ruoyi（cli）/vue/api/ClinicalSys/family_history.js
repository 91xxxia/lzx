import request from '@/utils/request'

// 查询家族史列表
export function listFamily_history(query) {
  return request({
    url: '/ClinicalSys/family_history/list',
    method: 'get',
    params: query
  })
}

// 查询家族史详细
export function getFamily_history(famId) {
  return request({
    url: '/ClinicalSys/family_history/' + famId,
    method: 'get'
  })
}

// 新增家族史
export function addFamily_history(data) {
  return request({
    url: '/ClinicalSys/family_history',
    method: 'post',
    data: data
  })
}

// 修改家族史
export function updateFamily_history(data) {
  return request({
    url: '/ClinicalSys/family_history',
    method: 'put',
    data: data
  })
}

// 删除家族史
export function delFamily_history(famId) {
  return request({
    url: '/ClinicalSys/family_history/' + famId,
    method: 'delete'
  })
}

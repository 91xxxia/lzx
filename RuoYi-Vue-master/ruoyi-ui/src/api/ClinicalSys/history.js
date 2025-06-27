import request from '@/utils/request'

// 查询既往史列表
export function listHistory(query) {
  return request({
    url: '/ClinicalSys/history/list',
    method: 'get',
    params: query
  })
}

// 查询既往史详细
export function getHistory(historyId) {
  return request({
    url: '/ClinicalSys/history/' + historyId,
    method: 'get'
  })
}

// 新增既往史
export function addHistory(data) {
  return request({
    url: '/ClinicalSys/history',
    method: 'post',
    data: data
  })
}

// 修改既往史
export function updateHistory(data) {
  return request({
    url: '/ClinicalSys/history',
    method: 'put',
    data: data
  })
}

// 删除既往史
export function delHistory(historyId) {
  return request({
    url: '/ClinicalSys/history/' + historyId,
    method: 'delete'
  })
}

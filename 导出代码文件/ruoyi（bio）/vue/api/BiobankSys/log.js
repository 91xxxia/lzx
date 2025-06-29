import request from '@/utils/request'

// 查询数据变更日志列表
export function listLog(query) {
  return request({
    url: '/BiobankSys/log/list',
    method: 'get',
    params: query
  })
}

// 查询数据变更日志详细
export function getLog(logId) {
  return request({
    url: '/BiobankSys/log/' + logId,
    method: 'get'
  })
}

// 新增数据变更日志
export function addLog(data) {
  return request({
    url: '/BiobankSys/log',
    method: 'post',
    data: data
  })
}

// 修改数据变更日志
export function updateLog(data) {
  return request({
    url: '/BiobankSys/log',
    method: 'put',
    data: data
  })
}

// 删除数据变更日志
export function delLog(logId) {
  return request({
    url: '/BiobankSys/log/' + logId,
    method: 'delete'
  })
}

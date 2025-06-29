import request from '@/utils/request'

// 查询样本采集事件列表
export function listEvents(query) {
  return request({
    url: '/BiobankSys/events/list',
    method: 'get',
    params: query
  })
}

// 查询样本采集事件详细
export function getEvents(eventId) {
  return request({
    url: '/BiobankSys/events/' + eventId,
    method: 'get'
  })
}

// 新增样本采集事件
export function addEvents(data) {
  return request({
    url: '/BiobankSys/events',
    method: 'post',
    data: data
  })
}

// 修改样本采集事件
export function updateEvents(data) {
  return request({
    url: '/BiobankSys/events',
    method: 'put',
    data: data
  })
}

// 删除样本采集事件
export function delEvents(eventId) {
  return request({
    url: '/BiobankSys/events/' + eventId,
    method: 'delete'
  })
}

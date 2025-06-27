import request from '@/utils/request'

// 查询蛋白质组数据列表
export function listProdata(query) {
  return request({
    url: '/BiobankSys/prodata/list',
    method: 'get',
    params: query
  })
}

// 查询蛋白质组数据详细
export function getProdata(proteomicId) {
  return request({
    url: '/BiobankSys/prodata/' + proteomicId,
    method: 'get'
  })
}

// 新增蛋白质组数据
export function addProdata(data) {
  return request({
    url: '/BiobankSys/prodata',
    method: 'post',
    data: data
  })
}

// 修改蛋白质组数据
export function updateProdata(data) {
  return request({
    url: '/BiobankSys/prodata',
    method: 'put',
    data: data
  })
}

// 删除蛋白质组数据
export function delProdata(proteomicId) {
  return request({
    url: '/BiobankSys/prodata/' + proteomicId,
    method: 'delete'
  })
}

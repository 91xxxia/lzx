import request from '@/utils/request'

// 查询微生物组数据列表
export function listMicdata(query) {
  return request({
    url: '/BiobankSys/micdata/list',
    method: 'get',
    params: query
  })
}

// 查询微生物组数据详细
export function getMicdata(microbiomeId) {
  return request({
    url: '/BiobankSys/micdata/' + microbiomeId,
    method: 'get'
  })
}

// 新增微生物组数据
export function addMicdata(data) {
  return request({
    url: '/BiobankSys/micdata',
    method: 'post',
    data: data
  })
}

// 修改微生物组数据
export function updateMicdata(data) {
  return request({
    url: '/BiobankSys/micdata',
    method: 'put',
    data: data
  })
}

// 删除微生物组数据
export function delMicdata(microbiomeId) {
  return request({
    url: '/BiobankSys/micdata/' + microbiomeId,
    method: 'delete'
  })
}

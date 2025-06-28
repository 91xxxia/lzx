import request from '@/utils/request'

// 查询微生物组数据列表
export function listMicrodata(query) {
  return request({
    url: '/BiobankSys/microdata/list',
    method: 'get',
    params: query
  })
}

// 查询微生物组数据详细
export function getMicrodata(microbiomeId) {
  return request({
    url: '/BiobankSys/microdata/' + microbiomeId,
    method: 'get'
  })
}

// 新增微生物组数据
export function addMicrodata(data) {
  return request({
    url: '/BiobankSys/microdata',
    method: 'post',
    data: data
  })
}

// 修改微生物组数据
export function updateMicrodata(data) {
  return request({
    url: '/BiobankSys/microdata',
    method: 'put',
    data: data
  })
}

// 删除微生物组数据
export function delMicrodata(microbiomeId) {
  return request({
    url: '/BiobankSys/microdata/' + microbiomeId,
    method: 'delete'
  })
}

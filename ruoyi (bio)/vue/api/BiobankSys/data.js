import request from '@/utils/request'

// 查询基因组数据列表
export function listData(query) {
  return request({
    url: '/BiobankSys/data/list',
    method: 'get',
    params: query
  })
}

// 查询基因组数据详细
export function getData(genomicId) {
  return request({
    url: '/BiobankSys/data/' + genomicId,
    method: 'get'
  })
}

// 新增基因组数据
export function addData(data) {
  return request({
    url: '/BiobankSys/data',
    method: 'post',
    data: data
  })
}

// 修改基因组数据
export function updateData(data) {
  return request({
    url: '/BiobankSys/data',
    method: 'put',
    data: data
  })
}

// 删除基因组数据
export function delData(genomicId) {
  return request({
    url: '/BiobankSys/data/' + genomicId,
    method: 'delete'
  })
}

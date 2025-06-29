import request from '@/utils/request'

// 查询基因组数据列表
export function listGenodata(query) {
  return request({
    url: '/BiobankSys/genodata/list',
    method: 'get',
    params: query
  })
}

// 查询基因组数据详细
export function getGenodata(genomicId) {
  return request({
    url: '/BiobankSys/genodata/' + genomicId,
    method: 'get'
  })
}

// 新增基因组数据
export function addGenodata(data) {
  return request({
    url: '/BiobankSys/genodata',
    method: 'post',
    data: data
  })
}

// 修改基因组数据
export function updateGenodata(data) {
  return request({
    url: '/BiobankSys/genodata',
    method: 'put',
    data: data
  })
}

// 删除基因组数据
export function delGenodata(genomicId) {
  return request({
    url: '/BiobankSys/genodata/' + genomicId,
    method: 'delete'
  })
}

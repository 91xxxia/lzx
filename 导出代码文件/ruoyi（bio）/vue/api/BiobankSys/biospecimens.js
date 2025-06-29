import request from '@/utils/request'

// 查询样本采集主表列表
export function listBiospecimens(query) {
  return request({
    url: '/BiobankSys/biospecimens/list',
    method: 'get',
    params: query
  })
}

// 查询样本采集主表详细
export function getBiospecimens(specimenId) {
  return request({
    url: '/BiobankSys/biospecimens/' + specimenId,
    method: 'get'
  })
}

// 新增样本采集主表
export function addBiospecimens(data) {
  return request({
    url: '/BiobankSys/biospecimens',
    method: 'post',
    data: data
  })
}

// 修改样本采集主表
export function updateBiospecimens(data) {
  return request({
    url: '/BiobankSys/biospecimens',
    method: 'put',
    data: data
  })
}

// 删除样本采集主表
export function delBiospecimens(specimenId) {
  return request({
    url: '/BiobankSys/biospecimens/' + specimenId,
    method: 'delete'
  })
}

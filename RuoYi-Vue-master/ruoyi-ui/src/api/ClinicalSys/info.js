import request from '@/utils/request'

// 查询医保情况列表
export function listInfo(query) {
  return request({
    url: '/ClinicalSys/info/list',
    method: 'get',
    params: query
  })
}

// 查询医保情况详细
export function getInfo(insuranceId) {
  return request({
    url: '/ClinicalSys/info/' + insuranceId,
    method: 'get'
  })
}

// 新增医保情况
export function addInfo(data) {
  return request({
    url: '/ClinicalSys/info',
    method: 'post',
    data: data
  })
}

// 修改医保情况
export function updateInfo(data) {
  return request({
    url: '/ClinicalSys/info',
    method: 'put',
    data: data
  })
}

// 删除医保情况
export function delInfo(insuranceId) {
  return request({
    url: '/ClinicalSys/info/' + insuranceId,
    method: 'delete'
  })
}

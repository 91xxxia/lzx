import request from '@/utils/request'

// 查询代谢组数据列表
export function listMetadata(query) {
  return request({
    url: '/BiobankSys/metadata/list',
    method: 'get',
    params: query
  })
}

// 查询代谢组数据详细
export function getMetadata(metabolomicId) {
  return request({
    url: '/BiobankSys/metadata/' + metabolomicId,
    method: 'get'
  })
}

// 新增代谢组数据
export function addMetadata(data) {
  return request({
    url: '/BiobankSys/metadata',
    method: 'post',
    data: data
  })
}

// 修改代谢组数据
export function updateMetadata(data) {
  return request({
    url: '/BiobankSys/metadata',
    method: 'put',
    data: data
  })
}

// 删除代谢组数据
export function delMetadata(metabolomicId) {
  return request({
    url: '/BiobankSys/metadata/' + metabolomicId,
    method: 'delete'
  })
}

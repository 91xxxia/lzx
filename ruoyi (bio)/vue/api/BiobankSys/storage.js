import request from '@/utils/request'

// 查询样本存储条件列表
export function listStorage(query) {
  return request({
    url: '/BiobankSys/storage/list',
    method: 'get',
    params: query
  })
}

// 查询样本存储条件详细
export function getStorage(storageId) {
  return request({
    url: '/BiobankSys/storage/' + storageId,
    method: 'get'
  })
}

// 新增样本存储条件
export function addStorage(data) {
  return request({
    url: '/BiobankSys/storage',
    method: 'post',
    data: data
  })
}

// 修改样本存储条件
export function updateStorage(data) {
  return request({
    url: '/BiobankSys/storage',
    method: 'put',
    data: data
  })
}

// 删除样本存储条件
export function delStorage(storageId) {
  return request({
    url: '/BiobankSys/storage/' + storageId,
    method: 'delete'
  })
}

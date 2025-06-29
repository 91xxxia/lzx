import request from '@/utils/request'

// 查询影像学检查列表
export function listImaging(query) {
  return request({
    url: '/ClinicalSys/imaging/list',
    method: 'get',
    params: query
  })
}

// 查询影像学检查详细
export function getImaging(imagingId) {
  return request({
    url: '/ClinicalSys/imaging/' + imagingId,
    method: 'get'
  })
}

// 新增影像学检查
export function addImaging(data) {
  return request({
    url: '/ClinicalSys/imaging',
    method: 'post',
    data: data
  })
}

// 修改影像学检查
export function updateImaging(data) {
  return request({
    url: '/ClinicalSys/imaging',
    method: 'put',
    data: data
  })
}

// 删除影像学检查
export function delImaging(imagingId) {
  return request({
    url: '/ClinicalSys/imaging/' + imagingId,
    method: 'delete'
  })
}

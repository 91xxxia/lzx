import request from '@/utils/request'

// 查询随访信息列表
export function listNotes(query) {
  return request({
    url: '/ClinicalSys/notes/list',
    method: 'get',
    params: query
  })
}

// 查询随访信息详细
export function getNotes(followupId) {
  return request({
    url: '/ClinicalSys/notes/' + followupId,
    method: 'get'
  })
}

// 新增随访信息
export function addNotes(data) {
  return request({
    url: '/ClinicalSys/notes',
    method: 'post',
    data: data
  })
}

// 修改随访信息
export function updateNotes(data) {
  return request({
    url: '/ClinicalSys/notes',
    method: 'put',
    data: data
  })
}

// 删除随访信息
export function delNotes(followupId) {
  return request({
    url: '/ClinicalSys/notes/' + followupId,
    method: 'delete'
  })
}

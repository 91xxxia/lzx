import request from '@/utils/request'

// 查询家族环境居住相似性列表
export function listSFenv(query) {
  return request({
    url: '/EpidemSys/SFenv/list',
    method: 'get',
    params: query
  })
}

// 查询家族环境居住相似性详细
export function getSFenv(familyEnvId) {
  return request({
    url: '/EpidemSys/SFenv/' + familyEnvId,
    method: 'get'
  })
}

// 新增家族环境居住相似性
export function addSFenv(data) {
  return request({
    url: '/EpidemSys/SFenv',
    method: 'post',
    data: data
  })
}

// 修改家族环境居住相似性
export function updateSFenv(data) {
  return request({
    url: '/EpidemSys/SFenv',
    method: 'put',
    data: data
  })
}

// 删除家族环境居住相似性
export function delSFenv(familyEnvId) {
  return request({
    url: '/EpidemSys/SFenv/' + familyEnvId,
    method: 'delete'
  })
}

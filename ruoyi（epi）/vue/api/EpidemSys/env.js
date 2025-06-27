import request from '@/utils/request'

// 查询家族环境列表
export function listEnv(query) {
  return request({
    url: '/EpidemSys/env/list',
    method: 'get',
    params: query
  })
}

// 查询家族环境详细
export function getEnv(familyEnvId) {
  return request({
    url: '/EpidemSys/env/' + familyEnvId,
    method: 'get'
  })
}

// 新增家族环境
export function addEnv(data) {
  return request({
    url: '/EpidemSys/env',
    method: 'post',
    data: data
  })
}

// 修改家族环境
export function updateEnv(data) {
  return request({
    url: '/EpidemSys/env',
    method: 'put',
    data: data
  })
}

// 删除家族环境
export function delEnv(familyEnvId) {
  return request({
    url: '/EpidemSys/env/' + familyEnvId,
    method: 'delete'
  })
}

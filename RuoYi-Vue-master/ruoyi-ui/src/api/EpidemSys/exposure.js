import request from '@/utils/request'

// 查询家庭环境暴露信息列表
export function listExposure(query) {
  return request({
    url: '/EpidemSys/exposure/list',
    method: 'get',
    params: query
  })
}

// 查询家庭环境暴露信息详细
export function getExposure(envId) {
  return request({
    url: '/EpidemSys/exposure/' + envId,
    method: 'get'
  })
}

// 新增家庭环境暴露信息
export function addExposure(data) {
  return request({
    url: '/EpidemSys/exposure',
    method: 'post',
    data: data
  })
}

// 修改家庭环境暴露信息
export function updateExposure(data) {
  return request({
    url: '/EpidemSys/exposure',
    method: 'put',
    data: data
  })
}

// 删除家庭环境暴露信息
export function delExposure(envId) {
  return request({
    url: '/EpidemSys/exposure/' + envId,
    method: 'delete'
  })
}

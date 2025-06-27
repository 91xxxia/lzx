import request from '@/utils/request'

// 查询城乡环境监测列表
export function listEnvironment(query) {
  return request({
    url: '/EpidemSys/environment/list',
    method: 'get',
    params: query
  })
}

// 查询城乡环境监测详细
export function getEnvironment(envAreaId) {
  return request({
    url: '/EpidemSys/environment/' + envAreaId,
    method: 'get'
  })
}

// 新增城乡环境监测
export function addEnvironment(data) {
  return request({
    url: '/EpidemSys/environment',
    method: 'post',
    data: data
  })
}

// 修改城乡环境监测
export function updateEnvironment(data) {
  return request({
    url: '/EpidemSys/environment',
    method: 'put',
    data: data
  })
}

// 删除城乡环境监测
export function delEnvironment(envAreaId) {
  return request({
    url: '/EpidemSys/environment/' + envAreaId,
    method: 'delete'
  })
}

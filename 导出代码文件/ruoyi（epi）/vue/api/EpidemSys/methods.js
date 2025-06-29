import request from '@/utils/request'

// 查询环境监测方法列表
export function listMethods(query) {
  return request({
    url: '/EpidemSys/methods/list',
    method: 'get',
    params: query
  })
}

// 查询环境监测方法详细
export function getMethods(methodId) {
  return request({
    url: '/EpidemSys/methods/' + methodId,
    method: 'get'
  })
}

// 新增环境监测方法
export function addMethods(data) {
  return request({
    url: '/EpidemSys/methods',
    method: 'post',
    data: data
  })
}

// 修改环境监测方法
export function updateMethods(data) {
  return request({
    url: '/EpidemSys/methods',
    method: 'put',
    data: data
  })
}

// 删除环境监测方法
export function delMethods(methodId) {
  return request({
    url: '/EpidemSys/methods/' + methodId,
    method: 'delete'
  })
}

import request from '@/utils/request'

// 查询城乡环境监测数据列表
export function listSAenvironment(query) {
  return request({
    url: '/EpidemSys/SAenvironment/list',
    method: 'get',
    params: query
  })
}

// 查询城乡环境监测数据详细
export function getSAenvironment(envAreaId) {
  return request({
    url: '/EpidemSys/SAenvironment/' + envAreaId,
    method: 'get'
  })
}

// 新增城乡环境监测数据
export function addSAenvironment(data) {
  return request({
    url: '/EpidemSys/SAenvironment',
    method: 'post',
    data: data
  })
}

// 修改城乡环境监测数据
export function updateSAenvironment(data) {
  return request({
    url: '/EpidemSys/SAenvironment',
    method: 'put',
    data: data
  })
}

// 删除城乡环境监测数据
export function delSAenvironment(envAreaId) {
  return request({
    url: '/EpidemSys/SAenvironment/' + envAreaId,
    method: 'delete'
  })
}

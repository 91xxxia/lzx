import request from '@/utils/request'

// 查询患儿基本信息列表
export function listInfo(query) {
  return request({
    url: '/EpidemSys/info/list',
    method: 'get',
    params: query
  })
}

// 查询患儿基本信息详细
export function getInfo(surveyId) {
  return request({
    url: '/EpidemSys/info/' + surveyId,
    method: 'get'
  })
}

// 新增患儿基本信息
export function addInfo(data) {
  return request({
    url: '/EpidemSys/info',
    method: 'post',
    data: data
  })
}

// 修改患儿基本信息
export function updateInfo(data) {
  return request({
    url: '/EpidemSys/info',
    method: 'put',
    data: data
  })
}

// 删除患儿基本信息
export function delInfo(surveyId) {
  return request({
    url: '/EpidemSys/info/' + surveyId,
    method: 'delete'
  })
}

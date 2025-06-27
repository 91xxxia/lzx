import request from '@/utils/request'

// 查询学习/工作环境号列表
export function listSLenv(query) {
  return request({
    url: '/EpidemSys/SLenv/list',
    method: 'get',
    params: query
  })
}

// 查询学习/工作环境号详细
export function getSLenv(learnEnvId) {
  return request({
    url: '/EpidemSys/SLenv/' + learnEnvId,
    method: 'get'
  })
}

// 新增学习/工作环境号
export function addSLenv(data) {
  return request({
    url: '/EpidemSys/SLenv',
    method: 'post',
    data: data
  })
}

// 修改学习/工作环境号
export function updateSLenv(data) {
  return request({
    url: '/EpidemSys/SLenv',
    method: 'put',
    data: data
  })
}

// 删除学习/工作环境号
export function delSLenv(learnEnvId) {
  return request({
    url: '/EpidemSys/SLenv/' + learnEnvId,
    method: 'delete'
  })
}

import request from '@/utils/request'

// 查询学习/工作环境信息列表
export function listStudyLearnenv(query) {
  return request({
    url: '/EpidemSys/StudyLearnenv/list',
    method: 'get',
    params: query
  })
}

// 查询学习/工作环境信息详细
export function getStudyLearnenv(learnEnvId) {
  return request({
    url: '/EpidemSys/StudyLearnenv/' + learnEnvId,
    method: 'get'
  })
}

// 新增学习/工作环境信息
export function addStudyLearnenv(data) {
  return request({
    url: '/EpidemSys/StudyLearnenv',
    method: 'post',
    data: data
  })
}

// 修改学习/工作环境信息
export function updateStudyLearnenv(data) {
  return request({
    url: '/EpidemSys/StudyLearnenv',
    method: 'put',
    data: data
  })
}

// 删除学习/工作环境信息
export function delStudyLearnenv(learnEnvId) {
  return request({
    url: '/EpidemSys/StudyLearnenv/' + learnEnvId,
    method: 'delete'
  })
}

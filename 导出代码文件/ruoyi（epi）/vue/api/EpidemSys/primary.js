import request from '@/utils/request'

// 查询一级亲属过敏史列表
export function listPrimary(query) {
  return request({
    url: '/EpidemSys/primary/list',
    method: 'get',
    params: query
  })
}

// 查询一级亲属过敏史详细
export function getPrimary(primId) {
  return request({
    url: '/EpidemSys/primary/' + primId,
    method: 'get'
  })
}

// 新增一级亲属过敏史
export function addPrimary(data) {
  return request({
    url: '/EpidemSys/primary',
    method: 'post',
    data: data
  })
}

// 修改一级亲属过敏史
export function updatePrimary(data) {
  return request({
    url: '/EpidemSys/primary',
    method: 'put',
    data: data
  })
}

// 删除一级亲属过敏史
export function delPrimary(primId) {
  return request({
    url: '/EpidemSys/primary/' + primId,
    method: 'delete'
  })
}

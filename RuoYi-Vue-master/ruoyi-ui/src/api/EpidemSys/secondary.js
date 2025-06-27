import request from '@/utils/request'

// 查询二级亲属过敏史列表
export function listSecondary(query) {
  return request({
    url: '/EpidemSys/secondary/list',
    method: 'get',
    params: query
  })
}

// 查询二级亲属过敏史详细
export function getSecondary(secId) {
  return request({
    url: '/EpidemSys/secondary/' + secId,
    method: 'get'
  })
}

// 新增二级亲属过敏史
export function addSecondary(data) {
  return request({
    url: '/EpidemSys/secondary',
    method: 'post',
    data: data
  })
}

// 修改二级亲属过敏史
export function updateSecondary(data) {
  return request({
    url: '/EpidemSys/secondary',
    method: 'put',
    data: data
  })
}

// 删除二级亲属过敏史
export function delSecondary(secId) {
  return request({
    url: '/EpidemSys/secondary/' + secId,
    method: 'delete'
  })
}

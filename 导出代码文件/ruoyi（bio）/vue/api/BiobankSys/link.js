import request from '@/utils/request'

// 查询样本临床关联列表
export function listLink(query) {
  return request({
    url: '/BiobankSys/link/list',
    method: 'get',
    params: query
  })
}

// 查询样本临床关联详细
export function getLink(linkId) {
  return request({
    url: '/BiobankSys/link/' + linkId,
    method: 'get'
  })
}

// 新增样本临床关联
export function addLink(data) {
  return request({
    url: '/BiobankSys/link',
    method: 'post',
    data: data
  })
}

// 修改样本临床关联
export function updateLink(data) {
  return request({
    url: '/BiobankSys/link',
    method: 'put',
    data: data
  })
}

// 删除样本临床关联
export function delLink(linkId) {
  return request({
    url: '/BiobankSys/link/' + linkId,
    method: 'delete'
  })
}

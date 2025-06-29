import request from '@/utils/request'

// 查询医疗服务机构标识信息列表
export function listOrgs(query) {
  return request({
    url: '/ClinicalSys/orgs/list',
    method: 'get',
    params: query
  })
}

// 查询医疗服务机构标识信息详细
export function getOrgs(orgId) {
  return request({
    url: '/ClinicalSys/orgs/' + orgId,
    method: 'get'
  })
}

// 新增医疗服务机构标识信息
export function addOrgs(data) {
  return request({
    url: '/ClinicalSys/orgs',
    method: 'post',
    data: data
  })
}

// 修改医疗服务机构标识信息
export function updateOrgs(data) {
  return request({
    url: '/ClinicalSys/orgs',
    method: 'put',
    data: data
  })
}

// 删除医疗服务机构标识信息
export function delOrgs(orgId) {
  return request({
    url: '/ClinicalSys/orgs/' + orgId,
    method: 'delete'
  })
}

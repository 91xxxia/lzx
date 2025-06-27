import request from '@/utils/request'

// 查询费用列表
export function listExpenses(query) {
  return request({
    url: '/ClinicalSys/expenses/list',
    method: 'get',
    params: query
  })
}

// 查询费用详细
export function getExpenses(expenseId) {
  return request({
    url: '/ClinicalSys/expenses/' + expenseId,
    method: 'get'
  })
}

// 新增费用
export function addExpenses(data) {
  return request({
    url: '/ClinicalSys/expenses',
    method: 'post',
    data: data
  })
}

// 修改费用
export function updateExpenses(data) {
  return request({
    url: '/ClinicalSys/expenses',
    method: 'put',
    data: data
  })
}

// 删除费用
export function delExpenses(expenseId) {
  return request({
    url: '/ClinicalSys/expenses/' + expenseId,
    method: 'delete'
  })
}

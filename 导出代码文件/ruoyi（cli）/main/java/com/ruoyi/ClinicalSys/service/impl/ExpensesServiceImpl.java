package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.ExpensesMapper;
import com.ruoyi.ClinicalSys.domain.Expenses;
import com.ruoyi.ClinicalSys.service.IExpensesService;

/**
 * 费用Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class ExpensesServiceImpl implements IExpensesService 
{
    @Autowired
    private ExpensesMapper expensesMapper;

    /**
     * 查询费用
     * 
     * @param expenseId 费用主键
     * @return 费用
     */
    @Override
    public Expenses selectExpensesByExpenseId(Long expenseId)
    {
        return expensesMapper.selectExpensesByExpenseId(expenseId);
    }

    /**
     * 查询费用列表
     * 
     * @param expenses 费用
     * @return 费用
     */
    @Override
    public List<Expenses> selectExpensesList(Expenses expenses)
    {
        return expensesMapper.selectExpensesList(expenses);
    }

    /**
     * 新增费用
     * 
     * @param expenses 费用
     * @return 结果
     */
    @Override
    public int insertExpenses(Expenses expenses)
    {
        return expensesMapper.insertExpenses(expenses);
    }

    /**
     * 修改费用
     * 
     * @param expenses 费用
     * @return 结果
     */
    @Override
    public int updateExpenses(Expenses expenses)
    {
        return expensesMapper.updateExpenses(expenses);
    }

    /**
     * 批量删除费用
     * 
     * @param expenseIds 需要删除的费用主键
     * @return 结果
     */
    @Override
    public int deleteExpensesByExpenseIds(Long[] expenseIds)
    {
        return expensesMapper.deleteExpensesByExpenseIds(expenseIds);
    }

    /**
     * 删除费用信息
     * 
     * @param expenseId 费用主键
     * @return 结果
     */
    @Override
    public int deleteExpensesByExpenseId(Long expenseId)
    {
        return expensesMapper.deleteExpensesByExpenseId(expenseId);
    }
}

package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.Expenses;

/**
 * 费用Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface ExpensesMapper 
{
    /**
     * 查询费用
     * 
     * @param expenseId 费用主键
     * @return 费用
     */
    public Expenses selectExpensesByExpenseId(Long expenseId);

    /**
     * 查询费用列表
     * 
     * @param expenses 费用
     * @return 费用集合
     */
    public List<Expenses> selectExpensesList(Expenses expenses);

    /**
     * 新增费用
     * 
     * @param expenses 费用
     * @return 结果
     */
    public int insertExpenses(Expenses expenses);

    /**
     * 修改费用
     * 
     * @param expenses 费用
     * @return 结果
     */
    public int updateExpenses(Expenses expenses);

    /**
     * 删除费用
     * 
     * @param expenseId 费用主键
     * @return 结果
     */
    public int deleteExpensesByExpenseId(Long expenseId);

    /**
     * 批量删除费用
     * 
     * @param expenseIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteExpensesByExpenseIds(Long[] expenseIds);
}

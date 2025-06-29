package com.ruoyi.FollowSys.mapper;

import java.util.List;
import com.ruoyi.FollowSys.domain.FollowupExpenses;

/**
 * 费用Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
public interface FollowupExpensesMapper 
{
    /**
     * 查询费用
     * 
     * @param expenseId 费用主键
     * @return 费用
     */
    public FollowupExpenses selectFollowupExpensesByExpenseId(Long expenseId);

    /**
     * 查询费用列表
     * 
     * @param followupExpenses 费用
     * @return 费用集合
     */
    public List<FollowupExpenses> selectFollowupExpensesList(FollowupExpenses followupExpenses);

    /**
     * 新增费用
     * 
     * @param followupExpenses 费用
     * @return 结果
     */
    public int insertFollowupExpenses(FollowupExpenses followupExpenses);

    /**
     * 修改费用
     * 
     * @param followupExpenses 费用
     * @return 结果
     */
    public int updateFollowupExpenses(FollowupExpenses followupExpenses);

    /**
     * 删除费用
     * 
     * @param expenseId 费用主键
     * @return 结果
     */
    public int deleteFollowupExpensesByExpenseId(Long expenseId);

    /**
     * 批量删除费用
     * 
     * @param expenseIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteFollowupExpensesByExpenseIds(Long[] expenseIds);
}

package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupExpensesMapper;
import com.ruoyi.FollowSys.domain.FollowupExpenses;
import com.ruoyi.FollowSys.service.IFollowupExpensesService;

/**
 * 费用Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupExpensesServiceImpl implements IFollowupExpensesService 
{
    @Autowired
    private FollowupExpensesMapper followupExpensesMapper;

    /**
     * 查询费用
     * 
     * @param expenseId 费用主键
     * @return 费用
     */
    @Override
    public FollowupExpenses selectFollowupExpensesByExpenseId(Long expenseId)
    {
        return followupExpensesMapper.selectFollowupExpensesByExpenseId(expenseId);
    }

    /**
     * 查询费用列表
     * 
     * @param followupExpenses 费用
     * @return 费用
     */
    @Override
    public List<FollowupExpenses> selectFollowupExpensesList(FollowupExpenses followupExpenses)
    {
        return followupExpensesMapper.selectFollowupExpensesList(followupExpenses);
    }

    /**
     * 新增费用
     * 
     * @param followupExpenses 费用
     * @return 结果
     */
    @Override
    public int insertFollowupExpenses(FollowupExpenses followupExpenses)
    {
        return followupExpensesMapper.insertFollowupExpenses(followupExpenses);
    }

    /**
     * 修改费用
     * 
     * @param followupExpenses 费用
     * @return 结果
     */
    @Override
    public int updateFollowupExpenses(FollowupExpenses followupExpenses)
    {
        return followupExpensesMapper.updateFollowupExpenses(followupExpenses);
    }

    /**
     * 批量删除费用
     * 
     * @param expenseIds 需要删除的费用主键
     * @return 结果
     */
    @Override
    public int deleteFollowupExpensesByExpenseIds(Long[] expenseIds)
    {
        return followupExpensesMapper.deleteFollowupExpensesByExpenseIds(expenseIds);
    }

    /**
     * 删除费用信息
     * 
     * @param expenseId 费用主键
     * @return 结果
     */
    @Override
    public int deleteFollowupExpensesByExpenseId(Long expenseId)
    {
        return followupExpensesMapper.deleteFollowupExpensesByExpenseId(expenseId);
    }
}

package com.ruoyi.FollowSys.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.FollowSys.domain.FollowupExpenses;
import com.ruoyi.FollowSys.service.IFollowupExpensesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 费用Controller
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@RestController
@RequestMapping("/FollowSys/expenses")
public class FollowupExpensesController extends BaseController
{
    @Autowired
    private IFollowupExpensesService followupExpensesService;

    /**
     * 查询费用列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:expenses:list')")
    @GetMapping("/list")
    public TableDataInfo list(FollowupExpenses followupExpenses)
    {
        startPage();
        List<FollowupExpenses> list = followupExpensesService.selectFollowupExpensesList(followupExpenses);
        return getDataTable(list);
    }

    /**
     * 导出费用列表
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:expenses:export')")
    @Log(title = "费用", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, FollowupExpenses followupExpenses)
    {
        List<FollowupExpenses> list = followupExpensesService.selectFollowupExpensesList(followupExpenses);
        ExcelUtil<FollowupExpenses> util = new ExcelUtil<FollowupExpenses>(FollowupExpenses.class);
        util.exportExcel(response, list, "费用数据");
    }

    /**
     * 获取费用详细信息
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:expenses:query')")
    @GetMapping(value = "/{expenseId}")
    public AjaxResult getInfo(@PathVariable("expenseId") Long expenseId)
    {
        return success(followupExpensesService.selectFollowupExpensesByExpenseId(expenseId));
    }

    /**
     * 新增费用
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:expenses:add')")
    @Log(title = "费用", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody FollowupExpenses followupExpenses)
    {
        return toAjax(followupExpensesService.insertFollowupExpenses(followupExpenses));
    }

    /**
     * 修改费用
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:expenses:edit')")
    @Log(title = "费用", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody FollowupExpenses followupExpenses)
    {
        return toAjax(followupExpensesService.updateFollowupExpenses(followupExpenses));
    }

    /**
     * 删除费用
     */
    @PreAuthorize("@ss.hasPermi('FollowSys:expenses:remove')")
    @Log(title = "费用", businessType = BusinessType.DELETE)
	@DeleteMapping("/{expenseIds}")
    public AjaxResult remove(@PathVariable Long[] expenseIds)
    {
        return toAjax(followupExpensesService.deleteFollowupExpensesByExpenseIds(expenseIds));
    }
}

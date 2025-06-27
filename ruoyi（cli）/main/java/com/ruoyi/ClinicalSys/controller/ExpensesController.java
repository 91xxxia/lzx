package com.ruoyi.ClinicalSys.controller;

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
import com.ruoyi.ClinicalSys.domain.Expenses;
import com.ruoyi.ClinicalSys.service.IExpensesService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 费用Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/expenses")
public class ExpensesController extends BaseController
{
    @Autowired
    private IExpensesService expensesService;

    /**
     * 查询费用列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:expenses:list')")
    @GetMapping("/list")
    public TableDataInfo list(Expenses expenses)
    {
        startPage();
        List<Expenses> list = expensesService.selectExpensesList(expenses);
        return getDataTable(list);
    }

    /**
     * 导出费用列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:expenses:export')")
    @Log(title = "费用", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Expenses expenses)
    {
        List<Expenses> list = expensesService.selectExpensesList(expenses);
        ExcelUtil<Expenses> util = new ExcelUtil<Expenses>(Expenses.class);
        util.exportExcel(response, list, "费用数据");
    }

    /**
     * 获取费用详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:expenses:query')")
    @GetMapping(value = "/{expenseId}")
    public AjaxResult getInfo(@PathVariable("expenseId") Long expenseId)
    {
        return success(expensesService.selectExpensesByExpenseId(expenseId));
    }

    /**
     * 新增费用
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:expenses:add')")
    @Log(title = "费用", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Expenses expenses)
    {
        return toAjax(expensesService.insertExpenses(expenses));
    }

    /**
     * 修改费用
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:expenses:edit')")
    @Log(title = "费用", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Expenses expenses)
    {
        return toAjax(expensesService.updateExpenses(expenses));
    }

    /**
     * 删除费用
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:expenses:remove')")
    @Log(title = "费用", businessType = BusinessType.DELETE)
	@DeleteMapping("/{expenseIds}")
    public AjaxResult remove(@PathVariable Long[] expenseIds)
    {
        return toAjax(expensesService.deleteExpensesByExpenseIds(expenseIds));
    }
}

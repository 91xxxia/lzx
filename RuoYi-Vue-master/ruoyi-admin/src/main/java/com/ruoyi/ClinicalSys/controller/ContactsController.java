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
import com.ruoyi.ClinicalSys.domain.Contacts;
import com.ruoyi.ClinicalSys.service.IContactsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 联系人Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/ClinicalSys/contacts")
public class ContactsController extends BaseController
{
    @Autowired
    private IContactsService contactsService;

    /**
     * 查询联系人列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:contacts:list')")
    @GetMapping("/list")
    public TableDataInfo list(Contacts contacts)
    {
        startPage();
        List<Contacts> list = contactsService.selectContactsList(contacts);
        return getDataTable(list);
    }

    /**
     * 导出联系人列表
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:contacts:export')")
    @Log(title = "联系人", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Contacts contacts)
    {
        List<Contacts> list = contactsService.selectContactsList(contacts);
        ExcelUtil<Contacts> util = new ExcelUtil<Contacts>(Contacts.class);
        util.exportExcel(response, list, "联系人数据");
    }

    /**
     * 获取联系人详细信息
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:contacts:query')")
    @GetMapping(value = "/{contactId}")
    public AjaxResult getInfo(@PathVariable("contactId") Long contactId)
    {
        return success(contactsService.selectContactsByContactId(contactId));
    }

    /**
     * 新增联系人
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:contacts:add')")
    @Log(title = "联系人", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Contacts contacts)
    {
        return toAjax(contactsService.insertContacts(contacts));
    }

    /**
     * 修改联系人
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:contacts:edit')")
    @Log(title = "联系人", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Contacts contacts)
    {
        return toAjax(contactsService.updateContacts(contacts));
    }

    /**
     * 删除联系人
     */
    @PreAuthorize("@ss.hasPermi('ClinicalSys:contacts:remove')")
    @Log(title = "联系人", businessType = BusinessType.DELETE)
	@DeleteMapping("/{contactIds}")
    public AjaxResult remove(@PathVariable Long[] contactIds)
    {
        return toAjax(contactsService.deleteContactsByContactIds(contactIds));
    }
}

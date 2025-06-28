package com.ruoyi.BiobankSys.controller;

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
import com.ruoyi.BiobankSys.domain.CollectionEvents;
import com.ruoyi.BiobankSys.service.ICollectionEventsService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 样本采集事件Controller
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@RestController
@RequestMapping("/BiobankSys/events")
public class CollectionEventsController extends BaseController
{
    @Autowired
    private ICollectionEventsService collectionEventsService;

    /**
     * 查询样本采集事件列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:events:list')")
    @GetMapping("/list")
    public TableDataInfo list(CollectionEvents collectionEvents)
    {
        startPage();
        List<CollectionEvents> list = collectionEventsService.selectCollectionEventsList(collectionEvents);
        return getDataTable(list);
    }

    /**
     * 导出样本采集事件列表
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:events:export')")
    @Log(title = "样本采集事件", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CollectionEvents collectionEvents)
    {
        List<CollectionEvents> list = collectionEventsService.selectCollectionEventsList(collectionEvents);
        ExcelUtil<CollectionEvents> util = new ExcelUtil<CollectionEvents>(CollectionEvents.class);
        util.exportExcel(response, list, "样本采集事件数据");
    }

    /**
     * 获取样本采集事件详细信息
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:events:query')")
    @GetMapping(value = "/{eventId}")
    public AjaxResult getInfo(@PathVariable("eventId") Long eventId)
    {
        return success(collectionEventsService.selectCollectionEventsByEventId(eventId));
    }

    /**
     * 新增样本采集事件
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:events:add')")
    @Log(title = "样本采集事件", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CollectionEvents collectionEvents)
    {
        return toAjax(collectionEventsService.insertCollectionEvents(collectionEvents));
    }

    /**
     * 修改样本采集事件
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:events:edit')")
    @Log(title = "样本采集事件", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CollectionEvents collectionEvents)
    {
        return toAjax(collectionEventsService.updateCollectionEvents(collectionEvents));
    }

    /**
     * 删除样本采集事件
     */
    @PreAuthorize("@ss.hasPermi('BiobankSys:events:remove')")
    @Log(title = "样本采集事件", businessType = BusinessType.DELETE)
	@DeleteMapping("/{eventIds}")
    public AjaxResult remove(@PathVariable Long[] eventIds)
    {
        return toAjax(collectionEventsService.deleteCollectionEventsByEventIds(eventIds));
    }
}

package com.ruoyi.BiobankSys.mapper;

import java.util.List;
import com.ruoyi.BiobankSys.domain.CollectionEvents;

/**
 * 样本采集事件Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface CollectionEventsMapper 
{
    /**
     * 查询样本采集事件
     * 
     * @param eventId 样本采集事件主键
     * @return 样本采集事件
     */
    public CollectionEvents selectCollectionEventsByEventId(Long eventId);

    /**
     * 查询样本采集事件列表
     * 
     * @param collectionEvents 样本采集事件
     * @return 样本采集事件集合
     */
    public List<CollectionEvents> selectCollectionEventsList(CollectionEvents collectionEvents);

    /**
     * 新增样本采集事件
     * 
     * @param collectionEvents 样本采集事件
     * @return 结果
     */
    public int insertCollectionEvents(CollectionEvents collectionEvents);

    /**
     * 修改样本采集事件
     * 
     * @param collectionEvents 样本采集事件
     * @return 结果
     */
    public int updateCollectionEvents(CollectionEvents collectionEvents);

    /**
     * 删除样本采集事件
     * 
     * @param eventId 样本采集事件主键
     * @return 结果
     */
    public int deleteCollectionEventsByEventId(Long eventId);

    /**
     * 批量删除样本采集事件
     * 
     * @param eventIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCollectionEventsByEventIds(Long[] eventIds);
}

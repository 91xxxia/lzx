package com.ruoyi.BiobankSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.BiobankSys.mapper.CollectionEventsMapper;
import com.ruoyi.BiobankSys.domain.CollectionEvents;
import com.ruoyi.BiobankSys.service.ICollectionEventsService;

/**
 * 样本采集事件Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class CollectionEventsServiceImpl implements ICollectionEventsService 
{
    @Autowired
    private CollectionEventsMapper collectionEventsMapper;

    /**
     * 查询样本采集事件
     * 
     * @param eventId 样本采集事件主键
     * @return 样本采集事件
     */
    @Override
    public CollectionEvents selectCollectionEventsByEventId(Long eventId)
    {
        return collectionEventsMapper.selectCollectionEventsByEventId(eventId);
    }

    /**
     * 查询样本采集事件列表
     * 
     * @param collectionEvents 样本采集事件
     * @return 样本采集事件
     */
    @Override
    public List<CollectionEvents> selectCollectionEventsList(CollectionEvents collectionEvents)
    {
        return collectionEventsMapper.selectCollectionEventsList(collectionEvents);
    }

    /**
     * 新增样本采集事件
     * 
     * @param collectionEvents 样本采集事件
     * @return 结果
     */
    @Override
    public int insertCollectionEvents(CollectionEvents collectionEvents)
    {
        return collectionEventsMapper.insertCollectionEvents(collectionEvents);
    }

    /**
     * 修改样本采集事件
     * 
     * @param collectionEvents 样本采集事件
     * @return 结果
     */
    @Override
    public int updateCollectionEvents(CollectionEvents collectionEvents)
    {
        return collectionEventsMapper.updateCollectionEvents(collectionEvents);
    }

    /**
     * 批量删除样本采集事件
     * 
     * @param eventIds 需要删除的样本采集事件主键
     * @return 结果
     */
    @Override
    public int deleteCollectionEventsByEventIds(Long[] eventIds)
    {
        return collectionEventsMapper.deleteCollectionEventsByEventIds(eventIds);
    }

    /**
     * 删除样本采集事件信息
     * 
     * @param eventId 样本采集事件主键
     * @return 结果
     */
    @Override
    public int deleteCollectionEventsByEventId(Long eventId)
    {
        return collectionEventsMapper.deleteCollectionEventsByEventId(eventId);
    }
}

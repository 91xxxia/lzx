package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.HistoryMapper;
import com.ruoyi.ClinicalSys.domain.History;
import com.ruoyi.ClinicalSys.service.IHistoryService;

/**
 * 既往史Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class HistoryServiceImpl implements IHistoryService 
{
    @Autowired
    private HistoryMapper historyMapper;

    /**
     * 查询既往史
     * 
     * @param historyId 既往史主键
     * @return 既往史
     */
    @Override
    public History selectHistoryByHistoryId(Long historyId)
    {
        return historyMapper.selectHistoryByHistoryId(historyId);
    }

    /**
     * 查询既往史列表
     * 
     * @param history 既往史
     * @return 既往史
     */
    @Override
    public List<History> selectHistoryList(History history)
    {
        return historyMapper.selectHistoryList(history);
    }

    /**
     * 新增既往史
     * 
     * @param history 既往史
     * @return 结果
     */
    @Override
    public int insertHistory(History history)
    {
        return historyMapper.insertHistory(history);
    }

    /**
     * 修改既往史
     * 
     * @param history 既往史
     * @return 结果
     */
    @Override
    public int updateHistory(History history)
    {
        return historyMapper.updateHistory(history);
    }

    /**
     * 批量删除既往史
     * 
     * @param historyIds 需要删除的既往史主键
     * @return 结果
     */
    @Override
    public int deleteHistoryByHistoryIds(Long[] historyIds)
    {
        return historyMapper.deleteHistoryByHistoryIds(historyIds);
    }

    /**
     * 删除既往史信息
     * 
     * @param historyId 既往史主键
     * @return 结果
     */
    @Override
    public int deleteHistoryByHistoryId(Long historyId)
    {
        return historyMapper.deleteHistoryByHistoryId(historyId);
    }
}

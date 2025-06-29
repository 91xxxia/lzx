package com.ruoyi.ClinicalSys.service;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.History;

/**
 * 既往史Service接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface IHistoryService 
{
    /**
     * 查询既往史
     * 
     * @param historyId 既往史主键
     * @return 既往史
     */
    public History selectHistoryByHistoryId(Long historyId);

    /**
     * 查询既往史列表
     * 
     * @param history 既往史
     * @return 既往史集合
     */
    public List<History> selectHistoryList(History history);

    /**
     * 新增既往史
     * 
     * @param history 既往史
     * @return 结果
     */
    public int insertHistory(History history);

    /**
     * 修改既往史
     * 
     * @param history 既往史
     * @return 结果
     */
    public int updateHistory(History history);

    /**
     * 批量删除既往史
     * 
     * @param historyIds 需要删除的既往史主键集合
     * @return 结果
     */
    public int deleteHistoryByHistoryIds(Long[] historyIds);

    /**
     * 删除既往史信息
     * 
     * @param historyId 既往史主键
     * @return 结果
     */
    public int deleteHistoryByHistoryId(Long historyId);
}

package com.ruoyi.BiobankSys.service;

import java.util.List;
import com.ruoyi.BiobankSys.domain.DataChangeLog;

/**
 * 数据变更日志Service接口
 * 
 * @author ruoyi
 * @date 2025-06-29
 */
public interface IDataChangeLogService 
{
    /**
     * 查询数据变更日志
     * 
     * @param logId 数据变更日志主键
     * @return 数据变更日志
     */
    public DataChangeLog selectDataChangeLogByLogId(Long logId);

    /**
     * 查询数据变更日志列表
     * 
     * @param dataChangeLog 数据变更日志
     * @return 数据变更日志集合
     */
    public List<DataChangeLog> selectDataChangeLogList(DataChangeLog dataChangeLog);

    /**
     * 新增数据变更日志
     * 
     * @param dataChangeLog 数据变更日志
     * @return 结果
     */
    public int insertDataChangeLog(DataChangeLog dataChangeLog);

    /**
     * 修改数据变更日志
     * 
     * @param dataChangeLog 数据变更日志
     * @return 结果
     */
    public int updateDataChangeLog(DataChangeLog dataChangeLog);

    /**
     * 批量删除数据变更日志
     * 
     * @param logIds 需要删除的数据变更日志主键集合
     * @return 结果
     */
    public int deleteDataChangeLogByLogIds(Long[] logIds);

    /**
     * 删除数据变更日志信息
     * 
     * @param logId 数据变更日志主键
     * @return 结果
     */
    public int deleteDataChangeLogByLogId(Long logId);
}

package com.ruoyi.BiobankSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.BiobankSys.mapper.DataChangeLogMapper;
import com.ruoyi.BiobankSys.domain.DataChangeLog;
import com.ruoyi.BiobankSys.service.IDataChangeLogService;

/**
 * 数据变更日志Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class DataChangeLogServiceImpl implements IDataChangeLogService 
{
    @Autowired
    private DataChangeLogMapper dataChangeLogMapper;

    /**
     * 查询数据变更日志
     * 
     * @param logId 数据变更日志主键
     * @return 数据变更日志
     */
    @Override
    public DataChangeLog selectDataChangeLogByLogId(Long logId)
    {
        return dataChangeLogMapper.selectDataChangeLogByLogId(logId);
    }

    /**
     * 查询数据变更日志列表
     * 
     * @param dataChangeLog 数据变更日志
     * @return 数据变更日志
     */
    @Override
    public List<DataChangeLog> selectDataChangeLogList(DataChangeLog dataChangeLog)
    {
        return dataChangeLogMapper.selectDataChangeLogList(dataChangeLog);
    }

    /**
     * 新增数据变更日志
     * 
     * @param dataChangeLog 数据变更日志
     * @return 结果
     */
    @Override
    public int insertDataChangeLog(DataChangeLog dataChangeLog)
    {
        return dataChangeLogMapper.insertDataChangeLog(dataChangeLog);
    }

    /**
     * 修改数据变更日志
     * 
     * @param dataChangeLog 数据变更日志
     * @return 结果
     */
    @Override
    public int updateDataChangeLog(DataChangeLog dataChangeLog)
    {
        return dataChangeLogMapper.updateDataChangeLog(dataChangeLog);
    }

    /**
     * 批量删除数据变更日志
     * 
     * @param logIds 需要删除的数据变更日志主键
     * @return 结果
     */
    @Override
    public int deleteDataChangeLogByLogIds(Long[] logIds)
    {
        return dataChangeLogMapper.deleteDataChangeLogByLogIds(logIds);
    }

    /**
     * 删除数据变更日志信息
     * 
     * @param logId 数据变更日志主键
     * @return 结果
     */
    @Override
    public int deleteDataChangeLogByLogId(Long logId)
    {
        return dataChangeLogMapper.deleteDataChangeLogByLogId(logId);
    }
}

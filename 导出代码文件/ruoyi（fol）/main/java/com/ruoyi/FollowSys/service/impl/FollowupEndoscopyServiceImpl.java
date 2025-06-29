package com.ruoyi.FollowSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.FollowSys.mapper.FollowupEndoscopyMapper;
import com.ruoyi.FollowSys.domain.FollowupEndoscopy;
import com.ruoyi.FollowSys.service.IFollowupEndoscopyService;

/**
 * 电子鼻咽喉镜Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-28
 */
@Service
public class FollowupEndoscopyServiceImpl implements IFollowupEndoscopyService 
{
    @Autowired
    private FollowupEndoscopyMapper followupEndoscopyMapper;

    /**
     * 查询电子鼻咽喉镜
     * 
     * @param endoscopyId 电子鼻咽喉镜主键
     * @return 电子鼻咽喉镜
     */
    @Override
    public FollowupEndoscopy selectFollowupEndoscopyByEndoscopyId(Long endoscopyId)
    {
        return followupEndoscopyMapper.selectFollowupEndoscopyByEndoscopyId(endoscopyId);
    }

    /**
     * 查询电子鼻咽喉镜列表
     * 
     * @param followupEndoscopy 电子鼻咽喉镜
     * @return 电子鼻咽喉镜
     */
    @Override
    public List<FollowupEndoscopy> selectFollowupEndoscopyList(FollowupEndoscopy followupEndoscopy)
    {
        return followupEndoscopyMapper.selectFollowupEndoscopyList(followupEndoscopy);
    }

    /**
     * 新增电子鼻咽喉镜
     * 
     * @param followupEndoscopy 电子鼻咽喉镜
     * @return 结果
     */
    @Override
    public int insertFollowupEndoscopy(FollowupEndoscopy followupEndoscopy)
    {
        return followupEndoscopyMapper.insertFollowupEndoscopy(followupEndoscopy);
    }

    /**
     * 修改电子鼻咽喉镜
     * 
     * @param followupEndoscopy 电子鼻咽喉镜
     * @return 结果
     */
    @Override
    public int updateFollowupEndoscopy(FollowupEndoscopy followupEndoscopy)
    {
        return followupEndoscopyMapper.updateFollowupEndoscopy(followupEndoscopy);
    }

    /**
     * 批量删除电子鼻咽喉镜
     * 
     * @param endoscopyIds 需要删除的电子鼻咽喉镜主键
     * @return 结果
     */
    @Override
    public int deleteFollowupEndoscopyByEndoscopyIds(Long[] endoscopyIds)
    {
        return followupEndoscopyMapper.deleteFollowupEndoscopyByEndoscopyIds(endoscopyIds);
    }

    /**
     * 删除电子鼻咽喉镜信息
     * 
     * @param endoscopyId 电子鼻咽喉镜主键
     * @return 结果
     */
    @Override
    public int deleteFollowupEndoscopyByEndoscopyId(Long endoscopyId)
    {
        return followupEndoscopyMapper.deleteFollowupEndoscopyByEndoscopyId(endoscopyId);
    }
}

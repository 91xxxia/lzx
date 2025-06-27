package com.ruoyi.ClinicalSys.mapper;

import java.util.List;
import com.ruoyi.ClinicalSys.domain.Contacts;

/**
 * 联系人Mapper接口
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
public interface ContactsMapper 
{
    /**
     * 查询联系人
     * 
     * @param contactId 联系人主键
     * @return 联系人
     */
    public Contacts selectContactsByContactId(Long contactId);

    /**
     * 查询联系人列表
     * 
     * @param contacts 联系人
     * @return 联系人集合
     */
    public List<Contacts> selectContactsList(Contacts contacts);

    /**
     * 新增联系人
     * 
     * @param contacts 联系人
     * @return 结果
     */
    public int insertContacts(Contacts contacts);

    /**
     * 修改联系人
     * 
     * @param contacts 联系人
     * @return 结果
     */
    public int updateContacts(Contacts contacts);

    /**
     * 删除联系人
     * 
     * @param contactId 联系人主键
     * @return 结果
     */
    public int deleteContactsByContactId(Long contactId);

    /**
     * 批量删除联系人
     * 
     * @param contactIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteContactsByContactIds(Long[] contactIds);
}

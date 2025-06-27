package com.ruoyi.ClinicalSys.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ClinicalSys.mapper.ContactsMapper;
import com.ruoyi.ClinicalSys.domain.Contacts;
import com.ruoyi.ClinicalSys.service.IContactsService;

/**
 * 联系人Service业务层处理
 * 
 * @author ruoyi
 * @date 2025-06-27
 */
@Service
public class ContactsServiceImpl implements IContactsService 
{
    @Autowired
    private ContactsMapper contactsMapper;

    /**
     * 查询联系人
     * 
     * @param contactId 联系人主键
     * @return 联系人
     */
    @Override
    public Contacts selectContactsByContactId(Long contactId)
    {
        return contactsMapper.selectContactsByContactId(contactId);
    }

    /**
     * 查询联系人列表
     * 
     * @param contacts 联系人
     * @return 联系人
     */
    @Override
    public List<Contacts> selectContactsList(Contacts contacts)
    {
        return contactsMapper.selectContactsList(contacts);
    }

    /**
     * 新增联系人
     * 
     * @param contacts 联系人
     * @return 结果
     */
    @Override
    public int insertContacts(Contacts contacts)
    {
        return contactsMapper.insertContacts(contacts);
    }

    /**
     * 修改联系人
     * 
     * @param contacts 联系人
     * @return 结果
     */
    @Override
    public int updateContacts(Contacts contacts)
    {
        return contactsMapper.updateContacts(contacts);
    }

    /**
     * 批量删除联系人
     * 
     * @param contactIds 需要删除的联系人主键
     * @return 结果
     */
    @Override
    public int deleteContactsByContactIds(Long[] contactIds)
    {
        return contactsMapper.deleteContactsByContactIds(contactIds);
    }

    /**
     * 删除联系人信息
     * 
     * @param contactId 联系人主键
     * @return 结果
     */
    @Override
    public int deleteContactsByContactId(Long contactId)
    {
        return contactsMapper.deleteContactsByContactId(contactId);
    }
}

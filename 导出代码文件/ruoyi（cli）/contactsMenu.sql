-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('联系人', '2061', '1', 'contacts', 'ClinicalSys/contacts/index', 1, 0, 'C', '0', '0', 'ClinicalSys:contacts:list', '#', 'admin', sysdate(), '', null, '联系人菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('联系人查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:contacts:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('联系人新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:contacts:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('联系人修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:contacts:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('联系人删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:contacts:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('联系人导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:contacts:export',       '#', 'admin', sysdate(), '', null, '');
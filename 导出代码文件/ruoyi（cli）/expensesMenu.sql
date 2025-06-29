-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('费用', '2061', '1', 'expenses', 'ClinicalSys/expenses/index', 1, 0, 'C', '0', '0', 'ClinicalSys:expenses:list', '#', 'admin', sysdate(), '', null, '费用菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('费用查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:expenses:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('费用新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:expenses:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('费用修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:expenses:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('费用删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:expenses:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('费用导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:expenses:export',       '#', 'admin', sysdate(), '', null, '');
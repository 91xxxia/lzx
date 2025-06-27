-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族史', '2061', '1', 'family_history', 'ClinicalSys/family_history/index', 1, 0, 'C', '0', '0', 'ClinicalSys:family_history:list', '#', 'admin', sysdate(), '', null, '家族史菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族史查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:family_history:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族史新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:family_history:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族史修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:family_history:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族史删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:family_history:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族史导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:family_history:export',       '#', 'admin', sysdate(), '', null, '');
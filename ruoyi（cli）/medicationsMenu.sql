-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用药', '2061', '1', 'medications', 'ClinicalSys/medications/index', 1, 0, 'C', '0', '0', 'ClinicalSys:medications:list', '#', 'admin', sysdate(), '', null, '用药菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用药查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:medications:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用药新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:medications:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用药修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:medications:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用药删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:medications:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('用药导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:medications:export',       '#', 'admin', sysdate(), '', null, '');
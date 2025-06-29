-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('症状及体征', '2061', '1', 'symptoms', 'ClinicalSys/symptoms/index', 1, 0, 'C', '0', '0', 'ClinicalSys:symptoms:list', '#', 'admin', sysdate(), '', null, '症状及体征菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('症状及体征查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:symptoms:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('症状及体征新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:symptoms:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('症状及体征修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:symptoms:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('症状及体征删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:symptoms:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('症状及体征导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:symptoms:export',       '#', 'admin', sysdate(), '', null, '');
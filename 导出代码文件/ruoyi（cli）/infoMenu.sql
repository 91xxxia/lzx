-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('医保情况', '2061', '1', 'info', 'ClinicalSys/info/index', 1, 0, 'C', '0', '0', 'ClinicalSys:info:list', '#', 'admin', sysdate(), '', null, '医保情况菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('医保情况查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:info:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('医保情况新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:info:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('医保情况修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:info:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('医保情况删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:info:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('医保情况导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:info:export',       '#', 'admin', sysdate(), '', null, '');
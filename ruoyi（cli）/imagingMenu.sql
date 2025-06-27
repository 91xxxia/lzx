-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('影像学检查', '2061', '1', 'imaging', 'ClinicalSys/imaging/index', 1, 0, 'C', '0', '0', 'ClinicalSys:imaging:list', '#', 'admin', sysdate(), '', null, '影像学检查菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('影像学检查查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:imaging:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('影像学检查新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:imaging:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('影像学检查修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:imaging:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('影像学检查删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:imaging:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('影像学检查导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:imaging:export',       '#', 'admin', sysdate(), '', null, '');
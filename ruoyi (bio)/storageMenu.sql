-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本存储条件', '2345', '1', 'storage', 'BiobankSys/storage/index', 1, 0, 'C', '0', '0', 'BiobankSys:storage:list', '#', 'admin', sysdate(), '', null, '样本存储条件菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本存储条件查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:storage:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本存储条件新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:storage:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本存储条件修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:storage:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本存储条件删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:storage:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本存储条件导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:storage:export',       '#', 'admin', sysdate(), '', null, '');
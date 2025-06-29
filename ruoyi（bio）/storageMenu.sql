-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本存储', '2573', '1', 'storage', 'BiobankSys/storage/index', 1, 0, 'C', '0', '0', 'BiobankSys:storage:list', '#', 'admin', sysdate(), '', null, '样本存储菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本存储查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:storage:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本存储新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:storage:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本存储修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:storage:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本存储删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:storage:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本存储导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:storage:export',       '#', 'admin', sysdate(), '', null, '');
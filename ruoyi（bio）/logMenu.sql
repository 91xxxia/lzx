-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('数据变更日志', '2573', '1', 'log', 'BiobankSys/log/index', 1, 0, 'C', '0', '0', 'BiobankSys:log:list', '#', 'admin', sysdate(), '', null, '数据变更日志菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('数据变更日志查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:log:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('数据变更日志新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:log:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('数据变更日志修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:log:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('数据变更日志删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:log:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('数据变更日志导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:log:export',       '#', 'admin', sysdate(), '', null, '');
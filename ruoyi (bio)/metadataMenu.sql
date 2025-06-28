-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('代谢组数据', '2345', '1', 'metadata', 'BiobankSys/metadata/index', 1, 0, 'C', '0', '0', 'BiobankSys:metadata:list', '#', 'admin', sysdate(), '', null, '代谢组数据菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('代谢组数据查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:metadata:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('代谢组数据新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:metadata:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('代谢组数据修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:metadata:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('代谢组数据删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:metadata:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('代谢组数据导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:metadata:export',       '#', 'admin', sysdate(), '', null, '');
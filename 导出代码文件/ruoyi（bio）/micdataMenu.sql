-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('微生物组数据', '2573', '1', 'micdata', 'BiobankSys/micdata/index', 1, 0, 'C', '0', '0', 'BiobankSys:micdata:list', '#', 'admin', sysdate(), '', null, '微生物组数据菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('微生物组数据查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:micdata:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('微生物组数据新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:micdata:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('微生物组数据修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:micdata:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('微生物组数据删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:micdata:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('微生物组数据导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:micdata:export',       '#', 'admin', sysdate(), '', null, '');
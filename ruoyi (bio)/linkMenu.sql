-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本-临床关联', '2345', '1', 'link', 'BiobankSys/link/index', 1, 0, 'C', '0', '0', 'BiobankSys:link:list', '#', 'admin', sysdate(), '', null, '样本-临床关联菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本-临床关联查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:link:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本-临床关联新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:link:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本-临床关联修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:link:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本-临床关联删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:link:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本-临床关联导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:link:export',       '#', 'admin', sysdate(), '', null, '');
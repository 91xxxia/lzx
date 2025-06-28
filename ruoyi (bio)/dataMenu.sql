-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('基因组数据', '2345', '1', 'data', 'BiobankSys/data/index', 1, 0, 'C', '0', '0', 'BiobankSys:data:list', '#', 'admin', sysdate(), '', null, '基因组数据菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('基因组数据查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:data:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('基因组数据新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:data:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('基因组数据修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:data:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('基因组数据删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:data:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('基因组数据导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:data:export',       '#', 'admin', sysdate(), '', null, '');
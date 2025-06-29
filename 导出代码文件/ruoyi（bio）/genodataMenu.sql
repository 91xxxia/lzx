-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('基因组数据', '2573', '1', 'genodata', 'BiobankSys/genodata/index', 1, 0, 'C', '0', '0', 'BiobankSys:genodata:list', '#', 'admin', sysdate(), '', null, '基因组数据菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('基因组数据查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:genodata:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('基因组数据新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:genodata:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('基因组数据修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:genodata:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('基因组数据删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:genodata:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('基因组数据导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:genodata:export',       '#', 'admin', sysdate(), '', null, '');
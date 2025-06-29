-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('CRF表格', '2573', '1', 'collection', 'BiobankSys/collection/index', 1, 0, 'C', '0', '0', 'BiobankSys:collection:list', '#', 'admin', sysdate(), '', null, 'CRF表格菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('CRF表格查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:collection:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('CRF表格新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:collection:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('CRF表格修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:collection:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('CRF表格删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:collection:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('CRF表格导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:collection:export',       '#', 'admin', sysdate(), '', null, '');
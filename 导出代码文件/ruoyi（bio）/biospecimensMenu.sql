-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本采集主表', '2573', '1', 'biospecimens', 'BiobankSys/biospecimens/index', 1, 0, 'C', '0', '0', 'BiobankSys:biospecimens:list', '#', 'admin', sysdate(), '', null, '样本采集主表菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本采集主表查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:biospecimens:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本采集主表新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:biospecimens:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本采集主表修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:biospecimens:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本采集主表删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:biospecimens:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本采集主表导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:biospecimens:export',       '#', 'admin', sysdate(), '', null, '');
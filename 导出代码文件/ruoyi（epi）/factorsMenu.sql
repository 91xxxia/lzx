-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('其他潜在混杂因素', '2000', '1', 'factors', 'EpidemSys/factors/index', 1, 0, 'C', '0', '0', 'EpidemSys:factors:list', '#', 'admin', sysdate(), '', null, '其他潜在混杂因素菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('其他潜在混杂因素查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('其他潜在混杂因素新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('其他潜在混杂因素修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('其他潜在混杂因素删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('其他潜在混杂因素导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:factors:export',       '#', 'admin', sysdate(), '', null, '');
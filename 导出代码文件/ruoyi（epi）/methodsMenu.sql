-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('环境监测方法', '2000', '1', 'methods', 'EpidemSys/methods/index', 1, 0, 'C', '0', '0', 'EpidemSys:methods:list', '#', 'admin', sysdate(), '', null, '环境监测方法菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('环境监测方法查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('环境监测方法新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('环境监测方法修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('环境监测方法删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('环境监测方法导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:methods:export',       '#', 'admin', sysdate(), '', null, '');
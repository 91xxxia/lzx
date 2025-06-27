-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族环境', '2000', '1', 'env', 'EpidemSys/env/index', 1, 0, 'C', '0', '0', 'EpidemSys:env:list', '#', 'admin', sysdate(), '', null, '家族环境菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族环境查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:env:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族环境新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:env:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族环境修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:env:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族环境删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:env:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族环境导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:env:export',       '#', 'admin', sysdate(), '', null, '');
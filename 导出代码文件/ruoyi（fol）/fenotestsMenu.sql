-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('呼出气一氧化氮检测', '2386', '1', 'fenotests', 'FollowSys/fenotests/index', 1, 0, 'C', '0', '0', 'FollowSys:fenotests:list', '#', 'admin', sysdate(), '', null, '呼出气一氧化氮检测菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('呼出气一氧化氮检测查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:fenotests:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('呼出气一氧化氮检测新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:fenotests:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('呼出气一氧化氮检测修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:fenotests:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('呼出气一氧化氮检测删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:fenotests:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('呼出气一氧化氮检测导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:fenotests:export',       '#', 'admin', sysdate(), '', null, '');
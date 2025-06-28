-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('随访基本信息', '2386', '1', 'info', 'FollowSys/info/index', 1, 0, 'C', '0', '0', 'FollowSys:info:list', '#', 'admin', sysdate(), '', null, '随访基本信息菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('随访基本信息查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:info:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('随访基本信息新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:info:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('随访基本信息修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:info:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('随访基本信息删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:info:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('随访基本信息导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:info:export',       '#', 'admin', sysdate(), '', null, '');
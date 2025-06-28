-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('症状', '2386', '1', 'symptoms', 'FollowSys/symptoms/index', 1, 0, 'C', '0', '0', 'FollowSys:symptoms:list', '#', 'admin', sysdate(), '', null, '症状菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('症状查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:symptoms:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('症状新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:symptoms:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('症状修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:symptoms:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('症状删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:symptoms:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('症状导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:symptoms:export',       '#', 'admin', sysdate(), '', null, '');
-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('鼻阻力', '2386', '1', 'nasaltests', 'FollowSys/nasaltests/index', 1, 0, 'C', '0', '0', 'FollowSys:nasaltests:list', '#', 'admin', sysdate(), '', null, '鼻阻力菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('鼻阻力查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:nasaltests:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('鼻阻力新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:nasaltests:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('鼻阻力修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:nasaltests:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('鼻阻力删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:nasaltests:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('鼻阻力导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:nasaltests:export',       '#', 'admin', sysdate(), '', null, '');
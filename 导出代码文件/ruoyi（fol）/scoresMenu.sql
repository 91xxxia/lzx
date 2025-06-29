-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('调查问卷', '2386', '1', 'scores', 'FollowSys/scores/index', 1, 0, 'C', '0', '0', 'FollowSys:scores:list', '#', 'admin', sysdate(), '', null, '调查问卷菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('调查问卷查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:scores:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('调查问卷新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:scores:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('调查问卷修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:scores:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('调查问卷删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:scores:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('调查问卷导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:scores:export',       '#', 'admin', sysdate(), '', null, '');
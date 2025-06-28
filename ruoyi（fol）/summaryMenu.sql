-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('随访信息', '2386', '1', 'summary', 'FollowSys/summary/index', 1, 0, 'C', '0', '0', 'FollowSys:summary:list', '#', 'admin', sysdate(), '', null, '随访信息菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('随访信息查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:summary:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('随访信息新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:summary:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('随访信息修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:summary:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('随访信息删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:summary:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('随访信息导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:summary:export',       '#', 'admin', sysdate(), '', null, '');
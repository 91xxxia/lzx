-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('体征', '2386', '1', 'exam', 'FollowSys/exam/index', 1, 0, 'C', '0', '0', 'FollowSys:exam:list', '#', 'admin', sysdate(), '', null, '体征菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('体征查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:exam:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('体征新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:exam:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('体征修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:exam:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('体征删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:exam:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('体征导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:exam:export',       '#', 'admin', sysdate(), '', null, '');
-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('听力检查', '2386', '1', 'audiotests', 'FollowSys/audiotests/index', 1, 0, 'C', '0', '0', 'FollowSys:audiotests:list', '#', 'admin', sysdate(), '', null, '听力检查菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('听力检查查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:audiotests:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('听力检查新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:audiotests:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('听力检查修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:audiotests:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('听力检查删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:audiotests:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('听力检查导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:audiotests:export',       '#', 'admin', sysdate(), '', null, '');
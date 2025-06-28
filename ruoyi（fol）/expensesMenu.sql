-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('费用', '2386', '1', 'expenses', 'FollowSys/expenses/index', 1, 0, 'C', '0', '0', 'FollowSys:expenses:list', '#', 'admin', sysdate(), '', null, '费用菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('费用查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:expenses:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('费用新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:expenses:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('费用修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:expenses:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('费用删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:expenses:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('费用导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:expenses:export',       '#', 'admin', sysdate(), '', null, '');
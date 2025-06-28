-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('实验室检查', '2386', '1', 'labtests', 'FollowSys/labtests/index', 1, 0, 'C', '0', '0', 'FollowSys:labtests:list', '#', 'admin', sysdate(), '', null, '实验室检查菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('实验室检查查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:labtests:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('实验室检查新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:labtests:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('实验室检查修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:labtests:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('实验室检查删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:labtests:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('实验室检查导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:labtests:export',       '#', 'admin', sysdate(), '', null, '');
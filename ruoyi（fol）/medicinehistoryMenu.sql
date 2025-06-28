-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('既往用药史', '2386', '1', 'medicinehistory', 'FollowSys/medicinehistory/index', 1, 0, 'C', '0', '0', 'FollowSys:medicinehistory:list', '#', 'admin', sysdate(), '', null, '既往用药史菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('既往用药史查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:medicinehistory:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('既往用药史新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:medicinehistory:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('既往用药史修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:medicinehistory:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('既往用药史删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:medicinehistory:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('既往用药史导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:medicinehistory:export',       '#', 'admin', sysdate(), '', null, '');
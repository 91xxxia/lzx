-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药物记录', '2386', '1', 'catalog', 'FollowSys/catalog/index', 1, 0, 'C', '0', '0', 'FollowSys:catalog:list', '#', 'admin', sysdate(), '', null, '药物记录菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药物记录查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:catalog:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药物记录新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:catalog:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药物记录修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:catalog:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药物记录删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:catalog:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药物记录导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:catalog:export',       '#', 'admin', sysdate(), '', null, '');
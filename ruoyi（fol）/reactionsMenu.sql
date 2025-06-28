-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药物不良反应', '2386', '1', 'reactions', 'FollowSys/reactions/index', 1, 0, 'C', '0', '0', 'FollowSys:reactions:list', '#', 'admin', sysdate(), '', null, '药物不良反应菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药物不良反应查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:reactions:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药物不良反应新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:reactions:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药物不良反应修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:reactions:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药物不良反应删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:reactions:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('药物不良反应导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:reactions:export',       '#', 'admin', sysdate(), '', null, '');
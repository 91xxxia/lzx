-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('疾病诊断', '2386', '1', 'diagnoses', 'FollowSys/diagnoses/index', 1, 0, 'C', '0', '0', 'FollowSys:diagnoses:list', '#', 'admin', sysdate(), '', null, '疾病诊断菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('疾病诊断查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:diagnoses:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('疾病诊断新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:diagnoses:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('疾病诊断修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:diagnoses:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('疾病诊断删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:diagnoses:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('疾病诊断导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:diagnoses:export',       '#', 'admin', sysdate(), '', null, '');
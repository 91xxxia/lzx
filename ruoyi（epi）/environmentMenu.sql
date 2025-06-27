-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('城乡环境监测', '2000', '1', 'environment', 'EpidemSys/environment/index', 1, 0, 'C', '0', '0', 'EpidemSys:environment:list', '#', 'admin', sysdate(), '', null, '城乡环境监测菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('城乡环境监测查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:environment:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('城乡环境监测新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:environment:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('城乡环境监测修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:environment:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('城乡环境监测删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:environment:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('城乡环境监测导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:environment:export',       '#', 'admin', sysdate(), '', null, '');
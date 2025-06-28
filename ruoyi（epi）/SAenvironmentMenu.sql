-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('城乡环境监测数据', '2000', '1', 'SAenvironment', 'EpidemSys/SAenvironment/index', 1, 0, 'C', '0', '0', 'EpidemSys:SAenvironment:list', '#', 'admin', sysdate(), '', null, '城乡环境监测数据菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('城乡环境监测数据查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SAenvironment:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('城乡环境监测数据新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SAenvironment:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('城乡环境监测数据修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SAenvironment:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('城乡环境监测数据删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SAenvironment:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('城乡环境监测数据导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SAenvironment:export',       '#', 'admin', sysdate(), '', null, '');
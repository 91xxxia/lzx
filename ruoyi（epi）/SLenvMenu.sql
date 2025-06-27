-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学习/工作环境号', '2000', '1', 'SLenv', 'EpidemSys/SLenv/index', 1, 0, 'C', '0', '0', 'EpidemSys:SLenv:list', '#', 'admin', sysdate(), '', null, '学习/工作环境号菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学习/工作环境号查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SLenv:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学习/工作环境号新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SLenv:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学习/工作环境号修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SLenv:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学习/工作环境号删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SLenv:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('学习/工作环境号导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SLenv:export',       '#', 'admin', sysdate(), '', null, '');
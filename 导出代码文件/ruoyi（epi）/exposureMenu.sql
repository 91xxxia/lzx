-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家庭环境暴露信息', '2000', '1', 'exposure', 'EpidemSys/exposure/index', 1, 0, 'C', '0', '0', 'EpidemSys:exposure:list', '#', 'admin', sysdate(), '', null, '家庭环境暴露信息菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家庭环境暴露信息查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家庭环境暴露信息新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家庭环境暴露信息修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家庭环境暴露信息删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家庭环境暴露信息导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:exposure:export',       '#', 'admin', sysdate(), '', null, '');
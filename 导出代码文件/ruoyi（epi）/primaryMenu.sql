-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('一级亲属过敏史', '2000', '1', 'primary', 'EpidemSys/primary/index', 1, 0, 'C', '0', '0', 'EpidemSys:primary:list', '#', 'admin', sysdate(), '', null, '一级亲属过敏史菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('一级亲属过敏史查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('一级亲属过敏史新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('一级亲属过敏史修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('一级亲属过敏史删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('一级亲属过敏史导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:primary:export',       '#', 'admin', sysdate(), '', null, '');
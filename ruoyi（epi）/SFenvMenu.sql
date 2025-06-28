-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族环境居住相似性', '2000', '1', 'SFenv', 'EpidemSys/SFenv/index', 1, 0, 'C', '0', '0', 'EpidemSys:SFenv:list', '#', 'admin', sysdate(), '', null, '家族环境居住相似性菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族环境居住相似性查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SFenv:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族环境居住相似性新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SFenv:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族环境居住相似性修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SFenv:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族环境居住相似性删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SFenv:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('家族环境居住相似性导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'EpidemSys:SFenv:export',       '#', 'admin', sysdate(), '', null, '');
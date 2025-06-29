-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('肺功能检查', '2061', '1', 'lungtests', 'ClinicalSys/lungtests/index', 1, 0, 'C', '0', '0', 'ClinicalSys:lungtests:list', '#', 'admin', sysdate(), '', null, '肺功能检查菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('肺功能检查查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:lungtests:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('肺功能检查新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:lungtests:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('肺功能检查修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:lungtests:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('肺功能检查删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:lungtests:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('肺功能检查导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'ClinicalSys:lungtests:export',       '#', 'admin', sysdate(), '', null, '');
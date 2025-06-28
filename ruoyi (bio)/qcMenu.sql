-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本质量控表', '2345', '1', 'qc', 'BiobankSys/qc/index', 1, 0, 'C', '0', '0', 'BiobankSys:qc:list', '#', 'admin', sysdate(), '', null, '样本质量控表菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本质量控表查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:qc:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本质量控表新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:qc:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本质量控表修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:qc:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本质量控表删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:qc:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本质量控表导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:qc:export',       '#', 'admin', sysdate(), '', null, '');
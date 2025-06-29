-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本采集事件', '2573', '1', 'events', 'BiobankSys/events/index', 1, 0, 'C', '0', '0', 'BiobankSys:events:list', '#', 'admin', sysdate(), '', null, '样本采集事件菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本采集事件查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:events:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本采集事件新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:events:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本采集事件修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:events:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本采集事件删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:events:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('样本采集事件导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'BiobankSys:events:export',       '#', 'admin', sysdate(), '', null, '');
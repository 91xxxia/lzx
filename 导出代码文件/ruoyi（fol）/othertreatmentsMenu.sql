-- 菜单 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('其他辅助治疗', '2386', '1', 'othertreatments', 'FollowSys/othertreatments/index', 1, 0, 'C', '0', '0', 'FollowSys:othertreatments:list', '#', 'admin', sysdate(), '', null, '其他辅助治疗菜单');

-- 按钮父菜单ID
SELECT @parentId := LAST_INSERT_ID();

-- 按钮 SQL
insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('其他辅助治疗查询', @parentId, '1',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:othertreatments:query',        '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('其他辅助治疗新增', @parentId, '2',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:othertreatments:add',          '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('其他辅助治疗修改', @parentId, '3',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:othertreatments:edit',         '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('其他辅助治疗删除', @parentId, '4',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:othertreatments:remove',       '#', 'admin', sysdate(), '', null, '');

insert into sys_menu (menu_name, parent_id, order_num, path, component, is_frame, is_cache, menu_type, visible, status, perms, icon, create_by, create_time, update_by, update_time, remark)
values('其他辅助治疗导出', @parentId, '5',  '#', '', 1, 0, 'F', '0', '0', 'FollowSys:othertreatments:export',       '#', 'admin', sysdate(), '', null, '');
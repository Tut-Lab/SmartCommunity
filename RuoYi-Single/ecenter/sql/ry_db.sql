/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:3306
 Source Schema         : ry_db

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 28/10/2021 18:36:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (2, 'sys_role', '角色信息表', NULL, NULL, 'SysRole', 'crud', 'com.ecenter.system', 'system', 'role', '角色信息', 'ruoyi', '0', '/', '{}', 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31', NULL);
INSERT INTO `gen_table` VALUES (3, 'sys_menu', '菜单权限表', NULL, NULL, 'SysMenu', 'crud', 'com.ecenter.system', 'system', 'menu', '菜单权限', 'ruoyi', '0', '/', NULL, 'admin', '2021-10-09 09:49:54', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 'sys_app', 'xxx', NULL, NULL, 'SysApp', 'crud', 'com.ecenter.system', 'system', 'app', 'xxx', 'ruoyi', '0', '/', '{}', 'admin', '2021-10-28 18:18:11', '', '2021-10-28 18:18:54', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (5, '2', 'role_id', '角色ID', 'bigint(20)', 'Long', 'roleId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (6, '2', 'role_name', '角色名称', 'varchar(30)', 'String', 'roleName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (7, '2', 'role_key', '角色权限字符串', 'varchar(100)', 'String', 'roleKey', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (8, '2', 'role_sort', '显示顺序', 'int(4)', 'Integer', 'roleSort', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (9, '2', 'data_scope', '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）', 'char(1)', 'String', 'dataScope', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (10, '2', 'menu_check_strictly', '菜单树选择项是否关联显示', 'tinyint(1)', 'Integer', 'menuCheckStrictly', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (11, '2', 'dept_check_strictly', '部门树选择项是否关联显示', 'tinyint(1)', 'Integer', 'deptCheckStrictly', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (12, '2', 'status', '角色状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 8, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (13, '2', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (14, '2', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (15, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (16, '2', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (17, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (18, '2', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 14, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (19, '2', 'app_id', '关联所属应用', 'varchar(36)', 'String', 'appId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 15, 'admin', '2021-09-30 16:28:40', '', '2021-09-30 16:29:31');
INSERT INTO `gen_table_column` VALUES (20, '3', 'menu_id', '菜单ID', 'bigint(20)', 'Long', 'menuId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (21, '3', 'menu_name', '菜单名称', 'varchar(50)', 'String', 'menuName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (22, '3', 'parent_id', '父菜单ID', 'bigint(20)', 'Long', 'parentId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (23, '3', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (24, '3', 'path', '路由地址', 'varchar(200)', 'String', 'path', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (25, '3', 'component', '组件路径', 'varchar(255)', 'String', 'component', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, '3', 'is_frame', '是否为外链（0是 1否）', 'int(1)', 'Integer', 'isFrame', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, '3', 'is_cache', '是否缓存（0缓存 1不缓存）', 'int(1)', 'Integer', 'isCache', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (28, '3', 'menu_type', '菜单类型（M目录 C菜单 F按钮）', 'char(1)', 'String', 'menuType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (29, '3', 'visible', '菜单状态（0显示 1隐藏）', 'char(1)', 'String', 'visible', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (30, '3', 'status', '菜单状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (31, '3', 'perms', '权限标识', 'varchar(100)', 'String', 'perms', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (32, '3', 'icon', '菜单图标', 'varchar(100)', 'String', 'icon', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (33, '3', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (34, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '3', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '3', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 18, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '3', 'app_id', '关联应用id', 'varchar(36)', 'String', 'appId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 19, 'admin', '2021-10-09 09:49:54', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '4', 'app_id', '应用id uuid', 'varchar(36)', 'String', 'appId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-28 18:18:11', '', '2021-10-28 18:18:54');
INSERT INTO `gen_table_column` VALUES (40, '4', 'app_name', '应用名称', 'varchar(255)', 'String', 'appName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-28 18:18:11', '', '2021-10-28 18:18:54');
INSERT INTO `gen_table_column` VALUES (41, '4', 'app_url', '应用地址', 'varchar(255)', 'String', 'appUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-28 18:18:11', '', '2021-10-28 18:18:54');
INSERT INTO `gen_table_column` VALUES (42, '4', 'type', '类型', 'tinyint(1)', 'Integer', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_app_type', 4, 'admin', '2021-10-28 18:18:11', '', '2021-10-28 18:18:54');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ecenter.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720020636F6D2E6563656E7465722E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E6563656E7465722E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017C202B7B4878707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ecenter.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720020636F6D2E6563656E7465722E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E6563656E7465722E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017C202B7B4878707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ecenter.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720020636F6D2E6563656E7465722E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720029636F6D2E6563656E7465722E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017C202B7B4878707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '之前配置文件中org.quartz.scheduler.instanceId配置的名字，就会写入该字段',
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'ST1635406637957', 1635417202322, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_ name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_ name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1635406640000, -1, 5, 'PAUSED', 'CRON', 1635406638000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1635406650000, -1, 5, 'PAUSED', 'CRON', 1635406638000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1635406640000, -1, 5, 'PAUSED', 'CRON', 1635406638000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for sys_app
-- ----------------------------
DROP TABLE IF EXISTS `sys_app`;
CREATE TABLE `sys_app`  (
  `app_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用id uuid',
  `app_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用名称',
  `app_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用地址',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_app
-- ----------------------------
INSERT INTO `sys_app` VALUES ('0458c20cc561446da7720e3d19a25ddf', '测试应用01', '#', 1);
INSERT INTO `sys_app` VALUES ('27ecdacdfa3f44799c0f4eab5de44f42', '超管系统', '#', 1);
INSERT INTO `sys_app` VALUES ('be0d0bcff73a461d986a04c9053800b5', '测试应用002', '#', 1);

-- ----------------------------
-- Table structure for sys_app_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_role`;
CREATE TABLE `sys_app_role`  (
  `app_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`app_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-09-26 11:34:53', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-09-26 11:34:53', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-09-26 11:34:53', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaOnOff', 'true', 'Y', 'admin', '2021-09-26 11:34:53', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-09-26 11:34:53', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-26 11:34:53', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-26 11:34:53', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-26 11:34:53', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-26 11:34:53', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-26 11:34:53', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-26 11:34:53', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-26 11:34:53', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-26 11:34:53', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-26 11:34:53', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-09-26 11:34:53', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, 'web端', '1', 'sys_app_type', NULL, 'default', 'N', '0', 'admin', '2021-09-30 14:27:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, 'H5', '2', 'sys_app_type', NULL, 'default', 'N', '0', 'admin', '2021-09-30 14:27:52', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 3, '微信小程序', '3', 'sys_app_type', NULL, 'default', 'N', '0', 'admin', '2021-09-30 14:28:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 4, '浙政钉', '4', 'sys_app_type', NULL, 'default', 'N', '0', 'admin', '2021-09-30 14:28:12', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '应用类型', 'sys_app_type', '0', 'admin', '2021-09-30 14:27:16', '', NULL, 'web h5 微信小程序 浙政钉');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-09-26 11:34:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-09-26 11:34:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-09-26 11:34:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 127 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'shuangfeng', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '登录用户：shuangfeng 不存在', '2021-09-26 11:39:17');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2021-09-26 11:39:21');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-26 11:39:25');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-26 13:34:58');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2021-09-30 13:49:32');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-30 13:49:35');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-30 16:01:22');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '192.168.14.73', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-09-30 16:10:20');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-08 16:41:58');
INSERT INTO `sys_logininfor` VALUES (109, 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-08 17:15:50');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-08 18:24:59');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-09 09:15:44');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-09 13:37:47');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-09 15:32:30');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-09 16:41:21');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 15:31:48');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '192.168.14.73', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-13 15:41:06');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:14:39');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '192.168.14.73', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 15:50:44');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '192.168.14.73', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2021-10-27 16:36:57');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '192.168.14.73', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 16:37:01');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 17:05:09');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-27 17:05:36');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-28 11:24:53');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-28 15:38:30');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-28 16:11:58');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2021-10-28 17:46:11');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `app_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联应用id',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2050 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-09-26 11:34:53', '', NULL, '系统管理目录', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-09-26 11:34:53', '', NULL, '系统监控目录', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-09-26 11:34:53', '', NULL, '系统工具目录', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-09-26 11:34:53', '', NULL, '用户管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-09-26 11:34:53', '', NULL, '角色管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-09-26 11:34:53', '', NULL, '菜单管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-09-26 11:34:53', '', NULL, '部门管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-09-26 11:34:53', '', NULL, '岗位管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-09-26 11:34:53', '', NULL, '字典管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-09-26 11:34:53', '', NULL, '参数设置菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-09-26 11:34:53', '', NULL, '通知公告菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-09-26 11:34:53', '', NULL, '日志管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-09-26 11:34:53', '', NULL, '在线用户菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-09-26 11:34:53', '', NULL, '定时任务菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2021-09-26 11:34:53', '', NULL, '数据监控菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-09-26 11:34:53', '', NULL, '服务监控菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2021-09-26 11:34:53', '', NULL, '缓存监控菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-09-26 11:34:53', '', NULL, '表单构建菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-09-26 11:34:53', '', NULL, '代码生成菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-09-26 11:34:53', '', NULL, '系统接口菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2021-09-26 11:34:53', '', NULL, '操作日志菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2021-09-26 11:34:53', '', NULL, '登录日志菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-09-26 11:34:53', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2000, '应用管理', 1, 10, 'app', 'system/app/index', 1, 0, 'C', '0', '0', 'system:app:list', 'build', 'admin', '2021-09-30 14:20:34', 'admin', '2021-09-30 14:25:16', '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2001, '新增', 2000, 1, '', NULL, 1, 0, 'F', '0', '0', 'system:app:add', '#', 'admin', '2021-09-30 14:23:17', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2002, '修改', 2000, 2, '', NULL, 1, 0, 'F', '0', '0', 'system:app:edit', '#', 'admin', '2021-09-30 14:23:33', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2003, '删除', 2000, 3, '', NULL, 1, 0, 'F', '0', '0', 'system:app:remove', '#', 'admin', '2021-09-30 14:23:50', 'admin', '2021-10-27 17:08:33', '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2004, '导出', 2000, 4, '', NULL, 1, 0, 'F', '0', '0', 'system:app:export', '#', 'admin', '2021-09-30 14:24:19', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2005, '列表', 2000, 5, '', NULL, 1, 0, 'F', '0', '0', 'system:app:list', '#', 'admin', '2021-09-30 14:25:12', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2024, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', NULL, 'system', '', '2021-10-09 09:52:25', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2025, '角色管理', 2024, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', '', '2021-10-09 09:52:25', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2026, '角色查询', 2025, 1, '', NULL, 1, 0, 'F', '0', '0', 'system:role:query', '#', '', '2021-10-09 09:52:25', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2027, '角色新增', 2025, 2, '', NULL, 1, 0, 'F', '0', '0', 'system:role:add', '#', '', '2021-10-09 09:52:25', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2028, '角色修改', 2025, 3, '', NULL, 1, 0, 'F', '0', '0', 'system:role:edit', '#', '', '2021-10-09 09:52:25', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2029, '角色删除', 2025, 4, '', NULL, 1, 0, 'F', '0', '0', 'system:role:remove', '#', '', '2021-10-09 09:52:25', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2030, '角色导出', 2025, 5, '', NULL, 1, 0, 'F', '0', '0', 'system:role:export', '#', '', '2021-10-09 09:52:25', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2031, '菜单管理', 2024, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', '', '2021-10-09 09:52:25', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2032, '菜单查询', 2031, 1, '', NULL, 1, 0, 'F', '0', '0', 'system:menu:query', '#', '', '2021-10-09 09:52:25', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2033, '菜单新增', 2031, 2, '', NULL, 1, 0, 'F', '0', '0', 'system:menu:add', '#', '', '2021-10-09 09:52:25', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2034, '菜单修改', 2031, 3, '', NULL, 1, 0, 'F', '0', '0', 'system:menu:edit', '#', '', '2021-10-09 09:52:25', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2035, '菜单删除', 2031, 4, '', NULL, 1, 0, 'F', '0', '0', 'system:menu:remove', '#', '', '2021-10-09 09:52:25', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2036, '模块01', 0, 2, 'mk01', NULL, 1, 0, 'M', '0', '0', NULL, 'post', 'admin', '2021-10-09 10:38:28', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2037, 'tab01', 2036, 1, 'tab01', NULL, 1, 0, 'C', '0', '0', NULL, 'component', 'admin', '2021-10-09 10:39:22', '', NULL, '', '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_menu` VALUES (2038, '系统管理', 0, 1, 'system', NULL, 1, 0, 'M', '0', '0', NULL, 'system', '', '2021-10-28 15:42:18', '', NULL, '', 'be0d0bcff73a461d986a04c9053800b5');
INSERT INTO `sys_menu` VALUES (2039, '角色管理', 2038, 2, 'role', 'system/role/index', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', '', '2021-10-28 15:42:18', '', NULL, '', 'be0d0bcff73a461d986a04c9053800b5');
INSERT INTO `sys_menu` VALUES (2040, '角色查询', 2039, 1, '', NULL, 1, 0, 'F', '0', '0', 'system:role:query', '#', '', '2021-10-28 15:42:18', '', NULL, '', 'be0d0bcff73a461d986a04c9053800b5');
INSERT INTO `sys_menu` VALUES (2041, '角色新增', 2039, 2, '', NULL, 1, 0, 'F', '0', '0', 'system:role:add', '#', '', '2021-10-28 15:42:18', '', NULL, '', 'be0d0bcff73a461d986a04c9053800b5');
INSERT INTO `sys_menu` VALUES (2042, '角色修改', 2039, 3, '', NULL, 1, 0, 'F', '0', '0', 'system:role:edit', '#', '', '2021-10-28 15:42:18', '', NULL, '', 'be0d0bcff73a461d986a04c9053800b5');
INSERT INTO `sys_menu` VALUES (2043, '角色删除', 2039, 4, '', NULL, 1, 0, 'F', '0', '0', 'system:role:remove', '#', '', '2021-10-28 15:42:18', '', NULL, '', 'be0d0bcff73a461d986a04c9053800b5');
INSERT INTO `sys_menu` VALUES (2044, '角色导出', 2039, 5, '', NULL, 1, 0, 'F', '0', '0', 'system:role:export', '#', '', '2021-10-28 15:42:18', '', NULL, '', 'be0d0bcff73a461d986a04c9053800b5');
INSERT INTO `sys_menu` VALUES (2045, '菜单管理', 2038, 3, 'menu', 'system/menu/index', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', '', '2021-10-28 15:42:18', '', NULL, '', 'be0d0bcff73a461d986a04c9053800b5');
INSERT INTO `sys_menu` VALUES (2046, '菜单查询', 2045, 1, '', NULL, 1, 0, 'F', '0', '0', 'system:menu:query', '#', '', '2021-10-28 15:42:18', '', NULL, '', 'be0d0bcff73a461d986a04c9053800b5');
INSERT INTO `sys_menu` VALUES (2047, '菜单新增', 2045, 2, '', NULL, 1, 0, 'F', '0', '0', 'system:menu:add', '#', '', '2021-10-28 15:42:18', '', NULL, '', 'be0d0bcff73a461d986a04c9053800b5');
INSERT INTO `sys_menu` VALUES (2048, '菜单修改', 2045, 3, '', NULL, 1, 0, 'F', '0', '0', 'system:menu:edit', '#', '', '2021-10-28 15:42:18', '', NULL, '', 'be0d0bcff73a461d986a04c9053800b5');
INSERT INTO `sys_menu` VALUES (2049, '菜单删除', 2045, 4, '', NULL, 1, 0, 'F', '0', '0', 'system:menu:remove', '#', '', '2021-10-28 15:42:18', '', NULL, '', 'be0d0bcff73a461d986a04c9053800b5');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-09-26 11:34:53', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-09-26 11:34:53', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 156 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.ecenter.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/ecenter/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-09-30 13:53:32');
INSERT INTO `sys_oper_log` VALUES (101, '角色管理', 2, 'com.ecenter.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1632627293000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 13:53:41');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.ecenter.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/ecenter/system/menu/4', '127.0.0.1', '内网IP', '{menuId=4}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 13:53:46');
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 6, 'com.ecenter.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/ecenter/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_app', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:14:29');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ecenter.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"10\",\"menuName\":\"应用管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"app\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:20:35');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ecenter.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"新增\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:app:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:23:17');
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 1, 'com.ecenter.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"修改\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:app:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:23:33');
INSERT INTO `sys_oper_log` VALUES (107, '菜单管理', 1, 'com.ecenter.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"删除\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:app:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:23:50');
INSERT INTO `sys_oper_log` VALUES (108, '菜单管理', 1, 'com.ecenter.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"导出\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:app:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:24:19');
INSERT INTO `sys_oper_log` VALUES (109, '菜单管理', 2, 'com.ecenter.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"10\",\"menuName\":\"应用管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"app\",\"component\":\"system/app/index\",\"children\":[],\"createTime\":1632982834000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:24:49');
INSERT INTO `sys_oper_log` VALUES (110, '菜单管理', 1, 'com.ecenter.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"列表\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"F\",\"perms\":\"system:app:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:25:12');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 2, 'com.ecenter.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"10\",\"menuName\":\"应用管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"app\",\"component\":\"system/app/index\",\"children\":[],\"createTime\":1632982834000,\"updateBy\":\"admin\",\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:app:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:25:16');
INSERT INTO `sys_oper_log` VALUES (112, '字典类型', 1, 'com.ecenter.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"应用类型\",\"remark\":\"web h5 微信小程序 浙政钉\",\"params\":{},\"dictType\":\"sys_app_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:27:16');
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.ecenter.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"sys_app_type\",\"dictLabel\":\"web端\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:27:41');
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 1, 'com.ecenter.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"sys_app_type\",\"dictLabel\":\"H5\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:27:52');
INSERT INTO `sys_oper_log` VALUES (115, '字典数据', 1, 'com.ecenter.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"sys_app_type\",\"dictLabel\":\"微信小程序\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:28:03');
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 1, 'com.ecenter.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/dict/data', '127.0.0.1', '内网IP', '{\"dictValue\":\"4\",\"listClass\":\"default\",\"dictSort\":4,\"params\":{},\"dictType\":\"sys_app_type\",\"dictLabel\":\"浙政钉\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:28:12');
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ecenter.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/ecenter/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"AppId\",\"usableColumn\":false,\"columnId\":1,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"appId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"应用id uuid\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1632982469000,\"tableId\":1,\"pk\":true,\"columnName\":\"app_id\"},{\"capJavaField\":\"AppName\",\"usableColumn\":false,\"columnId\":2,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"appName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"应用名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1632982469000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"app_name\"},{\"capJavaField\":\"AppUrl\",\"usableColumn\":false,\"columnId\":3,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"appUrl\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"应用地址\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1632982469000,\"isEdit\":\"1\",\"tableId\":1,\"pk\":false,\"columnName\":\"app_url\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":4,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_app_type\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"tinyint(1)\",\"createBy\":\"admin\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:28:44');
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 2, 'com.ecenter.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/ecenter/tool/gen/synchDb/sys_app', '127.0.0.1', '内网IP', '{tableName=sys_app}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 14:28:47');
INSERT INTO `sys_oper_log` VALUES (119, '', 1, 'com.ecenter.web.controller.system.SysAppController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/app', '192.168.14.73', '内网IP', '{\"appName\":\"测试应用\",\"appId\":\"27ecdacdfa3f44799c0f4eab5de44f42\",\"appUrl\":\"#\",\"params\":{},\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 16:11:07');
INSERT INTO `sys_oper_log` VALUES (120, '', 2, 'com.ecenter.web.controller.system.SysAppController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/app', '192.168.14.73', '内网IP', '{\"appName\":\"测试应用\",\"appId\":\"27ecdacdfa3f44799c0f4eab5de44f42\",\"appUrl\":\"#\",\"params\":{},\"type\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 16:11:14');
INSERT INTO `sys_oper_log` VALUES (121, '角色管理', 1, 'com.ecenter.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/role', '192.168.14.73', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"ww\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'普通角色\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2021-09-30 16:15:20');
INSERT INTO `sys_oper_log` VALUES (122, '角色管理', 1, 'com.ecenter.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/role', '192.168.14.73', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"ww\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'普通角色\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2021-09-30 16:15:30');
INSERT INTO `sys_oper_log` VALUES (123, '角色管理', 1, 'com.ecenter.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/role', '192.168.14.73', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"roleKey\":\"ww\",\"roleName\":\"普通角色\",\"deptIds\":[],\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"新增角色\'普通角色\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2021-09-30 16:15:36');
INSERT INTO `sys_oper_log` VALUES (124, '代码生成', 3, 'com.ecenter.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/ecenter/tool/gen/1', '192.168.14.73', '内网IP', '{tableIds=1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 16:28:31');
INSERT INTO `sys_oper_log` VALUES (125, '代码生成', 6, 'com.ecenter.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/ecenter/tool/gen/importTable', '192.168.14.73', '内网IP', 'sys_role', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 16:28:41');
INSERT INTO `sys_oper_log` VALUES (126, '代码生成', 2, 'com.ecenter.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/ecenter/tool/gen', '192.168.14.73', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"RoleId\",\"usableColumn\":false,\"columnId\":5,\"isIncrement\":\"1\",\"increment\":true,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"roleId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"角色ID\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"Long\",\"queryType\":\"EQ\",\"columnType\":\"bigint(20)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1632990520000,\"tableId\":2,\"pk\":true,\"columnName\":\"role_id\"},{\"capJavaField\":\"RoleName\",\"usableColumn\":false,\"columnId\":6,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"roleName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"角色名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(30)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1632990520000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"role_name\"},{\"capJavaField\":\"RoleKey\",\"usableColumn\":false,\"columnId\":7,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"roleKey\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"角色权限字符串\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1632990520000,\"isEdit\":\"1\",\"tableId\":2,\"pk\":false,\"columnName\":\"role_key\"},{\"capJavaField\":\"RoleSort\",\"usableColumn\":false,\"columnId\":8,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":true,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"isRequired\":\"1\",\"javaField\":\"roleSort\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"显示顺序\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"E', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 16:29:31');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 1, 'com.ecenter.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/menu', '192.168.14.73', '内网IP', '{\"visible\":\"0\",\"icon\":\"404\",\"orderNum\":\"1\",\"menuName\":\"gfdgd\",\"params\":{},\"isCache\":\"0\",\"path\":\"111\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 17:40:10');
INSERT INTO `sys_oper_log` VALUES (128, '菜单管理', 3, 'com.ecenter.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/ecenter/system/menu/2006', '192.168.14.73', '内网IP', '{menuId=2006}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-09-30 17:40:27');
INSERT INTO `sys_oper_log` VALUES (129, '', 2, 'com.ecenter.web.controller.system.SysAppController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/app', '127.0.0.1', '内网IP', '{\"appName\":\"超级管理员\",\"appId\":\"27ecdacdfa3f44799c0f4eab5de44f42\",\"appUrl\":\"#\",\"params\":{},\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-08 17:11:31');
INSERT INTO `sys_oper_log` VALUES (130, '', 2, 'com.ecenter.web.controller.system.SysAppController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/app', '127.0.0.1', '内网IP', '{\"appName\":\"超管系统\",\"appId\":\"27ecdacdfa3f44799c0f4eab5de44f42\",\"appUrl\":\"#\",\"params\":{},\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-08 17:11:55');
INSERT INTO `sys_oper_log` VALUES (131, '角色管理', 2, 'com.ecenter.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1632627293000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"27ecdacdfa3f44799c0f4eab5de44f42\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-08 17:14:40');
INSERT INTO `sys_oper_log` VALUES (132, '', 1, 'com.ecenter.web.controller.system.SysAppController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/app', '127.0.0.1', '内网IP', '{\"appName\":\"测试应用01\",\"appId\":\"3b879de2671e43cdb44bcd418f6ded95\",\"appUrl\":\"#\",\"params\":{},\"type\":1}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1008\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\item\\study\\ruoyi\\tx_cyk_server\\ecenter-system\\target\\classes\\mapper\\system\\SysMenuMapper.xml]\r\n### The error may involve com.ecenter.system.mapper.SysMenuMapper.insertMenu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_menu(    menu_id,         menu_name,     order_num,             is_frame,     is_cache,     menu_type,     visible,     status,     perms,     icon,            create_time   )values(    ?,         ?,     ?,             ?,     ?,     ?,     ?,     ?,     ?,     ?,            sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1008\' for key \'PRIMARY\'\n; Duplicate entry \'1008\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1008\' for key \'PRIMARY\'', '2021-10-09 09:39:20');
INSERT INTO `sys_oper_log` VALUES (133, '', 1, 'com.ecenter.web.controller.system.SysAppController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/app', '127.0.0.1', '内网IP', '{\"appName\":\"测试应用01\",\"appId\":\"9d8d0225557548568a1116d5b0943edf\",\"appUrl\":\"#\",\"params\":{},\"type\":1}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1008\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\item\\study\\ruoyi\\tx_cyk_server\\ecenter-system\\target\\classes\\mapper\\system\\SysMenuMapper.xml]\r\n### The error may involve com.ecenter.system.mapper.SysMenuMapper.insertMenu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_menu(    menu_id,         menu_name,     order_num,             is_frame,     is_cache,     menu_type,     visible,     status,     perms,     icon,            create_time   )values(    ?,         ?,     ?,             ?,     ?,     ?,     ?,     ?,     ?,     ?,            sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1008\' for key \'PRIMARY\'\n; Duplicate entry \'1008\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1008\' for key \'PRIMARY\'', '2021-10-09 09:44:51');
INSERT INTO `sys_oper_log` VALUES (134, '', 1, 'com.ecenter.web.controller.system.SysAppController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/app', '127.0.0.1', '内网IP', '{\"appName\":\"测试应用01\",\"appId\":\"0694d32601294c5f8136216e7345b50d\",\"appUrl\":\"#\",\"params\":{},\"type\":1}', 'null', 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1008\' for key \'PRIMARY\'\r\n### The error may exist in file [D:\\item\\study\\ruoyi\\tx_cyk_server\\ecenter-system\\target\\classes\\mapper\\system\\SysMenuMapper.xml]\r\n### The error may involve com.ecenter.system.mapper.SysMenuMapper.insertMenu-Inline\r\n### The error occurred while setting parameters\r\n### SQL: insert into sys_menu(    menu_id,     parent_id,     menu_name,     order_num,             is_frame,     is_cache,     menu_type,     visible,     status,     perms,     icon,            create_time   )values(    ?,     ?,     ?,     ?,             ?,     ?,     ?,     ?,     ?,     ?,     ?,            sysdate()   )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1008\' for key \'PRIMARY\'\n; Duplicate entry \'1008\' for key \'PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'1008\' for key \'PRIMARY\'', '2021-10-09 09:45:48');
INSERT INTO `sys_oper_log` VALUES (135, '', 1, 'com.ecenter.web.controller.system.SysAppController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/app', '127.0.0.1', '内网IP', '{\"appName\":\"测试应用01\",\"appId\":\"fd600dba71e14f4aa2b0765e16033fa9\",\"appUrl\":\"#\",\"params\":{},\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 09:46:55');
INSERT INTO `sys_oper_log` VALUES (136, '代码生成', 6, 'com.ecenter.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/ecenter/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_menu', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 09:49:54');
INSERT INTO `sys_oper_log` VALUES (137, '', 3, 'com.ecenter.web.controller.system.SysAppController.remove()', 'DELETE', 1, 'admin', NULL, '/ecenter/system/app/fd600dba71e14f4aa2b0765e16033fa9', '127.0.0.1', '内网IP', '{appIds=fd600dba71e14f4aa2b0765e16033fa9}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 09:51:26');
INSERT INTO `sys_oper_log` VALUES (138, '', 1, 'com.ecenter.web.controller.system.SysAppController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/app', '127.0.0.1', '内网IP', '{\"appName\":\"测试应用01\",\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"appUrl\":\"#\",\"params\":{},\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 09:52:25');
INSERT INTO `sys_oper_log` VALUES (139, '菜单管理', 1, 'com.ecenter.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"post\",\"orderNum\":\"2\",\"menuName\":\"模块01\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"mk01\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"isFrame\":\"1\",\"menuId\":2036,\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 10:38:28');
INSERT INTO `sys_oper_log` VALUES (140, '菜单管理', 1, 'com.ecenter.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"component\",\"orderNum\":\"1\",\"menuName\":\"tab01\",\"params\":{},\"parentId\":2036,\"isCache\":\"0\",\"path\":\"tab01\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"isFrame\":\"1\",\"menuId\":2037,\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 10:39:22');
INSERT INTO `sys_oper_log` VALUES (141, '角色管理', 1, 'com.ecenter.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":3,\"admin\":false,\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"roleKey\":\"test01\",\"roleName\":\"测试角色\",\"deptIds\":[],\"menuIds\":[2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 10:48:01');
INSERT INTO `sys_oper_log` VALUES (142, '角色管理', 3, 'com.ecenter.web.controller.system.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/ecenter/system/role/3', '127.0.0.1', '内网IP', '{roleIds=3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 10:51:12');
INSERT INTO `sys_oper_log` VALUES (143, '角色管理', 1, 'com.ecenter.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"roleKey\":\"test01\",\"roleName\":\"测试角色01\",\"deptIds\":[],\"menuIds\":[2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037],\"status\":\"0\"}', '{\"msg\":\"新增角色\'测试角色01\'失败，角色权限已存在\",\"code\":500}', 0, NULL, '2021-10-09 10:52:27');
INSERT INTO `sys_oper_log` VALUES (144, '角色管理', 1, 'com.ecenter.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":4,\"admin\":false,\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"roleKey\":\"test01\",\"roleName\":\"测试角色01\",\"deptIds\":[],\"menuIds\":[2024,2025,2026,2027,2028,2029,2030,2031,2032,2033,2034,2035,2036,2037],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 10:52:55');
INSERT INTO `sys_oper_log` VALUES (145, '角色管理', 1, 'com.ecenter.web.controller.system.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/role', '127.0.0.1', '内网IP', '{\"flag\":false,\"roleId\":5,\"admin\":false,\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"roleKey\":\"test02\",\"roleName\":\"测试角色02\",\"deptIds\":[],\"menuIds\":[2036,2037],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 13:46:58');
INSERT INTO `sys_oper_log` VALUES (146, '用户管理', 2, 'com.ecenter.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1633684550000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1632627293000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 14:50:26');
INSERT INTO `sys_oper_log` VALUES (147, '用户管理', 2, 'com.ecenter.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1633684550000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2,5],\"createTime\":1632627293000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 14:50:51');
INSERT INTO `sys_oper_log` VALUES (148, '用户管理', 2, 'com.ecenter.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"},{\"flag\":false,\"roleId\":5,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"test02\",\"roleName\":\"测试角色02\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1633684550000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1632627293000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 14:53:27');
INSERT INTO `sys_oper_log` VALUES (149, '用户管理', 2, 'com.ecenter.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1633684550000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2,5],\"createTime\":1632627293000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 15:03:54');
INSERT INTO `sys_oper_log` VALUES (150, '用户管理', 2, 'com.ecenter.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"},{\"flag\":false,\"roleId\":5,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"test02\",\"roleName\":\"测试角色02\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1633684550000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2],\"createTime\":1632627293000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 15:04:46');
INSERT INTO `sys_oper_log` VALUES (151, '用户管理', 2, 'com.ecenter.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/user', '127.0.0.1', '内网IP', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1633684550000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":2,\"createBy\":\"admin\",\"roleIds\":[2,5],\"createTime\":1632627293000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-09 17:17:32');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 2, 'com.ecenter.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/ecenter/system/menu', '127.0.0.1', '内网IP', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"删除\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1632983030000,\"updateBy\":\"admin\",\"appId\":\"27ecdacdfa3f44799c0f4eab5de44f42\",\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"F\",\"perms\":\"system:app:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 17:08:33');
INSERT INTO `sys_oper_log` VALUES (153, '', 1, 'com.ecenter.web.controller.system.SysAppController.add()', 'POST', 1, 'admin', NULL, '/ecenter/system/app', '127.0.0.1', '内网IP', '{\"appName\":\"测试应用002\",\"appId\":\"be0d0bcff73a461d986a04c9053800b5\",\"appUrl\":\"#\",\"params\":{},\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 15:42:18');
INSERT INTO `sys_oper_log` VALUES (154, '代码生成', 6, 'com.ecenter.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/ecenter/tool/gen/importTable', '127.0.0.1', '内网IP', 'sys_app', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:18:11');
INSERT INTO `sys_oper_log` VALUES (155, '代码生成', 2, 'com.ecenter.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', NULL, '/ecenter/tool/gen', '127.0.0.1', '内网IP', '{\"sub\":false,\"functionAuthor\":\"ruoyi\",\"columns\":[{\"capJavaField\":\"AppId\",\"usableColumn\":false,\"columnId\":39,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"appId\",\"htmlType\":\"input\",\"edit\":false,\"query\":false,\"columnComment\":\"应用id uuid\",\"sort\":1,\"list\":false,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(36)\",\"createBy\":\"admin\",\"isPk\":\"1\",\"createTime\":1635416291000,\"tableId\":4,\"pk\":true,\"columnName\":\"app_id\"},{\"capJavaField\":\"AppName\",\"usableColumn\":false,\"columnId\":40,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"appName\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"应用名称\",\"isQuery\":\"1\",\"sort\":2,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"LIKE\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1635416291000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"app_name\"},{\"capJavaField\":\"AppUrl\",\"usableColumn\":false,\"columnId\":41,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"appUrl\",\"htmlType\":\"input\",\"edit\":true,\"query\":true,\"columnComment\":\"应用地址\",\"isQuery\":\"1\",\"sort\":3,\"list\":true,\"params\":{},\"javaType\":\"String\",\"queryType\":\"EQ\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"isPk\":\"0\",\"createTime\":1635416291000,\"isEdit\":\"1\",\"tableId\":4,\"pk\":false,\"columnName\":\"app_url\"},{\"capJavaField\":\"Type\",\"usableColumn\":false,\"columnId\":42,\"isIncrement\":\"0\",\"increment\":false,\"insert\":true,\"isList\":\"1\",\"dictType\":\"sys_app_type\",\"required\":false,\"superColumn\":false,\"updateBy\":\"\",\"isInsert\":\"1\",\"javaField\":\"type\",\"htmlType\":\"select\",\"edit\":true,\"query\":true,\"columnComment\":\"类型\",\"isQuery\":\"1\",\"sort\":4,\"list\":true,\"params\":{},\"javaType\":\"Integer\",\"queryType\":\"EQ\",\"columnType\":\"tinyint(1)\",\"createBy\":\"ad', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:18:54');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-09-26 11:34:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-09-26 11:34:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-09-26 11:34:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-09-26 11:34:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `app_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联所属应用',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-09-26 11:34:53', '', NULL, '超级管理员', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-09-26 11:34:53', 'admin', '2021-10-08 17:14:40', '普通角色', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_role` VALUES (4, '测试角色01', 'test01', 1, '1', 1, 1, '0', '0', 'admin', '2021-10-09 10:52:55', '', NULL, NULL, '0458c20cc561446da7720e3d19a25ddf');
INSERT INTO `sys_role` VALUES (5, '测试角色02', 'test02', 2, '1', 1, 1, '0', '0', 'admin', '2021-10-09 13:46:58', '', NULL, NULL, '0458c20cc561446da7720e3d19a25ddf');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (4, 2024);
INSERT INTO `sys_role_menu` VALUES (4, 2025);
INSERT INTO `sys_role_menu` VALUES (4, 2026);
INSERT INTO `sys_role_menu` VALUES (4, 2027);
INSERT INTO `sys_role_menu` VALUES (4, 2028);
INSERT INTO `sys_role_menu` VALUES (4, 2029);
INSERT INTO `sys_role_menu` VALUES (4, 2030);
INSERT INTO `sys_role_menu` VALUES (4, 2031);
INSERT INTO `sys_role_menu` VALUES (4, 2032);
INSERT INTO `sys_role_menu` VALUES (4, 2033);
INSERT INTO `sys_role_menu` VALUES (4, 2034);
INSERT INTO `sys_role_menu` VALUES (4, 2035);
INSERT INTO `sys_role_menu` VALUES (4, 2036);
INSERT INTO `sys_role_menu` VALUES (4, 2037);
INSERT INTO `sys_role_menu` VALUES (5, 2036);
INSERT INTO `sys_role_menu` VALUES (5, 2037);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-10-28 17:46:12', 'admin', '2021-09-26 11:34:53', '', '2021-10-28 17:46:11', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-10-08 17:15:50', 'admin', '2021-09-26 11:34:53', 'admin', '2021-10-09 17:17:32', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (2, 5);

SET FOREIGN_KEY_CHECKS = 1;

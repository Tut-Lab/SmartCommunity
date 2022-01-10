/*
 Navicat Premium Data Transfer

 Source Server         : mysqql-db
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : sh-cdb-fvmvmemk.sql.tencentcdb.com:59176
 Source Schema         : ry-cloud

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : 65001

 Date: 09/01/2022 23:45:10
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
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 'sys_app', 'xx', NULL, NULL, 'SysApp', 'crud', 'com.ruoyi.system', 'system', 'app', 'xx', 'ruoyi', '0', '/', '{}', 'admin', '2021-10-28 18:24:22', '', '2021-10-28 18:24:44', NULL);
INSERT INTO `gen_table` VALUES (2, 'im_add_friend_apply', '好友申请', NULL, NULL, 'ImAddFriendApply', 'crud', 'com.ruoyi.system', 'system', 'apply', '好友申请', 'ruoyi', '0', '/', '{}', 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:03:01', NULL);
INSERT INTO `gen_table` VALUES (3, 'im_chat_info', '聊天列表', NULL, NULL, 'ImChatInfo', 'crud', 'com.ruoyi.system', 'system', 'info', '聊天列表', 'ruoyi', '0', '/', '{}', 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:06:51', NULL);
INSERT INTO `gen_table` VALUES (4, 'im_chat_info_detail', '聊天记录', NULL, NULL, 'ImChatInfoDetail', 'crud', 'com.ruoyi.system', 'system', 'detail', '聊天记录', 'ruoyi', '0', '/', '{}', 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:10:42', NULL);
INSERT INTO `gen_table` VALUES (5, 'im_user_friend', '', NULL, NULL, 'ImUserFriend', 'crud', 'com.ruoyi.system', 'system', 'friend', NULL, 'ruoyi', '0', '/', NULL, 'admin', '2021-12-11 20:52:46', '', NULL, NULL);

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
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, '1', 'app_id', '应用id uuid', 'varchar(36)', 'String', 'appId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-10-28 18:24:22', '', '2021-10-28 18:24:44');
INSERT INTO `gen_table_column` VALUES (2, '1', 'app_name', '应用名称', 'varchar(255)', 'String', 'appName', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-10-28 18:24:22', '', '2021-10-28 18:24:44');
INSERT INTO `gen_table_column` VALUES (3, '1', 'app_url', '应用地址', 'varchar(255)', 'String', 'appUrl', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-10-28 18:24:22', '', '2021-10-28 18:24:44');
INSERT INTO `gen_table_column` VALUES (4, '1', 'type', '类型', 'tinyint(1)', 'Integer', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_app_type', 4, 'admin', '2021-10-28 18:24:22', '', '2021-10-28 18:24:44');
INSERT INTO `gen_table_column` VALUES (5, '2', 'apply_id', NULL, 'char(32)', 'String', 'applyId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:03:01');
INSERT INTO `gen_table_column` VALUES (6, '2', 'req_user_id', '请求者用户Id', 'char(32)', 'String', 'reqUserId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:03:01');
INSERT INTO `gen_table_column` VALUES (7, '2', 'res_user_id', '被请求者用户id', 'char(32)', 'String', 'resUserId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:03:01');
INSERT INTO `gen_table_column` VALUES (8, '2', 'apply_content', '申请时的请求内容', 'varchar(100)', 'String', 'applyContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:03:01');
INSERT INTO `gen_table_column` VALUES (9, '2', 'remark_content', '备注名称', 'varchar(50)', 'String', 'remarkContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 5, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:03:01');
INSERT INTO `gen_table_column` VALUES (10, '2', 'apply_state', '申请状态 1-申请发起 2-申请通过 0-申请被拒绝', 'tinyint(1)', 'Integer', 'applyState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:03:01');
INSERT INTO `gen_table_column` VALUES (11, '2', 'origin', '通过什么添加好友 0-手机号 1-账号 2-群', 'varchar(50)', 'String', 'origin', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:03:01');
INSERT INTO `gen_table_column` VALUES (12, '2', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:03:01');
INSERT INTO `gen_table_column` VALUES (13, '2', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:03:01');
INSERT INTO `gen_table_column` VALUES (14, '3', 'chat_id', NULL, 'char(32)', 'String', 'chatId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:06:51');
INSERT INTO `gen_table_column` VALUES (15, '3', 'user_id', '用户id', 'char(32)', 'String', 'userId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:06:51');
INSERT INTO `gen_table_column` VALUES (16, '3', 'friend_id', '朋友id', 'char(32)', 'String', 'friendId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:06:51');
INSERT INTO `gen_table_column` VALUES (17, '3', 'online', '对方是否在线 1-在线 0-不在线', 'tinyint(1)', 'Integer', 'online', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:06:51');
INSERT INTO `gen_table_column` VALUES (18, '3', 'unread', '未读数', 'int(10)', 'Integer', 'unread', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:06:51');
INSERT INTO `gen_table_column` VALUES (19, '3', 'state', '是否删除 0-未删除 1-删除', 'tinyint(1)', 'Integer', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:06:51');
INSERT INTO `gen_table_column` VALUES (20, '3', 'hide', '是否隐藏 0-未隐藏 1-隐藏', 'tinyint(1)', 'Integer', 'hide', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:06:51');
INSERT INTO `gen_table_column` VALUES (21, '3', 'type', '1-点对点聊天 2-群聊', 'tinyint(1)', 'Integer', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 8, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:06:51');
INSERT INTO `gen_table_column` VALUES (22, '3', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:06:51');
INSERT INTO `gen_table_column` VALUES (23, '3', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:06:51');
INSERT INTO `gen_table_column` VALUES (24, '4', 'chat_detail_id', NULL, 'bigint(20)', 'Long', 'chatDetailId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:10:42');
INSERT INTO `gen_table_column` VALUES (25, '4', 'chat_id', '聊天id', 'char(32)', 'String', 'chatId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:10:42');
INSERT INTO `gen_table_column` VALUES (26, '4', 'user_id', '用户id', 'char(32)', 'String', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:10:42');
INSERT INTO `gen_table_column` VALUES (27, '4', 'type', '消息类型 1-普通文本信息 2-语音信息 3-链接信息 4-视频图片信息 5-表情信息', 'tinyint(1)', 'Integer', 'type', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 4, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:10:42');
INSERT INTO `gen_table_column` VALUES (28, '4', 'content', '聊天内容', 'varchar(255)', 'String', 'content', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 5, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:10:42');
INSERT INTO `gen_table_column` VALUES (29, '4', 'send_time', '发送时间', 'datetime', 'Date', 'sendTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:10:42');
INSERT INTO `gen_table_column` VALUES (30, '4', 'latest', '是否是最后一条信息 0-不是 1-是', 'tinyint(1)', 'Integer', 'latest', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:10:42');
INSERT INTO `gen_table_column` VALUES (31, '4', 'state', '是否删除 0-否 1-是', 'tinyint(1)', 'Integer', 'state', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:10:42');
INSERT INTO `gen_table_column` VALUES (32, '4', 'recall', '是否撤回 0-否 1-是', 'tinyint(1)', 'Integer', 'recall', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:10:42');
INSERT INTO `gen_table_column` VALUES (33, '4', 'receive', '接收状态 1-已接受 0-未接收', 'tinyint(1)', 'Integer', 'receive', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2021-12-11 20:52:46', '', '2021-12-11 21:10:42');
INSERT INTO `gen_table_column` VALUES (34, '5', 'relation_id', NULL, 'char(32)', 'String', 'relationId', '1', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-12-11 20:52:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (35, '5', 'user_id', '用户id', 'char(32)', 'String', 'userId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-12-11 20:52:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (36, '5', 'friend_id', '朋友id', 'char(32)', 'String', 'friendId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2021-12-11 20:52:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (37, '5', 'remark_content', '备注', 'varchar(50)', 'String', 'remarkContent', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'editor', '', 4, 'admin', '2021-12-11 20:52:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (38, '5', 'label', '标签', 'varchar(50)', 'String', 'label', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-12-11 20:52:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (39, '5', 'authority', '朋友权限 1-朋友圈，聊天 2-仅聊天', 'varchar(50)', 'String', 'authority', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2021-12-11 20:52:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (40, '5', 'share_state', '1-不让他看 2-不看他', 'varchar(10)', 'String', 'shareState', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-12-11 20:52:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (41, '5', 'origin', '通过什么添加好友 0-手机号 1-账号 2-群', 'varchar(100)', 'String', 'origin', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-12-11 20:52:46', '', NULL);

-- ----------------------------
-- Table structure for im_add_friend_apply
-- ----------------------------
DROP TABLE IF EXISTS `im_add_friend_apply`;
CREATE TABLE `im_add_friend_apply`  (
  `apply_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `req_user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求者用户Id',
  `res_user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '被请求者用户id',
  `apply_content` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请时的请求内容',
  `remark_content` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注名称',
  `apply_state` tinyint(1) NULL DEFAULT NULL COMMENT '申请状态 1-申请发起 2-申请通过 0-申请被拒绝',
  `origin` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通过什么添加好友 0-手机号 1-账号 2-群',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`apply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of im_add_friend_apply
-- ----------------------------
INSERT INTO `im_add_friend_apply` VALUES ('5a43cf13a0a74e65a2593d76e6f11d01', '1', 'f613572bd0324fc384a830f998c19ee3', '您好，我是若依', '张三', 2, '1', '2021-12-12 13:54:34', NULL);
INSERT INTO `im_add_friend_apply` VALUES ('bf8b2e864b3b49ec94823da95fa6a1bd', 'bf937cb42cf84e5295142fc571cbe564', 'f613572bd0324fc384a830f998c19ee3', '您好，我是若依', '张三', 2, '1', '2021-12-14 22:42:42', NULL);

-- ----------------------------
-- Table structure for im_chat_info
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_info`;
CREATE TABLE `im_chat_info`  (
  `chat_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `friend_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '朋友id',
  `online` tinyint(1) NULL DEFAULT NULL COMMENT '对方是否在线 1-在线 0-不在线',
  `unread` int(11) NULL DEFAULT NULL COMMENT '未读数',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除 0-未删除 1-删除',
  `hide` tinyint(1) NULL DEFAULT NULL COMMENT '是否隐藏 0-未隐藏 1-隐藏',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '1-点对点聊天 2-群聊',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`chat_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of im_chat_info
-- ----------------------------
INSERT INTO `im_chat_info` VALUES ('00a1d0f8f6484476aa91db39e394ecdd', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:21:05', NULL);
INSERT INTO `im_chat_info` VALUES ('08d74a73faa04740a0b33330696997c0', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:01:05', NULL);
INSERT INTO `im_chat_info` VALUES ('09f4de3590f94958b6a63b626c636e85', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:24:40', NULL);
INSERT INTO `im_chat_info` VALUES ('0c81c2a4903342d6a35332114e4153fc', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-14 23:25:40', NULL);
INSERT INTO `im_chat_info` VALUES ('139bb1ee7fec4e918062477fe2cdde3e', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:21:18', NULL);
INSERT INTO `im_chat_info` VALUES ('1a0d7fd4d5a840ae934f4c1b28f6141b', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 22:58:26', NULL);
INSERT INTO `im_chat_info` VALUES ('1e14949b66354a7b86fa8981d06dd07c', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:26:50', NULL);
INSERT INTO `im_chat_info` VALUES ('212b329a56de4612a0d31fdb455ea70c', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:24:24', NULL);
INSERT INTO `im_chat_info` VALUES ('2175734b258b41c1b01d60ee8f0afcb9', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-17 09:56:29', NULL);
INSERT INTO `im_chat_info` VALUES ('2237ae3cf27b4a31868fa571fe445191', 'f613572bd0324fc384a830f998c19ee3', 'bf937cb42cf84e5295142fc571cbe564', NULL, 0, 0, 0, 1, '2021-12-14 23:22:30', NULL);
INSERT INTO `im_chat_info` VALUES ('2aabd0fdfe7f450a9e333b16fde89e29', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-17 09:59:53', NULL);
INSERT INTO `im_chat_info` VALUES ('2c58a8708c5f48afbaf2f04e7945e0a0', 'bf937cb42cf84e5295142fc571cbe564', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-14 23:25:39', NULL);
INSERT INTO `im_chat_info` VALUES ('2ee4b7f4f5ec4772b97d77922040a844', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:08:26', NULL);
INSERT INTO `im_chat_info` VALUES ('36b7e807f5734fa482b38089032a616e', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-17 09:55:47', NULL);
INSERT INTO `im_chat_info` VALUES ('4019a8643213491f8160559cd2205e74', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-14 23:25:30', NULL);
INSERT INTO `im_chat_info` VALUES ('40e73281fa1348c29b901f7d8494a6ef', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:20:08', NULL);
INSERT INTO `im_chat_info` VALUES ('43dc51d811dc4f6fa02e8c9e5f653613', 'bf937cb42cf84e5295142fc571cbe564', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 22:58:38', NULL);
INSERT INTO `im_chat_info` VALUES ('4ada78b46eff4a45aae14d3baafedb3d', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 11:49:01', NULL);
INSERT INTO `im_chat_info` VALUES ('4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 11:48:47', NULL);
INSERT INTO `im_chat_info` VALUES ('519c1a2014a04deb889397091929eb0e', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:23:03', NULL);
INSERT INTO `im_chat_info` VALUES ('549a220551fe490b841786bd589e3103', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:08:31', NULL);
INSERT INTO `im_chat_info` VALUES ('55b14e0556fe40769c58e1a3d92e147d', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:23:43', NULL);
INSERT INTO `im_chat_info` VALUES ('5647aab19076428383cdb257efd9fff8', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:22:19', NULL);
INSERT INTO `im_chat_info` VALUES ('5e1e32ce0a77415499b5b6816521dab7', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:22:19', NULL);
INSERT INTO `im_chat_info` VALUES ('61bdc7b461a6483a93ae572bd2dd11fa', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:20:31', NULL);
INSERT INTO `im_chat_info` VALUES ('623226a02d7445578b02127d561a03ee', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:26:09', NULL);
INSERT INTO `im_chat_info` VALUES ('6d37191bd2da428abff7711972989eec', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:08:26', NULL);
INSERT INTO `im_chat_info` VALUES ('715ca67439054ced8dbd5760ae9bb27c', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:19:58', NULL);
INSERT INTO `im_chat_info` VALUES ('71d5b32725f1475bbd048b1e8386bf19', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:20:51', NULL);
INSERT INTO `im_chat_info` VALUES ('72d2aa5203104ce69912b8fd77639a00', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:19:52', NULL);
INSERT INTO `im_chat_info` VALUES ('7c4b148285de4178b9ec7ea1c310ce87', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:27:03', NULL);
INSERT INTO `im_chat_info` VALUES ('80b53bcb084c4be1872bec996a7cdc6c', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 11:50:11', NULL);
INSERT INTO `im_chat_info` VALUES ('848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-17 09:54:47', NULL);
INSERT INTO `im_chat_info` VALUES ('8802c8f35d864a5c8f282d9023ef6035', 'bf937cb42cf84e5295142fc571cbe564', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 22:58:13', NULL);
INSERT INTO `im_chat_info` VALUES ('8b97a722908e44619747f3c636729c03', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:09:53', NULL);
INSERT INTO `im_chat_info` VALUES ('9458d9fcb2474929bd7a7e2fa73125db', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:20:31', NULL);
INSERT INTO `im_chat_info` VALUES ('98a95ae345af455f9fa5a41e4cf62814', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:09:47', NULL);
INSERT INTO `im_chat_info` VALUES ('a06e9869624b4dbb98a6609f4df02b32', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:24:14', NULL);
INSERT INTO `im_chat_info` VALUES ('a4b36b9a6bc241768216475fe87dbc0d', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:23:03', NULL);
INSERT INTO `im_chat_info` VALUES ('a4cf578f3c2348328c9f1838a4e4d3bc', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:01:48', NULL);
INSERT INTO `im_chat_info` VALUES ('a8771ed2993d446b8d22f4a64cac17b3', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:09:24', NULL);
INSERT INTO `im_chat_info` VALUES ('ae1e294d43da4fd1bfe7e8d92f8c0c26', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:21:38', NULL);
INSERT INTO `im_chat_info` VALUES ('af794a4d6d3b4f558c85a18f5e182451', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 12:21:33', NULL);
INSERT INTO `im_chat_info` VALUES ('b1bd31b1f6e7445196eb13b83a03b552', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:26:31', NULL);
INSERT INTO `im_chat_info` VALUES ('b2b7ff085a554093b8b9bb2c81fba19b', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:08:34', NULL);
INSERT INTO `im_chat_info` VALUES ('b36da6224dbc4b9189aff99137aedcd8', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:09:58', NULL);
INSERT INTO `im_chat_info` VALUES ('b481179faa05467d974bc4c5f467d842', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 22:58:06', NULL);
INSERT INTO `im_chat_info` VALUES ('b53d88452cc74bcebe3c5b1cc4fe84f6', 'bf937cb42cf84e5295142fc571cbe564', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 22:58:13', NULL);
INSERT INTO `im_chat_info` VALUES ('b7adf70fb581485e85a5f2e07a371688', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:24:06', NULL);
INSERT INTO `im_chat_info` VALUES ('c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-14 21:47:28', NULL);
INSERT INTO `im_chat_info` VALUES ('c192306d75d04433844ffe83550784ad', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:24:55', NULL);
INSERT INTO `im_chat_info` VALUES ('c4d0bb324902420384056c10845c190c', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:25:02', NULL);
INSERT INTO `im_chat_info` VALUES ('c554906fa74641308047e35463b8690e', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:19:58', NULL);
INSERT INTO `im_chat_info` VALUES ('d3853ad57db942bb91afc8b0a5da7c1e', 'bf937cb42cf84e5295142fc571cbe564', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 22:58:37', NULL);
INSERT INTO `im_chat_info` VALUES ('e0899dcc6f0f4d82a45794d84b7ed2ba', 'bf937cb42cf84e5295142fc571cbe564', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-14 23:25:30', NULL);
INSERT INTO `im_chat_info` VALUES ('e4c131d7b6834fa5b3d52fff9aa20296', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:20:52', NULL);
INSERT INTO `im_chat_info` VALUES ('e559435f37494deeb8ffb049849fa0cd', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:19:52', NULL);
INSERT INTO `im_chat_info` VALUES ('e736590f2b0d486da72fb7575994437b', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:00:14', NULL);
INSERT INTO `im_chat_info` VALUES ('e7b557a5bf3a47959e1fe73cfe14df14', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-17 09:56:38', NULL);
INSERT INTO `im_chat_info` VALUES ('e89252dde76d44d4a5ff7d4c2a452c3d', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:10:13', NULL);
INSERT INTO `im_chat_info` VALUES ('ecfc5edd7fab4a259684ecddf06636b7', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:09:24', NULL);
INSERT INTO `im_chat_info` VALUES ('ee49f1eb8a3943358d94248fbe370359', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:21:38', NULL);
INSERT INTO `im_chat_info` VALUES ('eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:00:14', NULL);
INSERT INTO `im_chat_info` VALUES ('f286acaa0d86489bbc468b0002f40f72', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:08:30', NULL);
INSERT INTO `im_chat_info` VALUES ('f7108313a372440880e6581590781d45', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:21:18', NULL);
INSERT INTO `im_chat_info` VALUES ('f745eb19e40443ff8cd5b486f101ab24', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 23:21:05', NULL);
INSERT INTO `im_chat_info` VALUES ('f9c96327b1ca46b29e5d7424e0b03a26', 'bf937cb42cf84e5295142fc571cbe564', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-14 23:25:10', NULL);
INSERT INTO `im_chat_info` VALUES ('fda24ff056984bdc937d18a6e6316f1a', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, 0, 0, 0, 1, '2021-12-15 22:57:58', NULL);
INSERT INTO `im_chat_info` VALUES ('ff626ad4646543f69d4829142800a84d', '1', 'f613572bd0324fc384a830f998c19ee3', NULL, 0, 0, 0, 1, '2021-12-15 23:20:08', NULL);

-- ----------------------------
-- Table structure for im_chat_info_detail
-- ----------------------------
DROP TABLE IF EXISTS `im_chat_info_detail`;
CREATE TABLE `im_chat_info_detail`  (
  `chat_detail_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `chat_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '聊天id',
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '消息类型 1-普通文本信息 2-语音信息 3-链接信息 4-视频图片信息 5-表情信息',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '聊天内容',
  `send_time` datetime NULL DEFAULT NULL COMMENT '发送时间',
  `latest` tinyint(1) NULL DEFAULT NULL COMMENT '是否是最后一条信息 0-不是 1-是',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '是否删除 0-否 1-是',
  `recall` tinyint(1) NULL DEFAULT NULL COMMENT '是否撤回 0-否 1-是',
  `receive` tinyint(1) NULL DEFAULT NULL COMMENT '接收状态 1-已接受 0-未接收',
  `self` tinyint(1) NULL DEFAULT NULL COMMENT '1-自己的信息 2-对方的信息',
  PRIMARY KEY (`chat_detail_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 389 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of im_chat_info_detail
-- ----------------------------
INSERT INTO `im_chat_info_detail` VALUES (2, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '1111', '2021-12-14 21:58:05', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (3, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '222', '2021-12-14 21:58:39', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (4, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '你好有', '2021-12-14 21:58:46', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (5, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '你好有哈哈哈', '2021-12-14 21:59:29', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (6, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-14 22:27:32', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (7, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '我是汉三', '2021-12-14 22:36:51', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (8, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '真的慢呀', '2021-12-14 22:37:25', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (9, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '你好', '2021-12-14 23:24:25', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (10, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '你好', '2021-12-14 23:25:29', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (11, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '你好1', '2021-12-14 23:25:39', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (12, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, 'sss', '2021-12-14 23:36:16', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (13, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '555', '2021-12-14 23:38:33', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (14, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-14 23:41:41', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (15, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '12ff', '2021-12-14 23:43:20', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (16, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, 'eeee', '2021-12-14 23:54:24', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (17, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '332', '2021-12-14 23:57:54', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (18, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, 'sss', '2021-12-15 00:00:04', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (19, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '1122', '2021-12-15 00:02:41', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (20, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '4343', '2021-12-15 00:03:19', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (21, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '5445', '2021-12-15 00:04:06', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (22, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '333', '2021-12-15 00:04:45', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (23, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '323', '2021-12-15 00:05:40', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (24, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '323', '2021-12-15 00:06:03', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (25, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-15 00:09:53', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (26, '4019a8643213491f8160559cd2205e74', '1', 1, '1212', '2021-12-15 00:09:53', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (27, '4019a8643213491f8160559cd2205e74', '1', 1, '1212', '2021-12-15 00:09:53', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (28, '4019a8643213491f8160559cd2205e74', '1', 1, 'fgf', '2021-12-15 00:10:05', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (29, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, 'fgf', '2021-12-15 00:10:05', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (30, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, 'fgf', '2021-12-15 00:10:05', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (31, '4019a8643213491f8160559cd2205e74', '1', 1, '我是朱晓明', '2021-12-15 00:12:08', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (32, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '我是朱晓明', '2021-12-15 00:12:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (33, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '我是朱晓明', '2021-12-15 00:12:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (34, '4019a8643213491f8160559cd2205e74', '1', 1, '你好 我是猴猴', '2021-12-15 00:12:38', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (35, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '你好 我是猴猴', '2021-12-15 00:12:38', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (36, '4019a8643213491f8160559cd2205e74', '1', 1, '你好 我是猴猴', '2021-12-15 00:12:38', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (37, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '你好 我是猴猴5555555555555555555555555555555555555555555555555555555', '2021-12-15 00:14:07', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (38, '4019a8643213491f8160559cd2205e74', '1', 1, '你好 我是猴猴5555555555555555555555555555555555555555555555555555555', '2021-12-15 00:14:07', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (39, '4019a8643213491f8160559cd2205e74', '1', 1, '你好 我是猴猴5555555555555555555555555555555555555555555555555555555', '2021-12-15 00:14:07', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (40, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '好的', '2021-12-15 00:15:26', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (41, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是猴猴', '2021-12-15 11:43:17', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (42, '57758af529404b0e9cc02905432ccd90', '1', 1, '晚上一起洗个脚啊', '2021-12-15 11:44:09', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (43, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是张三', '2021-12-15 11:48:47', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (44, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '我是张三', '2021-12-15 11:48:47', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (45, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是张三', '2021-12-15 11:48:47', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (46, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是张三', '2021-12-15 11:48:47', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (47, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是张三', '2021-12-15 11:48:47', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (48, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是张三', '2021-12-15 11:48:47', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (49, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是张三', '2021-12-15 11:48:47', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (50, '4ada78b46eff4a45aae14d3baafedb3d', 'f613572bd0324fc384a830f998c19ee3', 1, '我是徐小玲', '2021-12-15 11:49:01', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (51, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是徐小玲', '2021-12-15 11:49:01', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (52, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是徐小玲', '2021-12-15 11:49:01', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (53, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是徐小玲', '2021-12-15 11:49:01', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (54, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是徐小玲', '2021-12-15 11:49:01', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (55, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是徐小玲', '2021-12-15 11:49:01', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (56, '57758af529404b0e9cc02905432ccd90', '1', 1, '我是徐小玲', '2021-12-15 11:49:01', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (57, '57758af529404b0e9cc02905432ccd90', '1', 1, '你好', '2021-12-15 11:49:15', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (58, '57758af529404b0e9cc02905432ccd90', '1', 1, '风雨无阻', '2021-12-15 11:50:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (59, '80b53bcb084c4be1872bec996a7cdc6c', 'f613572bd0324fc384a830f998c19ee3', 1, '风雨无阻', '2021-12-15 11:50:11', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (60, '57758af529404b0e9cc02905432ccd90', '1', 1, '风雨无阻', '2021-12-15 11:50:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (61, '57758af529404b0e9cc02905432ccd90', '1', 1, '风雨无阻', '2021-12-15 11:50:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (62, '57758af529404b0e9cc02905432ccd90', '1', 1, '风雨无阻', '2021-12-15 11:50:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (63, '57758af529404b0e9cc02905432ccd90', '1', 1, '风雨无阻', '2021-12-15 11:50:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (64, '57758af529404b0e9cc02905432ccd90', '1', 1, '风雨无阻', '2021-12-15 11:50:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (65, '57758af529404b0e9cc02905432ccd90', '1', 1, '好的', '2021-12-15 11:50:25', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (66, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '你哈', '2021-12-15 11:51:20', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (67, '57758af529404b0e9cc02905432ccd90', '1', 1, '你哈', '2021-12-15 11:51:20', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (68, '57758af529404b0e9cc02905432ccd90', '1', 1, '你哈', '2021-12-15 11:51:20', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (69, '57758af529404b0e9cc02905432ccd90', '1', 1, '你哈', '2021-12-15 11:51:20', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (70, '57758af529404b0e9cc02905432ccd90', '1', 1, '你哈', '2021-12-15 11:51:20', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (71, '57758af529404b0e9cc02905432ccd90', '1', 1, '你哈', '2021-12-15 11:51:20', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (72, '57758af529404b0e9cc02905432ccd90', '1', 1, '你哈', '2021-12-15 11:51:20', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (73, '57758af529404b0e9cc02905432ccd90', '1', 1, '不哈', '2021-12-15 11:51:41', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (74, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '中午洗脚 一起', '2021-12-15 11:52:32', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (75, '57758af529404b0e9cc02905432ccd90', '1', 1, '中午洗脚 一起', '2021-12-15 11:52:32', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (76, '57758af529404b0e9cc02905432ccd90', '1', 1, '中午洗脚 一起', '2021-12-15 11:52:32', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (77, '57758af529404b0e9cc02905432ccd90', '1', 1, '中午洗脚 一起', '2021-12-15 11:52:32', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (78, '57758af529404b0e9cc02905432ccd90', '1', 1, '中午洗脚 一起', '2021-12-15 11:52:32', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (79, '57758af529404b0e9cc02905432ccd90', '1', 1, '中午洗脚 一起', '2021-12-15 11:52:32', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (80, '57758af529404b0e9cc02905432ccd90', '1', 1, '中午洗脚 一起', '2021-12-15 11:52:32', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (81, '57758af529404b0e9cc02905432ccd90', '1', 1, '为什么你收不到信息', '2021-12-15 11:53:20', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (82, 'af794a4d6d3b4f558c85a18f5e182451', 'f613572bd0324fc384a830f998c19ee3', 1, 'Hello', '2021-12-15 12:21:32', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (83, '57758af529404b0e9cc02905432ccd90', '1', 1, 'Hello', '2021-12-15 12:21:32', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (84, '57758af529404b0e9cc02905432ccd90', '1', 1, 'sss', '2021-12-15 12:22:45', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (85, '57758af529404b0e9cc02905432ccd90', '1', 1, '终于上线了吧', '2021-12-15 12:25:59', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (86, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '终于上线了吧', '2021-12-15 12:25:59', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (87, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '是的 刚刚解决了这个bug', '2021-12-15 12:26:13', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (88, '57758af529404b0e9cc02905432ccd90', '1', 1, '是的 刚刚解决了这个bug', '2021-12-15 12:26:13', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (89, '57758af529404b0e9cc02905432ccd90', '1', 1, '是的 刚刚解决了这个bug', '2021-12-15 12:26:13', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (90, '57758af529404b0e9cc02905432ccd90', '1', 1, '是的 刚刚解决了这个bug', '2021-12-15 12:26:13', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (91, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '不容易呀', '2021-12-15 12:26:30', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (92, '57758af529404b0e9cc02905432ccd90', '1', 1, '不容易呀', '2021-12-15 12:26:30', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (93, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '老铁 666', '2021-12-15 12:27:28', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (94, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '老铁 666', '2021-12-15 12:27:28', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (95, '57758af529404b0e9cc02905432ccd90', '1', 1, '老铁 666', '2021-12-15 12:27:28', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (96, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, 'A piece ofcake', '2021-12-15 12:27:55', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (97, '57758af529404b0e9cc02905432ccd90', '1', 1, 'A piece ofcake', '2021-12-15 12:27:55', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (98, '57758af529404b0e9cc02905432ccd90', '1', 1, 'A piece ofcake', '2021-12-15 12:27:55', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (99, '57758af529404b0e9cc02905432ccd90', '1', 1, 'A piece ofcake', '2021-12-15 12:27:55', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (100, '57758af529404b0e9cc02905432ccd90', '1', 1, 'A piece ofcake', '2021-12-15 12:27:55', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (101, '57758af529404b0e9cc02905432ccd90', '1', 1, '又出问题了', '2021-12-15 12:29:10', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (102, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '又出问题了', '2021-12-15 12:29:10', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (103, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '又出问题了', '2021-12-15 12:29:10', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (104, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '出啥问题了', '2021-12-15 12:29:56', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (105, '57758af529404b0e9cc02905432ccd90', '1', 1, '出啥问题了', '2021-12-15 12:29:56', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (106, '57758af529404b0e9cc02905432ccd90', '1', 1, '出啥问题了', '2021-12-15 12:29:56', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (107, '57758af529404b0e9cc02905432ccd90', '1', 1, '出啥问题了', '2021-12-15 12:29:56', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (108, '57758af529404b0e9cc02905432ccd90', '1', 1, '出啥问题了', '2021-12-15 12:29:56', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (109, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '聊天记录列表有问题', '2021-12-15 12:30:37', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (110, '57758af529404b0e9cc02905432ccd90', '1', 1, '聊天记录列表有问题', '2021-12-15 12:30:37', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (111, '57758af529404b0e9cc02905432ccd90', '1', 1, '聊天记录列表有问题', '2021-12-15 12:30:37', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (112, '57758af529404b0e9cc02905432ccd90', '1', 1, '聊天记录列表有问题', '2021-12-15 12:30:37', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (113, '57758af529404b0e9cc02905432ccd90', '1', 1, '聊天记录列表有问题', '2021-12-15 12:30:37', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (114, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '这个问题我需要解决一下', '2021-12-15 12:30:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (115, '57758af529404b0e9cc02905432ccd90', '1', 1, '这个问题我需要解决一下', '2021-12-15 12:30:58', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (116, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '好的好的', '2021-12-15 12:31:41', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (117, '57758af529404b0e9cc02905432ccd90', '1', 1, '好的好的', '2021-12-15 12:31:41', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (118, '57758af529404b0e9cc02905432ccd90', '1', 1, '好的好的', '2021-12-15 12:31:41', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (119, '57758af529404b0e9cc02905432ccd90', '1', 1, '好的好的', '2021-12-15 12:31:41', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (120, '57758af529404b0e9cc02905432ccd90', '1', 1, '好的好的', '2021-12-15 12:31:41', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (121, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '睡觉吧', '2021-12-15 12:32:29', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (122, '57758af529404b0e9cc02905432ccd90', '1', 1, '睡觉吧', '2021-12-15 12:32:29', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (123, '57758af529404b0e9cc02905432ccd90', '1', 1, '睡觉吧', '2021-12-15 12:32:29', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (124, '57758af529404b0e9cc02905432ccd90', '1', 1, '睡觉吧', '2021-12-15 12:32:29', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (125, '57758af529404b0e9cc02905432ccd90', '1', 1, '睡觉吧', '2021-12-15 12:32:29', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (126, '57758af529404b0e9cc02905432ccd90', '1', 1, '连不上了', '2021-12-15 12:33:41', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (127, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '连不上了', '2021-12-15 12:33:41', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (128, '57758af529404b0e9cc02905432ccd90', '1', 1, '连不上了', '2021-12-15 12:33:41', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (129, '57758af529404b0e9cc02905432ccd90', '1', 1, '连不上了', '2021-12-15 12:33:41', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (130, '57758af529404b0e9cc02905432ccd90', '1', 1, '连不上了', '2021-12-15 12:33:41', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (131, '57758af529404b0e9cc02905432ccd90', '1', 1, '连不上了', '2021-12-15 12:33:41', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (132, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '可以的', '2021-12-15 12:33:51', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (133, '57758af529404b0e9cc02905432ccd90', '1', 1, '可以的', '2021-12-15 12:33:51', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (134, '57758af529404b0e9cc02905432ccd90', '1', 1, '可以的', '2021-12-15 12:33:51', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (135, '57758af529404b0e9cc02905432ccd90', '1', 1, '可以的', '2021-12-15 12:33:51', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (136, '57758af529404b0e9cc02905432ccd90', '1', 1, '可以的', '2021-12-15 12:33:51', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (137, '57758af529404b0e9cc02905432ccd90', '1', 1, '可以的', '2021-12-15 12:33:51', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (138, '4f31acaa566744549c87f85d723d5c58', 'f613572bd0324fc384a830f998c19ee3', 1, '你是谁', '2021-12-15 16:37:11', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (139, '57758af529404b0e9cc02905432ccd90', '1', 1, '你是谁', '2021-12-15 16:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (140, '57758af529404b0e9cc02905432ccd90', '1', 1, '你是谁', '2021-12-15 16:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (141, '57758af529404b0e9cc02905432ccd90', '1', 1, '你是谁', '2021-12-15 16:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (142, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '111', '2021-12-15 20:38:45', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (143, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '我去', '2021-12-15 20:38:59', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (144, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '我去？、', '2021-12-15 20:39:10', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (145, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '121', '2021-12-15 22:30:27', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (146, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '12323', '2021-12-15 22:30:40', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (147, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '23213', '2021-12-15 22:31:12', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (148, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '6666', '2021-12-15 22:31:20', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (149, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '121', '2021-12-15 22:34:03', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (150, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, 'wwww', '2021-12-15 22:34:46', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (151, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '255222', '2021-12-15 22:38:17', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (152, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '969666', '2021-12-15 22:38:31', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (153, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '1111', '2021-12-15 22:45:21', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (154, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '121', '2021-12-15 22:52:05', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (155, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '333', '2021-12-15 22:55:50', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (156, 'fda24ff056984bdc937d18a6e6316f1a', 'f613572bd0324fc384a830f998c19ee3', 1, '', '2021-12-15 22:58:04', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (157, 'b481179faa05467d974bc4c5f467d842', 'f613572bd0324fc384a830f998c19ee3', 1, '', '2021-12-15 22:58:12', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (158, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-15 22:58:12', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (159, 'b53d88452cc74bcebe3c5b1cc4fe84f6', 'bf937cb42cf84e5295142fc571cbe564', 1, '', '2021-12-15 22:58:12', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (160, '8802c8f35d864a5c8f282d9023ef6035', 'bf937cb42cf84e5295142fc571cbe564', 1, '1212', '2021-12-15 22:58:12', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (161, '1a0d7fd4d5a840ae934f4c1b28f6141b', 'f613572bd0324fc384a830f998c19ee3', 1, '', '2021-12-15 22:58:32', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (162, 'c08db8f081f64135a1916c70f31ee9cb', 'f613572bd0324fc384a830f998c19ee3', 1, '45454', '2021-12-15 22:58:36', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (163, 'd3853ad57db942bb91afc8b0a5da7c1e', 'bf937cb42cf84e5295142fc571cbe564', 1, '', '2021-12-15 22:58:36', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (164, '43dc51d811dc4f6fa02e8c9e5f653613', 'bf937cb42cf84e5295142fc571cbe564', 1, '45454', '2021-12-15 22:58:36', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (165, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '12212', '2021-12-15 23:00:13', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (166, 'e736590f2b0d486da72fb7575994437b', '1', 1, '', '2021-12-15 23:00:13', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (167, 'e736590f2b0d486da72fb7575994437b', '1', 1, '傻逼', '2021-12-15 23:01:04', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (168, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '傻逼', '2021-12-15 23:01:04', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (169, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '傻逼', '2021-12-15 23:01:04', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (170, '08d74a73faa04740a0b33330696997c0', 'f613572bd0324fc384a830f998c19ee3', 1, '傻逼', '2021-12-15 23:01:04', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (171, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '干嘛', '2021-12-15 23:01:12', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (172, 'e736590f2b0d486da72fb7575994437b', '1', 1, '2333', '2021-12-15 23:01:47', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (173, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '2333', '2021-12-15 23:01:47', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (174, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '2333', '2021-12-15 23:01:47', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (175, 'a4cf578f3c2348328c9f1838a4e4d3bc', 'f613572bd0324fc384a830f998c19ee3', 1, '2333', '2021-12-15 23:01:47', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (176, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '45454', '2021-12-15 23:01:50', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (177, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '3333', '2021-12-15 23:02:04', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (178, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '5555', '2021-12-15 23:04:09', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (179, 'e736590f2b0d486da72fb7575994437b', '1', 1, '5555', '2021-12-15 23:04:09', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (180, 'e736590f2b0d486da72fb7575994437b', '1', 1, '呼呼', '2021-12-15 23:04:14', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (181, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '呼呼', '2021-12-15 23:04:14', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (182, 'e736590f2b0d486da72fb7575994437b', '1', 1, '呼呼呼呼', '2021-12-15 23:04:21', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (183, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '呼呼呼呼', '2021-12-15 23:04:21', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (184, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '888888', '2021-12-15 23:04:47', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (185, 'e736590f2b0d486da72fb7575994437b', '1', 1, '888888', '2021-12-15 23:04:47', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (186, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '睡觉', '2021-12-15 23:04:59', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (187, 'e736590f2b0d486da72fb7575994437b', '1', 1, '睡觉', '2021-12-15 23:04:59', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (188, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '99999', '2021-12-15 23:05:05', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (189, 'e736590f2b0d486da72fb7575994437b', '1', 1, '99999', '2021-12-15 23:05:05', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (190, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '33212222', '2021-12-15 23:05:10', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (191, 'e736590f2b0d486da72fb7575994437b', '1', 1, '33212222', '2021-12-15 23:05:10', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (192, 'eef89353dd734fac9e90609a049fc9da', 'f613572bd0324fc384a830f998c19ee3', 1, '996666', '2021-12-15 23:05:22', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (193, 'e736590f2b0d486da72fb7575994437b', '1', 1, '996666', '2021-12-15 23:05:22', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (194, '2ee4b7f4f5ec4772b97d77922040a844', '1', 1, '你好', '2021-12-15 23:08:32', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (195, 'f286acaa0d86489bbc468b0002f40f72', '1', 1, '我发了', '2021-12-15 23:08:37', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (196, 'b2b7ff085a554093b8b9bb2c81fba19b', '1', 1, 'Ghvg', '2021-12-15 23:08:40', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (197, 'fda24ff056984bdc937d18a6e6316f1a', 'f613572bd0324fc384a830f998c19ee3', 1, 'Ghvg', '2021-12-15 23:08:40', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (198, 'ecfc5edd7fab4a259684ecddf06636b7', '1', 1, '卧槽', '2021-12-15 23:09:30', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (199, 'fda24ff056984bdc937d18a6e6316f1a', 'f613572bd0324fc384a830f998c19ee3', 1, 'Rfcg', '2021-12-15 23:09:53', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (200, '98a95ae345af455f9fa5a41e4cf62814', '1', 1, 'Rfcg', '2021-12-15 23:09:53', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (201, 'fda24ff056984bdc937d18a6e6316f1a', 'f613572bd0324fc384a830f998c19ee3', 1, '格格', '2021-12-15 23:09:59', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (202, '8b97a722908e44619747f3c636729c03', '1', 1, '格格', '2021-12-15 23:09:59', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (203, 'b36da6224dbc4b9189aff99137aedcd8', '1', 1, '写', '2021-12-15 23:10:04', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (204, 'fda24ff056984bdc937d18a6e6316f1a', 'f613572bd0324fc384a830f998c19ee3', 1, '写', '2021-12-15 23:10:04', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (205, 'fda24ff056984bdc937d18a6e6316f1a', 'f613572bd0324fc384a830f998c19ee3', 1, 'Hbjhhb', '2021-12-15 23:10:19', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (206, 'e89252dde76d44d4a5ff7d4c2a452c3d', '1', 1, 'Hbjhhb', '2021-12-15 23:10:19', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (207, 'e559435f37494deeb8ffb049849fa0cd', 'f613572bd0324fc384a830f998c19ee3', 1, '你好', '2021-12-15 23:19:58', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (208, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '你好', '2021-12-15 23:19:58', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (209, '715ca67439054ced8dbd5760ae9bb27c', '1', 1, '在干嘛', '2021-12-15 23:20:08', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (210, 'c554906fa74641308047e35463b8690e', 'f613572bd0324fc384a830f998c19ee3', 1, '在干嘛', '2021-12-15 23:20:08', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (211, '40e73281fa1348c29b901f7d8494a6ef', 'f613572bd0324fc384a830f998c19ee3', 1, '我在洗脚', '2021-12-15 23:20:14', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (212, 'ff626ad4646543f69d4829142800a84d', '1', 1, '我在洗脚', '2021-12-15 23:20:14', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (213, '9458d9fcb2474929bd7a7e2fa73125db', '1', 1, '洗个屁呀', '2021-12-15 23:20:41', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (214, '61bdc7b461a6483a93ae572bd2dd11fa', 'f613572bd0324fc384a830f998c19ee3', 1, '洗个屁呀', '2021-12-15 23:20:41', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (215, '71d5b32725f1475bbd048b1e8386bf19', 'f613572bd0324fc384a830f998c19ee3', 1, '一起大保健呀', '2021-12-15 23:20:57', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (216, 'e4c131d7b6834fa5b3d52fff9aa20296', '1', 1, '一起大保健呀', '2021-12-15 23:20:57', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (217, '00a1d0f8f6484476aa91db39e394ecdd', '1', 1, 'realy', '2021-12-15 23:21:15', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (218, 'f745eb19e40443ff8cd5b486f101ab24', 'f613572bd0324fc384a830f998c19ee3', 1, 'realy', '2021-12-15 23:21:15', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (219, 'f7108313a372440880e6581590781d45', 'f613572bd0324fc384a830f998c19ee3', 1, 'Of course', '2021-12-15 23:21:24', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (220, '139bb1ee7fec4e918062477fe2cdde3e', '1', 1, 'Of course', '2021-12-15 23:21:24', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (221, 'ae1e294d43da4fd1bfe7e8d92f8c0c26', '1', 1, '那走呀', '2021-12-15 23:21:48', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (222, 'ee49f1eb8a3943358d94248fbe370359', 'f613572bd0324fc384a830f998c19ee3', 1, '那走呀', '2021-12-15 23:21:48', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (223, '5647aab19076428383cdb257efd9fff8', 'f613572bd0324fc384a830f998c19ee3', 1, '走走走', '2021-12-15 23:22:25', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (224, '5e1e32ce0a77415499b5b6816521dab7', '1', 1, '走走走', '2021-12-15 23:22:25', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (225, '519c1a2014a04deb889397091929eb0e', 'f613572bd0324fc384a830f998c19ee3', 1, '明天湖人能赢吗', '2021-12-15 23:23:09', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (226, 'a4b36b9a6bc241768216475fe87dbc0d', '1', 1, '明天湖人能赢吗', '2021-12-15 23:23:09', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (227, '55b14e0556fe40769c58e1a3d92e147d', 'f613572bd0324fc384a830f998c19ee3', 1, '人呢', '2021-12-15 23:23:49', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (228, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '卧槽 他妈的聊天记录呢', '2021-12-15 23:24:17', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (229, 'b7adf70fb581485e85a5f2e07a371688', 'f613572bd0324fc384a830f998c19ee3', 1, '卧槽 他妈的聊天记录呢', '2021-12-15 23:24:17', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (230, 'a06e9869624b4dbb98a6609f4df02b32', 'f613572bd0324fc384a830f998c19ee3', 1, '你问谁的呀', '2021-12-15 23:24:20', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (231, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '你问谁的呀', '2021-12-15 23:24:20', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (232, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '全套啊没了', '2021-12-15 23:24:34', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (233, '212b329a56de4612a0d31fdb455ea70c', 'f613572bd0324fc384a830f998c19ee3', 1, '全套啊没了', '2021-12-15 23:24:34', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (234, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '草他奶奶的', '2021-12-15 23:24:46', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (235, '09f4de3590f94958b6a63b626c636e85', 'f613572bd0324fc384a830f998c19ee3', 1, '草他奶奶的', '2021-12-15 23:24:46', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (236, 'c192306d75d04433844ffe83550784ad', 'f613572bd0324fc384a830f998c19ee3', 1, '你说啥的', '2021-12-15 23:25:01', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (237, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '你说啥的', '2021-12-15 23:25:01', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (238, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '你说啥的', '2021-12-15 23:25:01', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (239, 'c4d0bb324902420384056c10845c190c', 'f613572bd0324fc384a830f998c19ee3', 1, '来点实际行动', '2021-12-15 23:25:08', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (240, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '来点实际行动', '2021-12-15 23:25:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (241, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '来点实际行动', '2021-12-15 23:25:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (242, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '这是什么情况', '2021-12-15 23:26:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (243, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '这是什么情况', '2021-12-15 23:26:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (244, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '这是什么情况', '2021-12-15 23:26:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (245, '623226a02d7445578b02127d561a03ee', 'f613572bd0324fc384a830f998c19ee3', 1, '这是什么情况', '2021-12-15 23:26:15', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (246, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '掉线了应该', '2021-12-15 23:26:41', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (247, 'b1bd31b1f6e7445196eb13b83a03b552', 'f613572bd0324fc384a830f998c19ee3', 1, '掉线了应该', '2021-12-15 23:26:41', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (248, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '有bug', '2021-12-15 23:27:00', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (249, '1e14949b66354a7b86fa8981d06dd07c', 'f613572bd0324fc384a830f998c19ee3', 1, '有bug', '2021-12-15 23:27:00', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (250, '72d2aa5203104ce69912b8fd77639a00', '1', 1, '8886', '2021-12-15 23:27:13', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (251, '7c4b148285de4178b9ec7ea1c310ce87', 'f613572bd0324fc384a830f998c19ee3', 1, '8886', '2021-12-15 23:27:13', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (252, '57758af529404b0e9cc02905432ccd90', '1', 1, '1212', '2021-12-16 17:24:39', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (253, '57758af529404b0e9cc02905432ccd90', '1', 1, '3424234', '2021-12-16 17:24:45', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (254, '57758af529404b0e9cc02905432ccd90', '1', 1, '333', '2021-12-16 17:25:03', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (255, '57758af529404b0e9cc02905432ccd90', '1', 1, '2324', '2021-12-16 17:25:06', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (256, '57758af529404b0e9cc02905432ccd90', '1', 1, '324324', '2021-12-16 17:25:08', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (257, '57758af529404b0e9cc02905432ccd90', '1', 1, '343', '2021-12-16 17:25:11', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (258, '57758af529404b0e9cc02905432ccd90', '1', 1, '实打实打算', '2021-12-16 17:25:22', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (259, '57758af529404b0e9cc02905432ccd90', '1', 1, '是的是的', '2021-12-16 17:25:26', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (260, '57758af529404b0e9cc02905432ccd90', '1', 1, '大大大大大', '2021-12-16 17:25:35', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (261, '57758af529404b0e9cc02905432ccd90', '1', 1, '的地方大师傅', '2021-12-16 17:25:39', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (262, '57758af529404b0e9cc02905432ccd90', '1', 1, '大大撒旦飒飒', '2021-12-16 17:25:42', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (263, '57758af529404b0e9cc02905432ccd90', '1', 1, '今天有问题吗', '2021-12-17 09:51:26', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (264, '57758af529404b0e9cc02905432ccd90', '1', 1, '人呢', '2021-12-17 09:54:45', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (265, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '人呢', '2021-12-17 09:54:45', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (266, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '12', '2021-12-17 09:55:47', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (267, '57758af529404b0e9cc02905432ccd90', '1', 1, '12', '2021-12-17 09:55:47', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (268, '36b7e807f5734fa482b38089032a616e', 'f613572bd0324fc384a830f998c19ee3', 1, '12', '2021-12-17 09:55:47', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (269, '57758af529404b0e9cc02905432ccd90', '1', 1, '78787', '2021-12-17 09:56:28', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (270, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '78787', '2021-12-17 09:56:28', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (271, '2175734b258b41c1b01d60ee8f0afcb9', 'f613572bd0324fc384a830f998c19ee3', 1, '78787', '2021-12-17 09:56:28', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (272, '57758af529404b0e9cc02905432ccd90', '1', 1, '干嘛呢', '2021-12-17 09:56:37', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (273, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '干嘛呢', '2021-12-17 09:56:37', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (274, 'e7b557a5bf3a47959e1fe73cfe14df14', 'f613572bd0324fc384a830f998c19ee3', 1, '干嘛呢', '2021-12-17 09:56:37', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (275, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '7878', '2021-12-17 09:59:37', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (276, '57758af529404b0e9cc02905432ccd90', '1', 1, '7878', '2021-12-17 09:59:37', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (277, '57758af529404b0e9cc02905432ccd90', '1', 1, '7878', '2021-12-17 09:59:37', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (278, '57758af529404b0e9cc02905432ccd90', '1', 1, '好的', '2021-12-17 09:59:52', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (279, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '好的', '2021-12-17 09:59:52', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (280, '2aabd0fdfe7f450a9e333b16fde89e29', 'f613572bd0324fc384a830f998c19ee3', 1, '好的', '2021-12-17 09:59:52', NULL, 0, 1, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (281, '57758af529404b0e9cc02905432ccd90', '1', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (282, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (283, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (284, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (285, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (286, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (287, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (288, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (289, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (290, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (291, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (292, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (293, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (294, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '1212', '2021-12-17 10:27:58', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (295, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (296, '57758af529404b0e9cc02905432ccd90', '1', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (297, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (298, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (299, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (300, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (301, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (302, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (303, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (304, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (305, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (306, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (307, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (308, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '122122', '2021-12-17 10:28:24', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (309, '57758af529404b0e9cc02905432ccd90', '1', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (310, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (311, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (312, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (313, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (314, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (315, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (316, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (317, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (318, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (319, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (320, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (321, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (322, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (323, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (324, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (325, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (326, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '14545', '2021-12-17 10:37:11', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (327, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (328, '57758af529404b0e9cc02905432ccd90', '1', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (329, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (330, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (331, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (332, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (333, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (334, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (335, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (336, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (337, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (338, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (339, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (340, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (341, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (342, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (343, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (344, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (345, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '454', '2021-12-17 10:37:31', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (346, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '45455', '2021-12-17 10:39:08', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (347, '57758af529404b0e9cc02905432ccd90', '1', 1, '45455', '2021-12-17 10:39:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (348, '57758af529404b0e9cc02905432ccd90', '1', 1, '45455', '2021-12-17 10:39:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (349, '57758af529404b0e9cc02905432ccd90', '1', 1, '45455', '2021-12-17 10:39:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (350, '57758af529404b0e9cc02905432ccd90', '1', 1, '45455', '2021-12-17 10:39:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (351, '57758af529404b0e9cc02905432ccd90', '1', 1, '45455', '2021-12-17 10:39:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (352, '57758af529404b0e9cc02905432ccd90', '1', 1, '45455', '2021-12-17 10:39:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (353, '57758af529404b0e9cc02905432ccd90', '1', 1, '45455', '2021-12-17 10:39:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (354, '57758af529404b0e9cc02905432ccd90', '1', 1, '45455', '2021-12-17 10:39:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (355, '57758af529404b0e9cc02905432ccd90', '1', 1, '45455', '2021-12-17 10:39:08', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (356, '57758af529404b0e9cc02905432ccd90', '1', 1, '666', '2021-12-17 10:40:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (357, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '666', '2021-12-17 10:40:15', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (358, '57758af529404b0e9cc02905432ccd90', '1', 1, '666', '2021-12-17 10:40:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (359, '57758af529404b0e9cc02905432ccd90', '1', 1, '666', '2021-12-17 10:40:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (360, '57758af529404b0e9cc02905432ccd90', '1', 1, '666', '2021-12-17 10:40:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (361, '57758af529404b0e9cc02905432ccd90', '1', 1, '666', '2021-12-17 10:40:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (362, '57758af529404b0e9cc02905432ccd90', '1', 1, '666', '2021-12-17 10:40:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (363, '57758af529404b0e9cc02905432ccd90', '1', 1, '666', '2021-12-17 10:40:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (364, '57758af529404b0e9cc02905432ccd90', '1', 1, '666', '2021-12-17 10:40:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (365, '57758af529404b0e9cc02905432ccd90', '1', 1, '666', '2021-12-17 10:40:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (366, '57758af529404b0e9cc02905432ccd90', '1', 1, '666', '2021-12-17 10:40:15', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (367, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '9999999', '2021-12-17 10:40:23', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (368, '57758af529404b0e9cc02905432ccd90', '1', 1, '9999999', '2021-12-17 10:40:23', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (369, '57758af529404b0e9cc02905432ccd90', '1', 1, '9999999', '2021-12-17 10:40:23', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (370, '57758af529404b0e9cc02905432ccd90', '1', 1, '9999999', '2021-12-17 10:40:23', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (371, '57758af529404b0e9cc02905432ccd90', '1', 1, '9999999', '2021-12-17 10:40:23', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (372, '57758af529404b0e9cc02905432ccd90', '1', 1, '9999999', '2021-12-17 10:40:23', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (373, '57758af529404b0e9cc02905432ccd90', '1', 1, '9999999', '2021-12-17 10:40:23', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (374, '57758af529404b0e9cc02905432ccd90', '1', 1, '9999999', '2021-12-17 10:40:23', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (375, '57758af529404b0e9cc02905432ccd90', '1', 1, '9999999', '2021-12-17 10:40:23', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (376, '57758af529404b0e9cc02905432ccd90', '1', 1, '9999999', '2021-12-17 10:40:23', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (377, '57758af529404b0e9cc02905432ccd90', '1', 1, '9999999', '2021-12-17 10:40:23', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (378, '57758af529404b0e9cc02905432ccd90', '1', 1, '**-****', '2021-12-17 10:40:38', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (379, '848f5b4aa04c43ff967ef827530970ea', 'f613572bd0324fc384a830f998c19ee3', 1, '**-****', '2021-12-17 10:40:38', NULL, 0, 0, NULL, 1);
INSERT INTO `im_chat_info_detail` VALUES (380, '57758af529404b0e9cc02905432ccd90', '1', 1, '**-****', '2021-12-17 10:40:38', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (381, '57758af529404b0e9cc02905432ccd90', '1', 1, '**-****', '2021-12-17 10:40:38', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (382, '57758af529404b0e9cc02905432ccd90', '1', 1, '**-****', '2021-12-17 10:40:38', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (383, '57758af529404b0e9cc02905432ccd90', '1', 1, '**-****', '2021-12-17 10:40:38', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (384, '57758af529404b0e9cc02905432ccd90', '1', 1, '**-****', '2021-12-17 10:40:38', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (385, '57758af529404b0e9cc02905432ccd90', '1', 1, '**-****', '2021-12-17 10:40:38', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (386, '57758af529404b0e9cc02905432ccd90', '1', 1, '**-****', '2021-12-17 10:40:38', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (387, '57758af529404b0e9cc02905432ccd90', '1', 1, '**-****', '2021-12-17 10:40:38', NULL, 0, 0, NULL, 2);
INSERT INTO `im_chat_info_detail` VALUES (388, '57758af529404b0e9cc02905432ccd90', '1', 1, '**-****', '2021-12-17 10:40:38', NULL, 0, 0, NULL, 2);

-- ----------------------------
-- Table structure for im_user_friend
-- ----------------------------
DROP TABLE IF EXISTS `im_user_friend`;
CREATE TABLE `im_user_friend`  (
  `relation_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `friend_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '朋友id',
  `remark_content` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `label` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签',
  `authority` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '朋友权限 1-朋友圈，聊天 2-仅聊天',
  `share_state` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '1-不让他看 2-不看他',
  `origin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '通过什么添加好友 0-手机号 1-账号 2-群',
  PRIMARY KEY (`relation_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of im_user_friend
-- ----------------------------
INSERT INTO `im_user_friend` VALUES ('164121ce7350467a9c43a21d35e7dcd9', 'f613572bd0324fc384a830f998c19ee3', '1', NULL, NULL, NULL, NULL, '1');
INSERT INTO `im_user_friend` VALUES ('458b3d113223470ebd913be8371f08e7', 'bf937cb42cf84e5295142fc571cbe564', 'f613572bd0324fc384a830f998c19ee3', '张三', NULL, NULL, NULL, '1');
INSERT INTO `im_user_friend` VALUES ('8d69a8e0e27e47c99c741df9b7734d14', 'f613572bd0324fc384a830f998c19ee3', 'bf937cb42cf84e5295142fc571cbe564', NULL, NULL, NULL, NULL, '1');
INSERT INTO `im_user_friend` VALUES ('d9880d93b562444aaccc6eaf50deccbc', '1', 'f613572bd0324fc384a830f998c19ee3', '张三', NULL, NULL, NULL, '1');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = DYNAMIC;

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
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001B636F6D2E72756F79692E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002B636F6D2E72756F79692E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017CC06837E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001B636F6D2E72756F79692E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002B636F6D2E72756F79692E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017CC06837E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.job.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001B636F6D2E72756F79692E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E00097872002B636F6D2E72756F79692E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B597419030000787077080000017CC06837E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'ST1641291791427', 1641291868228, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

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
  `next_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1641291800000, -1, 5, 'PAUSED', 'CRON', 1641291794000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1641291810000, -1, 5, 'PAUSED', 'CRON', 1641291797000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1641291800000, -1, 5, 'PAUSED', 'CRON', 1641291799000, 0, NULL, 2, '');

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_app
-- ----------------------------
INSERT INTO `sys_app` VALUES ('27ecdacdfa3f44799c0f4eab5de44f42', '超管系统', '#', 3);
INSERT INTO `sys_app` VALUES ('6d6acd5751364f3ab75dfae8a0636dc3', '大屏', '#', 1);
INSERT INTO `sys_app` VALUES ('79785c7c016443a8a53af382a1d68d5d', '测试应用001', '#', 1);
INSERT INTO `sys_app` VALUES ('8bd87d43a752404191bdba4067e120be', 'im通信', '#', 2);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2021-10-27 14:20:28', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2021-10-27 14:20:28', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2021-10-27 14:20:28', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2021-10-27 14:20:28', '', NULL, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-27 14:20:28', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-27 14:20:28', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-27 14:20:28', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-27 14:20:28', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-27 14:20:28', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-27 14:20:28', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-27 14:20:28', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-27 14:20:28', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-27 14:20:28', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2021-10-27 14:20:28', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 1, 'web端', '1', 'sys_app_type', NULL, 'default', 'N', '0', 'admin', '2021-10-28 16:04:55', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (30, 2, 'H5', '2', 'sys_app_type', NULL, 'default', 'N', '0', 'admin', '2021-10-28 16:05:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 3, '小程序', '3', 'sys_app_type', NULL, 'default', 'N', '0', 'admin', '2021-10-28 16:05:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 4, '浙政钉', '4', 'sys_app_type', NULL, 'default', 'N', '0', 'admin', '2021-10-28 16:05:47', '', NULL, NULL);

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
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '应用分类', 'sys_app_type', '0', 'admin', '2021-10-28 16:04:15', '', NULL, NULL);

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
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2021-10-27 14:20:28', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2021-10-27 14:20:28', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2021-10-27 14:20:28', '', NULL, '');

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
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 603 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '0', '登录成功', '2021-10-27 17:03:39');
INSERT INTO `sys_logininfor` VALUES (101, '', '127.0.0.1', '0', '退出成功', '2021-10-27 17:05:19');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '0', '登录成功', '2021-10-27 17:05:49');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '0', '登录成功', '2021-10-27 17:40:38');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '0', '登录成功', '2021-10-28 15:22:26');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '0', '登录成功', '2021-10-28 15:38:40');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '0', '登录成功', '2021-10-28 16:11:49');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '0', '退出成功', '2021-10-28 16:55:39');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '0', '登录成功', '2021-10-28 16:55:50');
INSERT INTO `sys_logininfor` VALUES (109, '', '127.0.0.1', '0', '退出成功', '2021-10-28 17:29:36');
INSERT INTO `sys_logininfor` VALUES (110, 'user001', '127.0.0.1', '0', '登录成功', '2021-10-28 17:29:43');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '0', '登录成功', '2021-10-28 17:47:01');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '0', '登录成功', '2021-10-28 18:20:15');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 21:23:44');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 21:25:03');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 21:25:34');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-09 21:26:53');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 22:04:59');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 22:19:10');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 22:21:13');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 22:21:15');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 22:21:19');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 22:21:22');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 22:21:24');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 22:40:15');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-09 22:40:22');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 23:31:59');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 23:33:14');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 23:55:54');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-09 23:58:34');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 00:04:27');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 00:10:39');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 00:13:56');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 00:14:30');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 00:15:00');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 00:16:03');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 00:17:03');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 00:17:49');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 19:32:20');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 20:08:06');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-10 20:14:09');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 20:15:49');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-10 22:58:45');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 22:58:57');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-10 22:59:21');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-11 00:06:02');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 00:06:08');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-11 00:09:12');
INSERT INTO `sys_logininfor` VALUES (148, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-11 00:09:19');
INSERT INTO `sys_logininfor` VALUES (149, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-11 00:09:38');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 00:09:42');
INSERT INTO `sys_logininfor` VALUES (151, 'zhangsan', '127.0.0.1', '1', '用户密码错误', '2021-12-11 00:11:38');
INSERT INTO `sys_logininfor` VALUES (152, 'zhangsan', '127.0.0.1', '1', '用户密码错误', '2021-12-11 00:11:50');
INSERT INTO `sys_logininfor` VALUES (153, 'zhangsan', '127.0.0.1', '1', '用户密码错误', '2021-12-11 00:12:03');
INSERT INTO `sys_logininfor` VALUES (154, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-11 00:12:37');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-11 00:19:22');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-11 16:14:27');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 16:15:08');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 16:19:18');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 16:21:49');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 16:36:21');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 17:01:23');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 17:01:23');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 17:08:59');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '192.168.1.12', '0', '登录成功', '2021-12-11 17:45:12');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 17:59:34');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 17:59:35');
INSERT INTO `sys_logininfor` VALUES (167, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 18:21:46');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 18:26:32');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 18:30:01');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:26');
INSERT INTO `sys_logininfor` VALUES (171, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:29');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:30');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:30');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:30');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:31');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:36');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:37');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:37');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:37');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:39');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:39');
INSERT INTO `sys_logininfor` VALUES (182, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:39');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '1', '用户密码错误', '2021-12-11 18:53:40');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 18:54:00');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 18:59:50');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 19:00:10');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 19:00:42');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 19:05:43');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 19:11:24');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 19:11:24');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 19:12:55');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 19:55:07');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 20:16:35');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 20:29:25');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-11 20:33:23');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 20:33:28');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-11 20:36:53');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-11 20:37:08');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 20:37:14');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 21:33:46');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 22:02:44');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 22:15:12');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 23:13:03');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-11 23:16:59');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-12 12:55:00');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 12:55:01');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-12 12:55:33');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 12:55:35');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 12:57:27');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:22:05');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:30:25');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:31:04');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-12 13:31:12');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:31:13');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-12 13:31:38');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:31:40');
INSERT INTO `sys_logininfor` VALUES (217, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:32:15');
INSERT INTO `sys_logininfor` VALUES (218, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-12 13:32:57');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:33:04');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:34:43');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:35:16');
INSERT INTO `sys_logininfor` VALUES (222, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:35:48');
INSERT INTO `sys_logininfor` VALUES (223, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:37:16');
INSERT INTO `sys_logininfor` VALUES (224, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:44:20');
INSERT INTO `sys_logininfor` VALUES (225, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:54:38');
INSERT INTO `sys_logininfor` VALUES (226, 'zhangsan', '127.0.0.1', '1', '用户密码错误', '2021-12-12 13:55:07');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 13:55:53');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-12 13:55:57');
INSERT INTO `sys_logininfor` VALUES (229, 'zhangsan', '127.0.0.1', '1', '用户密码错误', '2021-12-12 13:56:03');
INSERT INTO `sys_logininfor` VALUES (230, 'zhangsan', '127.0.0.1', '1', '用户密码错误', '2021-12-12 13:56:13');
INSERT INTO `sys_logininfor` VALUES (231, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 13:56:21');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-12 14:06:43');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 14:06:49');
INSERT INTO `sys_logininfor` VALUES (234, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-12 14:07:30');
INSERT INTO `sys_logininfor` VALUES (235, 'zhangsan', '127.0.0.1', '1', '用户密码错误', '2021-12-12 14:07:34');
INSERT INTO `sys_logininfor` VALUES (236, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 14:07:41');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-12 14:09:35');
INSERT INTO `sys_logininfor` VALUES (238, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 14:09:46');
INSERT INTO `sys_logininfor` VALUES (239, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-12 14:10:03');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-12 14:10:09');
INSERT INTO `sys_logininfor` VALUES (241, 'zhangsan', '127.0.0.1', '1', '用户密码错误', '2021-12-12 14:38:46');
INSERT INTO `sys_logininfor` VALUES (242, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 14:38:52');
INSERT INTO `sys_logininfor` VALUES (243, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 14:43:57');
INSERT INTO `sys_logininfor` VALUES (244, 'zhangsan', '127.0.0.1', '1', '用户密码错误', '2021-12-12 14:44:47');
INSERT INTO `sys_logininfor` VALUES (245, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 14:44:59');
INSERT INTO `sys_logininfor` VALUES (246, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 14:45:24');
INSERT INTO `sys_logininfor` VALUES (247, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 14:46:52');
INSERT INTO `sys_logininfor` VALUES (248, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 14:52:46');
INSERT INTO `sys_logininfor` VALUES (249, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 14:58:39');
INSERT INTO `sys_logininfor` VALUES (250, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 14:59:10');
INSERT INTO `sys_logininfor` VALUES (251, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 15:23:47');
INSERT INTO `sys_logininfor` VALUES (252, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 15:55:20');
INSERT INTO `sys_logininfor` VALUES (253, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 16:08:53');
INSERT INTO `sys_logininfor` VALUES (254, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-12 16:36:22');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 14:36:00');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 15:46:52');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 15:48:56');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 15:50:44');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 15:57:13');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 15:57:15');
INSERT INTO `sys_logininfor` VALUES (261, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 15:59:43');
INSERT INTO `sys_logininfor` VALUES (262, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 15:59:46');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:01:34');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 16:01:42');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:02:04');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 16:02:11');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:02:52');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 16:02:56');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:03:33');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 16:03:43');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:05:20');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 16:05:27');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:08:06');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 16:09:01');
INSERT INTO `sys_logininfor` VALUES (275, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:10:10');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 16:10:30');
INSERT INTO `sys_logininfor` VALUES (277, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:17:29');
INSERT INTO `sys_logininfor` VALUES (278, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 16:17:32');
INSERT INTO `sys_logininfor` VALUES (279, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:17:35');
INSERT INTO `sys_logininfor` VALUES (280, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 16:17:48');
INSERT INTO `sys_logininfor` VALUES (281, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:18:56');
INSERT INTO `sys_logininfor` VALUES (282, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:19:05');
INSERT INTO `sys_logininfor` VALUES (283, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 16:19:31');
INSERT INTO `sys_logininfor` VALUES (284, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:20:54');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 16:21:06');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 16:21:30');
INSERT INTO `sys_logininfor` VALUES (287, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 17:43:26');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 17:47:58');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 17:48:34');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 20:03:39');
INSERT INTO `sys_logininfor` VALUES (291, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 20:11:12');
INSERT INTO `sys_logininfor` VALUES (292, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 20:11:17');
INSERT INTO `sys_logininfor` VALUES (293, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 20:12:44');
INSERT INTO `sys_logininfor` VALUES (294, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 20:12:48');
INSERT INTO `sys_logininfor` VALUES (295, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-13 20:17:01');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-13 20:17:03');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 09:58:53');
INSERT INTO `sys_logininfor` VALUES (298, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 10:01:57');
INSERT INTO `sys_logininfor` VALUES (299, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 10:01:57');
INSERT INTO `sys_logininfor` VALUES (300, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 10:02:06');
INSERT INTO `sys_logininfor` VALUES (301, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 13:41:26');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 17:08:32');
INSERT INTO `sys_logininfor` VALUES (303, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 17:09:45');
INSERT INTO `sys_logininfor` VALUES (304, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-14 17:10:09');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 17:13:30');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 17:17:33');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 17:23:56');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-14 17:23:59');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 17:24:01');
INSERT INTO `sys_logininfor` VALUES (310, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 21:00:42');
INSERT INTO `sys_logininfor` VALUES (311, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 21:28:05');
INSERT INTO `sys_logininfor` VALUES (312, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 21:37:25');
INSERT INTO `sys_logininfor` VALUES (313, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 21:37:27');
INSERT INTO `sys_logininfor` VALUES (314, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 21:45:55');
INSERT INTO `sys_logininfor` VALUES (315, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 21:46:56');
INSERT INTO `sys_logininfor` VALUES (316, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 21:47:14');
INSERT INTO `sys_logininfor` VALUES (317, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 21:49:30');
INSERT INTO `sys_logininfor` VALUES (318, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 21:49:32');
INSERT INTO `sys_logininfor` VALUES (319, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 21:53:51');
INSERT INTO `sys_logininfor` VALUES (320, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 21:53:52');
INSERT INTO `sys_logininfor` VALUES (321, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 21:56:04');
INSERT INTO `sys_logininfor` VALUES (322, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 21:56:09');
INSERT INTO `sys_logininfor` VALUES (323, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 21:57:05');
INSERT INTO `sys_logininfor` VALUES (324, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 21:57:06');
INSERT INTO `sys_logininfor` VALUES (325, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 21:57:54');
INSERT INTO `sys_logininfor` VALUES (326, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 21:57:56');
INSERT INTO `sys_logininfor` VALUES (327, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 22:20:00');
INSERT INTO `sys_logininfor` VALUES (328, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 22:27:22');
INSERT INTO `sys_logininfor` VALUES (329, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 22:27:44');
INSERT INTO `sys_logininfor` VALUES (330, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 22:27:46');
INSERT INTO `sys_logininfor` VALUES (331, 'ry', '127.0.0.1', '0', '登录成功', '2021-12-14 22:38:34');
INSERT INTO `sys_logininfor` VALUES (332, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 22:41:44');
INSERT INTO `sys_logininfor` VALUES (333, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 22:41:46');
INSERT INTO `sys_logininfor` VALUES (334, 'ry', '127.0.0.1', '0', '退出成功', '2021-12-14 22:42:10');
INSERT INTO `sys_logininfor` VALUES (335, 'ry', '127.0.0.1', '0', '登录成功', '2021-12-14 22:42:18');
INSERT INTO `sys_logininfor` VALUES (336, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 22:45:18');
INSERT INTO `sys_logininfor` VALUES (337, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 22:45:20');
INSERT INTO `sys_logininfor` VALUES (338, 'ry', '127.0.0.1', '0', '退出成功', '2021-12-14 22:46:13');
INSERT INTO `sys_logininfor` VALUES (339, 'ry', '127.0.0.1', '0', '登录成功', '2021-12-14 22:46:19');
INSERT INTO `sys_logininfor` VALUES (340, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 23:05:46');
INSERT INTO `sys_logininfor` VALUES (341, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 23:05:48');
INSERT INTO `sys_logininfor` VALUES (342, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 23:22:28');
INSERT INTO `sys_logininfor` VALUES (343, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 23:22:35');
INSERT INTO `sys_logininfor` VALUES (344, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 23:24:17');
INSERT INTO `sys_logininfor` VALUES (345, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 23:24:19');
INSERT INTO `sys_logininfor` VALUES (346, 'ry', '127.0.0.1', '0', '退出成功', '2021-12-14 23:25:12');
INSERT INTO `sys_logininfor` VALUES (347, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 23:25:15');
INSERT INTO `sys_logininfor` VALUES (348, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 23:35:45');
INSERT INTO `sys_logininfor` VALUES (349, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 23:35:47');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-14 23:36:00');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 23:36:03');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-14 23:37:08');
INSERT INTO `sys_logininfor` VALUES (353, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 23:37:14');
INSERT INTO `sys_logininfor` VALUES (354, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 23:37:16');
INSERT INTO `sys_logininfor` VALUES (355, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 23:37:24');
INSERT INTO `sys_logininfor` VALUES (356, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-14 23:37:41');
INSERT INTO `sys_logininfor` VALUES (357, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 23:37:43');
INSERT INTO `sys_logininfor` VALUES (358, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-14 23:38:53');
INSERT INTO `sys_logininfor` VALUES (359, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-14 23:41:08');
INSERT INTO `sys_logininfor` VALUES (360, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-14 23:41:24');
INSERT INTO `sys_logininfor` VALUES (361, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 23:41:33');
INSERT INTO `sys_logininfor` VALUES (362, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-14 23:53:52');
INSERT INTO `sys_logininfor` VALUES (363, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 23:53:54');
INSERT INTO `sys_logininfor` VALUES (364, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-14 23:59:54');
INSERT INTO `sys_logininfor` VALUES (365, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-14 23:59:57');
INSERT INTO `sys_logininfor` VALUES (366, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 00:05:53');
INSERT INTO `sys_logininfor` VALUES (367, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 00:05:55');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 00:09:34');
INSERT INTO `sys_logininfor` VALUES (369, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-15 00:09:42');
INSERT INTO `sys_logininfor` VALUES (370, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 00:09:45');
INSERT INTO `sys_logininfor` VALUES (371, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 00:09:47');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 00:16:13');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 00:16:15');
INSERT INTO `sys_logininfor` VALUES (374, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 00:16:16');
INSERT INTO `sys_logininfor` VALUES (375, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 11:42:28');
INSERT INTO `sys_logininfor` VALUES (376, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 11:42:47');
INSERT INTO `sys_logininfor` VALUES (377, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 11:42:49');
INSERT INTO `sys_logininfor` VALUES (378, 'zhangsan', '172.16.2.29', '0', '登录成功', '2021-12-15 11:47:34');
INSERT INTO `sys_logininfor` VALUES (379, 'zhangsan', '172.16.2.29', '0', '退出成功', '2021-12-15 11:47:58');
INSERT INTO `sys_logininfor` VALUES (380, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 11:48:11');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 11:48:13');
INSERT INTO `sys_logininfor` VALUES (382, 'zhangsan', '172.16.2.29', '0', '登录成功', '2021-12-15 11:48:29');
INSERT INTO `sys_logininfor` VALUES (383, 'zhangsan', '172.16.2.29', '0', '退出成功', '2021-12-15 11:50:38');
INSERT INTO `sys_logininfor` VALUES (384, 'zhangsan', '172.16.2.29', '0', '登录成功', '2021-12-15 11:50:50');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 12:19:39');
INSERT INTO `sys_logininfor` VALUES (386, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 12:19:55');
INSERT INTO `sys_logininfor` VALUES (387, 'zhangsan', '172.16.2.29', '0', '登录成功', '2021-12-15 12:21:05');
INSERT INTO `sys_logininfor` VALUES (388, 'zhangsan', '172.16.2.29', '0', '登录成功', '2021-12-15 12:25:29');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 12:25:38');
INSERT INTO `sys_logininfor` VALUES (390, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 12:25:40');
INSERT INTO `sys_logininfor` VALUES (391, 'zhangsan', '172.16.2.29', '0', '退出成功', '2021-12-15 12:29:25');
INSERT INTO `sys_logininfor` VALUES (392, 'zhangsan', '172.16.2.29', '0', '登录成功', '2021-12-15 12:29:46');
INSERT INTO `sys_logininfor` VALUES (393, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 12:34:42');
INSERT INTO `sys_logininfor` VALUES (394, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 12:34:44');
INSERT INTO `sys_logininfor` VALUES (395, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 12:37:29');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 13:33:04');
INSERT INTO `sys_logininfor` VALUES (397, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 13:38:52');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 13:39:18');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 13:43:42');
INSERT INTO `sys_logininfor` VALUES (400, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 13:44:06');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 13:44:11');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 13:44:53');
INSERT INTO `sys_logininfor` VALUES (403, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 13:46:43');
INSERT INTO `sys_logininfor` VALUES (404, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 14:35:28');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 14:36:36');
INSERT INTO `sys_logininfor` VALUES (406, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 14:37:06');
INSERT INTO `sys_logininfor` VALUES (407, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 15:32:42');
INSERT INTO `sys_logininfor` VALUES (408, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 15:32:44');
INSERT INTO `sys_logininfor` VALUES (409, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 15:43:06');
INSERT INTO `sys_logininfor` VALUES (410, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 15:43:07');
INSERT INTO `sys_logininfor` VALUES (411, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 16:31:38');
INSERT INTO `sys_logininfor` VALUES (412, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 16:31:52');
INSERT INTO `sys_logininfor` VALUES (413, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 16:33:57');
INSERT INTO `sys_logininfor` VALUES (414, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 16:33:59');
INSERT INTO `sys_logininfor` VALUES (415, 'zhangsan', '172.16.2.29', '0', '登录成功', '2021-12-15 16:34:22');
INSERT INTO `sys_logininfor` VALUES (416, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 19:37:29');
INSERT INTO `sys_logininfor` VALUES (417, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-15 22:30:25');
INSERT INTO `sys_logininfor` VALUES (418, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 22:30:27');
INSERT INTO `sys_logininfor` VALUES (419, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-15 22:33:58');
INSERT INTO `sys_logininfor` VALUES (420, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 22:34:00');
INSERT INTO `sys_logininfor` VALUES (421, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-15 22:45:17');
INSERT INTO `sys_logininfor` VALUES (422, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 22:45:20');
INSERT INTO `sys_logininfor` VALUES (423, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 22:45:20');
INSERT INTO `sys_logininfor` VALUES (424, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 22:51:33');
INSERT INTO `sys_logininfor` VALUES (425, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-15 22:52:01');
INSERT INTO `sys_logininfor` VALUES (426, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 22:52:03');
INSERT INTO `sys_logininfor` VALUES (427, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-15 22:53:42');
INSERT INTO `sys_logininfor` VALUES (428, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 22:55:46');
INSERT INTO `sys_logininfor` VALUES (429, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-15 22:57:06');
INSERT INTO `sys_logininfor` VALUES (430, 'ry', '127.0.0.1', '1', '用户密码错误', '2021-12-15 22:57:12');
INSERT INTO `sys_logininfor` VALUES (431, 'ry', '127.0.0.1', '0', '登录成功', '2021-12-15 22:57:17');
INSERT INTO `sys_logininfor` VALUES (432, 'zhangsan', '192.168.1.10', '0', '登录成功', '2021-12-15 22:57:34');
INSERT INTO `sys_logininfor` VALUES (433, 'zhangsan', '192.168.1.10', '0', '登录成功', '2021-12-15 22:57:35');
INSERT INTO `sys_logininfor` VALUES (434, 'ry', '127.0.0.1', '0', '退出成功', '2021-12-15 22:58:54');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 22:59:34');
INSERT INTO `sys_logininfor` VALUES (436, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 23:00:04');
INSERT INTO `sys_logininfor` VALUES (437, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-15 23:02:28');
INSERT INTO `sys_logininfor` VALUES (438, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 23:02:43');
INSERT INTO `sys_logininfor` VALUES (439, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-15 23:03:13');
INSERT INTO `sys_logininfor` VALUES (440, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 23:03:27');
INSERT INTO `sys_logininfor` VALUES (441, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-15 23:03:30');
INSERT INTO `sys_logininfor` VALUES (442, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-15 23:03:35');
INSERT INTO `sys_logininfor` VALUES (443, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 23:03:43');
INSERT INTO `sys_logininfor` VALUES (444, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 23:03:51');
INSERT INTO `sys_logininfor` VALUES (445, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-15 23:03:52');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-15 23:07:27');
INSERT INTO `sys_logininfor` VALUES (447, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-15 23:07:32');
INSERT INTO `sys_logininfor` VALUES (448, 'zhangsan', '192.168.1.10', '0', '登录成功', '2021-12-15 23:07:50');
INSERT INTO `sys_logininfor` VALUES (449, 'admin', '192.168.1.12', '0', '登录成功', '2021-12-15 23:08:19');
INSERT INTO `sys_logininfor` VALUES (450, 'zhangsan', '192.168.1.10', '0', '登录成功', '2021-12-15 23:09:45');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '192.168.1.3', '1', '用户密码错误', '2021-12-15 23:19:19');
INSERT INTO `sys_logininfor` VALUES (452, 'admin', '192.168.1.3', '0', '登录成功', '2021-12-15 23:19:24');
INSERT INTO `sys_logininfor` VALUES (453, 'zhangsan', '192.168.1.10', '0', '登录成功', '2021-12-15 23:19:41');
INSERT INTO `sys_logininfor` VALUES (454, 'admin', '192.168.1.3', '0', '登录成功', '2021-12-15 23:23:39');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '192.168.1.3', '0', '登录成功', '2021-12-15 23:28:00');
INSERT INTO `sys_logininfor` VALUES (456, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-16 16:10:31');
INSERT INTO `sys_logininfor` VALUES (457, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-16 16:16:22');
INSERT INTO `sys_logininfor` VALUES (458, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-16 16:54:12');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-16 17:24:23');
INSERT INTO `sys_logininfor` VALUES (460, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-16 17:24:30');
INSERT INTO `sys_logininfor` VALUES (461, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-16 17:24:31');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-17 09:49:35');
INSERT INTO `sys_logininfor` VALUES (463, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-17 09:50:27');
INSERT INTO `sys_logininfor` VALUES (464, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-17 10:06:01');
INSERT INTO `sys_logininfor` VALUES (465, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-17 10:06:07');
INSERT INTO `sys_logininfor` VALUES (466, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-17 10:06:46');
INSERT INTO `sys_logininfor` VALUES (467, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-17 10:08:15');
INSERT INTO `sys_logininfor` VALUES (468, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-17 10:08:28');
INSERT INTO `sys_logininfor` VALUES (469, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-17 10:10:22');
INSERT INTO `sys_logininfor` VALUES (470, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-17 10:10:23');
INSERT INTO `sys_logininfor` VALUES (471, 'zhangsan', '127.0.0.1', '0', '退出成功', '2021-12-17 10:27:23');
INSERT INTO `sys_logininfor` VALUES (472, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-17 10:27:29');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-17 10:27:34');
INSERT INTO `sys_logininfor` VALUES (474, 'zhangsan', '127.0.0.1', '0', '登录成功', '2021-12-17 10:27:36');
INSERT INTO `sys_logininfor` VALUES (475, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-22 11:03:10');
INSERT INTO `sys_logininfor` VALUES (476, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-22 11:05:21');
INSERT INTO `sys_logininfor` VALUES (477, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-22 11:05:28');
INSERT INTO `sys_logininfor` VALUES (478, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-22 11:14:49');
INSERT INTO `sys_logininfor` VALUES (479, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-22 11:14:59');
INSERT INTO `sys_logininfor` VALUES (480, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-22 11:16:54');
INSERT INTO `sys_logininfor` VALUES (481, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-22 11:16:58');
INSERT INTO `sys_logininfor` VALUES (482, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-22 11:20:39');
INSERT INTO `sys_logininfor` VALUES (483, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-22 11:21:04');
INSERT INTO `sys_logininfor` VALUES (484, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-22 11:32:55');
INSERT INTO `sys_logininfor` VALUES (485, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-22 11:33:21');
INSERT INTO `sys_logininfor` VALUES (486, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-22 11:35:38');
INSERT INTO `sys_logininfor` VALUES (487, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-22 11:37:05');
INSERT INTO `sys_logininfor` VALUES (488, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-22 11:38:23');
INSERT INTO `sys_logininfor` VALUES (489, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-22 11:38:30');
INSERT INTO `sys_logininfor` VALUES (490, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-22 11:41:04');
INSERT INTO `sys_logininfor` VALUES (491, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-22 11:41:11');
INSERT INTO `sys_logininfor` VALUES (492, 'admin', '127.0.0.1', '0', '退出成功', '2021-12-22 11:45:38');
INSERT INTO `sys_logininfor` VALUES (493, 'admin', '127.0.0.1', '0', '登录成功', '2021-12-22 11:45:42');
INSERT INTO `sys_logininfor` VALUES (494, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-07 15:57:29');
INSERT INTO `sys_logininfor` VALUES (495, 'admin', '115.236.174.43', '0', '登录成功', '2022-01-07 17:24:50');
INSERT INTO `sys_logininfor` VALUES (496, 'admin', '115.236.174.43', '0', '退出成功', '2022-01-07 17:27:50');
INSERT INTO `sys_logininfor` VALUES (497, 'admin', '115.236.174.43', '0', '登录成功', '2022-01-07 17:28:58');
INSERT INTO `sys_logininfor` VALUES (498, 'admin', '115.236.174.43', '0', '退出成功', '2022-01-07 17:41:28');
INSERT INTO `sys_logininfor` VALUES (499, 'admin', '115.236.174.43', '0', '登录成功', '2022-01-07 17:44:42');
INSERT INTO `sys_logininfor` VALUES (500, 'admin', '115.236.174.43', '0', '退出成功', '2022-01-07 17:45:06');
INSERT INTO `sys_logininfor` VALUES (501, 'admin', '115.236.174.43', '0', '登录成功', '2022-01-07 17:45:22');
INSERT INTO `sys_logininfor` VALUES (502, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-07 18:19:18');
INSERT INTO `sys_logininfor` VALUES (503, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-07 18:19:20');
INSERT INTO `sys_logininfor` VALUES (504, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-07 18:25:21');
INSERT INTO `sys_logininfor` VALUES (505, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-07 21:18:57');
INSERT INTO `sys_logininfor` VALUES (506, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-07 21:24:31');
INSERT INTO `sys_logininfor` VALUES (507, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-07 21:25:17');
INSERT INTO `sys_logininfor` VALUES (508, 'admin', '112.10.107.210', '0', '退出成功', '2022-01-07 21:27:41');
INSERT INTO `sys_logininfor` VALUES (509, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-07 21:38:46');
INSERT INTO `sys_logininfor` VALUES (510, 'ry', '127.0.0.1', '0', '登录成功', '2022-01-07 21:39:11');
INSERT INTO `sys_logininfor` VALUES (511, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-07 21:46:49');
INSERT INTO `sys_logininfor` VALUES (512, 'ry', '127.0.0.1', '0', '登录成功', '2022-01-07 21:47:06');
INSERT INTO `sys_logininfor` VALUES (513, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-07 21:47:49');
INSERT INTO `sys_logininfor` VALUES (514, 'ry', '127.0.0.1', '0', '登录成功', '2022-01-07 21:54:42');
INSERT INTO `sys_logininfor` VALUES (515, 'admin', '192.168.1.226', '0', '登录成功', '2022-01-08 00:01:27');
INSERT INTO `sys_logininfor` VALUES (516, 'admin', '192.168.1.226', '0', '登录成功', '2022-01-08 00:27:26');
INSERT INTO `sys_logininfor` VALUES (517, 'admin', '192.168.1.226', '0', '登录成功', '2022-01-08 00:28:12');
INSERT INTO `sys_logininfor` VALUES (518, 'admin', '192.168.1.226', '0', '登录成功', '2022-01-08 00:33:18');
INSERT INTO `sys_logininfor` VALUES (519, 'admin', '192.168.1.226', '0', '登录成功', '2022-01-08 00:49:47');
INSERT INTO `sys_logininfor` VALUES (520, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-08 00:59:02');
INSERT INTO `sys_logininfor` VALUES (521, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 01:02:28');
INSERT INTO `sys_logininfor` VALUES (522, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 01:06:05');
INSERT INTO `sys_logininfor` VALUES (523, 'ry', '127.0.0.1', '0', '登录成功', '2022-01-08 01:09:44');
INSERT INTO `sys_logininfor` VALUES (524, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 01:10:38');
INSERT INTO `sys_logininfor` VALUES (525, 'ry', '127.0.0.1', '0', '登录成功', '2022-01-08 01:11:46');
INSERT INTO `sys_logininfor` VALUES (526, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 01:12:19');
INSERT INTO `sys_logininfor` VALUES (527, 'ry', '127.0.0.1', '0', '登录成功', '2022-01-08 01:12:52');
INSERT INTO `sys_logininfor` VALUES (528, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-08 01:15:16');
INSERT INTO `sys_logininfor` VALUES (529, 'ry', '127.0.0.1', '0', '退出成功', '2022-01-08 01:15:16');
INSERT INTO `sys_logininfor` VALUES (530, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 01:16:51');
INSERT INTO `sys_logininfor` VALUES (531, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 01:22:05');
INSERT INTO `sys_logininfor` VALUES (532, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 01:28:44');
INSERT INTO `sys_logininfor` VALUES (533, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 01:31:04');
INSERT INTO `sys_logininfor` VALUES (534, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 01:43:18');
INSERT INTO `sys_logininfor` VALUES (535, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-08 13:54:41');
INSERT INTO `sys_logininfor` VALUES (536, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 13:55:00');
INSERT INTO `sys_logininfor` VALUES (537, 'admin', '192.168.1.226', '0', '退出成功', '2022-01-08 13:58:57');
INSERT INTO `sys_logininfor` VALUES (538, 'admin', '192.168.1.226', '0', '登录成功', '2022-01-08 13:59:23');
INSERT INTO `sys_logininfor` VALUES (539, 'admin', '192.168.1.226', '0', '登录成功', '2022-01-08 15:03:45');
INSERT INTO `sys_logininfor` VALUES (540, 'admin', '192.168.1.226', '0', '登录成功', '2022-01-08 15:09:57');
INSERT INTO `sys_logininfor` VALUES (541, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 15:18:32');
INSERT INTO `sys_logininfor` VALUES (542, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 15:52:54');
INSERT INTO `sys_logininfor` VALUES (543, 'ry', '127.0.0.1', '0', '登录成功', '2022-01-08 15:55:05');
INSERT INTO `sys_logininfor` VALUES (544, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 16:27:03');
INSERT INTO `sys_logininfor` VALUES (545, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 16:35:03');
INSERT INTO `sys_logininfor` VALUES (546, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 16:58:57');
INSERT INTO `sys_logininfor` VALUES (547, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 16:59:48');
INSERT INTO `sys_logininfor` VALUES (548, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 18:48:37');
INSERT INTO `sys_logininfor` VALUES (549, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-08 19:06:23');
INSERT INTO `sys_logininfor` VALUES (550, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 19:07:34');
INSERT INTO `sys_logininfor` VALUES (551, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-08 19:09:09');
INSERT INTO `sys_logininfor` VALUES (552, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 19:09:15');
INSERT INTO `sys_logininfor` VALUES (553, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 19:16:10');
INSERT INTO `sys_logininfor` VALUES (554, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-08 19:18:28');
INSERT INTO `sys_logininfor` VALUES (555, 'ry', '127.0.0.1', '0', '登录成功', '2022-01-08 19:18:46');
INSERT INTO `sys_logininfor` VALUES (556, 'ry', '127.0.0.1', '0', '退出成功', '2022-01-08 19:21:10');
INSERT INTO `sys_logininfor` VALUES (557, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 19:31:10');
INSERT INTO `sys_logininfor` VALUES (558, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-08 19:34:25');
INSERT INTO `sys_logininfor` VALUES (559, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 19:34:29');
INSERT INTO `sys_logininfor` VALUES (560, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-08 19:35:07');
INSERT INTO `sys_logininfor` VALUES (561, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 19:35:17');
INSERT INTO `sys_logininfor` VALUES (562, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 20:00:28');
INSERT INTO `sys_logininfor` VALUES (563, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 20:06:03');
INSERT INTO `sys_logininfor` VALUES (564, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-08 20:06:29');
INSERT INTO `sys_logininfor` VALUES (565, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-08 20:09:31');
INSERT INTO `sys_logininfor` VALUES (566, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 20:10:05');
INSERT INTO `sys_logininfor` VALUES (567, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-08 21:02:36');
INSERT INTO `sys_logininfor` VALUES (568, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 21:02:46');
INSERT INTO `sys_logininfor` VALUES (569, 'admin', '112.10.107.210', '0', '退出成功', '2022-01-08 21:17:51');
INSERT INTO `sys_logininfor` VALUES (570, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-08 21:19:10');
INSERT INTO `sys_logininfor` VALUES (571, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-08 21:22:46');
INSERT INTO `sys_logininfor` VALUES (572, 'admin', '112.10.107.210', '0', '退出成功', '2022-01-08 21:26:42');
INSERT INTO `sys_logininfor` VALUES (573, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-08 21:29:12');
INSERT INTO `sys_logininfor` VALUES (574, 'admin', '112.10.107.210', '0', '退出成功', '2022-01-08 21:32:37');
INSERT INTO `sys_logininfor` VALUES (575, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 21:33:37');
INSERT INTO `sys_logininfor` VALUES (576, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-08 21:46:40');
INSERT INTO `sys_logininfor` VALUES (577, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-08 21:47:21');
INSERT INTO `sys_logininfor` VALUES (578, 'admin', '192.168.1.226', '0', '退出成功', '2022-01-08 21:52:56');
INSERT INTO `sys_logininfor` VALUES (579, 'admin', '192.168.1.226', '0', '登录成功', '2022-01-08 21:54:31');
INSERT INTO `sys_logininfor` VALUES (580, 'admin', '192.168.1.226', '0', '退出成功', '2022-01-08 21:54:50');
INSERT INTO `sys_logininfor` VALUES (581, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-08 22:00:49');
INSERT INTO `sys_logininfor` VALUES (582, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-08 22:08:33');
INSERT INTO `sys_logininfor` VALUES (583, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-09 21:59:17');
INSERT INTO `sys_logininfor` VALUES (584, 'admin', '127.0.0.1', '0', '登录成功', '2022-01-09 22:08:39');
INSERT INTO `sys_logininfor` VALUES (585, 'admin', '112.10.107.210', '0', '退出成功', '2022-01-09 22:57:55');
INSERT INTO `sys_logininfor` VALUES (586, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-09 22:58:04');
INSERT INTO `sys_logininfor` VALUES (587, 'admin', '192.168.1.226', '0', '登录成功', '2022-01-09 23:00:25');
INSERT INTO `sys_logininfor` VALUES (588, 'admin', '112.10.107.210', '0', '退出成功', '2022-01-09 23:07:00');
INSERT INTO `sys_logininfor` VALUES (589, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-09 23:09:05');
INSERT INTO `sys_logininfor` VALUES (590, 'admin', '127.0.0.1', '0', '退出成功', '2022-01-09 23:10:14');
INSERT INTO `sys_logininfor` VALUES (591, 'admin', '112.10.107.210', '0', '退出成功', '2022-01-09 23:17:46');
INSERT INTO `sys_logininfor` VALUES (592, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-09 23:18:19');
INSERT INTO `sys_logininfor` VALUES (593, 'admin', '115.197.25.104', '0', '登录成功', '2022-01-09 23:21:02');
INSERT INTO `sys_logininfor` VALUES (594, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-09 23:22:01');
INSERT INTO `sys_logininfor` VALUES (595, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-09 23:24:32');
INSERT INTO `sys_logininfor` VALUES (596, 'admin', '112.10.107.210', '0', '退出成功', '2022-01-09 23:24:47');
INSERT INTO `sys_logininfor` VALUES (597, 'admin', '39.183.27.126', '0', '登录成功', '2022-01-09 23:25:24');
INSERT INTO `sys_logininfor` VALUES (598, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-09 23:25:41');
INSERT INTO `sys_logininfor` VALUES (599, 'admin', '115.197.25.104', '0', '登录成功', '2022-01-09 23:27:04');
INSERT INTO `sys_logininfor` VALUES (600, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-09 23:27:17');
INSERT INTO `sys_logininfor` VALUES (601, 'admin', '112.10.107.210', '0', '退出成功', '2022-01-09 23:28:31');
INSERT INTO `sys_logininfor` VALUES (602, 'admin', '112.10.107.210', '0', '登录成功', '2022-01-09 23:28:43');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  `app_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联应用id',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2059 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2021-10-27 14:20:28', '', NULL, '系统管理目录', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2021-10-27 14:20:28', '', NULL, '系统监控目录', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2021-10-27 14:20:28', '', NULL, '系统工具目录', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2021-10-27 14:20:28', '', NULL, '用户管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2021-10-27 14:20:28', '', NULL, '角色管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2021-10-27 14:20:28', '', NULL, '菜单管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2021-10-27 14:20:28', '', NULL, '部门管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2021-10-27 14:20:28', '', NULL, '岗位管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2021-10-27 14:20:28', '', NULL, '字典管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2021-10-27 14:20:28', '', NULL, '参数设置菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2021-10-27 14:20:28', '', NULL, '通知公告菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2021-10-27 14:20:28', '', NULL, '日志管理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2021-10-27 14:20:28', '', NULL, '在线用户菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2021-10-27 14:20:28', '', NULL, '定时任务菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2021-10-27 14:20:28', '', NULL, '流量控制菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2021-10-27 14:20:28', '', NULL, '服务治理菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2021-10-27 14:20:28', '', NULL, '服务监控菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2021-10-27 14:20:28', '', NULL, '表单构建菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2021-10-27 14:20:28', '', NULL, '代码生成菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2021-10-27 14:20:28', '', NULL, '系统接口菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2021-10-27 14:20:28', '', NULL, '操作日志菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2021-10-27 14:20:28', '', NULL, '登录日志菜单', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2021-10-27 14:20:28', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2000, '应用管理', 1, 10, 'app', 'system/app/index', NULL, 1, 0, 'C', '0', '0', 'system:app:list', 'row', 'admin', '2021-10-27 17:07:34', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2001, '新增', 2000, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:app:add', '#', 'admin', '2021-10-27 17:08:05', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2002, '修改', 2000, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:app:edit', '#', 'admin', '2021-10-27 17:08:20', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2003, '删除', 2000, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:app:remove', '#', 'admin', '2021-10-27 17:08:32', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2004, '导出', 2000, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:app:export', '#', 'admin', '2021-10-27 17:08:47', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2005, '列表', 2000, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:app:list', '#', 'admin', '2021-10-27 17:09:02', '', NULL, '', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_menu` VALUES (2008, '系统管理', 0, 1, 'system', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'system', '', '2021-10-28 16:06:15', '', NULL, '', '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_menu` VALUES (2009, '角色管理', 2008, 2, 'role', 'system/role/index', NULL, 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', '', '2021-10-28 16:06:15', '', NULL, '', '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_menu` VALUES (2010, '角色查询', 2009, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:query', '#', '', '2021-10-28 16:06:15', '', NULL, '', '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_menu` VALUES (2011, '角色新增', 2009, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:add', '#', '', '2021-10-28 16:06:15', '', NULL, '', '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_menu` VALUES (2012, '角色修改', 2009, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:edit', '#', '', '2021-10-28 16:06:15', '', NULL, '', '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_menu` VALUES (2013, '角色删除', 2009, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:remove', '#', '', '2021-10-28 16:06:15', '', NULL, '', '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_menu` VALUES (2014, '角色导出', 2009, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:export', '#', '', '2021-10-28 16:06:15', '', NULL, '', '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_menu` VALUES (2015, '菜单管理', 2008, 3, 'menu', 'system/menu/index', NULL, 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', '', '2021-10-28 16:06:15', '', NULL, '', '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_menu` VALUES (2016, '菜单查询', 2015, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:query', '#', '', '2021-10-28 16:06:15', '', NULL, '', '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_menu` VALUES (2017, '菜单新增', 2015, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:add', '#', '', '2021-10-28 16:06:15', '', NULL, '', '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_menu` VALUES (2018, '菜单修改', 2015, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:edit', '#', '', '2021-10-28 16:06:15', '', NULL, '', '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_menu` VALUES (2019, '菜单删除', 2015, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:remove', '#', '', '2021-10-28 16:06:15', '', NULL, '', '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_menu` VALUES (2020, '系统管理', 0, 1, 'system', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'system', '', '2021-12-12 14:47:54', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2021, '角色管理', 2020, 2, 'role', 'system/role/index', NULL, 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', '', '2021-12-12 14:47:54', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2022, '角色查询', 2021, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:query', '#', '', '2021-12-12 14:47:54', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2023, '角色新增', 2021, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:add', '#', '', '2021-12-12 14:47:54', 'admin', '2021-12-12 14:50:51', '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2024, '角色修改', 2021, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:edit', '#', '', '2021-12-12 14:47:54', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2025, '角色删除', 2021, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:remove', '#', '', '2021-12-12 14:47:54', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2026, '角色导出', 2021, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:export', '#', '', '2021-12-12 14:47:54', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2027, '菜单管理', 2020, 3, 'menu', 'system/menu/index', NULL, 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', '', '2021-12-12 14:47:54', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2028, '菜单查询', 2027, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:query', '#', '', '2021-12-12 14:47:54', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2029, '菜单新增', 2027, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:add', '#', '', '2021-12-12 14:47:54', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2030, '菜单修改', 2027, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:edit', '#', '', '2021-12-12 14:47:54', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2031, '菜单删除', 2027, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:remove', '#', '', '2021-12-12 14:47:54', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2032, '新增用户', 2021, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-12-12 14:50:25', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2033, '用户修改', 2021, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2021-12-12 14:50:41', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2034, '用户查询', 2021, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2021-12-12 14:51:10', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2035, '用户删除', 2021, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2021-12-12 14:51:23', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2036, '用户列表', 2021, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:list', '#', 'admin', '2021-12-12 14:57:45', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2038, 'im通信', 0, 2, '#', NULL, NULL, 1, 0, 'C', '0', '0', NULL, 'message', 'admin', '2021-12-14 13:43:07', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2039, '聊天列表', 2038, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'im:info:list', '#', 'admin', '2021-12-14 13:43:26', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2040, '聊天列表查询', 2038, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'im:info:query', '#', 'admin', '2021-12-14 13:43:53', 'admin', '2021-12-14 13:47:21', '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2041, '聊天列表新增', 2038, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'im:info:add', '#', 'admin', '2021-12-14 13:44:27', 'admin', '2021-12-14 13:47:12', '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2042, '聊天列表编辑', 2038, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'im:info:edit', '#', 'admin', '2021-12-14 13:44:53', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2043, '聊天记录', 2038, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'im:detail:list', '#', 'admin', '2021-12-14 13:47:05', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2044, '聊天记录新增', 2038, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'im:detail:add', '#', 'admin', '2021-12-14 13:47:48', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2045, '聊天记录查询', 2038, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'im:detail:query', '#', 'admin', '2021-12-14 13:48:06', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2046, '聊天记录编辑', 2038, 8, '', NULL, NULL, 1, 0, 'F', '0', '0', 'im:detail:edit', '#', 'admin', '2021-12-14 13:48:22', '', NULL, '', '8bd87d43a752404191bdba4067e120be');
INSERT INTO `sys_menu` VALUES (2047, '系统管理', 0, 1, 'system', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'system', '', '2022-01-08 00:59:29', '', NULL, '', '6d6acd5751364f3ab75dfae8a0636dc3');
INSERT INTO `sys_menu` VALUES (2048, '角色管理', 2047, 2, 'role', 'system/role/index', NULL, 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', '', '2022-01-08 00:59:29', '', NULL, '', '6d6acd5751364f3ab75dfae8a0636dc3');
INSERT INTO `sys_menu` VALUES (2049, '角色查询', 2048, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:query', '#', '', '2022-01-08 00:59:29', '', NULL, '', '6d6acd5751364f3ab75dfae8a0636dc3');
INSERT INTO `sys_menu` VALUES (2050, '角色新增', 2048, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:add', '#', '', '2022-01-08 00:59:29', '', NULL, '', '6d6acd5751364f3ab75dfae8a0636dc3');
INSERT INTO `sys_menu` VALUES (2051, '角色修改', 2048, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:edit', '#', '', '2022-01-08 00:59:29', '', NULL, '', '6d6acd5751364f3ab75dfae8a0636dc3');
INSERT INTO `sys_menu` VALUES (2052, '角色删除', 2048, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:remove', '#', '', '2022-01-08 00:59:29', '', NULL, '', '6d6acd5751364f3ab75dfae8a0636dc3');
INSERT INTO `sys_menu` VALUES (2053, '角色导出', 2048, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:role:export', '#', '', '2022-01-08 00:59:29', '', NULL, '', '6d6acd5751364f3ab75dfae8a0636dc3');
INSERT INTO `sys_menu` VALUES (2054, '菜单管理', 2047, 3, 'menu', 'system/menu/index', NULL, 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', '', '2022-01-08 00:59:29', '', NULL, '', '6d6acd5751364f3ab75dfae8a0636dc3');
INSERT INTO `sys_menu` VALUES (2055, '菜单查询', 2054, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:query', '#', '', '2022-01-08 00:59:29', '', NULL, '', '6d6acd5751364f3ab75dfae8a0636dc3');
INSERT INTO `sys_menu` VALUES (2056, '菜单新增', 2054, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:add', '#', '', '2022-01-08 00:59:29', '', NULL, '', '6d6acd5751364f3ab75dfae8a0636dc3');
INSERT INTO `sys_menu` VALUES (2057, '菜单修改', 2054, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:edit', '#', '', '2022-01-08 00:59:29', '', NULL, '', '6d6acd5751364f3ab75dfae8a0636dc3');
INSERT INTO `sys_menu` VALUES (2058, '菜单删除', 2054, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:menu:remove', '#', '', '2022-01-08 00:59:29', '', NULL, '', '6d6acd5751364f3ab75dfae8a0636dc3');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2021-10-27 14:20:28', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2021-10-27 14:20:28', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 651 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"row\",\"orderNum\":\"10\",\"menuName\":\"应用管理\",\"params\":{},\"parentId\":1,\"isCache\":\"0\",\"path\":\"app\",\"component\":\"system/app/index\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuId\":2000,\"menuType\":\"C\",\"perms\":\"system:app:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 17:07:35');
INSERT INTO `sys_oper_log` VALUES (101, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"新增\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuId\":2001,\"menuType\":\"F\",\"perms\":\"system:app:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 17:08:05');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"修改\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuId\":2002,\"menuType\":\"F\",\"perms\":\"system:app:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 17:08:20');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"删除\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuId\":2003,\"menuType\":\"F\",\"perms\":\"system:app:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 17:08:32');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"导出\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuId\":2004,\"menuType\":\"F\",\"perms\":\"system:app:export\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 17:08:47');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"列表\",\"params\":{},\"parentId\":2000,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"isFrame\":\"1\",\"menuId\":2005,\"menuType\":\"F\",\"perms\":\"system:app:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 17:09:02');
INSERT INTO `sys_oper_log` VALUES (106, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"27ecdacdfa3f44799c0f4eab5de44f42\",\"roleKey\":\"ceshi\",\"roleName\":\"测试角色001\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2000,2001,2002,2003,2004,2005],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 17:50:03');
INSERT INTO `sys_oper_log` VALUES (107, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"appId\":\"27ecdacdfa3f44799c0f4eab5de44f42\",\"roleKey\":\"ceshi\",\"roleName\":\"测试角色001\",\"deptIds\":[],\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2000,2001,2002,2003,2004,2005],\"status\":\"0\"}', '{\"msg\":\"新增角色\'测试角色001\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2021-10-27 17:50:06');
INSERT INTO `sys_oper_log` VALUES (108, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":101,\"admin\":false,\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"roleKey\":\"ce2\",\"roleName\":\"测试002\",\"deptIds\":[],\"menuIds\":[2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 17:50:52');
INSERT INTO `sys_oper_log` VALUES (109, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":\"4\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"roleKey\":\"ce2\",\"roleName\":\"测试002\",\"deptIds\":[],\"menuIds\":[2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113],\"status\":\"0\"}', '{\"msg\":\"新增角色\'测试002\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2021-10-27 17:50:57');
INSERT INTO `sys_oper_log` VALUES (110, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":102,\"admin\":false,\"params\":{},\"roleSort\":\"5\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"roleKey\":\"ce3\",\"roleName\":\"ce003\",\"deptIds\":[],\"menuIds\":[2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 17:53:39');
INSERT INTO `sys_oper_log` VALUES (111, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"admin\":false,\"params\":{},\"roleSort\":\"5\",\"deptCheckStrictly\":true,\"menuCheckStrictly\":true,\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"roleKey\":\"ce3\",\"roleName\":\"ce003\",\"deptIds\":[],\"menuIds\":[2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113],\"status\":\"0\"}', '{\"msg\":\"新增角色\'ce003\'失败，角色名称已存在\",\"code\":500}', 0, NULL, '2021-10-27 17:53:53');
INSERT INTO `sys_oper_log` VALUES (112, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":103,\"admin\":false,\"params\":{},\"roleSort\":\"6\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"roleKey\":\"ce4\",\"roleName\":\"ce4\",\"deptIds\":[],\"menuIds\":[3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 17:54:17');
INSERT INTO `sys_oper_log` VALUES (113, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":104,\"admin\":false,\"params\":{},\"roleSort\":\"7\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"roleKey\":\"ce6\",\"roleName\":\"ce6\",\"deptIds\":[],\"menuIds\":[2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 17:57:01');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"build\",\"orderNum\":\"1\",\"menuName\":\"目录1\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"ml1\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"isFrame\":\"1\",\"menuId\":2006,\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 18:03:59');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"bug\",\"orderNum\":\"1\",\"menuName\":\"bug01\",\"params\":{},\"parentId\":2006,\"isCache\":\"0\",\"path\":\"bg01\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"isFrame\":\"1\",\"menuId\":2007,\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 18:05:36');
INSERT INTO `sys_oper_log` VALUES (116, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":104,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"7\",\"deptCheckStrictly\":true,\"createTime\":1635328621000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"0458c20cc561446da7720e3d19a25ddf\",\"roleKey\":\"ce6\",\"roleName\":\"ce6\",\"menuIds\":[2006,2007,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-27 18:11:29');
INSERT INTO `sys_oper_log` VALUES (117, '', 3, 'com.ruoyi.system.controller.SysAppController.remove()', 'DELETE', 1, 'admin', NULL, '/app/0458c20cc561446da7720e3d19a25ddf', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 15:34:50');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2007', '127.0.0.1', '', NULL, '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-10-28 15:35:00');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', NULL, '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-10-28 15:45:38');
INSERT INTO `sys_oper_log` VALUES (120, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":100,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"3\",\"deptCheckStrictly\":true,\"createTime\":1635328203000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"27ecdacdfa3f44799c0f4eab5de44f42\",\"roleKey\":\"ceshi\",\"roleName\":\"测试角色001\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2000,2001,2002,2003,2004,2005],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 15:51:24');
INSERT INTO `sys_oper_log` VALUES (121, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"应用分类\",\"params\":{},\"dictType\":\"sys_app_type\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 16:04:15');
INSERT INTO `sys_oper_log` VALUES (122, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"1\",\"listClass\":\"default\",\"dictSort\":1,\"params\":{},\"dictType\":\"sys_app_type\",\"dictLabel\":\"web端\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 16:04:55');
INSERT INTO `sys_oper_log` VALUES (123, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"2\",\"listClass\":\"default\",\"dictSort\":2,\"params\":{},\"dictType\":\"sys_app_type\",\"dictLabel\":\"H5\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 16:05:05');
INSERT INTO `sys_oper_log` VALUES (124, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"3\",\"listClass\":\"default\",\"dictSort\":3,\"params\":{},\"dictType\":\"sys_app_type\",\"dictLabel\":\"小程序\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 16:05:33');
INSERT INTO `sys_oper_log` VALUES (125, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"dictValue\":\"4\",\"listClass\":\"default\",\"dictSort\":4,\"params\":{},\"dictType\":\"sys_app_type\",\"dictLabel\":\"浙政钉\",\"createBy\":\"admin\",\"default\":false,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 16:05:47');
INSERT INTO `sys_oper_log` VALUES (126, '', 1, 'com.ruoyi.system.controller.SysAppController.add()', 'POST', 1, 'admin', NULL, '/app', '127.0.0.1', '', '{\"appName\":\"测试应用001\",\"appId\":\"79785c7c016443a8a53af382a1d68d5d\",\"appUrl\":\"#\",\"params\":{},\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 16:06:15');
INSERT INTO `sys_oper_log` VALUES (127, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":105,\"admin\":false,\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"79785c7c016443a8a53af382a1d68d5d\",\"roleKey\":\"ce01\",\"roleName\":\"测试应用角色01\",\"deptIds\":[],\"menuIds\":[2008,2009,2010,2011,2012,2013,2014],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 16:44:55');
INSERT INTO `sys_oper_log` VALUES (128, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"13212312312\",\"admin\":false,\"password\":\"$2a$10$mnH.v3wXV/v0ABe1.uK/G.jZmrhAMO9LGedibySjqmIaOdLsy0vhe\",\"postIds\":[],\"nickName\":\"user001\",\"params\":{},\"userName\":\"user001\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 17:29:08');
INSERT INTO `sys_oper_log` VALUES (129, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[],\"phonenumber\":\"13212312312\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"user001\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"user001\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[105],\"createTime\":1635413348000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 17:29:14');
INSERT INTO `sys_oper_log` VALUES (130, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"404\",\"orderNum\":\"2\",\"menuName\":\"测试目录001\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"ce001\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"79785c7c016443a8a53af382a1d68d5d\",\"isFrame\":\"1\",\"menuId\":2020,\"menuType\":\"M\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:02:25');
INSERT INTO `sys_oper_log` VALUES (131, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":105,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createTime\":1635410695000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"79785c7c016443a8a53af382a1d68d5d\",\"roleKey\":\"ce01\",\"roleName\":\"测试应用角色01\",\"menuIds\":[2008,2009,2010,2011,2012,2013,2014],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:06:12');
INSERT INTO `sys_oper_log` VALUES (132, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', NULL, '{\"msg\":\"菜单已分配,不允许删除\",\"code\":500}', 0, NULL, '2021-10-28 18:09:22');
INSERT INTO `sys_oper_log` VALUES (133, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":2,\"admin\":false,\"remark\":\"普通角色\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":true,\"createTime\":1635315628000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"27ecdacdfa3f44799c0f4eab5de44f42\",\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,116],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:09:32');
INSERT INTO `sys_oper_log` VALUES (134, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/4', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:09:35');
INSERT INTO `sys_oper_log` VALUES (135, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/role/100', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:11:25');
INSERT INTO `sys_oper_log` VALUES (136, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/role/105', '127.0.0.1', '', NULL, NULL, 1, '测试应用角色01已分配,不能删除', '2021-10-28 18:11:31');
INSERT INTO `sys_oper_log` VALUES (137, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":105,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createTime\":1635410695000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"79785c7c016443a8a53af382a1d68d5d\",\"roleKey\":\"ce01\",\"roleName\":\"测试应用角色01\",\"menuIds\":[],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:11:42');
INSERT INTO `sys_oper_log` VALUES (138, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/role/105', '127.0.0.1', '', NULL, NULL, 1, '测试应用角色01已分配,不能删除', '2021-10-28 18:11:45');
INSERT INTO `sys_oper_log` VALUES (139, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":105,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"ce01\",\"roleName\":\"测试应用角色01\",\"status\":\"0\"}],\"phonenumber\":\"13212312312\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[],\"loginIp\":\"\",\"email\":\"\",\"nickName\":\"user001\",\"sex\":\"0\",\"avatar\":\"\",\"params\":{},\"userName\":\"user001\",\"userId\":3,\"createBy\":\"admin\",\"roleIds\":[],\"createTime\":1635413348000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:11:55');
INSERT INTO `sys_oper_log` VALUES (140, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/role/105', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:12:06');
INSERT INTO `sys_oper_log` VALUES (141, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2020', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:12:16');
INSERT INTO `sys_oper_log` VALUES (142, '', 2, 'com.ruoyi.system.controller.SysAppController.edit()', 'PUT', 1, 'admin', NULL, '/app', '127.0.0.1', '', '{\"appName\":\"超管系统\",\"appId\":\"27ecdacdfa3f44799c0f4eab5de44f42\",\"appUrl\":\"#\",\"params\":{},\"type\":3}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:13:12');
INSERT INTO `sys_oper_log` VALUES (143, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'sys_app', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-10-28 18:24:23');
INSERT INTO `sys_oper_log` VALUES (144, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"phonenumber\":\"18312631256\",\"admin\":false,\"password\":\"$2a$10$pNU0T4iZGoOGA8/7WyGKgubaIZvmBDQgUEfqtY1ZkAx0t2FLBkk1G\",\"postIds\":[4],\"email\":\"18312631256@163.com\",\"nickName\":\"张三的瓜瓜\",\"sex\":\"0\",\"deptId\":101,\"params\":{},\"userName\":\"zhangsan\",\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"createBy\":\"admin\",\"roleIds\":[105],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-11 00:07:42');
INSERT INTO `sys_oper_log` VALUES (145, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":106,\"admin\":false,\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"79785c7c016443a8a53af382a1d68d5d\",\"roleKey\":\"testrole\",\"roleName\":\"测试角色\",\"deptIds\":[],\"menuIds\":[2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2019],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-11 00:13:17');
INSERT INTO `sys_oper_log` VALUES (146, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":105,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"ce01\",\"roleName\":\"测试应用角色01\",\"status\":\"0\"}],\"phonenumber\":\"18312631256\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[4],\"loginIp\":\"\",\"email\":\"18312631256@163.com\",\"nickName\":\"张三的瓜瓜\",\"sex\":\"0\",\"deptId\":101,\"avatar\":\"\",\"dept\":{\"deptName\":\"深圳总公司\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"createBy\":\"admin\",\"roleIds\":[106],\"createTime\":1639152461000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-11 00:13:37');
INSERT INTO `sys_oper_log` VALUES (147, '角色管理', 3, 'com.ruoyi.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', NULL, '/role/105', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-11 00:17:20');
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', 'im_chat_info,im_chat_info_detail,im_user_friend,im_add_friend_apply', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-11 20:52:46');
INSERT INTO `sys_oper_log` VALUES (149, '好友申请', 1, 'com.ruoyi.im.controller.ImAddFriendApplyController.add()', 'POST', 1, 'admin', NULL, '/apply', '127.0.0.1', '', '{\"reqUserId\":\"1\",\"origin\":\"1\",\"applyState\":1,\"resUserId\":\"f613572bd0324fc384a830f998c19ee3\",\"params\":{},\"applyId\":\"3c66cd844e0f45079f549a141891c073\",\"remarkContent\":\"121\",\"createTime\":1639288062756,\"applyContent\":\"您好，我是若依\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 13:47:43');
INSERT INTO `sys_oper_log` VALUES (150, '好友申请', 1, 'com.ruoyi.im.controller.ImAddFriendApplyController.add()', 'POST', 1, 'admin', NULL, '/apply', '127.0.0.1', '', '{\"reqUserId\":\"1\",\"origin\":\"1\",\"applyState\":1,\"resUserId\":\"f613572bd0324fc384a830f998c19ee3\",\"params\":{},\"applyId\":\"c5afa51391ca41ff8df3fb7745a904a9\",\"remarkContent\":\"\",\"createTime\":1639288228722,\"applyContent\":\"您好，我是若依\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 13:50:28');
INSERT INTO `sys_oper_log` VALUES (151, '好友申请', 1, 'com.ruoyi.im.controller.ImAddFriendApplyController.add()', 'POST', 1, 'admin', NULL, '/apply', '127.0.0.1', '', '{\"reqUserId\":\"1\",\"origin\":\"1\",\"applyState\":1,\"resUserId\":\"f613572bd0324fc384a830f998c19ee3\",\"params\":{},\"applyId\":\"17e8bfd1686448cda39f05e318fc134a\",\"remarkContent\":\"\",\"createTime\":1639288262189,\"applyContent\":\"您好，我是若依\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 13:51:02');
INSERT INTO `sys_oper_log` VALUES (152, '好友申请', 1, 'com.ruoyi.im.controller.ImAddFriendApplyController.add()', 'POST', 1, 'admin', NULL, '/apply', '127.0.0.1', '', '{\"reqUserId\":\"1\",\"origin\":\"1\",\"applyState\":1,\"resUserId\":\"f613572bd0324fc384a830f998c19ee3\",\"params\":{},\"applyId\":\"951750534ddc47ddb326e40a4392b0d4\",\"remarkContent\":\"\",\"createTime\":1639288267614,\"applyContent\":\"您好，我是若依\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 13:51:07');
INSERT INTO `sys_oper_log` VALUES (153, '好友申请', 1, 'com.ruoyi.im.controller.ImAddFriendApplyController.add()', 'POST', 1, 'admin', NULL, '/apply', '127.0.0.1', '', '{\"reqUserId\":\"1\",\"origin\":\"1\",\"applyState\":1,\"resUserId\":\"f613572bd0324fc384a830f998c19ee3\",\"params\":{},\"applyId\":\"e7b6589d07fa409d8d962d61f2bde0de\",\"remarkContent\":\"\",\"createTime\":1639288308543,\"applyContent\":\"您好，我是若依\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 13:51:48');
INSERT INTO `sys_oper_log` VALUES (154, '好友申请', 1, 'com.ruoyi.im.controller.ImAddFriendApplyController.add()', 'POST', 1, 'admin', NULL, '/apply', '127.0.0.1', '', '{\"reqUserId\":\"1\",\"origin\":\"1\",\"applyState\":1,\"resUserId\":\"f613572bd0324fc384a830f998c19ee3\",\"params\":{},\"applyId\":\"58bd8a4d94a54fa080ba19218b5b44a9\",\"remarkContent\":\"\",\"createTime\":1639288352206,\"applyContent\":\"您好，我是若依\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 13:52:32');
INSERT INTO `sys_oper_log` VALUES (155, '好友申请', 1, 'com.ruoyi.im.controller.ImAddFriendApplyController.add()', 'POST', 1, 'admin', NULL, '/apply', '127.0.0.1', '', '{\"reqUserId\":\"1\",\"origin\":\"1\",\"applyState\":1,\"resUserId\":\"f613572bd0324fc384a830f998c19ee3\",\"params\":{},\"applyId\":\"27fd1d42a95c4af98f66cf4d05838b6c\",\"remarkContent\":\"\",\"createTime\":1639288397855,\"applyContent\":\"您好，我是若依\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 13:53:17');
INSERT INTO `sys_oper_log` VALUES (156, '好友申请', 1, 'com.ruoyi.im.controller.ImAddFriendApplyController.add()', 'POST', 1, 'admin', NULL, '/apply', '127.0.0.1', '', '{\"reqUserId\":\"1\",\"origin\":\"1\",\"applyState\":1,\"resUserId\":\"f613572bd0324fc384a830f998c19ee3\",\"params\":{},\"applyId\":\"5a43cf13a0a74e65a2593d76e6f11d01\",\"remarkContent\":\"张三\",\"createTime\":1639288473591,\"applyContent\":\"您好，我是若依\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 13:54:33');
INSERT INTO `sys_oper_log` VALUES (157, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":106,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"testrole\",\"roleName\":\"测试角色\",\"status\":\"0\"}],\"phonenumber\":\"18312631256\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[4],\"loginIp\":\"\",\"email\":\"18312631256@163.com\",\"nickName\":\"张三的瓜瓜\",\"sex\":\"0\",\"deptId\":101,\"avatar\":\"\",\"dept\":{\"deptName\":\"深圳总公司\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"createBy\":\"admin\",\"roleIds\":[106,1],\"createTime\":1639152461000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 14:07:06');
INSERT INTO `sys_oper_log` VALUES (158, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"},{\"flag\":false,\"roleId\":106,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"testrole\",\"roleName\":\"测试角色\",\"status\":\"0\"}],\"phonenumber\":\"18312631256\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[4],\"loginIp\":\"\",\"email\":\"18312631256@163.com\",\"nickName\":\"张三的瓜瓜\",\"sex\":\"0\",\"deptId\":101,\"avatar\":\"\",\"dept\":{\"deptName\":\"深圳总公司\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"createBy\":\"admin\",\"roleIds\":[1],\"createTime\":1639152461000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 14:09:15');
INSERT INTO `sys_oper_log` VALUES (159, '', 1, 'com.ruoyi.system.controller.SysAppController.add()', 'POST', 1, 'admin', NULL, '/app', '127.0.0.1', '', '{\"appName\":\"im通信\",\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"appUrl\":\"#\",\"params\":{},\"type\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 14:47:54');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"新增用户\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2032,\"menuType\":\"F\",\"perms\":\"system:user:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 14:50:25');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"用户修改\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2033,\"menuType\":\"F\",\"perms\":\"system:user:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 14:50:42');
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"角色新增\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1639291674000,\"updateBy\":\"admin\",\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2023,\"menuType\":\"F\",\"perms\":\"system:user:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 14:50:51');
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"用户查询\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2034,\"menuType\":\"F\",\"perms\":\"system:user:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 14:51:10');
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"用户删除\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2035,\"menuType\":\"F\",\"perms\":\"system:user:remove\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 14:51:23');
INSERT INTO `sys_oper_log` VALUES (165, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":107,\"admin\":false,\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"roleKey\":\"imrole\",\"roleName\":\"im通信角色\",\"deptIds\":[],\"menuIds\":[2020,2021,2022,2032,2023,2033,2024,2034,2025,2035,2026,2027,2028,2029,2030,2031],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 14:52:21');
INSERT INTO `sys_oper_log` VALUES (166, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":1,\"admin\":true,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"status\":\"0\"}],\"phonenumber\":\"18312631256\",\"admin\":false,\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[4],\"loginIp\":\"\",\"email\":\"18312631256@163.com\",\"nickName\":\"张三的瓜瓜\",\"sex\":\"0\",\"deptId\":101,\"avatar\":\"\",\"dept\":{\"deptName\":\"深圳总公司\",\"leader\":\"若依\",\"deptId\":101,\"orderNum\":\"1\",\"params\":{},\"parentId\":100,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"zhangsan\",\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"createBy\":\"admin\",\"roleIds\":[107],\"createTime\":1639152461000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 14:52:30');
INSERT INTO `sys_oper_log` VALUES (167, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"6\",\"menuName\":\"用户列表\",\"params\":{},\"parentId\":2021,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2036,\"menuType\":\"F\",\"perms\":\"system:user:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 14:57:45');
INSERT INTO `sys_oper_log` VALUES (168, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":107,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createTime\":1639291941000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"roleKey\":\"imrole\",\"roleName\":\"im通信角色\",\"menuIds\":[2020,2021,2022,2032,2023,2033,2024,2034,2025,2035,2026,2036,2027,2028,2029,2030,2031],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-12 14:57:56');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"message\",\"orderNum\":\"2\",\"menuName\":\"im通信\",\"params\":{},\"parentId\":2020,\"isCache\":\"0\",\"path\":\"#\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2037,\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:42:25');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2037', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:42:36');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"message\",\"orderNum\":\"2\",\"menuName\":\"im通信\",\"params\":{},\"parentId\":0,\"isCache\":\"0\",\"path\":\"#\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2038,\"menuType\":\"C\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:43:07');
INSERT INTO `sys_oper_log` VALUES (172, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"1\",\"menuName\":\"聊天列表\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2039,\"menuType\":\"F\",\"perms\":\"im:info:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:43:26');
INSERT INTO `sys_oper_log` VALUES (173, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"2\",\"menuName\":\"查询聊天\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2040,\"menuType\":\"F\",\"perms\":\"im:info:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:43:53');
INSERT INTO `sys_oper_log` VALUES (174, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"3\",\"menuName\":\"新增\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2041,\"menuType\":\"F\",\"perms\":\"im:info:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:44:27');
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"4\",\"menuName\":\"聊天列表编辑\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2042,\"menuType\":\"F\",\"perms\":\"im:info:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:44:53');
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"聊天记录新增\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1639460667000,\"updateBy\":\"admin\",\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2041,\"menuType\":\"F\",\"perms\":\"im:info:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:45:08');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"聊天记录查询\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1639460633000,\"updateBy\":\"admin\",\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2040,\"menuType\":\"F\",\"perms\":\"im:info:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:45:18');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"5\",\"menuName\":\"聊天记录\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2043,\"menuType\":\"F\",\"perms\":\"im:detail:list\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:47:05');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"3\",\"menuName\":\"聊天列表新增\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1639460667000,\"updateBy\":\"admin\",\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2041,\"menuType\":\"F\",\"perms\":\"im:info:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:47:12');
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"icon\":\"#\",\"orderNum\":\"2\",\"menuName\":\"聊天列表查询\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"path\":\"\",\"children\":[],\"createTime\":1639460633000,\"updateBy\":\"admin\",\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2040,\"menuType\":\"F\",\"perms\":\"im:info:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:47:21');
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"6\",\"menuName\":\"聊天记录新增\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2044,\"menuType\":\"F\",\"perms\":\"im:detail:add\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:47:48');
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"7\",\"menuName\":\"聊天记录查询\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2045,\"menuType\":\"F\",\"perms\":\"im:detail:query\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:48:06');
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"visible\":\"0\",\"orderNum\":\"8\",\"menuName\":\"聊天记录编辑\",\"params\":{},\"parentId\":2038,\"isCache\":\"0\",\"createBy\":\"admin\",\"children\":[],\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"isFrame\":\"1\",\"menuId\":2046,\"menuType\":\"F\",\"perms\":\"im:detail:edit\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 13:48:22');
INSERT INTO `sys_oper_log` VALUES (184, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"43b73141fc274e3896532e8a3b6b36ea\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639475750048,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"43b73141fc274e3896532e8a3b6b36ea\",\"createTime\":1639475750048,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-14 17:55:50');
INSERT INTO `sys_oper_log` VALUES (185, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"13560a5fd179451baa39d9f3210d1279\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639476052211,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"13560a5fd179451baa39d9f3210d1279\",\"createTime\":1639476052211,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-14 18:00:52');
INSERT INTO `sys_oper_log` VALUES (186, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639476116666,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"createTime\":1639476116666,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-14 18:01:56');
INSERT INTO `sys_oper_log` VALUES (187, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '127.0.0.1', '', '{\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"state\":0}', NULL, 1, 'im:info:add', '2021-12-14 21:41:19');
INSERT INTO `sys_oper_log` VALUES (188, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '127.0.0.1', '', '{\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"state\":0}', NULL, 1, 'im:info:add', '2021-12-14 21:41:24');
INSERT INTO `sys_oper_log` VALUES (189, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"flag\":false,\"roleId\":107,\"admin\":false,\"dataScope\":\"1\",\"delFlag\":\"0\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":true,\"createTime\":1639291941000,\"updateBy\":\"admin\",\"menuCheckStrictly\":true,\"appId\":\"8bd87d43a752404191bdba4067e120be\",\"roleKey\":\"imrole\",\"roleName\":\"im通信角色\",\"menuIds\":[2020,2021,2022,2032,2023,2033,2024,2034,2025,2035,2026,2036,2027,2028,2029,2030,2031,2038,2039,2040,2041,2042,2043,2044,2045,2046],\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 21:46:31');
INSERT INTO `sys_oper_log` VALUES (190, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1635315628000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"若依\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"createBy\":\"admin\",\"roleIds\":[2,107],\"createTime\":1635315628000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 21:46:45');
INSERT INTO `sys_oper_log` VALUES (191, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639489647532,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"createTime\":1639489647532,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-14 21:47:27');
INSERT INTO `sys_oper_log` VALUES (192, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1111\",\"sendTime\":1639490235000,\"chatDetailId\":1,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 21:57:15');
INSERT INTO `sys_oper_log` VALUES (193, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1111\",\"sendTime\":1639490285000,\"chatDetailId\":2,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 21:58:05');
INSERT INTO `sys_oper_log` VALUES (194, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"222\",\"sendTime\":1639490319000,\"chatDetailId\":3,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 21:58:39');
INSERT INTO `sys_oper_log` VALUES (195, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"你好有\",\"sendTime\":1639490326000,\"chatDetailId\":4,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 21:58:46');
INSERT INTO `sys_oper_log` VALUES (196, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"你好有哈哈哈\",\"sendTime\":1639490369000,\"chatDetailId\":5,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 21:59:30');
INSERT INTO `sys_oper_log` VALUES (197, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639492052000,\"chatDetailId\":6,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 22:27:32');
INSERT INTO `sys_oper_log` VALUES (198, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"我是汉三\",\"sendTime\":1639492611000,\"chatDetailId\":7,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 22:36:59');
INSERT INTO `sys_oper_log` VALUES (199, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"真的慢呀\",\"sendTime\":1639492645000,\"chatDetailId\":8,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 22:37:31');
INSERT INTO `sys_oper_log` VALUES (200, '好友申请', 1, 'com.ruoyi.im.controller.ImAddFriendApplyController.add()', 'POST', 1, 'ry', NULL, '/apply', '127.0.0.1', '', '{\"reqUserId\":\"bf937cb42cf84e5295142fc571cbe564\",\"origin\":\"1\",\"applyState\":1,\"resUserId\":\"f613572bd0324fc384a830f998c19ee3\",\"params\":{},\"applyId\":\"bf8b2e864b3b49ec94823da95fa6a1bd\",\"remarkContent\":\"张三\",\"createTime\":1639492961851,\"applyContent\":\"您好，我是若依\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 22:42:47');
INSERT INTO `sys_oper_log` VALUES (201, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"roles\":[{\"flag\":false,\"roleId\":2,\"admin\":false,\"dataScope\":\"2\",\"params\":{},\"roleSort\":\"2\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"status\":\"0\"},{\"flag\":false,\"roleId\":107,\"admin\":false,\"dataScope\":\"1\",\"params\":{},\"roleSort\":\"1\",\"deptCheckStrictly\":false,\"menuCheckStrictly\":false,\"roleKey\":\"imrole\",\"roleName\":\"im通信角色\",\"status\":\"0\"}],\"phonenumber\":\"15666666666\",\"admin\":false,\"loginDate\":1635315628000,\"remark\":\"测试员\",\"delFlag\":\"0\",\"password\":\"\",\"updateBy\":\"admin\",\"postIds\":[2],\"loginIp\":\"127.0.0.1\",\"email\":\"ry@qq.com\",\"nickName\":\"李安平\",\"sex\":\"1\",\"deptId\":105,\"avatar\":\"\",\"dept\":{\"deptName\":\"测试部门\",\"leader\":\"若依\",\"deptId\":105,\"orderNum\":\"3\",\"params\":{},\"parentId\":101,\"children\":[],\"status\":\"0\"},\"params\":{},\"userName\":\"ry\",\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"createBy\":\"admin\",\"roleIds\":[2,107],\"createTime\":1635315628000,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 22:44:48');
INSERT INTO `sys_oper_log` VALUES (202, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"2237ae3cf27b4a31868fa571fe445191\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"bf937cb42cf84e5295142fc571cbe564\",\"createTime\":1639495349842,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"2237ae3cf27b4a31868fa571fe445191\",\"createTime\":1639495349842,\"friendId\":\"bf937cb42cf84e5295142fc571cbe564\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-14 23:22:36');
INSERT INTO `sys_oper_log` VALUES (203, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"你好\",\"sendTime\":1639495465000,\"chatDetailId\":9,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 23:24:45');
INSERT INTO `sys_oper_log` VALUES (204, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"f9c96327b1ca46b29e5d7424e0b03a26\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639495510249,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"f9c96327b1ca46b29e5d7424e0b03a26\",\"createTime\":1639495510249,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\"}}', 0, NULL, '2021-12-14 23:25:16');
INSERT INTO `sys_oper_log` VALUES (205, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"你好\",\"sendTime\":1639495529000,\"chatDetailId\":10,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 23:25:35');
INSERT INTO `sys_oper_log` VALUES (206, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"e0899dcc6f0f4d82a45794d84b7ed2ba\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639495530261,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"e0899dcc6f0f4d82a45794d84b7ed2ba\",\"createTime\":1639495530261,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\"}}', 0, NULL, '2021-12-14 23:25:36');
INSERT INTO `sys_oper_log` VALUES (207, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"4019a8643213491f8160559cd2205e74\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639495530261,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"4019a8643213491f8160559cd2205e74\",\"createTime\":1639495530261,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-14 23:25:36');
INSERT INTO `sys_oper_log` VALUES (208, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"2c58a8708c5f48afbaf2f04e7945e0a0\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639495539422,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"2c58a8708c5f48afbaf2f04e7945e0a0\",\"createTime\":1639495539422,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\"}}', 0, NULL, '2021-12-14 23:25:45');
INSERT INTO `sys_oper_log` VALUES (209, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"你好1\",\"sendTime\":1639495539000,\"chatDetailId\":11,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 23:25:45');
INSERT INTO `sys_oper_log` VALUES (210, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"0c81c2a4903342d6a35332114e4153fc\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639495539753,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"0c81c2a4903342d6a35332114e4153fc\",\"createTime\":1639495539753,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-14 23:25:45');
INSERT INTO `sys_oper_log` VALUES (211, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"sss\",\"sendTime\":1639496176000,\"chatDetailId\":12,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 23:36:23');
INSERT INTO `sys_oper_log` VALUES (212, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"555\",\"sendTime\":1639496313000,\"chatDetailId\":13,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 23:38:40');
INSERT INTO `sys_oper_log` VALUES (213, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639496501000,\"chatDetailId\":14,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 23:41:48');
INSERT INTO `sys_oper_log` VALUES (214, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"12ff\",\"sendTime\":1639496600000,\"chatDetailId\":15,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 23:43:28');
INSERT INTO `sys_oper_log` VALUES (215, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"eeee\",\"sendTime\":1639497264000,\"chatDetailId\":16,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 23:54:30');
INSERT INTO `sys_oper_log` VALUES (216, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"332\",\"sendTime\":1639497474000,\"chatDetailId\":17,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-14 23:58:02');
INSERT INTO `sys_oper_log` VALUES (217, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"sss\",\"sendTime\":1639497604000,\"chatDetailId\":18,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:00:10');
INSERT INTO `sys_oper_log` VALUES (218, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1122\",\"sendTime\":1639497761000,\"chatDetailId\":19,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:03:08');
INSERT INTO `sys_oper_log` VALUES (219, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"4343\",\"sendTime\":1639497799000,\"chatDetailId\":20,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:03:25');
INSERT INTO `sys_oper_log` VALUES (220, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"5445\",\"sendTime\":1639497846000,\"chatDetailId\":21,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:04:13');
INSERT INTO `sys_oper_log` VALUES (221, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"333\",\"sendTime\":1639497885000,\"chatDetailId\":22,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:04:52');
INSERT INTO `sys_oper_log` VALUES (222, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"323\",\"sendTime\":1639497940000,\"chatDetailId\":23,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:05:46');
INSERT INTO `sys_oper_log` VALUES (223, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"323\",\"sendTime\":1639497963000,\"chatDetailId\":24,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:06:09');
INSERT INTO `sys_oper_log` VALUES (224, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639498193000,\"chatDetailId\":25,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:09:59');
INSERT INTO `sys_oper_log` VALUES (225, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"4019a8643213491f8160559cd2205e74\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"1212\",\"sendTime\":1639498193000,\"chatDetailId\":26,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:09:59');
INSERT INTO `sys_oper_log` VALUES (226, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"4019a8643213491f8160559cd2205e74\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"1212\",\"sendTime\":1639498193000,\"chatDetailId\":27,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:09:59');
INSERT INTO `sys_oper_log` VALUES (227, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"4019a8643213491f8160559cd2205e74\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"fgf\",\"sendTime\":1639498205000,\"chatDetailId\":28,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:10:11');
INSERT INTO `sys_oper_log` VALUES (228, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"fgf\",\"sendTime\":1639498205000,\"chatDetailId\":30,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:10:11');
INSERT INTO `sys_oper_log` VALUES (229, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"fgf\",\"sendTime\":1639498205000,\"chatDetailId\":29,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:10:11');
INSERT INTO `sys_oper_log` VALUES (230, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"我是朱晓明\",\"sendTime\":1639498328000,\"chatDetailId\":32,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:12:15');
INSERT INTO `sys_oper_log` VALUES (231, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"4019a8643213491f8160559cd2205e74\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是朱晓明\",\"sendTime\":1639498328000,\"chatDetailId\":31,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:12:15');
INSERT INTO `sys_oper_log` VALUES (232, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"我是朱晓明\",\"sendTime\":1639498328000,\"chatDetailId\":33,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:12:15');
INSERT INTO `sys_oper_log` VALUES (233, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"4019a8643213491f8160559cd2205e74\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你好 我是猴猴\",\"sendTime\":1639498358000,\"chatDetailId\":34,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:12:44');
INSERT INTO `sys_oper_log` VALUES (234, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"你好 我是猴猴\",\"sendTime\":1639498358000,\"chatDetailId\":35,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:12:44');
INSERT INTO `sys_oper_log` VALUES (235, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"4019a8643213491f8160559cd2205e74\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你好 我是猴猴\",\"sendTime\":1639498358000,\"chatDetailId\":36,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:12:44');
INSERT INTO `sys_oper_log` VALUES (236, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"4019a8643213491f8160559cd2205e74\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你好 我是猴猴5555555555555555555555555555555555555555555555555555555\",\"sendTime\":1639498447000,\"chatDetailId\":38,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:14:14');
INSERT INTO `sys_oper_log` VALUES (237, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"你好 我是猴猴5555555555555555555555555555555555555555555555555555555\",\"sendTime\":1639498447000,\"chatDetailId\":37,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:14:15');
INSERT INTO `sys_oper_log` VALUES (238, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"4019a8643213491f8160559cd2205e74\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你好 我是猴猴5555555555555555555555555555555555555555555555555555555\",\"sendTime\":1639498447000,\"chatDetailId\":39,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:14:15');
INSERT INTO `sys_oper_log` VALUES (239, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"好的\",\"sendTime\":1639498526000,\"chatDetailId\":40,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 00:15:33');
INSERT INTO `sys_oper_log` VALUES (240, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是猴猴\",\"sendTime\":1639539797000,\"chatDetailId\":41,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:43:18');
INSERT INTO `sys_oper_log` VALUES (241, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"晚上一起洗个脚啊\",\"sendTime\":1639539849000,\"chatDetailId\":42,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:44:10');
INSERT INTO `sys_oper_log` VALUES (242, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639540127460,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"createTime\":1639540127460,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 11:48:48');
INSERT INTO `sys_oper_log` VALUES (243, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是张三\",\"sendTime\":1639540127000,\"chatDetailId\":43,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:48:48');
INSERT INTO `sys_oper_log` VALUES (244, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"我是张三\",\"sendTime\":1639540127000,\"chatDetailId\":44,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:48:48');
INSERT INTO `sys_oper_log` VALUES (245, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是张三\",\"sendTime\":1639540127000,\"chatDetailId\":45,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:48:48');
INSERT INTO `sys_oper_log` VALUES (246, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是张三\",\"sendTime\":1639540127000,\"chatDetailId\":46,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:48:48');
INSERT INTO `sys_oper_log` VALUES (247, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是张三\",\"sendTime\":1639540127000,\"chatDetailId\":47,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:48:48');
INSERT INTO `sys_oper_log` VALUES (248, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是张三\",\"sendTime\":1639540127000,\"chatDetailId\":48,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:48:48');
INSERT INTO `sys_oper_log` VALUES (249, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是张三\",\"sendTime\":1639540127000,\"chatDetailId\":49,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:48:48');
INSERT INTO `sys_oper_log` VALUES (250, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '172.16.2.29', '', '{\"chatId\":\"4ada78b46eff4a45aae14d3baafedb3d\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639540141434,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"4ada78b46eff4a45aae14d3baafedb3d\",\"createTime\":1639540141434,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 11:49:02');
INSERT INTO `sys_oper_log` VALUES (251, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4ada78b46eff4a45aae14d3baafedb3d\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"我是徐小玲\",\"sendTime\":1639540141000,\"chatDetailId\":50,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:49:02');
INSERT INTO `sys_oper_log` VALUES (252, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是徐小玲\",\"sendTime\":1639540141000,\"chatDetailId\":51,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:49:02');
INSERT INTO `sys_oper_log` VALUES (253, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是徐小玲\",\"sendTime\":1639540141000,\"chatDetailId\":52,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:49:02');
INSERT INTO `sys_oper_log` VALUES (254, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是徐小玲\",\"sendTime\":1639540141000,\"chatDetailId\":53,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:49:02');
INSERT INTO `sys_oper_log` VALUES (255, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是徐小玲\",\"sendTime\":1639540141000,\"chatDetailId\":55,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:49:02');
INSERT INTO `sys_oper_log` VALUES (256, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是徐小玲\",\"sendTime\":1639540141000,\"chatDetailId\":56,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:49:02');
INSERT INTO `sys_oper_log` VALUES (257, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我是徐小玲\",\"sendTime\":1639540141000,\"chatDetailId\":54,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:49:02');
INSERT INTO `sys_oper_log` VALUES (258, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你好\",\"sendTime\":1639540155000,\"chatDetailId\":57,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:49:16');
INSERT INTO `sys_oper_log` VALUES (259, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '172.16.2.29', '', '{\"chatId\":\"80b53bcb084c4be1872bec996a7cdc6c\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639540211252,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"80b53bcb084c4be1872bec996a7cdc6c\",\"createTime\":1639540211252,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 11:50:11');
INSERT INTO `sys_oper_log` VALUES (260, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"风雨无阻\",\"sendTime\":1639540211000,\"chatDetailId\":58,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:50:11');
INSERT INTO `sys_oper_log` VALUES (261, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"80b53bcb084c4be1872bec996a7cdc6c\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"风雨无阻\",\"sendTime\":1639540211000,\"chatDetailId\":59,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:50:12');
INSERT INTO `sys_oper_log` VALUES (262, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"风雨无阻\",\"sendTime\":1639540211000,\"chatDetailId\":60,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:50:12');
INSERT INTO `sys_oper_log` VALUES (263, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"风雨无阻\",\"sendTime\":1639540211000,\"chatDetailId\":62,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:50:12');
INSERT INTO `sys_oper_log` VALUES (264, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"风雨无阻\",\"sendTime\":1639540211000,\"chatDetailId\":63,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:50:12');
INSERT INTO `sys_oper_log` VALUES (265, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"风雨无阻\",\"sendTime\":1639540211000,\"chatDetailId\":61,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:50:12');
INSERT INTO `sys_oper_log` VALUES (266, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"风雨无阻\",\"sendTime\":1639540211000,\"chatDetailId\":64,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:50:12');
INSERT INTO `sys_oper_log` VALUES (267, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"好的\",\"sendTime\":1639540225000,\"chatDetailId\":65,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:50:26');
INSERT INTO `sys_oper_log` VALUES (268, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"你哈\",\"sendTime\":1639540280000,\"chatDetailId\":66,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:51:21');
INSERT INTO `sys_oper_log` VALUES (269, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你哈\",\"sendTime\":1639540280000,\"chatDetailId\":67,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:51:21');
INSERT INTO `sys_oper_log` VALUES (270, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你哈\",\"sendTime\":1639540280000,\"chatDetailId\":68,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:51:21');
INSERT INTO `sys_oper_log` VALUES (271, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你哈\",\"sendTime\":1639540280000,\"chatDetailId\":69,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:51:21');
INSERT INTO `sys_oper_log` VALUES (272, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你哈\",\"sendTime\":1639540280000,\"chatDetailId\":70,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:51:21');
INSERT INTO `sys_oper_log` VALUES (273, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你哈\",\"sendTime\":1639540280000,\"chatDetailId\":71,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:51:21');
INSERT INTO `sys_oper_log` VALUES (274, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你哈\",\"sendTime\":1639540280000,\"chatDetailId\":72,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:51:22');
INSERT INTO `sys_oper_log` VALUES (275, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"不哈\",\"sendTime\":1639540301000,\"chatDetailId\":73,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:51:42');
INSERT INTO `sys_oper_log` VALUES (276, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"中午洗脚 一起\",\"sendTime\":1639540352000,\"chatDetailId\":74,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:52:32');
INSERT INTO `sys_oper_log` VALUES (277, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"中午洗脚 一起\",\"sendTime\":1639540352000,\"chatDetailId\":75,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:52:33');
INSERT INTO `sys_oper_log` VALUES (278, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"中午洗脚 一起\",\"sendTime\":1639540352000,\"chatDetailId\":76,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:52:33');
INSERT INTO `sys_oper_log` VALUES (279, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"中午洗脚 一起\",\"sendTime\":1639540352000,\"chatDetailId\":77,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:52:33');
INSERT INTO `sys_oper_log` VALUES (280, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"中午洗脚 一起\",\"sendTime\":1639540352000,\"chatDetailId\":78,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:52:33');
INSERT INTO `sys_oper_log` VALUES (281, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"中午洗脚 一起\",\"sendTime\":1639540352000,\"chatDetailId\":79,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:52:33');
INSERT INTO `sys_oper_log` VALUES (282, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"中午洗脚 一起\",\"sendTime\":1639540352000,\"chatDetailId\":80,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:52:33');
INSERT INTO `sys_oper_log` VALUES (283, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"为什么你收不到信息\",\"sendTime\":1639540400000,\"chatDetailId\":81,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 11:53:21');
INSERT INTO `sys_oper_log` VALUES (284, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '172.16.2.29', '', '{\"chatId\":\"af794a4d6d3b4f558c85a18f5e182451\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639542092557,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"af794a4d6d3b4f558c85a18f5e182451\",\"createTime\":1639542092557,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 12:21:33');
INSERT INTO `sys_oper_log` VALUES (285, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"af794a4d6d3b4f558c85a18f5e182451\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"Hello\",\"sendTime\":1639542092000,\"chatDetailId\":82,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:21:33');
INSERT INTO `sys_oper_log` VALUES (286, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"Hello\",\"sendTime\":1639542092000,\"chatDetailId\":83,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:21:33');
INSERT INTO `sys_oper_log` VALUES (287, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"sss\",\"sendTime\":1639542165000,\"chatDetailId\":84,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:22:46');
INSERT INTO `sys_oper_log` VALUES (288, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"终于上线了吧\",\"sendTime\":1639542359000,\"chatDetailId\":85,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:26:00');
INSERT INTO `sys_oper_log` VALUES (289, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"终于上线了吧\",\"sendTime\":1639542359000,\"chatDetailId\":86,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:26:00');
INSERT INTO `sys_oper_log` VALUES (290, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"是的 刚刚解决了这个bug\",\"sendTime\":1639542373000,\"chatDetailId\":87,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:26:13');
INSERT INTO `sys_oper_log` VALUES (291, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"是的 刚刚解决了这个bug\",\"sendTime\":1639542373000,\"chatDetailId\":88,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:26:13');
INSERT INTO `sys_oper_log` VALUES (292, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"是的 刚刚解决了这个bug\",\"sendTime\":1639542373000,\"chatDetailId\":89,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:26:13');
INSERT INTO `sys_oper_log` VALUES (293, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"是的 刚刚解决了这个bug\",\"sendTime\":1639542373000,\"chatDetailId\":90,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:26:13');
INSERT INTO `sys_oper_log` VALUES (294, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"不容易呀\",\"sendTime\":1639542390000,\"chatDetailId\":91,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:26:31');
INSERT INTO `sys_oper_log` VALUES (295, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"不容易呀\",\"sendTime\":1639542390000,\"chatDetailId\":92,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:26:31');
INSERT INTO `sys_oper_log` VALUES (296, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"老铁 666\",\"sendTime\":1639542448000,\"chatDetailId\":93,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:27:29');
INSERT INTO `sys_oper_log` VALUES (297, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"老铁 666\",\"sendTime\":1639542448000,\"chatDetailId\":94,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:27:29');
INSERT INTO `sys_oper_log` VALUES (298, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"老铁 666\",\"sendTime\":1639542448000,\"chatDetailId\":95,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:27:29');
INSERT INTO `sys_oper_log` VALUES (299, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"A piece ofcake\",\"sendTime\":1639542475000,\"chatDetailId\":96,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:27:56');
INSERT INTO `sys_oper_log` VALUES (300, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"A piece ofcake\",\"sendTime\":1639542475000,\"chatDetailId\":97,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:27:56');
INSERT INTO `sys_oper_log` VALUES (301, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"A piece ofcake\",\"sendTime\":1639542475000,\"chatDetailId\":99,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:27:56');
INSERT INTO `sys_oper_log` VALUES (302, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"A piece ofcake\",\"sendTime\":1639542475000,\"chatDetailId\":100,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:27:56');
INSERT INTO `sys_oper_log` VALUES (303, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"A piece ofcake\",\"sendTime\":1639542475000,\"chatDetailId\":98,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:27:56');
INSERT INTO `sys_oper_log` VALUES (304, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"又出问题了\",\"sendTime\":1639542550000,\"chatDetailId\":101,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:29:12');
INSERT INTO `sys_oper_log` VALUES (305, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"又出问题了\",\"sendTime\":1639542550000,\"chatDetailId\":102,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:29:12');
INSERT INTO `sys_oper_log` VALUES (306, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"又出问题了\",\"sendTime\":1639542550000,\"chatDetailId\":103,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:29:12');
INSERT INTO `sys_oper_log` VALUES (307, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"出啥问题了\",\"sendTime\":1639542596000,\"chatDetailId\":104,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:29:57');
INSERT INTO `sys_oper_log` VALUES (308, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"出啥问题了\",\"sendTime\":1639542596000,\"chatDetailId\":105,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:29:57');
INSERT INTO `sys_oper_log` VALUES (309, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"出啥问题了\",\"sendTime\":1639542596000,\"chatDetailId\":107,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:29:57');
INSERT INTO `sys_oper_log` VALUES (310, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"出啥问题了\",\"sendTime\":1639542596000,\"chatDetailId\":106,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:29:57');
INSERT INTO `sys_oper_log` VALUES (311, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"出啥问题了\",\"sendTime\":1639542596000,\"chatDetailId\":108,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:29:57');
INSERT INTO `sys_oper_log` VALUES (312, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"聊天记录列表有问题\",\"sendTime\":1639542637000,\"chatDetailId\":109,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:30:37');
INSERT INTO `sys_oper_log` VALUES (313, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"聊天记录列表有问题\",\"sendTime\":1639542637000,\"chatDetailId\":110,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:30:38');
INSERT INTO `sys_oper_log` VALUES (314, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"聊天记录列表有问题\",\"sendTime\":1639542637000,\"chatDetailId\":111,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:30:38');
INSERT INTO `sys_oper_log` VALUES (315, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"聊天记录列表有问题\",\"sendTime\":1639542637000,\"chatDetailId\":112,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:30:38');
INSERT INTO `sys_oper_log` VALUES (316, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"聊天记录列表有问题\",\"sendTime\":1639542637000,\"chatDetailId\":113,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:30:38');
INSERT INTO `sys_oper_log` VALUES (317, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"这个问题我需要解决一下\",\"sendTime\":1639542658000,\"chatDetailId\":114,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:30:58');
INSERT INTO `sys_oper_log` VALUES (318, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"这个问题我需要解决一下\",\"sendTime\":1639542658000,\"chatDetailId\":115,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:30:58');
INSERT INTO `sys_oper_log` VALUES (319, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"好的好的\",\"sendTime\":1639542701000,\"chatDetailId\":116,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:31:42');
INSERT INTO `sys_oper_log` VALUES (320, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"好的好的\",\"sendTime\":1639542701000,\"chatDetailId\":117,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:31:42');
INSERT INTO `sys_oper_log` VALUES (321, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"好的好的\",\"sendTime\":1639542701000,\"chatDetailId\":118,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:31:42');
INSERT INTO `sys_oper_log` VALUES (322, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"好的好的\",\"sendTime\":1639542701000,\"chatDetailId\":119,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:31:42');
INSERT INTO `sys_oper_log` VALUES (323, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"好的好的\",\"sendTime\":1639542701000,\"chatDetailId\":120,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:31:42');
INSERT INTO `sys_oper_log` VALUES (324, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"睡觉吧\",\"sendTime\":1639542749000,\"chatDetailId\":121,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:32:30');
INSERT INTO `sys_oper_log` VALUES (325, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"睡觉吧\",\"sendTime\":1639542749000,\"chatDetailId\":122,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:32:30');
INSERT INTO `sys_oper_log` VALUES (326, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"睡觉吧\",\"sendTime\":1639542749000,\"chatDetailId\":123,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:32:30');
INSERT INTO `sys_oper_log` VALUES (327, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"睡觉吧\",\"sendTime\":1639542749000,\"chatDetailId\":124,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:32:30');
INSERT INTO `sys_oper_log` VALUES (328, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"睡觉吧\",\"sendTime\":1639542749000,\"chatDetailId\":125,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:32:30');
INSERT INTO `sys_oper_log` VALUES (329, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"连不上了\",\"sendTime\":1639542821000,\"chatDetailId\":126,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:33:42');
INSERT INTO `sys_oper_log` VALUES (330, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"连不上了\",\"sendTime\":1639542821000,\"chatDetailId\":127,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:33:42');
INSERT INTO `sys_oper_log` VALUES (331, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"连不上了\",\"sendTime\":1639542821000,\"chatDetailId\":128,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:33:42');
INSERT INTO `sys_oper_log` VALUES (332, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"连不上了\",\"sendTime\":1639542821000,\"chatDetailId\":129,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:33:42');
INSERT INTO `sys_oper_log` VALUES (333, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"连不上了\",\"sendTime\":1639542821000,\"chatDetailId\":130,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:33:42');
INSERT INTO `sys_oper_log` VALUES (334, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"连不上了\",\"sendTime\":1639542821000,\"chatDetailId\":131,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:33:42');
INSERT INTO `sys_oper_log` VALUES (335, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"可以的\",\"sendTime\":1639542831000,\"chatDetailId\":132,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:33:51');
INSERT INTO `sys_oper_log` VALUES (336, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"可以的\",\"sendTime\":1639542831000,\"chatDetailId\":133,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:33:52');
INSERT INTO `sys_oper_log` VALUES (337, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"可以的\",\"sendTime\":1639542831000,\"chatDetailId\":134,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:33:52');
INSERT INTO `sys_oper_log` VALUES (338, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"可以的\",\"sendTime\":1639542831000,\"chatDetailId\":136,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:33:52');
INSERT INTO `sys_oper_log` VALUES (339, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"可以的\",\"sendTime\":1639542831000,\"chatDetailId\":135,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:33:52');
INSERT INTO `sys_oper_log` VALUES (340, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"可以的\",\"sendTime\":1639542831000,\"chatDetailId\":137,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 12:33:52');
INSERT INTO `sys_oper_log` VALUES (341, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '172.16.2.29', '', '{\"chatId\":\"4f31acaa566744549c87f85d723d5c58\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"你是谁\",\"sendTime\":1639557431000,\"chatDetailId\":138,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 16:37:12');
INSERT INTO `sys_oper_log` VALUES (342, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你是谁\",\"sendTime\":1639557431000,\"chatDetailId\":139,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 16:37:12');
INSERT INTO `sys_oper_log` VALUES (343, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你是谁\",\"sendTime\":1639557431000,\"chatDetailId\":140,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 16:37:12');
INSERT INTO `sys_oper_log` VALUES (344, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你是谁\",\"sendTime\":1639557431000,\"chatDetailId\":141,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 16:37:12');
INSERT INTO `sys_oper_log` VALUES (345, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"我去\",\"sendTime\":1639571939000,\"chatDetailId\":143,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 20:39:14');
INSERT INTO `sys_oper_log` VALUES (346, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"111\",\"sendTime\":1639571925000,\"chatDetailId\":142,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 20:39:15');
INSERT INTO `sys_oper_log` VALUES (347, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"我去？、\",\"sendTime\":1639571950000,\"chatDetailId\":144,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 20:39:17');
INSERT INTO `sys_oper_log` VALUES (348, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"121\",\"sendTime\":1639578627000,\"chatDetailId\":145,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:30:35');
INSERT INTO `sys_oper_log` VALUES (349, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"12323\",\"sendTime\":1639578640000,\"chatDetailId\":146,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:30:47');
INSERT INTO `sys_oper_log` VALUES (350, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"23213\",\"sendTime\":1639578672000,\"chatDetailId\":147,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:31:19');
INSERT INTO `sys_oper_log` VALUES (351, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"6666\",\"sendTime\":1639578680000,\"chatDetailId\":148,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:31:27');
INSERT INTO `sys_oper_log` VALUES (352, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"121\",\"sendTime\":1639578843000,\"chatDetailId\":149,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:34:10');
INSERT INTO `sys_oper_log` VALUES (353, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"wwww\",\"sendTime\":1639578886000,\"chatDetailId\":150,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:34:54');
INSERT INTO `sys_oper_log` VALUES (354, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"255222\",\"sendTime\":1639579097000,\"chatDetailId\":151,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:38:25');
INSERT INTO `sys_oper_log` VALUES (355, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"969666\",\"sendTime\":1639579111000,\"chatDetailId\":152,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:38:38');
INSERT INTO `sys_oper_log` VALUES (356, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1111\",\"sendTime\":1639579521000,\"chatDetailId\":153,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:45:28');
INSERT INTO `sys_oper_log` VALUES (357, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"121\",\"sendTime\":1639579925000,\"chatDetailId\":154,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:52:12');
INSERT INTO `sys_oper_log` VALUES (358, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"333\",\"sendTime\":1639580150000,\"chatDetailId\":155,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:55:57');
INSERT INTO `sys_oper_log` VALUES (359, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"fda24ff056984bdc937d18a6e6316f1a\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639580277952,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"fda24ff056984bdc937d18a6e6316f1a\",\"createTime\":1639580277952,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 22:58:04');
INSERT INTO `sys_oper_log` VALUES (360, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"fda24ff056984bdc937d18a6e6316f1a\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"\",\"sendTime\":1639580284000,\"chatDetailId\":156,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:58:05');
INSERT INTO `sys_oper_log` VALUES (361, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"b481179faa05467d974bc4c5f467d842\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639580286282,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"b481179faa05467d974bc4c5f467d842\",\"createTime\":1639580286282,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 22:58:13');
INSERT INTO `sys_oper_log` VALUES (362, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"b481179faa05467d974bc4c5f467d842\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"\",\"sendTime\":1639580292000,\"chatDetailId\":157,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:58:13');
INSERT INTO `sys_oper_log` VALUES (363, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'ry', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"b53d88452cc74bcebe3c5b1cc4fe84f6\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580292586,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"b53d88452cc74bcebe3c5b1cc4fe84f6\",\"createTime\":1639580292586,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\"}}', 0, NULL, '2021-12-15 22:58:19');
INSERT INTO `sys_oper_log` VALUES (364, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'ry', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639580292000,\"chatDetailId\":158,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:58:19');
INSERT INTO `sys_oper_log` VALUES (365, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'ry', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"b53d88452cc74bcebe3c5b1cc4fe84f6\",\"params\":{},\"type\":1,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"content\":\"\",\"sendTime\":1639580292000,\"chatDetailId\":159,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:58:19');
INSERT INTO `sys_oper_log` VALUES (366, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'ry', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"8802c8f35d864a5c8f282d9023ef6035\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580292939,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"8802c8f35d864a5c8f282d9023ef6035\",\"createTime\":1639580292939,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\"}}', 0, NULL, '2021-12-15 22:58:19');
INSERT INTO `sys_oper_log` VALUES (367, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'ry', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"8802c8f35d864a5c8f282d9023ef6035\",\"params\":{},\"type\":1,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"content\":\"1212\",\"sendTime\":1639580292000,\"chatDetailId\":160,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:58:19');
INSERT INTO `sys_oper_log` VALUES (368, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"1a0d7fd4d5a840ae934f4c1b28f6141b\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639580306140,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"1a0d7fd4d5a840ae934f4c1b28f6141b\",\"createTime\":1639580306140,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 22:58:32');
INSERT INTO `sys_oper_log` VALUES (369, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"1a0d7fd4d5a840ae934f4c1b28f6141b\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"\",\"sendTime\":1639580312000,\"chatDetailId\":161,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:58:33');
INSERT INTO `sys_oper_log` VALUES (370, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'ry', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"d3853ad57db942bb91afc8b0a5da7c1e\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580317311,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"d3853ad57db942bb91afc8b0a5da7c1e\",\"createTime\":1639580317311,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\"}}', 0, NULL, '2021-12-15 22:58:44');
INSERT INTO `sys_oper_log` VALUES (371, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'ry', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"c08db8f081f64135a1916c70f31ee9cb\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"45454\",\"sendTime\":1639580316000,\"chatDetailId\":162,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:58:44');
INSERT INTO `sys_oper_log` VALUES (372, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'ry', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"d3853ad57db942bb91afc8b0a5da7c1e\",\"params\":{},\"type\":1,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"content\":\"\",\"sendTime\":1639580316000,\"chatDetailId\":163,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:58:44');
INSERT INTO `sys_oper_log` VALUES (373, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'ry', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"43dc51d811dc4f6fa02e8c9e5f653613\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580317671,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"43dc51d811dc4f6fa02e8c9e5f653613\",\"createTime\":1639580317671,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\"}}', 0, NULL, '2021-12-15 22:58:44');
INSERT INTO `sys_oper_log` VALUES (374, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'ry', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"43dc51d811dc4f6fa02e8c9e5f653613\",\"params\":{},\"type\":1,\"userId\":\"bf937cb42cf84e5295142fc571cbe564\",\"content\":\"45454\",\"sendTime\":1639580316000,\"chatDetailId\":164,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 22:58:44');
INSERT INTO `sys_oper_log` VALUES (375, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639580413699,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"createTime\":1639580413699,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:00:20');
INSERT INTO `sys_oper_log` VALUES (376, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580413993,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"createTime\":1639580413993,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:00:20');
INSERT INTO `sys_oper_log` VALUES (377, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"12212\",\"sendTime\":1639580413000,\"chatDetailId\":165,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:00:20');
INSERT INTO `sys_oper_log` VALUES (378, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"\",\"sendTime\":1639580413000,\"chatDetailId\":166,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:00:21');
INSERT INTO `sys_oper_log` VALUES (379, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"傻逼\",\"sendTime\":1639580464000,\"chatDetailId\":167,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:01:11');
INSERT INTO `sys_oper_log` VALUES (380, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"08d74a73faa04740a0b33330696997c0\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639580464756,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"08d74a73faa04740a0b33330696997c0\",\"createTime\":1639580464756,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:01:11');
INSERT INTO `sys_oper_log` VALUES (381, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"傻逼\",\"sendTime\":1639580464000,\"chatDetailId\":168,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:01:11');
INSERT INTO `sys_oper_log` VALUES (382, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"傻逼\",\"sendTime\":1639580464000,\"chatDetailId\":169,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:01:11');
INSERT INTO `sys_oper_log` VALUES (383, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"08d74a73faa04740a0b33330696997c0\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"傻逼\",\"sendTime\":1639580464000,\"chatDetailId\":170,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:01:11');
INSERT INTO `sys_oper_log` VALUES (384, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"干嘛\",\"sendTime\":1639580472000,\"chatDetailId\":171,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:01:19');
INSERT INTO `sys_oper_log` VALUES (385, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"2333\",\"sendTime\":1639580507000,\"chatDetailId\":172,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:01:54');
INSERT INTO `sys_oper_log` VALUES (386, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"a4cf578f3c2348328c9f1838a4e4d3bc\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639580507847,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"a4cf578f3c2348328c9f1838a4e4d3bc\",\"createTime\":1639580507847,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:01:54');
INSERT INTO `sys_oper_log` VALUES (387, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"2333\",\"sendTime\":1639580507000,\"chatDetailId\":173,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:01:54');
INSERT INTO `sys_oper_log` VALUES (388, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"2333\",\"sendTime\":1639580507000,\"chatDetailId\":174,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:01:54');
INSERT INTO `sys_oper_log` VALUES (389, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"a4cf578f3c2348328c9f1838a4e4d3bc\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"2333\",\"sendTime\":1639580507000,\"chatDetailId\":175,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:01:54');
INSERT INTO `sys_oper_log` VALUES (390, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"45454\",\"sendTime\":1639580510000,\"chatDetailId\":176,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:01:57');
INSERT INTO `sys_oper_log` VALUES (391, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"3333\",\"sendTime\":1639580524000,\"chatDetailId\":177,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:02:12');
INSERT INTO `sys_oper_log` VALUES (392, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"5555\",\"sendTime\":1639580649000,\"chatDetailId\":178,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:04:16');
INSERT INTO `sys_oper_log` VALUES (393, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"5555\",\"sendTime\":1639580649000,\"chatDetailId\":179,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:04:16');
INSERT INTO `sys_oper_log` VALUES (394, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"呼呼\",\"sendTime\":1639580654000,\"chatDetailId\":180,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:04:21');
INSERT INTO `sys_oper_log` VALUES (395, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"呼呼\",\"sendTime\":1639580654000,\"chatDetailId\":181,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:04:21');
INSERT INTO `sys_oper_log` VALUES (396, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"呼呼呼呼\",\"sendTime\":1639580661000,\"chatDetailId\":182,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:04:28');
INSERT INTO `sys_oper_log` VALUES (397, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"呼呼呼呼\",\"sendTime\":1639580661000,\"chatDetailId\":183,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:04:28');
INSERT INTO `sys_oper_log` VALUES (398, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"888888\",\"sendTime\":1639580687000,\"chatDetailId\":184,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:04:54');
INSERT INTO `sys_oper_log` VALUES (399, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"888888\",\"sendTime\":1639580687000,\"chatDetailId\":185,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:04:54');
INSERT INTO `sys_oper_log` VALUES (400, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"睡觉\",\"sendTime\":1639580699000,\"chatDetailId\":187,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:05:06');
INSERT INTO `sys_oper_log` VALUES (401, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"睡觉\",\"sendTime\":1639580699000,\"chatDetailId\":186,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:05:06');
INSERT INTO `sys_oper_log` VALUES (402, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"99999\",\"sendTime\":1639580705000,\"chatDetailId\":188,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:05:12');
INSERT INTO `sys_oper_log` VALUES (403, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"99999\",\"sendTime\":1639580705000,\"chatDetailId\":189,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:05:12');
INSERT INTO `sys_oper_log` VALUES (404, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"33212222\",\"sendTime\":1639580710000,\"chatDetailId\":190,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:05:17');
INSERT INTO `sys_oper_log` VALUES (405, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"33212222\",\"sendTime\":1639580710000,\"chatDetailId\":191,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:05:17');
INSERT INTO `sys_oper_log` VALUES (406, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"eef89353dd734fac9e90609a049fc9da\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"996666\",\"sendTime\":1639580722000,\"chatDetailId\":192,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:05:29');
INSERT INTO `sys_oper_log` VALUES (407, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"e736590f2b0d486da72fb7575994437b\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"996666\",\"sendTime\":1639580722000,\"chatDetailId\":193,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:05:29');
INSERT INTO `sys_oper_log` VALUES (408, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.12', '', '{\"chatId\":\"6d37191bd2da428abff7711972989eec\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580905640,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"6d37191bd2da428abff7711972989eec\",\"createTime\":1639580905640,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:08:32');
INSERT INTO `sys_oper_log` VALUES (409, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.12', '', '{\"chatId\":\"2ee4b7f4f5ec4772b97d77922040a844\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580905613,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"2ee4b7f4f5ec4772b97d77922040a844\",\"createTime\":1639580905613,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:08:32');
INSERT INTO `sys_oper_log` VALUES (410, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.12', '', '{\"chatId\":\"2ee4b7f4f5ec4772b97d77922040a844\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你好\",\"sendTime\":1639580912000,\"chatDetailId\":194,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:08:32');
INSERT INTO `sys_oper_log` VALUES (411, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.12', '', '{\"chatId\":\"f286acaa0d86489bbc468b0002f40f72\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580910487,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"f286acaa0d86489bbc468b0002f40f72\",\"createTime\":1639580910487,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:08:37');
INSERT INTO `sys_oper_log` VALUES (412, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.12', '', '{\"chatId\":\"549a220551fe490b841786bd589e3103\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580910774,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"549a220551fe490b841786bd589e3103\",\"createTime\":1639580910774,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:08:37');
INSERT INTO `sys_oper_log` VALUES (413, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.12', '', '{\"chatId\":\"f286acaa0d86489bbc468b0002f40f72\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我发了\",\"sendTime\":1639580917000,\"chatDetailId\":195,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:08:37');
INSERT INTO `sys_oper_log` VALUES (414, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.12', '', '{\"chatId\":\"b2b7ff085a554093b8b9bb2c81fba19b\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580913997,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"b2b7ff085a554093b8b9bb2c81fba19b\",\"createTime\":1639580913997,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:08:40');
INSERT INTO `sys_oper_log` VALUES (415, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.12', '', '{\"chatId\":\"b2b7ff085a554093b8b9bb2c81fba19b\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"Ghvg\",\"sendTime\":1639580920000,\"chatDetailId\":196,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:08:40');
INSERT INTO `sys_oper_log` VALUES (416, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"fda24ff056984bdc937d18a6e6316f1a\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"Ghvg\",\"sendTime\":1639580920000,\"chatDetailId\":197,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:08:41');
INSERT INTO `sys_oper_log` VALUES (417, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.12', '', '{\"chatId\":\"ecfc5edd7fab4a259684ecddf06636b7\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580963965,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"ecfc5edd7fab4a259684ecddf06636b7\",\"createTime\":1639580963965,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:09:30');
INSERT INTO `sys_oper_log` VALUES (418, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.12', '', '{\"chatId\":\"a8771ed2993d446b8d22f4a64cac17b3\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580964065,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"a8771ed2993d446b8d22f4a64cac17b3\",\"createTime\":1639580964065,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:09:30');
INSERT INTO `sys_oper_log` VALUES (419, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.12', '', '{\"chatId\":\"ecfc5edd7fab4a259684ecddf06636b7\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"卧槽\",\"sendTime\":1639580970000,\"chatDetailId\":198,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:09:30');
INSERT INTO `sys_oper_log` VALUES (420, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"fda24ff056984bdc937d18a6e6316f1a\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"Rfcg\",\"sendTime\":1639580993000,\"chatDetailId\":199,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:09:53');
INSERT INTO `sys_oper_log` VALUES (421, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.12', '', '{\"chatId\":\"98a95ae345af455f9fa5a41e4cf62814\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580986645,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"98a95ae345af455f9fa5a41e4cf62814\",\"createTime\":1639580986645,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:09:53');
INSERT INTO `sys_oper_log` VALUES (422, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.12', '', '{\"chatId\":\"98a95ae345af455f9fa5a41e4cf62814\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"Rfcg\",\"sendTime\":1639580993000,\"chatDetailId\":200,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:09:53');
INSERT INTO `sys_oper_log` VALUES (423, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.12', '', '{\"chatId\":\"8b97a722908e44619747f3c636729c03\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580993439,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"8b97a722908e44619747f3c636729c03\",\"createTime\":1639580993439,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:10:00');
INSERT INTO `sys_oper_log` VALUES (424, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"fda24ff056984bdc937d18a6e6316f1a\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"格格\",\"sendTime\":1639580999000,\"chatDetailId\":201,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:10:00');
INSERT INTO `sys_oper_log` VALUES (425, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.12', '', '{\"chatId\":\"8b97a722908e44619747f3c636729c03\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"格格\",\"sendTime\":1639580999000,\"chatDetailId\":202,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:10:00');
INSERT INTO `sys_oper_log` VALUES (426, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.12', '', '{\"chatId\":\"b36da6224dbc4b9189aff99137aedcd8\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639580998381,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"b36da6224dbc4b9189aff99137aedcd8\",\"createTime\":1639580998381,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:10:05');
INSERT INTO `sys_oper_log` VALUES (427, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.12', '', '{\"chatId\":\"b36da6224dbc4b9189aff99137aedcd8\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"写\",\"sendTime\":1639581004000,\"chatDetailId\":203,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:10:05');
INSERT INTO `sys_oper_log` VALUES (428, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"fda24ff056984bdc937d18a6e6316f1a\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"写\",\"sendTime\":1639581004000,\"chatDetailId\":204,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:10:05');
INSERT INTO `sys_oper_log` VALUES (429, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"fda24ff056984bdc937d18a6e6316f1a\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"Hbjhhb\",\"sendTime\":1639581019000,\"chatDetailId\":205,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:10:19');
INSERT INTO `sys_oper_log` VALUES (430, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.12', '', '{\"chatId\":\"e89252dde76d44d4a5ff7d4c2a452c3d\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639581013180,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"e89252dde76d44d4a5ff7d4c2a452c3d\",\"createTime\":1639581013180,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:10:20');
INSERT INTO `sys_oper_log` VALUES (431, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.12', '', '{\"chatId\":\"e89252dde76d44d4a5ff7d4c2a452c3d\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"Hbjhhb\",\"sendTime\":1639581019000,\"chatDetailId\":206,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:10:20');
INSERT INTO `sys_oper_log` VALUES (432, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"e559435f37494deeb8ffb049849fa0cd\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581592006,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"e559435f37494deeb8ffb049849fa0cd\",\"createTime\":1639581592006,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:19:58');
INSERT INTO `sys_oper_log` VALUES (433, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"e559435f37494deeb8ffb049849fa0cd\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"你好\",\"sendTime\":1639581598000,\"chatDetailId\":207,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:19:58');
INSERT INTO `sys_oper_log` VALUES (434, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639581592140,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"createTime\":1639581592140,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:19:58');
INSERT INTO `sys_oper_log` VALUES (435, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你好\",\"sendTime\":1639581598000,\"chatDetailId\":208,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:19:59');
INSERT INTO `sys_oper_log` VALUES (436, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.3', '', '{\"chatId\":\"715ca67439054ced8dbd5760ae9bb27c\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639581598289,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"715ca67439054ced8dbd5760ae9bb27c\",\"createTime\":1639581598289,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:20:05');
INSERT INTO `sys_oper_log` VALUES (437, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"c554906fa74641308047e35463b8690e\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581598398,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"c554906fa74641308047e35463b8690e\",\"createTime\":1639581598398,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:20:05');
INSERT INTO `sys_oper_log` VALUES (438, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"715ca67439054ced8dbd5760ae9bb27c\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"在干嘛\",\"sendTime\":1639581608000,\"chatDetailId\":209,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:20:05');
INSERT INTO `sys_oper_log` VALUES (439, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"c554906fa74641308047e35463b8690e\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"在干嘛\",\"sendTime\":1639581608000,\"chatDetailId\":210,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:20:05');
INSERT INTO `sys_oper_log` VALUES (440, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"40e73281fa1348c29b901f7d8494a6ef\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581608242,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"40e73281fa1348c29b901f7d8494a6ef\",\"createTime\":1639581608242,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:20:15');
INSERT INTO `sys_oper_log` VALUES (441, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.3', '', '{\"chatId\":\"ff626ad4646543f69d4829142800a84d\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639581608328,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"ff626ad4646543f69d4829142800a84d\",\"createTime\":1639581608328,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:20:15');
INSERT INTO `sys_oper_log` VALUES (442, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"40e73281fa1348c29b901f7d8494a6ef\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"我在洗脚\",\"sendTime\":1639581614000,\"chatDetailId\":211,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:20:15');
INSERT INTO `sys_oper_log` VALUES (443, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"ff626ad4646543f69d4829142800a84d\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"我在洗脚\",\"sendTime\":1639581614000,\"chatDetailId\":212,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:20:15');
INSERT INTO `sys_oper_log` VALUES (444, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.3', '', '{\"chatId\":\"9458d9fcb2474929bd7a7e2fa73125db\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639581630596,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"9458d9fcb2474929bd7a7e2fa73125db\",\"createTime\":1639581630596,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:20:37');
INSERT INTO `sys_oper_log` VALUES (445, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"61bdc7b461a6483a93ae572bd2dd11fa\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581630727,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"61bdc7b461a6483a93ae572bd2dd11fa\",\"createTime\":1639581630727,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:20:37');
INSERT INTO `sys_oper_log` VALUES (446, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"9458d9fcb2474929bd7a7e2fa73125db\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"洗个屁呀\",\"sendTime\":1639581641000,\"chatDetailId\":213,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:20:37');
INSERT INTO `sys_oper_log` VALUES (447, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"61bdc7b461a6483a93ae572bd2dd11fa\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"洗个屁呀\",\"sendTime\":1639581641000,\"chatDetailId\":214,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:20:37');
INSERT INTO `sys_oper_log` VALUES (448, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"71d5b32725f1475bbd048b1e8386bf19\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581651410,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"71d5b32725f1475bbd048b1e8386bf19\",\"createTime\":1639581651410,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:20:58');
INSERT INTO `sys_oper_log` VALUES (449, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.3', '', '{\"chatId\":\"e4c131d7b6834fa5b3d52fff9aa20296\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639581651525,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"e4c131d7b6834fa5b3d52fff9aa20296\",\"createTime\":1639581651525,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:20:58');
INSERT INTO `sys_oper_log` VALUES (450, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"71d5b32725f1475bbd048b1e8386bf19\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"一起大保健呀\",\"sendTime\":1639581657000,\"chatDetailId\":215,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:20:58');
INSERT INTO `sys_oper_log` VALUES (451, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"e4c131d7b6834fa5b3d52fff9aa20296\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"一起大保健呀\",\"sendTime\":1639581657000,\"chatDetailId\":216,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:20:58');
INSERT INTO `sys_oper_log` VALUES (452, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.3', '', '{\"chatId\":\"00a1d0f8f6484476aa91db39e394ecdd\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639581664684,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"00a1d0f8f6484476aa91db39e394ecdd\",\"createTime\":1639581664684,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:21:11');
INSERT INTO `sys_oper_log` VALUES (453, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"00a1d0f8f6484476aa91db39e394ecdd\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"realy\",\"sendTime\":1639581675000,\"chatDetailId\":217,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:21:11');
INSERT INTO `sys_oper_log` VALUES (454, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"f745eb19e40443ff8cd5b486f101ab24\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581664845,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"f745eb19e40443ff8cd5b486f101ab24\",\"createTime\":1639581664845,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:21:11');
INSERT INTO `sys_oper_log` VALUES (455, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"f745eb19e40443ff8cd5b486f101ab24\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"realy\",\"sendTime\":1639581675000,\"chatDetailId\":218,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:21:11');
INSERT INTO `sys_oper_log` VALUES (456, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"f7108313a372440880e6581590781d45\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581678172,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"f7108313a372440880e6581590781d45\",\"createTime\":1639581678172,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:21:25');
INSERT INTO `sys_oper_log` VALUES (457, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.3', '', '{\"chatId\":\"139bb1ee7fec4e918062477fe2cdde3e\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639581678245,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"139bb1ee7fec4e918062477fe2cdde3e\",\"createTime\":1639581678245,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:21:25');
INSERT INTO `sys_oper_log` VALUES (458, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"f7108313a372440880e6581590781d45\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"Of course\",\"sendTime\":1639581684000,\"chatDetailId\":219,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:21:25');
INSERT INTO `sys_oper_log` VALUES (459, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"139bb1ee7fec4e918062477fe2cdde3e\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"Of course\",\"sendTime\":1639581684000,\"chatDetailId\":220,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:21:25');
INSERT INTO `sys_oper_log` VALUES (460, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.3', '', '{\"chatId\":\"ae1e294d43da4fd1bfe7e8d92f8c0c26\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639581697805,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"ae1e294d43da4fd1bfe7e8d92f8c0c26\",\"createTime\":1639581697805,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:21:44');
INSERT INTO `sys_oper_log` VALUES (461, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"ee49f1eb8a3943358d94248fbe370359\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581697911,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"ee49f1eb8a3943358d94248fbe370359\",\"createTime\":1639581697911,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:21:44');
INSERT INTO `sys_oper_log` VALUES (462, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"ae1e294d43da4fd1bfe7e8d92f8c0c26\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"那走呀\",\"sendTime\":1639581708000,\"chatDetailId\":221,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:21:44');
INSERT INTO `sys_oper_log` VALUES (463, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"ee49f1eb8a3943358d94248fbe370359\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"那走呀\",\"sendTime\":1639581708000,\"chatDetailId\":222,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:21:44');
INSERT INTO `sys_oper_log` VALUES (464, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"5647aab19076428383cdb257efd9fff8\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581739014,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"5647aab19076428383cdb257efd9fff8\",\"createTime\":1639581739014,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:22:25');
INSERT INTO `sys_oper_log` VALUES (465, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"5647aab19076428383cdb257efd9fff8\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"走走走\",\"sendTime\":1639581745000,\"chatDetailId\":223,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:22:25');
INSERT INTO `sys_oper_log` VALUES (466, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.3', '', '{\"chatId\":\"5e1e32ce0a77415499b5b6816521dab7\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639581739181,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"5e1e32ce0a77415499b5b6816521dab7\",\"createTime\":1639581739181,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:22:26');
INSERT INTO `sys_oper_log` VALUES (467, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"5e1e32ce0a77415499b5b6816521dab7\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"走走走\",\"sendTime\":1639581745000,\"chatDetailId\":224,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:22:26');
INSERT INTO `sys_oper_log` VALUES (468, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"519c1a2014a04deb889397091929eb0e\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581782794,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"519c1a2014a04deb889397091929eb0e\",\"createTime\":1639581782794,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:23:09');
INSERT INTO `sys_oper_log` VALUES (469, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'admin', NULL, '/info', '192.168.1.3', '', '{\"chatId\":\"a4b36b9a6bc241768216475fe87dbc0d\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"1\",\"hide\":0,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"createTime\":1639581782907,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"a4b36b9a6bc241768216475fe87dbc0d\",\"createTime\":1639581782907,\"friendId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"1\"}}', 0, NULL, '2021-12-15 23:23:09');
INSERT INTO `sys_oper_log` VALUES (470, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"519c1a2014a04deb889397091929eb0e\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"明天湖人能赢吗\",\"sendTime\":1639581789000,\"chatDetailId\":225,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:23:09');
INSERT INTO `sys_oper_log` VALUES (471, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"a4b36b9a6bc241768216475fe87dbc0d\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"明天湖人能赢吗\",\"sendTime\":1639581789000,\"chatDetailId\":226,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:23:09');
INSERT INTO `sys_oper_log` VALUES (472, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"55b14e0556fe40769c58e1a3d92e147d\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581822561,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"55b14e0556fe40769c58e1a3d92e147d\",\"createTime\":1639581822561,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:23:49');
INSERT INTO `sys_oper_log` VALUES (473, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"55b14e0556fe40769c58e1a3d92e147d\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"人呢\",\"sendTime\":1639581829000,\"chatDetailId\":227,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:23:49');
INSERT INTO `sys_oper_log` VALUES (474, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"卧槽 他妈的聊天记录呢\",\"sendTime\":1639581857000,\"chatDetailId\":228,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:24:13');
INSERT INTO `sys_oper_log` VALUES (475, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"b7adf70fb581485e85a5f2e07a371688\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581846496,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"b7adf70fb581485e85a5f2e07a371688\",\"createTime\":1639581846496,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:24:13');
INSERT INTO `sys_oper_log` VALUES (476, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"b7adf70fb581485e85a5f2e07a371688\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"卧槽 他妈的聊天记录呢\",\"sendTime\":1639581857000,\"chatDetailId\":229,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:24:13');
INSERT INTO `sys_oper_log` VALUES (477, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"a06e9869624b4dbb98a6609f4df02b32\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581853940,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"a06e9869624b4dbb98a6609f4df02b32\",\"createTime\":1639581853940,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:24:20');
INSERT INTO `sys_oper_log` VALUES (478, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"a06e9869624b4dbb98a6609f4df02b32\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"你问谁的呀\",\"sendTime\":1639581860000,\"chatDetailId\":230,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:24:20');
INSERT INTO `sys_oper_log` VALUES (479, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你问谁的呀\",\"sendTime\":1639581860000,\"chatDetailId\":231,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:24:21');
INSERT INTO `sys_oper_log` VALUES (480, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"全套啊没了\",\"sendTime\":1639581874000,\"chatDetailId\":232,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:24:30');
INSERT INTO `sys_oper_log` VALUES (481, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"212b329a56de4612a0d31fdb455ea70c\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581863595,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"212b329a56de4612a0d31fdb455ea70c\",\"createTime\":1639581863595,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:24:30');
INSERT INTO `sys_oper_log` VALUES (482, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"212b329a56de4612a0d31fdb455ea70c\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"全套啊没了\",\"sendTime\":1639581874000,\"chatDetailId\":233,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:24:30');
INSERT INTO `sys_oper_log` VALUES (483, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"09f4de3590f94958b6a63b626c636e85\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581879809,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"09f4de3590f94958b6a63b626c636e85\",\"createTime\":1639581879809,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:24:46');
INSERT INTO `sys_oper_log` VALUES (484, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"草他奶奶的\",\"sendTime\":1639581886000,\"chatDetailId\":234,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:24:46');
INSERT INTO `sys_oper_log` VALUES (485, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"09f4de3590f94958b6a63b626c636e85\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"草他奶奶的\",\"sendTime\":1639581886000,\"chatDetailId\":235,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:24:46');
INSERT INTO `sys_oper_log` VALUES (486, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"c192306d75d04433844ffe83550784ad\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581895080,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"c192306d75d04433844ffe83550784ad\",\"createTime\":1639581895080,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:25:01');
INSERT INTO `sys_oper_log` VALUES (487, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"c192306d75d04433844ffe83550784ad\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"你说啥的\",\"sendTime\":1639581901000,\"chatDetailId\":236,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:25:02');
INSERT INTO `sys_oper_log` VALUES (488, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你说啥的\",\"sendTime\":1639581901000,\"chatDetailId\":237,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:25:02');
INSERT INTO `sys_oper_log` VALUES (489, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"你说啥的\",\"sendTime\":1639581901000,\"chatDetailId\":238,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:25:02');
INSERT INTO `sys_oper_log` VALUES (490, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"c4d0bb324902420384056c10845c190c\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581902243,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"c4d0bb324902420384056c10845c190c\",\"createTime\":1639581902243,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:25:09');
INSERT INTO `sys_oper_log` VALUES (491, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"c4d0bb324902420384056c10845c190c\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"来点实际行动\",\"sendTime\":1639581908000,\"chatDetailId\":239,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:25:09');
INSERT INTO `sys_oper_log` VALUES (492, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"来点实际行动\",\"sendTime\":1639581908000,\"chatDetailId\":240,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:25:09');
INSERT INTO `sys_oper_log` VALUES (493, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"来点实际行动\",\"sendTime\":1639581908000,\"chatDetailId\":241,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:25:09');
INSERT INTO `sys_oper_log` VALUES (494, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"这是什么情况\",\"sendTime\":1639581975000,\"chatDetailId\":242,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:26:16');
INSERT INTO `sys_oper_log` VALUES (495, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"623226a02d7445578b02127d561a03ee\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581968997,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"623226a02d7445578b02127d561a03ee\",\"createTime\":1639581968997,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:26:16');
INSERT INTO `sys_oper_log` VALUES (496, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"这是什么情况\",\"sendTime\":1639581975000,\"chatDetailId\":243,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:26:16');
INSERT INTO `sys_oper_log` VALUES (497, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"这是什么情况\",\"sendTime\":1639581975000,\"chatDetailId\":244,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:26:16');
INSERT INTO `sys_oper_log` VALUES (498, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"623226a02d7445578b02127d561a03ee\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"这是什么情况\",\"sendTime\":1639581975000,\"chatDetailId\":245,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:26:17');
INSERT INTO `sys_oper_log` VALUES (499, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"掉线了应该\",\"sendTime\":1639582001000,\"chatDetailId\":246,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:26:37');
INSERT INTO `sys_oper_log` VALUES (500, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"b1bd31b1f6e7445196eb13b83a03b552\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639581990577,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"b1bd31b1f6e7445196eb13b83a03b552\",\"createTime\":1639581990577,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:26:37');
INSERT INTO `sys_oper_log` VALUES (501, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"b1bd31b1f6e7445196eb13b83a03b552\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"掉线了应该\",\"sendTime\":1639582001000,\"chatDetailId\":247,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:26:37');
INSERT INTO `sys_oper_log` VALUES (502, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"有bug\",\"sendTime\":1639582020000,\"chatDetailId\":248,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:26:57');
INSERT INTO `sys_oper_log` VALUES (503, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"1e14949b66354a7b86fa8981d06dd07c\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639582010428,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"1e14949b66354a7b86fa8981d06dd07c\",\"createTime\":1639582010428,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:26:57');
INSERT INTO `sys_oper_log` VALUES (504, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"1e14949b66354a7b86fa8981d06dd07c\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"有bug\",\"sendTime\":1639582020000,\"chatDetailId\":249,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:26:57');
INSERT INTO `sys_oper_log` VALUES (505, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '192.168.1.3', '', '{\"chatId\":\"72d2aa5203104ce69912b8fd77639a00\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"8886\",\"sendTime\":1639582033000,\"chatDetailId\":250,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:27:09');
INSERT INTO `sys_oper_log` VALUES (506, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '192.168.1.10', '', '{\"chatId\":\"7c4b148285de4178b9ec7ea1c310ce87\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639582022817,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"7c4b148285de4178b9ec7ea1c310ce87\",\"createTime\":1639582022817,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-15 23:27:09');
INSERT INTO `sys_oper_log` VALUES (507, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '192.168.1.10', '', '{\"chatId\":\"7c4b148285de4178b9ec7ea1c310ce87\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"8886\",\"sendTime\":1639582033000,\"chatDetailId\":251,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-15 23:27:09');
INSERT INTO `sys_oper_log` VALUES (508, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"1212\",\"sendTime\":1639646679000,\"chatDetailId\":252,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-16 17:24:38');
INSERT INTO `sys_oper_log` VALUES (509, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"3424234\",\"sendTime\":1639646685000,\"chatDetailId\":253,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-16 17:24:45');
INSERT INTO `sys_oper_log` VALUES (510, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"333\",\"sendTime\":1639646703000,\"chatDetailId\":254,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-16 17:25:02');
INSERT INTO `sys_oper_log` VALUES (511, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"2324\",\"sendTime\":1639646706000,\"chatDetailId\":255,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-16 17:25:05');
INSERT INTO `sys_oper_log` VALUES (512, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"324324\",\"sendTime\":1639646708000,\"chatDetailId\":256,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-16 17:25:07');
INSERT INTO `sys_oper_log` VALUES (513, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"343\",\"sendTime\":1639646711000,\"chatDetailId\":257,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-16 17:25:11');
INSERT INTO `sys_oper_log` VALUES (514, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"实打实打算\",\"sendTime\":1639646722000,\"chatDetailId\":258,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-16 17:25:22');
INSERT INTO `sys_oper_log` VALUES (515, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"是的是的\",\"sendTime\":1639646726000,\"chatDetailId\":259,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-16 17:25:25');
INSERT INTO `sys_oper_log` VALUES (516, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"大大大大大\",\"sendTime\":1639646735000,\"chatDetailId\":260,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-16 17:25:34');
INSERT INTO `sys_oper_log` VALUES (517, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"的地方大师傅\",\"sendTime\":1639646739000,\"chatDetailId\":261,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-16 17:25:38');
INSERT INTO `sys_oper_log` VALUES (518, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"大大撒旦飒飒\",\"sendTime\":1639646742000,\"chatDetailId\":262,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-16 17:25:41');
INSERT INTO `sys_oper_log` VALUES (519, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"今天有问题吗\",\"sendTime\":1639705886000,\"chatDetailId\":263,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:51:25');
INSERT INTO `sys_oper_log` VALUES (520, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"人呢\",\"sendTime\":1639706085000,\"chatDetailId\":264,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:54:44');
INSERT INTO `sys_oper_log` VALUES (521, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639706086610,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"createTime\":1639706086610,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-17 09:54:44');
INSERT INTO `sys_oper_log` VALUES (522, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"人呢\",\"sendTime\":1639706085000,\"chatDetailId\":265,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:54:45');
INSERT INTO `sys_oper_log` VALUES (523, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"12\",\"sendTime\":1639706147000,\"chatDetailId\":266,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:55:46');
INSERT INTO `sys_oper_log` VALUES (524, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"36b7e807f5734fa482b38089032a616e\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639706147205,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"36b7e807f5734fa482b38089032a616e\",\"createTime\":1639706147205,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-17 09:55:46');
INSERT INTO `sys_oper_log` VALUES (525, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"12\",\"sendTime\":1639706147000,\"chatDetailId\":267,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:55:46');
INSERT INTO `sys_oper_log` VALUES (526, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"36b7e807f5734fa482b38089032a616e\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"12\",\"sendTime\":1639706147000,\"chatDetailId\":268,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:55:46');
INSERT INTO `sys_oper_log` VALUES (527, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"78787\",\"sendTime\":1639706188000,\"chatDetailId\":269,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:56:26');
INSERT INTO `sys_oper_log` VALUES (528, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"78787\",\"sendTime\":1639706188000,\"chatDetailId\":270,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:56:27');
INSERT INTO `sys_oper_log` VALUES (529, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"2175734b258b41c1b01d60ee8f0afcb9\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639706189111,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"2175734b258b41c1b01d60ee8f0afcb9\",\"createTime\":1639706189111,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-17 09:56:27');
INSERT INTO `sys_oper_log` VALUES (530, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"2175734b258b41c1b01d60ee8f0afcb9\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"78787\",\"sendTime\":1639706188000,\"chatDetailId\":271,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:56:27');
INSERT INTO `sys_oper_log` VALUES (531, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"干嘛呢\",\"sendTime\":1639706197000,\"chatDetailId\":272,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:56:36');
INSERT INTO `sys_oper_log` VALUES (532, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"干嘛呢\",\"sendTime\":1639706197000,\"chatDetailId\":273,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:56:36');
INSERT INTO `sys_oper_log` VALUES (533, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"e7b557a5bf3a47959e1fe73cfe14df14\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639706198257,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"e7b557a5bf3a47959e1fe73cfe14df14\",\"createTime\":1639706198257,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-17 09:56:36');
INSERT INTO `sys_oper_log` VALUES (534, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"e7b557a5bf3a47959e1fe73cfe14df14\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"干嘛呢\",\"sendTime\":1639706197000,\"chatDetailId\":274,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:56:36');
INSERT INTO `sys_oper_log` VALUES (535, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"7878\",\"sendTime\":1639706377000,\"chatDetailId\":275,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:59:36');
INSERT INTO `sys_oper_log` VALUES (536, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"7878\",\"sendTime\":1639706377000,\"chatDetailId\":276,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:59:36');
INSERT INTO `sys_oper_log` VALUES (537, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"7878\",\"sendTime\":1639706377000,\"chatDetailId\":277,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:59:36');
INSERT INTO `sys_oper_log` VALUES (538, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"好的\",\"sendTime\":1639706392000,\"chatDetailId\":278,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:59:51');
INSERT INTO `sys_oper_log` VALUES (539, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"好的\",\"sendTime\":1639706392000,\"chatDetailId\":279,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:59:51');
INSERT INTO `sys_oper_log` VALUES (540, '聊天列表', 1, 'com.ruoyi.im.controller.ImChatInfoController.add()', 'POST', 1, 'zhangsan', NULL, '/info', '127.0.0.1', '', '{\"chatId\":\"2aabd0fdfe7f450a9e333b16fde89e29\",\"unread\":0,\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"hide\":0,\"friendId\":\"1\",\"createTime\":1639706393177,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200,\"data\":{\"chatId\":\"2aabd0fdfe7f450a9e333b16fde89e29\",\"createTime\":1639706393177,\"friendId\":\"1\",\"hide\":0,\"params\":{},\"state\":0,\"type\":1,\"unread\":0,\"userId\":\"f613572bd0324fc384a830f998c19ee3\"}}', 0, NULL, '2021-12-17 09:59:51');
INSERT INTO `sys_oper_log` VALUES (541, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"2aabd0fdfe7f450a9e333b16fde89e29\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"好的\",\"sendTime\":1639706392000,\"chatDetailId\":280,\"recall\":1,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 09:59:51');
INSERT INTO `sys_oper_log` VALUES (542, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":281,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:57');
INSERT INTO `sys_oper_log` VALUES (543, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":282,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:57');
INSERT INTO `sys_oper_log` VALUES (544, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":283,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:57');
INSERT INTO `sys_oper_log` VALUES (545, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":284,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:57');
INSERT INTO `sys_oper_log` VALUES (546, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":285,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:57');
INSERT INTO `sys_oper_log` VALUES (547, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":286,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:57');
INSERT INTO `sys_oper_log` VALUES (548, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":287,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:57');
INSERT INTO `sys_oper_log` VALUES (549, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":288,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:57');
INSERT INTO `sys_oper_log` VALUES (550, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":289,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:57');
INSERT INTO `sys_oper_log` VALUES (551, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":290,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:58');
INSERT INTO `sys_oper_log` VALUES (552, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":291,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:58');
INSERT INTO `sys_oper_log` VALUES (553, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":292,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:58');
INSERT INTO `sys_oper_log` VALUES (554, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":293,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:58');
INSERT INTO `sys_oper_log` VALUES (555, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"1212\",\"sendTime\":1639708078000,\"chatDetailId\":294,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:27:58');
INSERT INTO `sys_oper_log` VALUES (556, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":295,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:22');
INSERT INTO `sys_oper_log` VALUES (557, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":296,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:22');
INSERT INTO `sys_oper_log` VALUES (558, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":297,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:22');
INSERT INTO `sys_oper_log` VALUES (559, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":298,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:22');
INSERT INTO `sys_oper_log` VALUES (560, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":300,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:22');
INSERT INTO `sys_oper_log` VALUES (561, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":299,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:22');
INSERT INTO `sys_oper_log` VALUES (562, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":301,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:22');
INSERT INTO `sys_oper_log` VALUES (563, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":302,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:22');
INSERT INTO `sys_oper_log` VALUES (564, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":303,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:22');
INSERT INTO `sys_oper_log` VALUES (565, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":304,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:22');
INSERT INTO `sys_oper_log` VALUES (566, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":305,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:23');
INSERT INTO `sys_oper_log` VALUES (567, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":306,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:23');
INSERT INTO `sys_oper_log` VALUES (568, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":307,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:23');
INSERT INTO `sys_oper_log` VALUES (569, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"122122\",\"sendTime\":1639708104000,\"chatDetailId\":308,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:28:23');
INSERT INTO `sys_oper_log` VALUES (570, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":309,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:10');
INSERT INTO `sys_oper_log` VALUES (571, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":310,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:10');
INSERT INTO `sys_oper_log` VALUES (572, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":311,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:10');
INSERT INTO `sys_oper_log` VALUES (573, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":312,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (574, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":313,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (575, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":314,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (576, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":315,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (577, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":316,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (578, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":317,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (579, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":318,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (580, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":319,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (581, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":321,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (582, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":320,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (583, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":322,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (584, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":323,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (585, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":324,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (586, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":325,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (587, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"14545\",\"sendTime\":1639708631000,\"chatDetailId\":326,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:11');
INSERT INTO `sys_oper_log` VALUES (588, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":327,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (589, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":328,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (590, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":329,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (591, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":330,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (592, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":331,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (593, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":332,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (594, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":333,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (595, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":334,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (596, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":335,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (597, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":336,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (598, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":337,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (599, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":339,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (600, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":338,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (601, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":340,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:30');
INSERT INTO `sys_oper_log` VALUES (602, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":341,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:31');
INSERT INTO `sys_oper_log` VALUES (603, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":342,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:31');
INSERT INTO `sys_oper_log` VALUES (604, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":343,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:31');
INSERT INTO `sys_oper_log` VALUES (605, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":344,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:31');
INSERT INTO `sys_oper_log` VALUES (606, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"454\",\"sendTime\":1639708651000,\"chatDetailId\":345,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:37:31');
INSERT INTO `sys_oper_log` VALUES (607, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"45455\",\"sendTime\":1639708748000,\"chatDetailId\":346,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:39:07');
INSERT INTO `sys_oper_log` VALUES (608, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"45455\",\"sendTime\":1639708748000,\"chatDetailId\":347,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:39:07');
INSERT INTO `sys_oper_log` VALUES (609, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"45455\",\"sendTime\":1639708748000,\"chatDetailId\":348,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:39:07');
INSERT INTO `sys_oper_log` VALUES (610, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"45455\",\"sendTime\":1639708748000,\"chatDetailId\":349,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:39:07');
INSERT INTO `sys_oper_log` VALUES (611, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"45455\",\"sendTime\":1639708748000,\"chatDetailId\":350,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:39:07');
INSERT INTO `sys_oper_log` VALUES (612, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"45455\",\"sendTime\":1639708748000,\"chatDetailId\":352,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:39:07');
INSERT INTO `sys_oper_log` VALUES (613, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"45455\",\"sendTime\":1639708748000,\"chatDetailId\":351,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:39:07');
INSERT INTO `sys_oper_log` VALUES (614, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"45455\",\"sendTime\":1639708748000,\"chatDetailId\":353,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:39:07');
INSERT INTO `sys_oper_log` VALUES (615, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"45455\",\"sendTime\":1639708748000,\"chatDetailId\":354,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:39:07');
INSERT INTO `sys_oper_log` VALUES (616, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"45455\",\"sendTime\":1639708748000,\"chatDetailId\":355,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:39:07');
INSERT INTO `sys_oper_log` VALUES (617, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"666\",\"sendTime\":1639708815000,\"chatDetailId\":357,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:14');
INSERT INTO `sys_oper_log` VALUES (618, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"666\",\"sendTime\":1639708815000,\"chatDetailId\":356,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:14');
INSERT INTO `sys_oper_log` VALUES (619, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"666\",\"sendTime\":1639708815000,\"chatDetailId\":358,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:14');
INSERT INTO `sys_oper_log` VALUES (620, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"666\",\"sendTime\":1639708815000,\"chatDetailId\":359,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:14');
INSERT INTO `sys_oper_log` VALUES (621, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"666\",\"sendTime\":1639708815000,\"chatDetailId\":360,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:14');
INSERT INTO `sys_oper_log` VALUES (622, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"666\",\"sendTime\":1639708815000,\"chatDetailId\":361,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:14');
INSERT INTO `sys_oper_log` VALUES (623, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"666\",\"sendTime\":1639708815000,\"chatDetailId\":362,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:14');
INSERT INTO `sys_oper_log` VALUES (624, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"666\",\"sendTime\":1639708815000,\"chatDetailId\":363,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:14');
INSERT INTO `sys_oper_log` VALUES (625, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"666\",\"sendTime\":1639708815000,\"chatDetailId\":364,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:14');
INSERT INTO `sys_oper_log` VALUES (626, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"666\",\"sendTime\":1639708815000,\"chatDetailId\":365,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:14');
INSERT INTO `sys_oper_log` VALUES (627, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"666\",\"sendTime\":1639708815000,\"chatDetailId\":366,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:14');
INSERT INTO `sys_oper_log` VALUES (628, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"9999999\",\"sendTime\":1639708823000,\"chatDetailId\":367,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:22');
INSERT INTO `sys_oper_log` VALUES (629, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"9999999\",\"sendTime\":1639708823000,\"chatDetailId\":368,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:22');
INSERT INTO `sys_oper_log` VALUES (630, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"9999999\",\"sendTime\":1639708823000,\"chatDetailId\":369,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:22');
INSERT INTO `sys_oper_log` VALUES (631, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"9999999\",\"sendTime\":1639708823000,\"chatDetailId\":370,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:22');
INSERT INTO `sys_oper_log` VALUES (632, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"9999999\",\"sendTime\":1639708823000,\"chatDetailId\":371,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:22');
INSERT INTO `sys_oper_log` VALUES (633, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"9999999\",\"sendTime\":1639708823000,\"chatDetailId\":372,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:22');
INSERT INTO `sys_oper_log` VALUES (634, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"9999999\",\"sendTime\":1639708823000,\"chatDetailId\":373,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:22');
INSERT INTO `sys_oper_log` VALUES (635, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"9999999\",\"sendTime\":1639708823000,\"chatDetailId\":374,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:23');
INSERT INTO `sys_oper_log` VALUES (636, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"9999999\",\"sendTime\":1639708823000,\"chatDetailId\":376,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:23');
INSERT INTO `sys_oper_log` VALUES (637, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"9999999\",\"sendTime\":1639708823000,\"chatDetailId\":375,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:23');
INSERT INTO `sys_oper_log` VALUES (638, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"9999999\",\"sendTime\":1639708823000,\"chatDetailId\":377,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:23');
INSERT INTO `sys_oper_log` VALUES (639, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"**-****\",\"sendTime\":1639708838000,\"chatDetailId\":378,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:37');
INSERT INTO `sys_oper_log` VALUES (640, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'zhangsan', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"848f5b4aa04c43ff967ef827530970ea\",\"params\":{},\"type\":1,\"userId\":\"f613572bd0324fc384a830f998c19ee3\",\"content\":\"**-****\",\"sendTime\":1639708838000,\"chatDetailId\":379,\"recall\":0,\"self\":1,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:37');
INSERT INTO `sys_oper_log` VALUES (641, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"**-****\",\"sendTime\":1639708838000,\"chatDetailId\":381,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:37');
INSERT INTO `sys_oper_log` VALUES (642, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"**-****\",\"sendTime\":1639708838000,\"chatDetailId\":380,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:37');
INSERT INTO `sys_oper_log` VALUES (643, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"**-****\",\"sendTime\":1639708838000,\"chatDetailId\":383,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:37');
INSERT INTO `sys_oper_log` VALUES (644, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"**-****\",\"sendTime\":1639708838000,\"chatDetailId\":384,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:37');
INSERT INTO `sys_oper_log` VALUES (645, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"**-****\",\"sendTime\":1639708838000,\"chatDetailId\":382,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:37');
INSERT INTO `sys_oper_log` VALUES (646, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"**-****\",\"sendTime\":1639708838000,\"chatDetailId\":385,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:37');
INSERT INTO `sys_oper_log` VALUES (647, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"**-****\",\"sendTime\":1639708838000,\"chatDetailId\":386,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:37');
INSERT INTO `sys_oper_log` VALUES (648, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"**-****\",\"sendTime\":1639708838000,\"chatDetailId\":387,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:37');
INSERT INTO `sys_oper_log` VALUES (649, '聊天记录', 1, 'com.ruoyi.im.controller.ImChatInfoDetailController.add()', 'POST', 1, 'admin', NULL, '/detail', '127.0.0.1', '', '{\"chatId\":\"57758af529404b0e9cc02905432ccd90\",\"params\":{},\"type\":1,\"userId\":\"1\",\"content\":\"**-****\",\"sendTime\":1639708838000,\"chatDetailId\":388,\"recall\":0,\"self\":2,\"state\":0}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-12-17 10:40:37');
INSERT INTO `sys_oper_log` VALUES (650, '', 1, 'com.ruoyi.system.controller.SysAppController.add()', 'POST', 1, 'admin', NULL, '/app', '112.10.107.210', '', '{\"appName\":\"大屏\",\"appId\":\"6d6acd5751364f3ab75dfae8a0636dc3\",\"appUrl\":\"#\",\"params\":{},\"type\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-01-08 00:59:29');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2021-10-27 14:20:28', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2021-10-27 14:20:28', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2021-10-27 14:20:28', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2021-10-27 14:20:28', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `app_id` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联所属应用',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2021-10-27 14:20:28', '', NULL, '超级管理员', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2021-10-27 14:20:28', 'admin', '2021-10-28 18:09:32', '普通角色', '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_role` VALUES (100, '测试角色001', 'ceshi', 3, '1', 1, 1, '0', '2', 'admin', '2021-10-27 17:50:03', 'admin', '2021-10-28 15:51:24', NULL, '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_role` VALUES (105, '测试应用角色01', 'ce01', 1, '1', 1, 1, '0', '2', 'admin', '2021-10-28 16:44:55', 'admin', '2021-10-28 18:11:42', NULL, '27ecdacdfa3f44799c0f4eab5de44f42');
INSERT INTO `sys_role` VALUES (106, '测试角色', 'testrole', 1, '1', 1, 1, '0', '0', 'admin', '2021-12-11 00:13:17', '', NULL, NULL, '79785c7c016443a8a53af382a1d68d5d');
INSERT INTO `sys_role` VALUES (107, 'im通信角色', 'imrole', 1, '1', 1, 1, '0', '0', 'admin', '2021-12-12 14:52:21', 'admin', '2021-12-14 21:46:31', NULL, '8bd87d43a752404191bdba4067e120be');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (101, 2);
INSERT INTO `sys_role_menu` VALUES (101, 109);
INSERT INTO `sys_role_menu` VALUES (101, 110);
INSERT INTO `sys_role_menu` VALUES (101, 111);
INSERT INTO `sys_role_menu` VALUES (101, 112);
INSERT INTO `sys_role_menu` VALUES (101, 113);
INSERT INTO `sys_role_menu` VALUES (101, 1046);
INSERT INTO `sys_role_menu` VALUES (101, 1047);
INSERT INTO `sys_role_menu` VALUES (101, 1048);
INSERT INTO `sys_role_menu` VALUES (101, 1049);
INSERT INTO `sys_role_menu` VALUES (101, 1050);
INSERT INTO `sys_role_menu` VALUES (101, 1051);
INSERT INTO `sys_role_menu` VALUES (101, 1052);
INSERT INTO `sys_role_menu` VALUES (101, 1053);
INSERT INTO `sys_role_menu` VALUES (101, 1054);
INSERT INTO `sys_role_menu` VALUES (102, 2);
INSERT INTO `sys_role_menu` VALUES (102, 109);
INSERT INTO `sys_role_menu` VALUES (102, 110);
INSERT INTO `sys_role_menu` VALUES (102, 111);
INSERT INTO `sys_role_menu` VALUES (102, 112);
INSERT INTO `sys_role_menu` VALUES (102, 113);
INSERT INTO `sys_role_menu` VALUES (102, 1046);
INSERT INTO `sys_role_menu` VALUES (102, 1047);
INSERT INTO `sys_role_menu` VALUES (102, 1048);
INSERT INTO `sys_role_menu` VALUES (102, 1049);
INSERT INTO `sys_role_menu` VALUES (102, 1050);
INSERT INTO `sys_role_menu` VALUES (102, 1051);
INSERT INTO `sys_role_menu` VALUES (102, 1052);
INSERT INTO `sys_role_menu` VALUES (102, 1053);
INSERT INTO `sys_role_menu` VALUES (102, 1054);
INSERT INTO `sys_role_menu` VALUES (103, 3);
INSERT INTO `sys_role_menu` VALUES (103, 114);
INSERT INTO `sys_role_menu` VALUES (103, 115);
INSERT INTO `sys_role_menu` VALUES (103, 116);
INSERT INTO `sys_role_menu` VALUES (103, 1055);
INSERT INTO `sys_role_menu` VALUES (103, 1056);
INSERT INTO `sys_role_menu` VALUES (103, 1057);
INSERT INTO `sys_role_menu` VALUES (103, 1058);
INSERT INTO `sys_role_menu` VALUES (103, 1059);
INSERT INTO `sys_role_menu` VALUES (103, 1060);
INSERT INTO `sys_role_menu` VALUES (104, 2);
INSERT INTO `sys_role_menu` VALUES (104, 109);
INSERT INTO `sys_role_menu` VALUES (104, 110);
INSERT INTO `sys_role_menu` VALUES (104, 111);
INSERT INTO `sys_role_menu` VALUES (104, 112);
INSERT INTO `sys_role_menu` VALUES (104, 113);
INSERT INTO `sys_role_menu` VALUES (104, 1046);
INSERT INTO `sys_role_menu` VALUES (104, 1047);
INSERT INTO `sys_role_menu` VALUES (104, 1048);
INSERT INTO `sys_role_menu` VALUES (104, 1049);
INSERT INTO `sys_role_menu` VALUES (104, 1050);
INSERT INTO `sys_role_menu` VALUES (104, 1051);
INSERT INTO `sys_role_menu` VALUES (104, 1052);
INSERT INTO `sys_role_menu` VALUES (104, 1053);
INSERT INTO `sys_role_menu` VALUES (104, 1054);
INSERT INTO `sys_role_menu` VALUES (106, 2008);
INSERT INTO `sys_role_menu` VALUES (106, 2009);
INSERT INTO `sys_role_menu` VALUES (106, 2010);
INSERT INTO `sys_role_menu` VALUES (106, 2011);
INSERT INTO `sys_role_menu` VALUES (106, 2012);
INSERT INTO `sys_role_menu` VALUES (106, 2013);
INSERT INTO `sys_role_menu` VALUES (106, 2014);
INSERT INTO `sys_role_menu` VALUES (106, 2015);
INSERT INTO `sys_role_menu` VALUES (106, 2016);
INSERT INTO `sys_role_menu` VALUES (106, 2017);
INSERT INTO `sys_role_menu` VALUES (106, 2018);
INSERT INTO `sys_role_menu` VALUES (106, 2019);
INSERT INTO `sys_role_menu` VALUES (107, 2020);
INSERT INTO `sys_role_menu` VALUES (107, 2021);
INSERT INTO `sys_role_menu` VALUES (107, 2022);
INSERT INTO `sys_role_menu` VALUES (107, 2023);
INSERT INTO `sys_role_menu` VALUES (107, 2024);
INSERT INTO `sys_role_menu` VALUES (107, 2025);
INSERT INTO `sys_role_menu` VALUES (107, 2026);
INSERT INTO `sys_role_menu` VALUES (107, 2027);
INSERT INTO `sys_role_menu` VALUES (107, 2028);
INSERT INTO `sys_role_menu` VALUES (107, 2029);
INSERT INTO `sys_role_menu` VALUES (107, 2030);
INSERT INTO `sys_role_menu` VALUES (107, 2031);
INSERT INTO `sys_role_menu` VALUES (107, 2032);
INSERT INTO `sys_role_menu` VALUES (107, 2033);
INSERT INTO `sys_role_menu` VALUES (107, 2034);
INSERT INTO `sys_role_menu` VALUES (107, 2035);
INSERT INTO `sys_role_menu` VALUES (107, 2036);
INSERT INTO `sys_role_menu` VALUES (107, 2038);
INSERT INTO `sys_role_menu` VALUES (107, 2039);
INSERT INTO `sys_role_menu` VALUES (107, 2040);
INSERT INTO `sys_role_menu` VALUES (107, 2041);
INSERT INTO `sys_role_menu` VALUES (107, 2042);
INSERT INTO `sys_role_menu` VALUES (107, 2043);
INSERT INTO `sys_role_menu` VALUES (107, 2044);
INSERT INTO `sys_role_menu` VALUES (107, 2045);
INSERT INTO `sys_role_menu` VALUES (107, 2046);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
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
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-10-27 14:20:28', 'admin', '2021-10-27 14:20:28', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES ('bf937cb42cf84e5295142fc571cbe564', 105, 'ry', '李安平', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-10-27 14:20:28', 'admin', '2021-10-27 14:20:28', 'admin', '2021-12-14 22:44:48', '测试员');
INSERT INTO `sys_user` VALUES ('f613572bd0324fc384a830f998c19ee3', 101, 'zhangsan', '张三的瓜瓜', '00', '18312631256@163.com', '18312631256', '0', '', '$2a$10$pNU0T4iZGoOGA8/7WyGKgubaIZvmBDQgUEfqtY1ZkAx0t2FLBkk1G', '0', '0', '', NULL, 'admin', '2021-12-11 00:07:41', 'admin', '2021-12-12 14:52:30', NULL);

-- ----------------------------
-- Table structure for sys_user_copy1
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_copy1`;
CREATE TABLE `sys_user_copy1`  (
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
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_copy1
-- ----------------------------
INSERT INTO `sys_user_copy1` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-10-27 14:20:28', 'admin', '2021-10-27 14:20:28', '', NULL, '管理员');
INSERT INTO `sys_user_copy1` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2021-10-27 14:20:28', 'admin', '2021-10-27 14:20:28', '', NULL, '测试员');
INSERT INTO `sys_user_copy1` VALUES (3, NULL, 'user001', 'user001', '00', '', '13212312312', '0', '', '$2a$10$mnH.v3wXV/v0ABe1.uK/G.jZmrhAMO9LGedibySjqmIaOdLsy0vhe', '0', '0', '', NULL, 'admin', '2021-10-28 17:29:08', 'admin', '2021-10-28 18:11:55', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', 1);
INSERT INTO `sys_user_post` VALUES ('bf937cb42cf84e5295142fc571cbe564', 2);
INSERT INTO `sys_user_post` VALUES ('f613572bd0324fc384a830f998c19ee3', 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', 1);
INSERT INTO `sys_user_role` VALUES ('bf937cb42cf84e5295142fc571cbe564', 2);
INSERT INTO `sys_user_role` VALUES ('bf937cb42cf84e5295142fc571cbe564', 107);
INSERT INTO `sys_user_role` VALUES ('f613572bd0324fc384a830f998c19ee3', 107);

SET FOREIGN_KEY_CHECKS = 1;

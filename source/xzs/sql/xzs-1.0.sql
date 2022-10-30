/*
 Navicat Premium Data Transfer

 Source Server         : 腾讯云mysql数据库
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 81.68.85.107:3306
 Source Schema         : xzs

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 29/10/2022 15:21:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper`;
CREATE TABLE `t_exam_paper`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试卷名称',
  `subject_id` int(0) NULL DEFAULT NULL COMMENT '学科',
  `paper_type` int(0) NULL DEFAULT NULL COMMENT '试卷类型( 1固定试卷  2临时试卷 3班级试卷 4.时段试卷 5.推送试卷)',
  `grade_level` int(0) NULL DEFAULT NULL COMMENT '级别',
  `score` int(0) NULL DEFAULT NULL COMMENT '试卷总分(千分制)',
  `question_count` int(0) NULL DEFAULT NULL COMMENT '题目数量',
  `suggest_time` int(0) NULL DEFAULT NULL COMMENT '建议时长(分钟)',
  `limit_start_time` datetime(0) NULL DEFAULT NULL COMMENT '时段试卷 开始时间',
  `limit_end_time` datetime(0) NULL DEFAULT NULL COMMENT '时段试卷 结束时间',
  `frame_text_content_id` int(0) NULL DEFAULT NULL COMMENT '试卷框架 内容为JSON',
  `create_user` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `task_exam_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_exam_paper
-- ----------------------------
INSERT INTO `t_exam_paper` VALUES (1, '江苏省苏锡常镇四市2021-2022学年高一下学期3月教学调研（一）化学试卷', 1, 1, 10, 140, 4, 90, NULL, NULL, 5, 2, '2022-10-29 10:19:08', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (2, '2022 苏州学府中学高一化学调研', 1, 6, 10, 30, 1, 90, NULL, NULL, 6, 2, '2022-10-29 10:34:32', b'0', 1);
INSERT INTO `t_exam_paper` VALUES (3, '2022 苏州学府中学高一化学调研（二）', 1, 4, 10, 30, 1, 120, '2022-10-30 16:00:00', '2022-10-30 18:00:00', 7, 2, '2022-10-29 10:39:54', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (4, '2022 苏州金鸡湖中学高三化学调研（一）', 3, 6, 12, 50, 2, 60, NULL, NULL, 13, 2, '2022-10-29 11:08:03', b'0', 2);
INSERT INTO `t_exam_paper` VALUES (5, '2022 苏州科技大学附属中学高一化学调研（一）', 1, 6, 10, 120, 3, 60, NULL, NULL, 15, 2, '2022-10-29 11:13:02', b'0', 3);

-- ----------------------------
-- Table structure for t_exam_paper_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_answer`;
CREATE TABLE `t_exam_paper_answer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `exam_paper_id` int(0) NULL DEFAULT NULL,
  `paper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '试卷名称',
  `paper_type` int(0) NULL DEFAULT NULL COMMENT '试卷类型( 1固定试卷  2临时试卷 3班级试卷 4.时段试卷 )',
  `subject_id` int(0) NULL DEFAULT NULL COMMENT '学科',
  `system_score` int(0) NULL DEFAULT NULL COMMENT '系统判定得分',
  `user_score` int(0) NULL DEFAULT NULL COMMENT '最终得分(千分制)',
  `paper_score` int(0) NULL DEFAULT NULL COMMENT '试卷总分',
  `question_correct` int(0) NULL DEFAULT NULL COMMENT '做对题目数量',
  `question_count` int(0) NULL DEFAULT NULL COMMENT '题目总数量',
  `do_time` int(0) NULL DEFAULT NULL COMMENT '做题时间(秒)',
  `status` int(0) NULL DEFAULT NULL COMMENT '试卷状态(1待判分 2完成)',
  `create_user` int(0) NULL DEFAULT NULL COMMENT '学生',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '提交时间',
  `task_exam_id` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_exam_paper_answer
-- ----------------------------
INSERT INTO `t_exam_paper_answer` VALUES (1, 2, '2022 苏州学府中学高一化学调研', 6, 1, 30, 30, 30, 1, 1, 9, 2, 3, '2022-10-29 10:56:21', 1);
INSERT INTO `t_exam_paper_answer` VALUES (2, 2, '2022 苏州学府中学高一化学调研', 6, 1, 30, 30, 30, 1, 1, 4, 2, 6, '2022-10-29 11:06:18', 1);
INSERT INTO `t_exam_paper_answer` VALUES (3, 5, '2022 苏州科技大学附属中学高一化学调研（一）', 6, 1, 20, 20, 120, 1, 3, 9, 2, 3, '2022-10-29 13:36:21', 3);

-- ----------------------------
-- Table structure for t_exam_paper_question_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_question_customer_answer`;
CREATE TABLE `t_exam_paper_question_customer_answer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `question_id` int(0) NULL DEFAULT NULL COMMENT '题目Id',
  `exam_paper_id` int(0) NULL DEFAULT NULL COMMENT '答案Id',
  `exam_paper_answer_id` int(0) NULL DEFAULT NULL,
  `question_type` int(0) NULL DEFAULT NULL COMMENT '题型',
  `subject_id` int(0) NULL DEFAULT NULL COMMENT '学科',
  `customer_score` int(0) NULL DEFAULT NULL COMMENT '得分',
  `question_score` int(0) NULL DEFAULT NULL COMMENT '题目原始分数',
  `question_text_content_id` int(0) NULL DEFAULT NULL COMMENT '问题内容',
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '做题答案',
  `text_content_id` int(0) NULL DEFAULT NULL COMMENT '做题内容',
  `do_right` bit(1) NULL DEFAULT NULL COMMENT '是否正确',
  `create_user` int(0) NULL DEFAULT NULL COMMENT '做题人',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `item_order` int(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_exam_paper_question_customer_answer
-- ----------------------------
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (1, 1, 2, 1, 1, 1, 30, 30, 1, 'A', NULL, b'1', 3, '2022-10-29 10:56:21', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (2, 1, 2, 2, 1, 1, 30, 30, 1, 'A', NULL, b'1', 6, '2022-10-29 11:06:18', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (3, 1, 5, 3, 1, 1, 0, 30, 1, 'D', NULL, b'0', 3, '2022-10-29 13:36:21', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (4, 2, 5, 3, 3, 1, 20, 20, 2, 'A', NULL, b'1', 3, '2022-10-29 13:36:21', 2);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (5, 4, 5, 3, 5, 1, 0, 70, 4, NULL, 17, b'0', 3, '2022-10-29 13:36:21', 3);

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `send_user_id` int(0) NULL DEFAULT NULL COMMENT '发送者用户ID',
  `send_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者用户名',
  `send_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '发送者真实姓名',
  `receive_user_count` int(0) NULL DEFAULT NULL COMMENT '接收人数',
  `read_count` int(0) NULL DEFAULT NULL COMMENT '已读人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES (1, '【注册通知】', '欢迎注册', '2022-10-29 10:29:07', 2, 'admin', '管理员', 3, 1);

-- ----------------------------
-- Table structure for t_message_user
-- ----------------------------
DROP TABLE IF EXISTS `t_message_user`;
CREATE TABLE `t_message_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `message_id` int(0) NULL DEFAULT NULL COMMENT '消息内容ID',
  `receive_user_id` int(0) NULL DEFAULT NULL COMMENT '接收人ID',
  `receive_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收人用户名',
  `receive_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '接收人真实姓名',
  `readed` bit(1) NULL DEFAULT NULL COMMENT '是否已读',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_message_user
-- ----------------------------
INSERT INTO `t_message_user` VALUES (1, 1, 3, 'neo', NULL, b'1', '2022-10-29 10:29:07', '2022-10-29 10:29:33');
INSERT INTO `t_message_user` VALUES (2, 1, 4, 'lwt123', 'lwt', b'0', '2022-10-29 10:29:07', NULL);
INSERT INTO `t_message_user` VALUES (3, 1, 5, '秦钲皓', NULL, b'0', '2022-10-29 10:29:07', NULL);

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `question_type` int(0) NULL DEFAULT NULL COMMENT '1.单选题  2.多选题  3.判断题 4.填空题 5.简答题',
  `subject_id` int(0) NULL DEFAULT NULL COMMENT '学科',
  `score` int(0) NULL DEFAULT NULL COMMENT '题目总分(千分制)',
  `grade_level` int(0) NULL DEFAULT NULL COMMENT '级别',
  `difficult` int(0) NULL DEFAULT NULL COMMENT '题目难度',
  `correct` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '正确答案',
  `info_text_content_id` int(0) NULL DEFAULT NULL COMMENT '题目  填空、 题干、解析、答案等信息',
  `create_user` int(0) NULL DEFAULT NULL COMMENT '创建人',
  `status` int(0) NULL DEFAULT NULL COMMENT '1.正常',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES (1, 1, 1, 30, 1, 3, 'A', 1, 2, 1, '2022-10-29 10:07:28', b'0');
INSERT INTO `t_question` VALUES (2, 3, 1, 20, 1, 3, 'A', 2, 2, 1, '2022-10-29 10:08:42', b'0');
INSERT INTO `t_question` VALUES (3, 4, 1, 20, 1, 2, '', 3, 2, 1, '2022-10-29 10:09:49', b'0');
INSERT INTO `t_question` VALUES (4, 5, 1, 70, 1, 3, '<span style=\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; background-color: #FFFFFF;\">氢，氦，锂，铍，硼，碳，氮，氧，氟，氖，钠，镁，铝，硅，磷，硫，氯，氩，钾，钙</span>', 4, 2, 1, '2022-10-29 10:14:52', b'0');
INSERT INTO `t_question` VALUES (5, 1, 3, 30, 3, 4, 'A', 10, 2, 1, '2022-10-29 11:06:06', b'0');
INSERT INTO `t_question` VALUES (6, 3, 3, 20, 3, 2, 'A', 12, 2, 1, '2022-10-29 11:06:43', b'0');

-- ----------------------------
-- Table structure for t_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '语文 数学 英语 等',
  `level` int(0) NULL DEFAULT NULL COMMENT '年级 (1-12) 小学 初中 高中  大学',
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一年级、二年级等',
  `item_order` int(0) NULL DEFAULT NULL COMMENT '排序',
  `deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES (1, '化学', 10, '高一', NULL, b'0');
INSERT INTO `t_subject` VALUES (2, '化学', 11, '高二', NULL, b'0');
INSERT INTO `t_subject` VALUES (3, '化学', 12, '高三', NULL, b'0');

-- ----------------------------
-- Table structure for t_task_exam
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam`;
CREATE TABLE `t_task_exam`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grade_level` int(0) NULL DEFAULT NULL COMMENT '级别',
  `frame_text_content_id` int(0) NULL DEFAULT NULL COMMENT '任务框架 内容为JSON',
  `create_user` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `create_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_task_exam
-- ----------------------------
INSERT INTO `t_task_exam` VALUES (1, '高一化学训练1', 10, 8, 2, '2022-10-29 10:55:47', b'0', 'admin');
INSERT INTO `t_task_exam` VALUES (2, '高三化学训练', 12, 14, 2, '2022-10-29 11:09:40', b'0', 'admin');
INSERT INTO `t_task_exam` VALUES (3, '高一化学训练2', 10, 16, 2, '2022-10-29 11:13:35', b'0', 'admin');

-- ----------------------------
-- Table structure for t_task_exam_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam_customer_answer`;
CREATE TABLE `t_task_exam_customer_answer`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `task_exam_id` int(0) NULL DEFAULT NULL,
  `create_user` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `text_content_id` int(0) NULL DEFAULT NULL COMMENT '任务完成情况(Json)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_task_exam_customer_answer
-- ----------------------------
INSERT INTO `t_task_exam_customer_answer` VALUES (1, 1, 3, '2022-10-29 10:56:21', 9);
INSERT INTO `t_task_exam_customer_answer` VALUES (2, 1, 6, '2022-10-29 11:06:18', 11);
INSERT INTO `t_task_exam_customer_answer` VALUES (3, 3, 3, '2022-10-29 13:36:21', 18);

-- ----------------------------
-- Table structure for t_text_content
-- ----------------------------
DROP TABLE IF EXISTS `t_text_content`;
CREATE TABLE `t_text_content`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_text_content
-- ----------------------------
INSERT INTO `t_text_content` VALUES (1, '{\"titleContent\":\"这是一道化学题\",\"analyze\":\"5\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"1\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"2\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"3\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"4\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2022-10-29 10:07:28');
INSERT INTO `t_text_content` VALUES (2, '{\"titleContent\":\"这是判断题\",\"analyze\":\"无\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2022-10-29 10:08:42');
INSERT INTO `t_text_content` VALUES (3, '{\"titleContent\":\"填空题<span class=\\\"gapfilling-span 1908b578-b54c-4182-9fc8-39c6fb24c759\\\">1</span>\",\"analyze\":\"无\",\"questionItemObjects\":[{\"prefix\":\"1\",\"content\":\"AAA\",\"score\":20,\"itemUuid\":\"1908b578-b54c-4182-9fc8-39c6fb24c759\"}],\"correct\":\"\"}', '2022-10-29 10:09:49');
INSERT INTO `t_text_content` VALUES (4, '{\"titleContent\":\"这是一道简答题，请默写元素周期表1-20\",\"analyze\":\"无\",\"questionItemObjects\":[],\"correct\":\"<span style=\\\"color: #121212; font-family: -apple-system, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Microsoft YaHei&quot;, &quot;Source Han Sans SC&quot;, &quot;Noto Sans CJK SC&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; font-size: medium; background-color: #FFFFFF;\\\">氢，氦，锂，铍，硼，碳，氮，氧，氟，氖，钠，镁，铝，硅，磷，硫，氯，氩，钾，钙</span>\"}', '2022-10-29 10:14:52');
INSERT INTO `t_text_content` VALUES (5, '[{\"name\":\"一、选择题\",\"questionItems\":[{\"id\":1,\"itemOrder\":1}]},{\"name\":\"二、判断题\",\"questionItems\":[{\"id\":2,\"itemOrder\":2}]},{\"name\":\"三、填空题\",\"questionItems\":[{\"id\":3,\"itemOrder\":3}]},{\"name\":\"四、简答题\",\"questionItems\":[{\"id\":4,\"itemOrder\":4}]}]', '2022-10-29 10:19:08');
INSERT INTO `t_text_content` VALUES (6, '[{\"name\":\"一、选择题\",\"questionItems\":[{\"id\":1,\"itemOrder\":1}]}]', '2022-10-29 10:34:32');
INSERT INTO `t_text_content` VALUES (7, '[{\"name\":\"一、单选题\",\"questionItems\":[{\"id\":1,\"itemOrder\":1}]}]', '2022-10-29 10:39:54');
INSERT INTO `t_text_content` VALUES (8, '[{\"examPaperId\":2,\"examPaperName\":\"2022 苏州学府中学高一化学调研\",\"itemOrder\":null}]', '2022-10-29 10:55:47');
INSERT INTO `t_text_content` VALUES (9, '[{\"examPaperId\":2,\"examPaperAnswerId\":1,\"status\":2}]', '2022-10-29 10:56:21');
INSERT INTO `t_text_content` VALUES (10, '{\"titleContent\":\"单选题12121\",\"analyze\":\"无\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"12\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"21\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"22\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"34\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2022-10-29 11:06:06');
INSERT INTO `t_text_content` VALUES (11, '[{\"examPaperId\":2,\"examPaperAnswerId\":2,\"status\":2}]', '2022-10-29 11:06:18');
INSERT INTO `t_text_content` VALUES (12, '{\"titleContent\":\"判断题222\",\"analyze\":\"无\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2022-10-29 11:06:43');
INSERT INTO `t_text_content` VALUES (13, '[{\"name\":\"一、单选题\",\"questionItems\":[{\"id\":5,\"itemOrder\":1}]},{\"name\":\"二、判断题\",\"questionItems\":[{\"id\":6,\"itemOrder\":2}]}]', '2022-10-29 11:08:03');
INSERT INTO `t_text_content` VALUES (14, '[{\"examPaperId\":4,\"examPaperName\":\"2022 苏州金鸡湖中学高三化学调研（一）\",\"itemOrder\":null}]', '2022-10-29 11:09:40');
INSERT INTO `t_text_content` VALUES (15, '[{\"name\":\"一、单选题\",\"questionItems\":[{\"id\":1,\"itemOrder\":1}]},{\"name\":\"二、判断题\",\"questionItems\":[{\"id\":2,\"itemOrder\":2}]},{\"name\":\"三、简答题\",\"questionItems\":[{\"id\":4,\"itemOrder\":3}]}]', '2022-10-29 11:13:02');
INSERT INTO `t_text_content` VALUES (16, '[{\"examPaperId\":5,\"examPaperName\":\"2022 苏州科技大学附属中学高一化学调研（一）\",\"itemOrder\":null}]', '2022-10-29 11:13:35');
INSERT INTO `t_text_content` VALUES (17, '5435', '2022-10-29 13:36:21');
INSERT INTO `t_text_content` VALUES (18, '[{\"examPaperId\":5,\"examPaperAnswerId\":3,\"status\":2}]', '2022-10-29 13:36:21');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `age` int(0) NULL DEFAULT NULL,
  `sex` int(0) NULL DEFAULT NULL COMMENT '1.男 2女',
  `birth_day` datetime(0) NULL DEFAULT NULL,
  `user_level` int(0) NULL DEFAULT NULL COMMENT '学生年级(1-12)',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` int(0) NULL DEFAULT NULL COMMENT '1.学生 2.老师 3.管理员',
  `status` int(0) NULL DEFAULT NULL COMMENT '1.启用 2禁用',
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `modify_time` datetime(0) NULL DEFAULT NULL,
  `last_active_time` datetime(0) NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL COMMENT '是否删除',
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openId',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'd2d29da2-dcb3-4013-b874-727626236f47', 'student', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '学生', 18, 1, '2019-09-01 16:00:00', 12, '158800882', 1, 1, 'http://image.alvisu.com/Fn4CyLHWvT-kxIrK1ZaqTDidvXzj', '2019-09-07 18:55:02', '2020-02-04 08:26:54', NULL, b'0', NULL);
INSERT INTO `t_user` VALUES (2, '52045f5f-a13f-4ccc-93dd-f7ee8270ad4c', 'admin', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '管理员', 30, 1, '2019-09-07 18:56:07', NULL, NULL, 3, 1, NULL, '2019-09-07 18:56:21', NULL, NULL, b'0', NULL);
INSERT INTO `t_user` VALUES (3, '5eccabc8-a586-4de4-a838-19b4e6dbaa89', 'neo', 'OGpA7iTsRixNwj5qCGm3xeFcCLt+kyr6WBzegRT6VjMatOsYLCH805AtpRsmG8TTfy28xaPztSh6Xqh178N82Dscq2h64I8SJespVzTiilwd4SH7QmxVBuhOING51xuQfl/hwGaDzFiVwFCtcDOCY3jmi2cm3I0TIaIS+JHTBoE=', NULL, NULL, NULL, NULL, 10, NULL, 1, 1, NULL, '2022-10-28 22:46:44', NULL, '2022-10-28 22:46:44', b'0', NULL);
INSERT INTO `t_user` VALUES (4, '7f674b7b-6ce6-4524-ae33-006378655ee7', 'lwt123', 'G1TqGf2NELmojnOlOcwzariBmxNGKrvhnTGE+52q8+d0JxB4LUGN0LcUDR4EJCf29vKOqO6UBbXizSwKzptrI9R2TR6F2WypewFupsLmVSHTQ9ruxR6ocNoz/EtX0rGAXy0tlKEv3WdnbBI2ibu+sA7J6G++mCOxckZ0+iJnk1E=', 'lwt', NULL, 2, NULL, NULL, NULL, 3, 1, NULL, '2022-10-28 23:05:51', '2022-10-29 09:55:26', '2022-10-28 23:05:51', b'0', NULL);
INSERT INTO `t_user` VALUES (5, '2f5c404a-1927-4a58-b96f-b5050a2f4fef', '秦钲皓', 'AVNYfSxg2i6YjTrmtQJRUsxr2P4uXQIt/1+LwGnQFKZH7sXQ6aNYKxDLlDX/pLCd+WGDDpEpKrIXe2MY9S/m068DdU3WJrrZY0DSxT2EjZyPIywBsGYIm4xt+xBrV2es8BdJa78DHSlcx53+1xEdwKJ98ZRF6e7K2danH1aWFvk=', NULL, NULL, NULL, NULL, 12, NULL, 1, 1, NULL, '2022-10-28 23:54:21', '2022-10-29 10:21:53', '2022-10-28 23:54:21', b'0', NULL);
INSERT INTO `t_user` VALUES (6, '669fc6fd-7de0-48fe-8dc2-c08a789fb908', 'lwt', 'KXERQyXhVlNIM+fwo0jb6VIro3+yuapz3K0uYFZHj7TnIYMGJYdrLHSgA91K8m5Dg0JiZjwVpfuE5H06pZZmIFZ2hJrB5GdDvttY+nc+YkzNobTgcm9MiWEkiQukaVjMhlm2GgTSCGO0jFDv/stHBH9+xDGuIUtXXODRnC29KRU=', NULL, NULL, NULL, NULL, 10, NULL, 1, 1, NULL, '2022-10-29 11:05:59', NULL, '2022-10-29 11:05:59', b'0', NULL);
INSERT INTO `t_user` VALUES (7, 'f6a45cc6-97f2-4942-bc18-9a4920331777', 'hhh', 'hW/1LDDeOoVzIO8YNkWxe/Tvn9u/UepgIwQkpCVd+C7oTVuEMv9XGluvO5Xoovy7vOAikCaxFj+vTpnFWj3UZsBkK8bzgqWLDhrq/78DldpQqR+ie9h1Ep651djXdm7iChPVWYSxX2pvxFvF/Bl3qmRfmyDp28C8hHxAloLrAsE=', NULL, NULL, NULL, NULL, 12, NULL, 1, 1, NULL, '2022-10-29 13:30:42', NULL, '2022-10-29 13:30:42', b'0', NULL);

-- ----------------------------
-- Table structure for t_user_event_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_event_log`;
CREATE TABLE `t_user_event_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_event_log
-- ----------------------------
INSERT INTO `t_user_event_log` VALUES (1, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-28 22:46:32');
INSERT INTO `t_user_event_log` VALUES (2, 3, 'neo', NULL, '欢迎 neo 注册来到高中化学考试系统', '2022-10-28 22:46:44');
INSERT INTO `t_user_event_log` VALUES (3, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-28 22:46:49');
INSERT INTO `t_user_event_log` VALUES (4, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-28 23:05:22');
INSERT INTO `t_user_event_log` VALUES (5, 5, '秦钲皓', NULL, '欢迎 秦钲皓 注册来到高中化学考试系统', '2022-10-28 23:54:21');
INSERT INTO `t_user_event_log` VALUES (6, 5, '秦钲皓', NULL, '秦钲皓 登录了学之思开源考试系统', '2022-10-28 23:54:30');
INSERT INTO `t_user_event_log` VALUES (7, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 00:13:12');
INSERT INTO `t_user_event_log` VALUES (8, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 09:54:00');
INSERT INTO `t_user_event_log` VALUES (9, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 09:54:10');
INSERT INTO `t_user_event_log` VALUES (10, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 09:55:11');
INSERT INTO `t_user_event_log` VALUES (11, 2, 'admin', '管理员', 'admin 登出了学之思开源考试系统', '2022-10-29 09:57:33');
INSERT INTO `t_user_event_log` VALUES (12, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 09:57:35');
INSERT INTO `t_user_event_log` VALUES (13, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 10:04:52');
INSERT INTO `t_user_event_log` VALUES (14, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 10:19:19');
INSERT INTO `t_user_event_log` VALUES (15, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 10:19:37');
INSERT INTO `t_user_event_log` VALUES (16, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 10:29:20');
INSERT INTO `t_user_event_log` VALUES (17, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 10:33:26');
INSERT INTO `t_user_event_log` VALUES (18, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 10:40:03');
INSERT INTO `t_user_event_log` VALUES (19, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 10:40:18');
INSERT INTO `t_user_event_log` VALUES (20, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 10:56:03');
INSERT INTO `t_user_event_log` VALUES (21, 3, 'neo', NULL, 'neo 提交试卷：2022 苏州学府中学高一化学调研 得分：3 耗时：9 秒', '2022-10-29 10:56:21');
INSERT INTO `t_user_event_log` VALUES (22, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 10:58:33');
INSERT INTO `t_user_event_log` VALUES (23, 6, 'lwt', NULL, '欢迎 lwt 注册来到高中化学考试系统', '2022-10-29 11:05:59');
INSERT INTO `t_user_event_log` VALUES (24, 6, 'lwt', NULL, 'lwt 登录了学之思开源考试系统', '2022-10-29 11:06:07');
INSERT INTO `t_user_event_log` VALUES (25, 6, 'lwt', NULL, 'lwt 提交试卷：2022 苏州学府中学高一化学调研 得分：3 耗时：4 秒', '2022-10-29 11:06:18');
INSERT INTO `t_user_event_log` VALUES (26, 6, 'lwt', NULL, 'lwt 登出了学之思开源考试系统', '2022-10-29 11:06:33');
INSERT INTO `t_user_event_log` VALUES (27, 6, 'lwt', NULL, 'lwt 登录了学之思开源考试系统', '2022-10-29 11:07:51');
INSERT INTO `t_user_event_log` VALUES (28, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 11:14:11');
INSERT INTO `t_user_event_log` VALUES (29, 3, 'neo', NULL, 'neo 登出了学之思开源考试系统', '2022-10-29 11:14:21');
INSERT INTO `t_user_event_log` VALUES (30, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 11:14:22');
INSERT INTO `t_user_event_log` VALUES (31, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 11:14:52');
INSERT INTO `t_user_event_log` VALUES (32, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 11:15:57');
INSERT INTO `t_user_event_log` VALUES (33, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 11:16:30');
INSERT INTO `t_user_event_log` VALUES (34, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 11:18:01');
INSERT INTO `t_user_event_log` VALUES (35, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 11:18:11');
INSERT INTO `t_user_event_log` VALUES (36, 3, 'neo', NULL, 'neo 登出了学之思开源考试系统', '2022-10-29 11:18:20');
INSERT INTO `t_user_event_log` VALUES (37, 6, 'lwt', NULL, 'lwt 登录了学之思开源考试系统', '2022-10-29 11:18:26');
INSERT INTO `t_user_event_log` VALUES (38, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 11:18:40');
INSERT INTO `t_user_event_log` VALUES (39, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 13:26:00');
INSERT INTO `t_user_event_log` VALUES (40, 7, 'hhh', NULL, '欢迎 hhh 注册来到高中化学考试系统', '2022-10-29 13:30:42');
INSERT INTO `t_user_event_log` VALUES (41, 7, 'hhh', NULL, 'hhh 登录了学之思开源考试系统', '2022-10-29 13:30:49');
INSERT INTO `t_user_event_log` VALUES (42, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 13:32:12');
INSERT INTO `t_user_event_log` VALUES (43, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 13:34:45');
INSERT INTO `t_user_event_log` VALUES (44, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 13:35:16');
INSERT INTO `t_user_event_log` VALUES (45, 3, 'neo', NULL, 'neo 登录了学之思开源考试系统', '2022-10-29 13:35:56');
INSERT INTO `t_user_event_log` VALUES (46, 3, 'neo', NULL, 'neo 提交试卷：2022 苏州科技大学附属中学高一化学调研（一） 得分：2 耗时：9 秒', '2022-10-29 13:36:21');
INSERT INTO `t_user_event_log` VALUES (47, 3, 'neo', NULL, 'neo 批改试卷：2022 苏州科技大学附属中学高一化学调研（一） 得分：2', '2022-10-29 13:40:57');
INSERT INTO `t_user_event_log` VALUES (48, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 13:41:37');
INSERT INTO `t_user_event_log` VALUES (49, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2022-10-29 14:53:13');

-- ----------------------------
-- Table structure for t_user_token
-- ----------------------------
DROP TABLE IF EXISTS `t_user_token`;
CREATE TABLE `t_user_token`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `token` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL COMMENT '用户Id',
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openId',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_token
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;

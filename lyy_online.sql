/*
Navicat MySQL Data Transfer

Source Server         : mytest
Source Server Version : 80018
Source Host           : localhost:3306
Source Database       : lyy_online

Target Server Type    : MYSQL
Target Server Version : 80018
File Encoding         : 65001

Date: 2020-11-12 20:23:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add 轮播图', '6', 'add_banner');
INSERT INTO `auth_permission` VALUES ('22', 'Can change 轮播图', '6', 'change_banner');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete 轮播图', '6', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('24', 'Can view 轮播图', '6', 'view_banner');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 邮箱验证码', '7', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 邮箱验证码', '7', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 邮箱验证码', '7', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('28', 'Can view 邮箱验证码', '7', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('29', 'Can add 用户信息', '8', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('30', 'Can change 用户信息', '8', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete 用户信息', '8', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('32', 'Can view 用户信息', '8', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('33', 'Can add 章节', '9', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('34', 'Can change 章节', '9', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete 章节', '9', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('36', 'Can view 章节', '9', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 视频', '10', 'add_video');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 视频', '10', 'change_video');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 视频', '10', 'delete_video');
INSERT INTO `auth_permission` VALUES ('40', 'Can view 视频', '10', 'view_video');
INSERT INTO `auth_permission` VALUES ('41', 'Can add 课程', '11', 'add_course');
INSERT INTO `auth_permission` VALUES ('42', 'Can change 课程', '11', 'change_course');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete 课程', '11', 'delete_course');
INSERT INTO `auth_permission` VALUES ('44', 'Can view 课程', '11', 'view_course');
INSERT INTO `auth_permission` VALUES ('45', 'Can add 课程资源', '12', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('46', 'Can change 课程资源', '12', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete 课程资源', '12', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('48', 'Can view 课程资源', '12', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 教师', '13', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 教师', '13', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 教师', '13', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('52', 'Can view 教师', '13', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('53', 'Can add 城市', '14', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('54', 'Can change 城市', '14', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete 城市', '14', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('56', 'Can view 城市', '14', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('57', 'Can add 课程机构', '15', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('58', 'Can change 课程机构', '15', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete 课程机构', '15', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('60', 'Can view 课程机构', '15', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 用户咨询', '16', 'add_userask');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 用户咨询', '16', 'change_userask');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 用户咨询', '16', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('64', 'Can view 用户咨询', '16', 'view_userask');
INSERT INTO `auth_permission` VALUES ('65', 'Can add 用户消息', '17', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('66', 'Can change 用户消息', '17', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete 用户消息', '17', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 用户消息', '17', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('69', 'Can add 用户收藏', '18', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('70', 'Can change 用户收藏', '18', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete 用户收藏', '18', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 用户收藏', '18', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('73', 'Can add 课程评论', '19', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('74', 'Can change 课程评论', '19', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete 课程评论', '19', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 课程评论', '19', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('77', 'Can add 用户课程', '20', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('78', 'Can change 用户课程', '20', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete 用户课程', '20', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('80', 'Can view 用户课程', '20', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('81', 'Can add Bookmark', '21', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('82', 'Can change Bookmark', '21', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete Bookmark', '21', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('84', 'Can view Bookmark', '21', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('85', 'Can add User Setting', '22', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('86', 'Can change User Setting', '22', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete User Setting', '22', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('88', 'Can view User Setting', '22', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('89', 'Can add User Widget', '23', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('90', 'Can change User Widget', '23', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete User Widget', '23', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('92', 'Can view User Widget', '23', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('93', 'Can add log entry', '24', 'add_log');
INSERT INTO `auth_permission` VALUES ('94', 'Can change log entry', '24', 'change_log');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete log entry', '24', 'delete_log');
INSERT INTO `auth_permission` VALUES ('96', 'Can view log entry', '24', 'view_log');
INSERT INTO `auth_permission` VALUES ('97', 'Can add revision', '25', 'add_revision');
INSERT INTO `auth_permission` VALUES ('98', 'Can change revision', '25', 'change_revision');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete revision', '25', 'delete_revision');
INSERT INTO `auth_permission` VALUES ('100', 'Can view revision', '25', 'view_revision');
INSERT INTO `auth_permission` VALUES ('101', 'Can add version', '26', 'add_version');
INSERT INTO `auth_permission` VALUES ('102', 'Can change version', '26', 'change_version');
INSERT INTO `auth_permission` VALUES ('103', 'Can delete version', '26', 'delete_version');
INSERT INTO `auth_permission` VALUES ('104', 'Can view version', '26', 'view_version');
INSERT INTO `auth_permission` VALUES ('105', 'Can add captcha store', '27', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('106', 'Can change captcha store', '27', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('107', 'Can delete captcha store', '27', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('108', 'Can view captcha store', '27', 'view_captchastore');

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('98', 'IRXL', 'irxl', '0e7c9cfa0af0f39bccf0c90481f77fd4afa5b578', '2020-11-09 19:12:04.795423');
INSERT INTO `captcha_captchastore` VALUES ('99', 'PBBA', 'pbba', 'a9a4590a3802be4f763b6ad8a84e5781b8643ac3', '2020-11-09 19:12:04.977097');
INSERT INTO `captcha_captchastore` VALUES ('100', 'NGMU', 'ngmu', 'a9ff71cb8a59433e20693608d16c638be74032a4', '2020-11-09 19:13:54.675900');
INSERT INTO `captcha_captchastore` VALUES ('101', 'VDAB', 'vdab', 'bb062d2c23bfbca709616d82c83c9126f9baaa99', '2020-11-09 19:15:28.190894');
INSERT INTO `captcha_captchastore` VALUES ('103', 'IQJY', 'iqjy', 'dd4ca5e425cf4aeb09a78816d82ef3e16ec03ba5', '2020-11-09 19:19:13.029462');
INSERT INTO `captcha_captchastore` VALUES ('104', 'YAMH', 'yamh', 'a312f2b095b7e4f7c14c78911581223f3b31453d', '2020-11-09 19:19:13.072346');
INSERT INTO `captcha_captchastore` VALUES ('105', 'YKSG', 'yksg', '1f92660b1ed61c07462f441bb583ee7a5677cdb2', '2020-11-09 19:20:06.781189');
INSERT INTO `captcha_captchastore` VALUES ('106', 'KMDI', 'kmdi', 'a1f30da3052d952905f506267844819571bb77c8', '2020-11-09 19:20:06.796145');
INSERT INTO `captcha_captchastore` VALUES ('107', 'UWGJ', 'uwgj', 'c22106797c1b319e82d34b6844d379aea24575f2', '2020-11-09 19:20:10.023750');
INSERT INTO `captcha_captchastore` VALUES ('108', 'NVZO', 'nvzo', 'dc35fd44b3d1a5e9c6e34800b53c8441477f68c7', '2020-11-09 19:20:10.043697');
INSERT INTO `captcha_captchastore` VALUES ('109', 'GOEM', 'goem', '216ecac5dcda406f0d63735aeea4aa1ea06f3d91', '2020-11-09 19:20:46.172141');

-- ----------------------------
-- Table structure for course_course
-- ----------------------------
DROP TABLE IF EXISTS `course_course`;
CREATE TABLE `course_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(2) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_org_id` int(11) DEFAULT NULL,
  `category` varchar(20) NOT NULL,
  `tag` varchar(10) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  `teacher_tell` varchar(300) NOT NULL,
  `youneed_know` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_course_course_org_id_6a10e205_fk_organizat` (`course_org_id`),
  KEY `course_course_teacher_id_f04a37b5_fk_organization_teacher_id` (`teacher_id`),
  CONSTRAINT `course_course_course_org_id_6a10e205_fk_organizat` FOREIGN KEY (`course_org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `course_course_teacher_id_f04a37b5_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_course
-- ----------------------------
INSERT INTO `course_course` VALUES ('1', 'python基础', 'python 是一门面相对象的计算机解释器编译型语言。', 'python是一门面向对象的解释型计算机设计语言，拥有丰富和强大的库，Python除了极少的事情不能做之外，其他基本上可以说全能，系统运维、图形处理、数学处理、文本处理、数据库编程、网络编程、web编程、多媒体应用、pymo引擎、黑客编程、爬虫编写、机器学习、人工智能等等。Python除了极少的事情不能做之外，其他基本上可以说全能，系统运维、图形处理、数学处理、文本处理、数据库编程、网络编程、web编程、多媒体应用、pymo引擎、黑客编程、爬虫编写、机器学习、人工智能等等。', 'gj', '180000', '10012', '0', 'courses/2020/11/微信图片_20191030093244.png', '38', '2020-11-09 19:49:00.000000', '2', '编程', 'python', '5', '基础要扎实，不懂就要问', 'python要知道各种基础的运用');
INSERT INTO `course_course` VALUES ('2', 'django', 'django强大的框架', '基于python建立的django框架，内置了强大的后台', 'zj', '3600', '1536', '562', 'courses/2020/11/WIN_20191225_10_51_06_Pro.jpg', '80', '2020-11-09 20:00:00.000000', '6', '', '', null, '', '');
INSERT INTO `course_course` VALUES ('3', 'flask', 'flask框架', 'flask框架，非常的灵活好用，即插即用，深受各大公司的喜爱', 'zj', '8000', '900', '800', 'courses/2020/11/微信图片_20200916104136.jpg', '78', '2020-11-09 20:02:00.000000', '7', '', '', null, '', '');
INSERT INTO `course_course` VALUES ('4', 'HMTL', 'html', 'asdasdasda sdascxaccasc', 'zj', '7222', '555', '450', 'courses/2020/11/WIN_20200106_09_40_09_Pro.jpg', '80', '2020-11-09 20:11:00.000000', '2', '', '', null, '', '');
INSERT INTO `course_course` VALUES ('5', 'JAVA', 'yuyan', '高级灵活的编程语言', 'gj', '10000', '788', '577', 'courses/2020/11/WIN_20191225_10_51_04_Pro.jpg', '57', '2020-11-09 20:12:00.000000', '4', '', '', null, '', '');
INSERT INTO `course_course` VALUES ('6', 'Javascript', 'js语言', '操作页面html的语言', 'zj', '1000', '766', '777', 'courses/2020/11/WIN_20190819_19_09_13_Pro.jpg', '575', '2020-11-09 20:13:00.000000', '5', '', '', null, '', '');
INSERT INTO `course_course` VALUES ('7', '爬虫spider', '数据语言', '大数据', 'gj', '12112', '2222', '1212', 'courses/2020/11/微信图片_20191204171655.jpg', '2350', '2020-11-09 20:16:00.000000', '1', '', '', null, '', '');
INSERT INTO `course_course` VALUES ('8', '厨师', '调查显示，“经济发达，经济发展迅速，经济实力强”是上海“宜居”的主要原因。而北京的入选，很大程度上是由于“北京是中国的首都，在各方面都具有优势”。', '调查显示，“经济发达，经济发展迅速，经济实力强”是上海“宜居”的主要原因。而北京的入选，很大程度上是由于“北京是中国的首都，在各方面都具有优势”。', 'zj', '555', '55', '555', 'courses/2020/11/WIN_20191225_10_51_06_Pro_SPudMpb.jpg', '68', '2020-11-09 20:41:00.000000', '1', '', '', null, '', '');

-- ----------------------------
-- Table structure for course_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `course_courseresource`;
CREATE TABLE `course_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_courseresource_course_id_d5504211_fk_course_course_id` (`course_id`),
  CONSTRAINT `course_courseresource_course_id_d5504211_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_courseresource
-- ----------------------------
INSERT INTO `course_courseresource` VALUES ('1', '基础资料', 'course/resource/2020/11/day1__day2_1.doc', '2020-11-11 15:30:00.000000', '1');
INSERT INTO `course_courseresource` VALUES ('2', '前端课件', 'course/resource/2020/11/index.html', '2020-11-11 15:31:00.000000', '4');

-- ----------------------------
-- Table structure for course_lesson
-- ----------------------------
DROP TABLE IF EXISTS `course_lesson`;
CREATE TABLE `course_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_lesson_course_id_65df4a1c_fk_course_course_id` (`course_id`),
  CONSTRAINT `course_lesson_course_id_65df4a1c_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_lesson
-- ----------------------------
INSERT INTO `course_lesson` VALUES ('1', 'python基础-1', '2020-11-11 15:11:00.000000', '1');
INSERT INTO `course_lesson` VALUES ('2', 'python基础-2', '2020-11-11 15:13:00.000000', '1');
INSERT INTO `course_lesson` VALUES ('3', 'pythonj基础-3', '2020-11-11 15:13:00.000000', '1');

-- ----------------------------
-- Table structure for course_video
-- ----------------------------
DROP TABLE IF EXISTS `course_video`;
CREATE TABLE `course_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(200) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `course_video_lesson_id_0731e8a9_fk_course_lesson_id` (`lesson_id`),
  CONSTRAINT `course_video_lesson_id_0731e8a9_fk_course_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `course_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_video
-- ----------------------------
INSERT INTO `course_video` VALUES ('1', '第一节', '2020-11-11 15:13:00.000000', '1', 'http://www.sigocn.com/dpl/xiongdiying/v3-1/', '0');
INSERT INTO `course_video` VALUES ('2', '第二节', '2020-11-11 15:21:00.000000', '1', 'https://www.xjxs.net/vodplay/117195-1-1.html', '0');
INSERT INTO `course_video` VALUES ('3', '第三节', '2020-11-11 15:23:00.000000', '1', 'http://vjs.zencdn.net/v/oceans.mp4', '50');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('27', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('11', 'course', 'course');
INSERT INTO `django_content_type` VALUES ('12', 'course', 'courseresource');
INSERT INTO `django_content_type` VALUES ('9', 'course', 'lesson');
INSERT INTO `django_content_type` VALUES ('10', 'course', 'video');
INSERT INTO `django_content_type` VALUES ('19', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('16', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('20', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('18', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('17', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('14', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('15', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('13', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('25', 'reversion', 'revision');
INSERT INTO `django_content_type` VALUES ('26', 'reversion', 'version');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('21', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-11-03 01:39:49.188509');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2020-11-03 01:39:49.360766');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2020-11-03 01:39:49.519846');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2020-11-03 01:39:49.917782');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2020-11-03 01:39:49.928752');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2020-11-03 01:39:49.938725');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2020-11-03 01:39:49.949695');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2020-11-03 01:39:49.956681');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2020-11-03 01:39:49.967648');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2020-11-03 01:39:49.979616');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2020-11-03 01:39:49.988615');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0010_alter_group_name_max_length', '2020-11-03 01:39:50.069377');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0011_update_proxy_permissions', '2020-11-03 01:39:50.080346');
INSERT INTO `django_migrations` VALUES ('14', 'users', '0001_initial', '2020-11-03 01:39:50.268842');
INSERT INTO `django_migrations` VALUES ('15', 'admin', '0001_initial', '2020-11-03 01:39:50.682309');
INSERT INTO `django_migrations` VALUES ('16', 'admin', '0002_logentry_remove_auto_add', '2020-11-03 01:39:50.907234');
INSERT INTO `django_migrations` VALUES ('17', 'admin', '0003_logentry_add_action_flag_choices', '2020-11-03 01:39:50.920198');
INSERT INTO `django_migrations` VALUES ('18', 'sessions', '0001_initial', '2020-11-03 01:39:50.957103');
INSERT INTO `django_migrations` VALUES ('19', 'course', '0001_initial', '2020-11-03 01:41:34.920712');
INSERT INTO `django_migrations` VALUES ('20', 'operation', '0001_initial', '2020-11-03 01:41:35.299699');
INSERT INTO `django_migrations` VALUES ('21', 'organization', '0001_initial', '2020-11-03 01:41:35.933005');
INSERT INTO `django_migrations` VALUES ('22', 'reversion', '0001_squashed_0004_auto_20160611_1202', '2020-11-03 10:45:55.462065');
INSERT INTO `django_migrations` VALUES ('23', 'xadmin', '0001_initial', '2020-11-03 10:45:55.825094');
INSERT INTO `django_migrations` VALUES ('24', 'xadmin', '0002_log', '2020-11-03 10:45:56.169197');
INSERT INTO `django_migrations` VALUES ('25', 'xadmin', '0003_auto_20160715_0100', '2020-11-03 10:45:56.469371');
INSERT INTO `django_migrations` VALUES ('26', 'users', '0002_auto_20201103_1725', '2020-11-03 17:25:41.280235');
INSERT INTO `django_migrations` VALUES ('27', 'captcha', '0001_initial', '2020-11-05 09:47:40.659159');
INSERT INTO `django_migrations` VALUES ('28', 'organization', '0002_courseorg_category', '2020-11-06 10:25:54.156753');
INSERT INTO `django_migrations` VALUES ('29', 'organization', '0003_auto_20201108_1446', '2020-11-08 14:46:15.680079');
INSERT INTO `django_migrations` VALUES ('30', 'users', '0003_auto_20201108_1913', '2020-11-08 19:14:09.309710');
INSERT INTO `django_migrations` VALUES ('31', 'course', '0002_course_course_org', '2020-11-09 09:49:56.189844');
INSERT INTO `django_migrations` VALUES ('32', 'organization', '0004_teacher_image', '2020-11-09 20:36:15.989454');
INSERT INTO `django_migrations` VALUES ('33', 'course', '0003_course_category', '2020-11-11 09:05:21.282829');
INSERT INTO `django_migrations` VALUES ('34', 'course', '0004_course_tag', '2020-11-11 14:32:34.922744');
INSERT INTO `django_migrations` VALUES ('35', 'course', '0005_video_url', '2020-11-11 15:09:28.943589');
INSERT INTO `django_migrations` VALUES ('36', 'course', '0006_video_learn_times', '2020-11-11 15:27:22.266875');
INSERT INTO `django_migrations` VALUES ('37', 'course', '0007_auto_20201111_1541', '2020-11-11 15:41:16.615530');
INSERT INTO `django_migrations` VALUES ('38', 'organization', '0005_teacher_teacher_age', '2020-11-12 09:16:20.275838');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('04h6nfx6m2zf7yuwsok85yaroj7phy5d', 'M2RiOGIzOWI1NzFjODhmZTc1YzJlMTZkYWNiOTkxM2MxZGE4MDNhMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMjEzYTk5Mzk5YzRmMjRhYjg4OGJkNDg2OWE4NDQwMTVmZjEyNTNmIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXX0=', '2020-11-17 11:01:40.332523');
INSERT INTO `django_session` VALUES ('1rt1kivrn99ib4x96wnsqrqw53s6f8z0', 'YWE3MjIzNzYyY2NiZTliZmI2MGQwYzEzNTJlYTM5YzkxNGNmODZhYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwcy51c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmJhYzA0YzRlZDEzNmMyN2M0ZWZkMzhhNWQ5YjYwYTdmNDJjNjE4NyJ9', '2020-11-23 09:02:39.279166');
INSERT INTO `django_session` VALUES ('4uguqhikewisol2ltjha8g7p9clm9ge2', 'NThjYzNjNTcyMzcwNTRhNDk1OTE4MTk0NmYwOGQ4YzlkZTQ0ZGQyNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMjEzYTk5Mzk5YzRmMjRhYjg4OGJkNDg2OWE4NDQwMTVmZjEyNTNmIiwiTElTVF9RVUVSWSI6W1siY291cnNlIiwiY291cnNlcmVzb3VyY2UiXSwiIl19', '2020-11-18 19:36:51.088389');
INSERT INTO `django_session` VALUES ('50t39f7u3z1crjgs7eakzdl7q4bgrwgn', 'MThhYzc5ZDlkZGU0ZjRlNzAxNWEzZTE4ZTMxZjc5MjZhZDc4OWE4Yzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwcy51c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDIxM2E5OTM5OWM0ZjI0YWI4ODhiZDQ4NjlhODQ0MDE1ZmYxMjUzZiIsIkxJU1RfUVVFUlkiOltbIm9yZ2FuaXphdGlvbiIsImNvdXJzZW9yZyJdLCIiXX0=', '2020-11-20 15:36:18.447184');
INSERT INTO `django_session` VALUES ('63ppnr0znd6ozwofqrhpqlbjb44eb09f', 'YWE3MjIzNzYyY2NiZTliZmI2MGQwYzEzNTJlYTM5YzkxNGNmODZhYzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwcy51c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMmJhYzA0YzRlZDEzNmMyN2M0ZWZkMzhhNWQ5YjYwYTdmNDJjNjE4NyJ9', '2020-11-22 10:18:57.598389');
INSERT INTO `django_session` VALUES ('abhyx237y8ory2ekxddr0x8jpylkuhi8', 'YzU4NWUzYTk4OGM2OGUwMzg3ZjA4YzdlNWIzZTVhODQ1NTdhMzEwMTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwcy51c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDIxM2E5OTM5OWM0ZjI0YWI4ODhiZDQ4NjlhODQ0MDE1ZmYxMjUzZiIsIkxJU1RfUVVFUlkiOltbIm9yZ2FuaXphdGlvbiIsImNpdHlkaWN0Il0sIiJdfQ==', '2020-11-22 10:22:29.430822');
INSERT INTO `django_session` VALUES ('mtmio2cy8yx1xkoe6popl3h5at3bc873', 'Zjk1Nzk3MGY3ZDYxOWVhNGI5Zjc3NzQzNzA1NjZmM2JmYjU0NzliNTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwcy51c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTU5OTBlODg0YWZlNjcwNzEwOGJhNmY2YmFjYmYxZDRiNmZiMzcxYiJ9', '2020-11-19 19:42:43.203696');
INSERT INTO `django_session` VALUES ('nieqmy8l2mqzk1d7j3xbn4qgoagn5uas', 'MTZlZjNmMzBiNTA3YTQ5MzYxN2MyNjYyNDBkMzM5ZTY4MWM3M2IwNzp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwcy51c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiY2UxNWY2NjEyYzQxYjc2ZDFlMzQ0NjgxMzU1Njk2MjM1NTAxNTZmOSIsIkxJU1RfUVVFUlkiOltbImNvdXJzZSIsInZpZGVvIl0sIiJdfQ==', '2020-11-26 15:38:56.753671');
INSERT INTO `django_session` VALUES ('nuhyryq4qrlxtijhyul5ybeastphvbqx', 'M2RiOGIzOWI1NzFjODhmZTc1YzJlMTZkYWNiOTkxM2MxZGE4MDNhMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkMjEzYTk5Mzk5YzRmMjRhYjg4OGJkNDg2OWE4NDQwMTVmZjEyNTNmIiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXX0=', '2020-11-17 11:03:05.129856');
INSERT INTO `django_session` VALUES ('ojpqt46gtfn3tf71xc0dpqe67k1nqmb4', 'ZjZlMTNmNWVjNWZkMmIxZTNlZjk1NjVjZTUxMWE2MDgxZDMzZTU5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwcy51c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDIxM2E5OTM5OWM0ZjI0YWI4ODhiZDQ4NjlhODQ0MDE1ZmYxMjUzZiIsIkxJU1RfUVVFUlkiOltbInVzZXJzIiwidXNlcnByb2ZpbGUiXSwiIl19', '2020-11-22 08:58:21.953157');
INSERT INTO `django_session` VALUES ('oud4y9weqrx1hh5ipvse3ax668re872e', 'ZjZlMTNmNWVjNWZkMmIxZTNlZjk1NjVjZTUxMWE2MDgxZDMzZTU5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYXBwcy51c2Vycy52aWV3cy5DdXN0b21CYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZDIxM2E5OTM5OWM0ZjI0YWI4ODhiZDQ4NjlhODQ0MDE1ZmYxMjUzZiIsIkxJU1RfUVVFUlkiOltbInVzZXJzIiwidXNlcnByb2ZpbGUiXSwiIl19', '2020-11-22 19:14:32.039282');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_course_course_id` (`course_id`),
  KEY `operation_coursecomm_user_id_f5ff70b3_fk_users_use` (`user_id`),
  CONSTRAINT `operation_coursecomm_user_id_f5ff70b3_fk_users_use` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES ('1', '王建鹏真的太帅了\n', '2020-11-11 20:46:21.393818', '1', '3');
INSERT INTO `operation_coursecomments` VALUES ('2', '一楼说的所言极是\n', '2020-11-11 20:50:25.876179', '1', '3');

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES ('1', '北京', '18734794234', 'llll', '2020-11-09 09:13:22.509765');
INSERT INTO `operation_userask` VALUES ('2', 'd', '18734794234', 'fdf', '2020-11-12 15:22:20.484457');
INSERT INTO `operation_userask` VALUES ('3', 'd', '18734794234', 'fdf', '2020-11-12 15:22:20.483422');

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_course_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_course_course_id` FOREIGN KEY (`course_id`) REFERENCES `course_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES ('1', '2020-11-11 15:37:00.000000', '1', '3');
INSERT INTO `operation_usercourse` VALUES ('2', '2020-11-11 21:11:53.513309', '2', '3');
INSERT INTO `operation_usercourse` VALUES ('3', '2020-11-11 21:12:17.711614', '7', '3');
INSERT INTO `operation_usercourse` VALUES ('4', '2020-11-12 14:31:45.938541', '8', '3');
INSERT INTO `operation_usercourse` VALUES ('5', '2020-11-12 15:21:25.782000', '4', '3');

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES ('19', '3', '3', '2020-11-12 15:12:41.978677', '3');
INSERT INTO `operation_userfavorite` VALUES ('21', '5', '3', '2020-11-12 15:14:49.041236', '3');
INSERT INTO `operation_userfavorite` VALUES ('27', '1', '1', '2020-11-12 15:19:19.857691', '3');

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES ('1', '北京', '调查显示，“经济发达，经济发展迅速，经济实力强”是上海“宜居”的主要原因。而北京的入选，很大程度上是由于“北京是中国的首都，在各方面都具有优势”。', '2020-11-06 09:21:00.000000');
INSERT INTO `organization_citydict` VALUES ('2', '上海', '酷爱旅游的研究生李晋拍摄的各地图片曾被中国《国家地理杂志》购买刊用，在接受记者采访时，一提到上海，他立刻滔滔不绝：“我心中有两个上海。第一个上海从新天地开始，一直到外滩3号。第二个上海是巨鹿路上的阿毛，火车站旁的锅贴，以及随处可见的便利店。当我第一次在午夜从便利店买到粽子时，我就承认，上海是个适合生活的城市。”', '2020-11-06 09:22:00.000000');
INSERT INTO `organization_citydict` VALUES ('3', '大连', '在评价一个城市是否适合居住时，分别有47.9%、46.1%和43.9%的受访者认为“交通方便快捷”、“城市干净整洁无污染”和“空气质量好”是成为“宜居城市”的必要条件，明显高于“经济发展水平”、“社会治安状况”、“社会保障水平”等其他因素', '2020-11-06 09:23:00.000000');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_courseo_city_id_4a842f85_fk_organizat` (`city_id`),
  CONSTRAINT `organization_courseo_city_id_4a842f85_fk_organizat` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('1', '新东方', '新东方，全名北京bai新东方教育科技（集团）有限du公司，总部位于北京市海淀区中关村，是规模最大的综合性教育集团，同时也是教育培训集团。公司业务包括外语培训、中小学基础教育、学前教育、在线教育、出国咨询、图书出版等各个领域', '0', '0', 'org/202011/xindongfang.gif', '北京市海淀区', '2020-11-06 10:31:00.000000', '1', 'pxjg', '0', '0');
INSERT INTO `organization_courseorg` VALUES ('2', '安博教育', '安博教育连续多年被新浪、搜狐、腾讯、《人民日报》、新华社等国内权威媒体誉为中国十大教育服务品牌，被《中国企业家》杂志评为“中国最具成长性企业21星”，被《商务周刊》连续三年评为“中国100快”公司。\r\n\r\n2007年、2008年，安博教育分别获投资5400万美元和1.03亿美元，连续创造我国教育私募融资之最。2010年8月5日，安博教育成功登陆纽交所。', '0', '0', 'org/202011/anbojiaoyu.gif', '上海浦东区', '2020-11-06 10:32:00.000000', '2', 'pxjg', '0', '0');
INSERT INTO `organization_courseorg` VALUES ('3', '学大教育', '学大教育集团（NYSE：XUE） “学大教育”创立于2001年9月，总部设在北京，一直以来专注于利用优质的教育资源和先进的信息技术，服务于中国教育服务领域。\r\n\r\n是目前国内个性化教育的领导者。现已在77个城市开设了408所个性化学习中心，在全国拥有16000多名员工，其中专职教师超过8000名。', '0', '0', 'org/202011/xuedajiaoyu.gif', '大连市中心', '2020-11-06 10:33:00.000000', '3', 'pxjg', '0', '0');
INSERT INTO `organization_courseorg` VALUES ('4', '好未来', '（北京世纪好未来教育科技有限公司）\r\n北京世纪好未来教育科技有限公司，十大教育培训机构，中国领先的课外基础教育辅导服务提供商，国内较早在美上市的中小学教育机构，旗下拥有学而思培优、智康1对1、摩比思维馆、学而思网校、家长帮、乐外教等品牌。', '0', '0', 'org/202011/haoweilai.gif', '北京市', '2020-11-06 14:54:00.000000', '1', 'pxjg', '0', '0');
INSERT INTO `organization_courseorg` VALUES ('5', '（北京东大正保科技有限公司）', '北京东大正保科技有限公司，中国十大教育培训机构，中国领先的网络教育机构，远程教育行业的领跑者，中国第一家在纽交所上市的远程教育公司，北京市高新技术企业，经教育部批准开展远程教育的专业公司。', '0', '0', 'org/202011/zhengbaoyuancheng.jpg', '北京市海淀区', '2020-11-06 14:54:00.000000', '1', 'pxjg', '0', '0');
INSERT INTO `organization_courseorg` VALUES ('6', '北大青鸟', '北京阿博泰克北大青鸟信息技术有限公司，由北大青鸟集团与印度阿博泰克合资成立于1999年，以创新的职业教育理念和经营模式，致力于IT技能型人才的培养。', '0', '0', 'org/202011/北大青鸟.gif', '北京市海淀区', '2020-11-06 14:55:00.000000', '1', 'pxjg', '0', '0');
INSERT INTO `organization_courseorg` VALUES ('7', '（达内时代科技集团有限公司）', '达内时代科技集团有限公司，致力于培养面向电信和金融领域的中高端软件人才，以IT培训为主的多元化、综合性的职业教育及人才服务品牌。', '0', '0', 'org/202011/达内.png', '北京市海淀区', '2020-11-06 14:57:00.000000', '1', 'pxjg', '0', '0');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `teacher_age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teacher_org_id_cd000a1a_fk_organizat` (`org_id`),
  CONSTRAINT `organization_teacher_org_id_cd000a1a_fk_organizat` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('1', '韩嘉鹏', '5', '网络科技', 'python讲师', '幽默有趣', '8888', '999', '2020-11-09 20:22:00.000000', '1', 'image/default.png', '25');
INSERT INTO `organization_teacher` VALUES ('2', '马琦', '5', '网络科技', 'python讲师', '幽默有趣', '6666', '8888', '2020-11-09 20:23:00.000000', '2', 'image/default.png', '25');
INSERT INTO `organization_teacher` VALUES ('3', '秦伟清', '6', '毛粪坑', '套毛分', '吃苦耐劳', '99999', '55555', '2020-11-09 20:23:00.000000', '3', 'image/default.png', '25');
INSERT INTO `organization_teacher` VALUES ('4', '刘泳辰', '8', '阿里', '数据分析师', '详通易解，逻辑清晰，幽默风趣', '9999', '99999', '2020-11-09 20:25:00.000000', '4', 'image/default.png', '25');
INSERT INTO `organization_teacher` VALUES ('5', '刘春磊', '3', '网络科技', 'django讲师', '幽默有趣', '6666', '666', '2020-11-09 20:26:00.000000', '1', 'image/202011/微信图片_20200909191811.jpg', '25');

-- ----------------------------
-- Table structure for reversion_revision
-- ----------------------------
DROP TABLE IF EXISTS `reversion_revision`;
CREATE TABLE `reversion_revision` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `comment` longtext NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reversion_revision_user_id_17095f45_fk_users_userprofile_id` (`user_id`),
  KEY `reversion_revision_date_created_96f7c20c` (`date_created`),
  CONSTRAINT `reversion_revision_user_id_17095f45_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_revision
-- ----------------------------

-- ----------------------------
-- Table structure for reversion_version
-- ----------------------------
DROP TABLE IF EXISTS `reversion_version`;
CREATE TABLE `reversion_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` varchar(191) NOT NULL,
  `format` varchar(255) NOT NULL,
  `serialized_data` longtext NOT NULL,
  `object_repr` longtext NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `revision_id` int(11) NOT NULL,
  `db` varchar(191) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reversion_version_db_content_type_id_objec_b2c54f65_uniq` (`db`,`content_type_id`,`object_id`,`revision_id`),
  KEY `reversion_version_content_type_id_7d0ff25c_fk_django_co` (`content_type_id`),
  KEY `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` (`revision_id`),
  CONSTRAINT `reversion_version_content_type_id_7d0ff25c_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `reversion_version_revision_id_af9f6a9d_fk_reversion_revision_id` FOREIGN KEY (`revision_id`) REFERENCES `reversion_revision` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reversion_version
-- ----------------------------

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(10) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES ('1', 'PwAWiVW7IwVFeZ9S', '979253281@qq.com', 'register', '2020-11-05 19:04:57.908912');
INSERT INTO `users_emailverifyrecord` VALUES ('2', 'Qc6vnbRfALXeIw2r', '979253281@qq.com', 'forget', '2020-11-05 20:52:44.657469');
INSERT INTO `users_emailverifyrecord` VALUES ('3', 'iqs8pwWCTSaCmiZE', '979253281@qq.com', 'forget', '2020-11-06 08:42:07.745985');
INSERT INTO `users_emailverifyrecord` VALUES ('4', '3ai9udKJn16rnP7x', '979253281@qq.com', 'forget', '2020-11-06 19:55:19.884995');
INSERT INTO `users_emailverifyrecord` VALUES ('5', 'yGCzaLxYIehTkoNa', '979253281@qq.com', 'forget', '2020-11-08 19:52:35.227496');
INSERT INTO `users_emailverifyrecord` VALUES ('6', '4vIduJiFujj4sn3v', '123@qq.com', 'register', '2020-11-09 08:30:49.948349');
INSERT INTO `users_emailverifyrecord` VALUES ('7', 'GJzgCv75aA7VDfeV', '456@qq.com', 'register', '2020-11-09 08:42:38.890362');
INSERT INTO `users_emailverifyrecord` VALUES ('8', 'Sz1XKdN1dnltuTdJ', '979253281@qq.com', 'forget', '2020-11-09 19:10:48.358969');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nick_name` varchar(50) NOT NULL,
  `birthday` date DEFAULT NULL,
  `gender` varchar(10) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `image` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `users_userprofile_mobile_f1b04622_uniq` (`mobile`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('3', 'pbkdf2_sha256$150000$PY7yVDreKj1d$ZgKB5lwG0bBNCcMqOXMckkD3y6DF4C3TQpuwEEypYp4=', '2020-11-09 19:39:53.752923', '1', '979253281@qq.com', '泳辰', '刘', '979253281@qq.com', '1', '1', '2020-11-05 19:04:00.000000', '爱上一匹野马', '1998-05-20', 'male', '18888888888', 'iamge/202011/6d9c6bef701d34a219927476ccd22f2.jpg', '<p style=\"text-align: justify;\"><font face=\"隶书, SimLi\"><b>临汾市</b></font></p>');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_group_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofile_gr_userprofile_id_a4496a80_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_p_userprofile_id_permissio_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_us_permission_id_393136b6_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_userprofile_us_permission_id_393136b6_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_userprofile_us_userprofile_id_34544737_fk_users_use` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookmark_content_type_id_60941679_fk_django_co` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookmark_content_type_id_60941679_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('15', '2020-11-09 19:40:18.357910', '127.0.0.1', null, '', 'delete', '批量删除 3 个 用户信息', null, '3');
INSERT INTO `xadmin_log` VALUES ('16', '2020-11-09 19:59:15.549534', '127.0.0.1', '1', 'python基础', 'create', '已添加。', '11', '3');
INSERT INTO `xadmin_log` VALUES ('17', '2020-11-09 20:02:31.754749', '127.0.0.1', '2', 'django', 'create', '已添加。', '11', '3');
INSERT INTO `xadmin_log` VALUES ('18', '2020-11-09 20:06:32.163109', '127.0.0.1', '3', 'flask', 'create', '已添加。', '11', '3');
INSERT INTO `xadmin_log` VALUES ('19', '2020-11-09 20:12:29.536884', '127.0.0.1', '4', 'HMTL', 'create', '已添加。', '11', '3');
INSERT INTO `xadmin_log` VALUES ('20', '2020-11-09 20:13:58.498174', '127.0.0.1', '5', 'JAVA', 'create', '已添加。', '11', '3');
INSERT INTO `xadmin_log` VALUES ('21', '2020-11-09 20:16:06.086475', '127.0.0.1', '6', 'Javascript', 'create', '已添加。', '11', '3');
INSERT INTO `xadmin_log` VALUES ('22', '2020-11-09 20:17:38.154895', '127.0.0.1', '7', '爬虫spider', 'create', '已添加。', '11', '3');
INSERT INTO `xadmin_log` VALUES ('23', '2020-11-09 20:23:10.889256', '127.0.0.1', '1', '[新东方]的教师: 韩嘉鹏', 'create', '已添加。', '13', '3');
INSERT INTO `xadmin_log` VALUES ('24', '2020-11-09 20:23:33.703848', '127.0.0.1', '2', '[安博教育]的教师: 马琦', 'create', '已添加。', '13', '3');
INSERT INTO `xadmin_log` VALUES ('25', '2020-11-09 20:25:10.010420', '127.0.0.1', '3', '[学大教育]的教师: 秦伟清', 'create', '已添加。', '13', '3');
INSERT INTO `xadmin_log` VALUES ('26', '2020-11-09 20:26:56.406742', '127.0.0.1', '4', '[好未来]的教师: 刘泳辰', 'create', '已添加。', '13', '3');
INSERT INTO `xadmin_log` VALUES ('27', '2020-11-09 20:27:36.884774', '127.0.0.1', '5', '[新东方]的教师: 刘春磊', 'create', '已添加。', '13', '3');
INSERT INTO `xadmin_log` VALUES ('28', '2020-11-09 20:42:28.198808', '127.0.0.1', '8', '厨师', 'create', '已添加。', '11', '3');
INSERT INTO `xadmin_log` VALUES ('29', '2020-11-09 21:06:41.813203', '127.0.0.1', '5', '[新东方]的教师: 刘春磊', 'change', '修改 image', '13', '3');
INSERT INTO `xadmin_log` VALUES ('30', '2020-11-11 15:12:04.389634', '127.0.0.1', '1', '《python基础》课程的章节 >> python基础-1', 'create', '已添加。', '9', '3');
INSERT INTO `xadmin_log` VALUES ('31', '2020-11-11 15:13:24.614667', '127.0.0.1', '2', '《python基础》课程的章节 >> python基础-2', 'create', '已添加。', '9', '3');
INSERT INTO `xadmin_log` VALUES ('32', '2020-11-11 15:13:43.910367', '127.0.0.1', '3', '《python基础》课程的章节 >> pythonj基础-3', 'create', '已添加。', '9', '3');
INSERT INTO `xadmin_log` VALUES ('33', '2020-11-11 15:21:53.790681', '127.0.0.1', '1', '第一节', 'create', '已添加。', '10', '3');
INSERT INTO `xadmin_log` VALUES ('34', '2020-11-11 15:23:55.432341', '127.0.0.1', '2', '第二节', 'create', '已添加。', '10', '3');
INSERT INTO `xadmin_log` VALUES ('35', '2020-11-11 15:24:23.324924', '127.0.0.1', '3', '第三节', 'create', '已添加。', '10', '3');
INSERT INTO `xadmin_log` VALUES ('36', '2020-11-11 15:31:19.333840', '127.0.0.1', '1', 'CourseResource object (1)', 'create', '已添加。', '12', '3');
INSERT INTO `xadmin_log` VALUES ('37', '2020-11-11 15:32:14.756707', '127.0.0.1', '2', 'CourseResource object (2)', 'create', '已添加。', '12', '3');
INSERT INTO `xadmin_log` VALUES ('38', '2020-11-11 15:37:33.035176', '127.0.0.1', '1', 'UserCourse object (1)', 'create', '已添加。', '20', '3');
INSERT INTO `xadmin_log` VALUES ('39', '2020-11-11 15:44:20.390688', '127.0.0.1', '1', 'python基础', 'change', '修改 image，category，tag，teacher，youneed_know 和 teacher_tell', '11', '3');
INSERT INTO `xadmin_log` VALUES ('40', '2020-11-12 15:39:18.531410', '127.0.0.1', '3', '第三节', 'change', '修改 url 和 learn_times', '10', '3');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('3', 'dashboard:home:pos', '', '3');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------

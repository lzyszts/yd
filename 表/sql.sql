CREATE TABLE `yd_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `username` varchar(30) NOT NULL DEFAULT '' COMMENT '用户名',
  `login_pwd` char(32) NOT NULL DEFAULT '' COMMENT '登录密码',
  `login_salt` char(6) NOT NULL DEFAULT '' COMMENT '登录密码配合加密字符串',
  `email` char(60) NOT NULL DEFAULT '' COMMENT '电子邮箱（最大长度60个字符）',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `admin_des` varchar(11) DEFAULT '' COMMENT '管理员描述',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别（0保密，1女，2男）',
  `login_total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `role_ids` varchar(255) NOT NULL DEFAULT '0' COMMENT '所属角色组',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否启用,0禁用,1启用',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除字段',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='管理员表';
INSERT INTO `yd`.`yd_admin` (`id`, `username`, `login_pwd`, `login_salt`, `email`, `mobile`, `admin_des`, `gender`, `login_total`, `login_time`, `role_ids`, `add_time`, `update_time`, `state`, `delete_time`) VALUES ('1', 'admin', 'efe4f4890c2fc8162977081691a3497e', '804237', '362603286@qq.com', '', '超级管理员', '0', '29', '1556358293', '1', '0', '1556358557', '1', NULL);

CREATE TABLE `yd_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `code` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态代码',
  `username` varchar(30) NOT NULL DEFAULT '0' COMMENT '操作者用户名',
  `info` varchar(100) DEFAULT ''COMMENT '说明',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(16) NOT NULL DEFAULT '0' COMMENT 'ip地址',
  `get` varchar(255) NOT NULL DEFAULT '' COMMENT '请求地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  CHARSET=utf8mb4 COMMENT='操作日志';

CREATE TABLE `yd_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色组id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_des` varchar(255) DEFAULT NULL COMMENT '角色描述',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  `update_time` int(11) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='角色表';
INSERT INTO `yd`.`yd_role` (`id`, `name`, `role_des`, `state`, `add_time`, `update_time`) VALUES ('1', '默认角色', '所有用户默认权限', '1', NULL, '1566550892');
INSERT INTO `yd`.`yd_role` (`id`, `name`, `role_des`, `state`, `add_time`, `update_time`) VALUES ('2', '前台用户', '前台普通用户登录后自动赋予', '1', NULL, '1567411411');




CREATE TABLE `yd_role_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '关联id',
  `role_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色id',
  `auth_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限id',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `auth_id` (`auth_id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='角色与权限关联表';



CREATE TABLE `yd_auth` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '权限父级id',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '权限名称',
  `module` varchar(30) NOT NULL DEFAULT '' COMMENT '模块名称',
  `control` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action` varchar(30) NOT NULL DEFAULT '' COMMENT '方法名称',
  `level` tinyint(4) DEFAULT NULL COMMENT '权限层级',
  `sort` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示（0否，1是）',
  `is_new` tinyint(4) DEFAULT '0' COMMENT '是否新页面打开',
  `icon` char(60) NOT NULL DEFAULT '' COMMENT '图标class',
  `type` tinyint(3) unsigned NOT NULL COMMENT '0后台权限、1前台权限',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='权限表';
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('2', '0', '权限控制', 'admin', 'power', 'index', '0', '5', '1', '0', 'icon-other', '0', '1567675837');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('3', '2', '角色管理', 'admin', 'role', 'index', '1', '0', '1', '0', '', '0', '1556259434');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('4', '2', '权限列表', 'admin', 'auth', 'index', '1', '0', '1', '0', '', '0', '1555898261');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('5', '2', '管理员列表', 'admin', 'admin', 'index', '1', '0', '1', '0', '', '0', '1555898295');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('7', '3', '添加', 'admin', 'role', 'roleAdd', '2', '0', '0', '0', '', '0', '1556259296');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('8', '3', '编辑', 'admin', 'role', 'roleEdit', '2', '0', '0', '0', '', '0', '1556272673');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('9', '3', '删除', 'admin', 'role', 'roleDel', '2', '0', '0', '0', '', '0', '1556259326');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('14', '4', '添加', 'admin', 'auth', 'authAdd', '2', '0', '0', '0', '', '0', '1556380517');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('15', '4', '编辑', 'admin', 'auth', 'authEdit', '2', '0', '0', '0', '', '0', '1556259731');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('16', '4', '删除', 'admin', 'auth', 'authDel', '2', '0', '0', '0', '', '0', '1556259621');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('17', '5', '添加', 'admin', 'admin', 'adminAdd', '2', '0', '0', '0', '', '0', '1556259704');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('18', '5', '编辑', 'admin', 'admin', 'adminEdit', '2', '0', '0', '0', '', '0', '1556259750');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('19', '5', '删除', 'admin', 'admin', 'adminDel', '2', '0', '0', '0', '', '0', '1556259771');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('20', '5', '启用/禁用', 'admin', 'admin', 'adminSwitch', '2', '0', '0', '0', '', '0', '1556259790');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('21', '0', '文章管理', 'admin', 'article', 'index', '0', '1', '1', '0', 'icon-wenzhang', '0', '1559223148');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('22', '21', '文章分类', 'admin', 'article', 'articleCategory', '1', '1', '1', '0', '', '0', '1558078105');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('23', '21', '文章列表', 'admin', 'article', 'articleList', '1', '0', '1', '0', '', '0', '1558078115');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('28', '22', '添加', 'admin', 'article', 'categoryAdd', '2', '0', '0', '0', '', '0', '1556444730');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('29', '22', '编辑', 'admin', 'article', 'categoryEdit', '2', '0', '0', '0', '', '0', '1556444747');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('30', '22', '删除', 'admin', 'article', 'categoryDel', '2', '0', '0', '0', '', '0', '1556444775');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('31', '23', '添加', 'admin', 'article', 'articleAdd', '2', '0', '0', '0', '', '0', '1556521600');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('32', '23', '编辑', 'admin', 'article', 'articleEdit', '2', '0', '0', '0', '', '0', '1556521632');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('33', '23', '删除', 'admin', 'article', 'articleDel', '2', '0', '0', '0', '', '0', '1556521670');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('34', '2', '管理员日志', 'admin', 'log', 'index', '1', '4', '1', '0', '', '0', '1557933779');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('35', '34', '删除', 'admin', 'log', 'logDel', '2', '0', '0', '0', '', '0', '1557400182');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('36', '0', '系统配置', 'admin', 'config', 'index', '0', '4', '1', '0', 'icon-gongnengjianyi', '0', '1567676185');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('37', '36', '后台设置', 'admin', 'config', 'website', '1', '0', '1', '0', '', '0', '1558445242');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('38', '36', '邮件配置', 'admin', 'config', 'email', '1', '2', '1', '0', '', '0', '1558000218');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('39', '36', '链接管理', 'admin', 'config', 'link', '1', '3', '1', '0', '', '0', '1558000209');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('41', '39', '添加', 'admin', 'config', 'linkAdd', '2', '0', '0', '0', '', '0', '1557883270');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('42', '39', '编辑', 'admin', 'config', 'linkEdit', '2', '0', '0', '0', '', '0', '1557883297');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('43', '39', '删除', 'admin', 'config', 'linkDel', '2', '0', '0', '0', '', '0', '1557883319');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('44', '36', '栏目管理', 'admin', 'config', 'column', '1', '4', '1', '0', '', '0', '1558313354');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('45', '44', '添加', 'admin', 'config', 'columnAdd', '2', '0', '0', '0', '', '0', '1558314089');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('46', '44', '编辑', 'admin', 'config', 'columnEdit', '2', '0', '0', '0', '', '0', '1558314115');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('47', '44', '删除', 'admin', 'config', 'columnDel', '2', '0', '0', '0', '', '0', '1558314134');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('51', '36', '前台配置', 'admin', 'config', 'info', '1', '1', '1', '0', '', '0', '1558445273');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('56', '0', '首页', 'home', 'index', 'index', '0', '0', '0', '0', '', '1', '1567415661');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('57', '0', '图片管理', 'admin', 'config', 'index', '0', '2', '1', '0', 'icon-tupian', '0', '1567675585');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('58', '57', '轮播图管理', 'admin', 'config', 'slide', '1', '0', '1', '0', '', '0', '1567675613');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('59', '58', '添加', 'admin', 'config', 'slideAdd', '2', '0', '0', '0', '', '0', '1567675637');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('60', '58', '编辑', 'admin', 'config', 'slideEdit', '2', '0', '0', '0', '', '0', '1567675656');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('61', '58', '删除', 'admin', 'config', 'slideDel', '2', '0', '0', '0', '', '0', '1567675673');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('62', '0', '文件管理', 'admin', 'config', 'download', '0', '3', '1', '0', 'icon-wenjianjia-zhankai', '0', '1567675855');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('63', '62', '下载管理', 'admin', 'file', 'download', '1', '0', '1', '0', '', '0', '1567688655');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('64', '63', '添加', 'admin', 'file', 'downloadAdd', '2', '0', '0', '0', '', '0', '1567688681');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('65', '63', '编辑', 'admin', 'file', 'downloadEdit', '2', '0', '0', '0', '', '0', '1567688665');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('66', '63', '删除', 'admin', 'file', 'downloadDel', '2', '0', '0', '0', '', '0', '1567688674');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('67', '62', '视频管理', 'admin', 'file', 'video', '1', '0', '1', '0', '', '0', '1567689337');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('68', '67', '添加', 'admin', 'file', 'videoAdd', '2', '0', '0', '0', '', '0', '1567689368');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('69', '67', '编辑', 'admin', 'file', 'videoEdit', '2', '0', '0', '0', '', '0', '1567689469');
INSERT INTO `yd`.`yd_auth` (`id`, `pid`, `name`, `module`, `control`, `action`, `level`, `sort`, `is_show`, `is_new`, `icon`, `type`, `add_time`) VALUES ('70', '67', '删除', 'admin', 'file', 'videoDel', '2', '0', '0', '0', '', '0', '1567689495');


CREATE TABLE `yd_article_category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(32) NOT NULL COMMENT '名称',
  `location` varchar(32) DEFAULT NULL COMMENT '跳转模块，例如index/about',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '顺序',
  `column_id` int(11) DEFAULT NULL COMMENT '所属栏目id',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `delete_time` int(11) DEFAULT NULL COMMENT '软删除字段',
  PRIMARY KEY (`id`),
  KEY `state` (`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文章分类';

INSERT INTO `yd`.`yd_article_category` (`id`, `name`, `location`, `state`, `sort`, `add_time`, `update_time`, `delete_time`) VALUES ('1', '新闻资讯', 'news.html', '1', '0', '1557386135', '1567490977', NULL);
INSERT INTO `yd`.`yd_article_category` (`id`, `name`, `location`, `state`, `sort`, `add_time`, `update_time`, `delete_time`) VALUES ('2', '公司新闻', 'position.html', '1', '0', '1557386129', '1558919100', NULL);
INSERT INTO `yd`.`yd_article_category` (`id`, `name`, `location`, `state`, `sort`, `add_time`, `update_time`, `delete_time`) VALUES ('3', '招聘信息', 'position.html', '1', '0', '1558073548', '1558574164', NULL);


CREATE TABLE `yd_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(60) NOT NULL DEFAULT '' COMMENT '标题',
  `describe` varchar(255) DEFAULT '' COMMENT '描述',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文章分类id',
  `head_img_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '缩略图id',
  `title_color` char(7) NOT NULL DEFAULT '' COMMENT '标题颜色',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `content` text COMMENT '内容',
  `content_imgs_ids` varchar(100) DEFAULT NULL COMMENT '内容中的图片ids',
  `access_count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '访问次数',
  `author` varchar(32) DEFAULT NULL COMMENT '作者',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `is_top` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否置顶（0否, 1是）',
  `position` varchar(100) DEFAULT '' COMMENT '工作地点',
  `work_number` tinyint(3) unsigned DEFAULT '0' COMMENT '招聘人数',
  `education` varchar(16) DEFAULT '' COMMENT '学历要求',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `title` (`title`),
  KEY `state` (`state`),
  KEY `access_count` (`access_count`),
  KEY `article_category_id` (`category_id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='文章';




CREATE TABLE `yd_img_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `real_name` varchar(150) DEFAULT NULL COMMENT '上传图片真实名',
  `img_name` varchar(150) DEFAULT NULL COMMENT '图片名',
  `username` varchar(32) DEFAULT NULL COMMENT '用户名',
  `src` varchar(255) DEFAULT NULL COMMENT '图片src',
  `real_path` varchar(255) DEFAULT NULL COMMENT '图片盘符真实路径',
  `add_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '临时图片0正式1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='图片上传表';

CREATE TABLE `yd_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '配置名称',
  `value` varchar(100) COMMENT '配置值',
  `describe` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `type` char(5) NOT NULL DEFAULT '' COMMENT '类型（admin后台, home前台）',
  `only_tag` varchar(60) NOT NULL DEFAULT '' COMMENT '唯一的标记',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `only_tag` (`only_tag`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='基本配置参数';
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('1', '首页名称', '四川野嘀食品有限责任公司', '网站的名称', 'admin', 'sitename', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('2', '网站域名', 'http://kuaidanshou.com', '域名', 'admin', 'domain', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('3', '上传图片类型', 'png,gif,jpeg,jpg', '设置允许上传图片类型，不同类型用\",\"隔开', 'admin', 'imgType', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('4', '图片上传大小', '3072', '最大上传 3MB', 'admin', 'uploadImgSize', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('5', '上传文件类型', 'apk,ipa,exe', '允许上传文件类型，不同类型用\",\"隔开', 'admin', 'fileType', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('6', '文件上传大小', '10240', '最大上传 40MB', 'admin', 'uploadFileSize', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('7', '版权信息', 'copyright @2019 lzy', '网站版权信息', 'admin', 'copyright', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('8', 'SMTP服务器', 'smtp.qq.com', '如：smtp.163.com', 'admin', 'mailSmtpServer', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('9', 'SMTP端口', '465', '一般为 25 或 465', 'admin', 'mailSmtpPort', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('10', '发件人邮箱', '3626032862@qq.com', '', 'admin', 'mailSendUsername', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('11', '发件人昵称', '快单手', '', 'admin', 'mailSendName', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('12', '邮箱密码', 'bssoieypkcpkbgec', '', 'admin', 'mailSendPwd', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('13', '客服电话', '400-1858-0011', '', 'home', 'phone', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('14', '服务时间', '8：00AM ～ 23：00 PM', '', 'home', 'workTime', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('15', '客服QQ号', '362603286', '', 'home', 'qq', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('16', '视频上传类型', 'mp4', '允许上传视频类型，不同类型用\",\"隔开', 'admin', 'videoType', '0');
INSERT INTO `yd`.`yd_config` (`id`, `name`, `value`, `describe`, `type`, `only_tag`, `update_time`) VALUES ('17', '视频上传大小', '40960', '最大上传 40MB', 'admin', 'uploadVideoSize', '0');


CREATE TABLE `yd_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `link_name` varchar(100) NOT NULL DEFAULT '' COMMENT '网站名称',
  `type` varchar(32) NOT NULL COMMENT '分组标识关键字',
  `thumb_id` int(11) unsigned DEFAULT '0' COMMENT '网站LOGOid',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '网站地址',
  `describe` varchar(60) NOT NULL DEFAULT '' COMMENT '网站描述',
  `icon` varchar(60) DEFAULT NULL COMMENT 'icon class名',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `is_new` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否新窗口打开（0否，1是）',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='友情链接';
INSERT INTO `yd`.`yd_link` (`id`, `link_name`, `type`, `thumb_id`, `url`, `describe`, `icon`, `sort`, `state`, `is_new`, `add_time`, `update_time`) VALUES ('1', '官方微博', 'footer', '92', '#', '', 'icon-weibo', '0', '1', '0', '1567587475', '1567591014');
INSERT INTO `yd`.`yd_link` (`id`, `link_name`, `type`, `thumb_id`, `url`, `describe`, `icon`, `sort`, `state`, `is_new`, `add_time`, `update_time`) VALUES ('2', '官方微信', 'footer', '93', '#', '', 'icon-weixin', '1', '1', '0', '1567588870', '1567590906');
INSERT INTO `yd`.`yd_link` (`id`, `link_name`, `type`, `thumb_id`, `url`, `describe`, `icon`, `sort`, `state`, `is_new`, `add_time`, `update_time`) VALUES ('3', '淘宝旗舰店', 'footer', '94', '#', '', NULL, '2', '1', '0', '1567588884', '1567588890');



CREATE TABLE `yd_column` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '栏目父级id',
  `name` char(30) NOT NULL DEFAULT '' COMMENT '栏目名称',
  `control` char(30) NOT NULL DEFAULT '' COMMENT '控制器名称',
  `action` char(30) NOT NULL DEFAULT '' COMMENT '方法名称',
  `level` tinyint(4) DEFAULT NULL COMMENT '栏目层级',
  `sort` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态（0否，1是）',
  `is_new` tinyint(4) DEFAULT '0' COMMENT '是否新页面打开',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='栏目表';
INSERT INTO `yd`.`yd_column` (`id`, `pid`, `name`, `control`, `action`, `level`, `sort`, `state`, `is_new`, `add_time`) VALUES ('1', '0', '首页', 'index', 'index', '0', '0', '1', '0', '1567648985');
INSERT INTO `yd`.`yd_column` (`id`, `pid`, `name`, `control`, `action`, `level`, `sort`, `state`, `is_new`, `add_time`) VALUES ('2', '0', '公司介绍', 'index', 'about', '0', '1', '1', '0', '1567649340');
INSERT INTO `yd`.`yd_column` (`id`, `pid`, `name`, `control`, `action`, `level`, `sort`, `state`, `is_new`, `add_time`) VALUES ('3', '0', '产品中心', 'index', 'product', '0', '2', '1', '0', '1567649361');
INSERT INTO `yd`.`yd_column` (`id`, `pid`, `name`, `control`, `action`, `level`, `sort`, `state`, `is_new`, `add_time`) VALUES ('4', '0', '寻味记', 'index', 'xunweiji', '0', '3', '1', '0', '1567649388');
INSERT INTO `yd`.`yd_column` (`id`, `pid`, `name`, `control`, `action`, `level`, `sort`, `state`, `is_new`, `add_time`) VALUES ('5', '0', '企业服务', 'index', 'service', '0', '4', '1', '0', '1567649406');
INSERT INTO `yd`.`yd_column` (`id`, `pid`, `name`, `control`, `action`, `level`, `sort`, `state`, `is_new`, `add_time`) VALUES ('6', '0', '新闻资讯', 'index', 'news', '0', '5', '1', '0', '1567649432');
INSERT INTO `yd`.`yd_column` (`id`, `pid`, `name`, `control`, `action`, `level`, `sort`, `state`, `is_new`, `add_time`) VALUES ('7', '0', '招商加盟', 'index', 'join', '0', '6', '1', '0', '1567649452');



CREATE TABLE `yd_slide` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `column_id` int(11) NOT NULL COMMENT '所属栏目id',
  `type` varchar(32) NOT NULL COMMENT '分类标识关键字',
  `event_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '事件类型（0 无操作, 1 跳转链接, 2 打开地图，3 拨打电话）',
  `event_value` varchar(255) NOT NULL DEFAULT '' COMMENT '事件值',
  `img_id` int(11) NOT NULL COMMENT '图片id',
  `name` char(60) NOT NULL DEFAULT '' COMMENT '名称',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `describe` varchar(255) DEFAULT NULL COMMENT '描述信息',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='轮播图片';



CREATE TABLE `yd_download` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `download_name` varchar(30) NOT NULL DEFAULT '' COMMENT '软件名称',
  `type` varchar(32) NOT NULL COMMENT '分组标识关键字',
  `logo_id` int(11) unsigned DEFAULT '0' COMMENT '图标LOGOid',
  `file_id` int(11) NOT NULL COMMENT '文件信息表对应的id',
  `location` varchar(255) NOT NULL DEFAULT '' COMMENT '跳转链接',
  `describe` varchar(60) NOT NULL DEFAULT '' COMMENT '下载描述',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `state` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否启用（0否，1是）',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  CHARSET=utf8mb4 COMMENT='下载链接维护表';



CREATE TABLE `yd_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '联系人姓名',
  `wx` varchar(60) DEFAULT '' COMMENT '微信号',
  `sheng` varchar(32) DEFAULT '' COMMENT '省份',
  `city` varchar(32) DEFAULT '' COMMENT '城市',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `describe` varchar(100) DEFAULT '' COMMENT '留言',
  `ip` varchar(16) DEFAULT NULL COMMENT 'ip地址',
  `date` date DEFAULT NULL COMMENT '日期',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='信息维护表';






CREATE TABLE `yd_file_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL COMMENT '上传的用户名',
  `real_name` varchar(150) DEFAULT NULL COMMENT '上传文件真实名',
  `file_name` varchar(150) DEFAULT NULL COMMENT '文件名',
  `src` varchar(255) DEFAULT NULL COMMENT '文件src',
  `real_path` varchar(255) DEFAULT NULL COMMENT '图片盘符真实路径',
  `add_time` varchar(32) DEFAULT NULL COMMENT '创建时间',
  `state` tinyint(1) DEFAULT NULL COMMENT '临时文件0正式1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='文件上传信息表';





CREATE TABLE `yd_article_access_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `date_y` char(4) DEFAULT NULL,
  `date_m` char(2) DEFAULT NULL,
  `date_d` char(2) DEFAULT NULL,
  `date` char(8) NOT NULL DEFAULT '' COMMENT '日期',
  `count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='文章访问统计表';


CREATE TABLE `yd_download_access_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `date_y` char(4) DEFAULT NULL,
  `date_m` char(2) DEFAULT NULL,
  `date_d` char(2) DEFAULT NULL,
  `date` char(8) NOT NULL DEFAULT '' COMMENT '日期',
  `count` int(11) unsigned NOT NULL DEFAULT '1' COMMENT '次数',
  `total_count` int(11) unsigned DEFAULT '0' COMMENT '当前总数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='下载统计表';
INSERT INTO `yd`.`yd_download_access_log` (`id`, `date_y`, `date_m`, `date_d`, `date`, `count`, `total_count`) VALUES ('1', NULL, NULL, NULL, '', '0', '0');


CREATE TABLE `yd_page_access_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `date` char(8) NOT NULL DEFAULT '' COMMENT '日期',
  `count` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB CHARSET=utf8mb4 COMMENT='页面访问统计表';





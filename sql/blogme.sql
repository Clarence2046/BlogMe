/*
Navicat MySQL Data Transfer

Source Server         : BlogMe
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : blogme

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-03-06 18:25:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for c_blog
-- ----------------------------
DROP TABLE IF EXISTS `c_blog`;
CREATE TABLE `c_blog` (
  `blogId` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客编号',
  `userId` int(11) DEFAULT NULL COMMENT '发布人',
  `blogTitle` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '博客标题',
  `blogContent` varchar(21000) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '博客内容',
  `publishTime` datetime DEFAULT NULL COMMENT '发布时间',
  `attachments` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '附件',
  `views` int(255) DEFAULT NULL COMMENT '被查看次数',
  `contentWithNoHtml` text COLLATE utf8_unicode_ci,
  `status` int(11) DEFAULT '1' COMMENT '1:正常 2：删除',
  PRIMARY KEY (`blogId`),
  KEY `f_c_blog` (`userId`),
  CONSTRAINT `f_c_blog` FOREIGN KEY (`userId`) REFERENCES `c_user` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_blog
-- ----------------------------
INSERT INTO `c_blog` VALUES ('1', '1', '主题1', '<div align=\"center\">\r\n	<p>\r\n		<span style=\"color:#E56600;\">床前明月光</span>，<strong>疑似地上霜</strong>。 <u>举头望明</u>天，<em>低头思故</em><em>乡</em>\r\n	</p>\r\n	<div align=\"left\">\r\n		<ul>\r\n			<li>\r\n				<em>文章</em>\r\n			</li>\r\n			<li>\r\n				<em>故事</em>\r\n			</li>\r\n			<li>\r\n				<em>留言</em><br />\r\n			</li>\r\n		</ul>\r\n	</div>\r\n</div>', '2016-03-06 11:41:01', null, '6', null, '2');
INSERT INTO `c_blog` VALUES ('2', '1', '测试', '<span style=\"font-family:FangSong_GB2312;color:#006600;\">这只是带样式的一个测试</span>', '2016-03-06 12:17:13', null, '0', null, '2');
INSERT INTO `c_blog` VALUES ('3', '1', '测试二', '<a href=\"http://www.baidu.com\" target=\"_blank\">http://www.baidu.com</a>KindEditor', '2016-03-06 12:20:50', null, '0', null, '2');
INSERT INTO `c_blog` VALUES ('4', '1', '测试三', '<img src=\"/BlogMe/attached/image/20160306/20160306124156_596.jpg\" alt=\"\" />KindEditor', '2016-03-06 12:42:06', null, '1', null, '2');
INSERT INTO `c_blog` VALUES ('5', '1', 'kindeditor 图片上传配置方法', '来自百度知道：http://jingyan.baidu.com/article/da1091fb3fee89027849d630.html', '2016-03-06 13:36:13', null, '0', null, '2');
INSERT INTO `c_blog` VALUES ('6', '1', 'kindeditor 图片上传配置方法', '详见：<a href=\"http://jingyan.baidu.com/article/da1091fb3fee89027849d630.html\" target=\"_blank\">http://jingyan.baidu.com/article/da1091fb3fee89027849d630.html</a>', '2016-03-06 13:37:12', null, '0', null, '2');
INSERT INTO `c_blog` VALUES ('8', '1', 'wdatepicker使用方法', '<h3>\r\n	1. 常规功能<a name=\"m21\"></a>\r\n</h3>\r\n<ol>\r\n	<li>\r\n		支持多种调用模式 <a name=\"m211\"></a> \r\n		<p>\r\n			除了支持常规在input单击或获得焦点调用外,还支持使用其他的元素如:&lt;img&gt;&lt;div&gt;等触发WdatePicker函数来调用弹出日期框\r\n		</p>\r\n		<div>\r\n			<h4>\r\n				示例1-1-1 常规调用\r\n			</h4>\r\n			<p>\r\n				<br />\r\n&lt;input id=\"d11\" type=\"text\" <span class=\"STYLE1\">onClick=\"WdatePicker()\"</span>/&gt;\r\n			</p>\r\n		</div>\r\n		<div>\r\n			<h4>\r\n				示例1-1-2 图标触发\r\n			</h4>\r\n			<p>\r\n				<img src=\"http://www.my97.net/dp/My97DatePicker/skin/datePicker.gif\" width=\"16\" height=\"22\" align=\"absmiddle\" /> <br />\r\n&lt;input id=\"<span class=\"STYLE1\">d12</span>\" type=\"text\"/&gt;<br />\r\n&lt;img onclick=\"WdatePicker({<span class=\"STYLE2\">el:</span><span class=\"STYLE1\">\'d12\'</span>})\"  src=\"../skin/datePicker.gif\" width=\"16\" height=\"22\" align=\"absmiddle\"&gt;<br />\r\n<span class=\"STYLE1\">注意:</span>只需要传入控件的id即可\r\n			</p>\r\n		</div>\r\n	</li>\r\n	<li>\r\n		下拉,输入,导航选择日期<a name=\"m212\"></a> \r\n		<p>\r\n			年月时分秒输入框都具备以下三种特性 <br />\r\n1.\r\n          通过导航图标选择<br />\r\n<img src=\"http://www.my97.net/dp/demo/resource/pic1.jpg\" width=\"180\" height=\"197\" /><br />\r\n<br />\r\n2. 直接使用键盘输入数字<br />\r\n<img src=\"http://www.my97.net/dp/demo/resource/pic2.jpg\" width=\"180\" height=\"197\" /><br />\r\n<br />\r\n3. 直接从弹出的下拉框中选择<br />\r\n<img src=\"http://www.my97.net/dp/demo/resource/pic3.jpg\" width=\"180\" height=\"197\" /><br />\r\n<br />\r\n<span class=\"STYLE2\">另:年份输入框有智能提示功能,当用户连续点击同一个导航按钮5次时,会自动弹出年份下拉框</span>\r\n		</p>\r\n	</li>\r\n	<li>\r\n		支持周显示 <a name=\"m213\"></a> \r\n		<p>\r\n			可以通过配置isShowWeek属性决定是否限制周,并且在返回日期的时候还可以通过自带的自定义事件和API函数返回选择的周\r\n		</p>\r\n<br />\r\n		<div>\r\n			<h4>\r\n				示例1-2-1 周显示简单应用\r\n			</h4>\r\n			<p>\r\n				<br />\r\n&lt;input id=\"d121\" type=\"text\" onfocus=\"WdatePicker({<span class=\"STYLE2\">isShowWeek:</span><span class=\"STYLE1\">true</span>})\"/&gt;<br />\r\n<br />\r\n<span class=\"STYLE1\">注意:周算法参考的是ISO8601定义的方法,如果您对此有疑问,请详见:</span><a href=\"http://en.wikipedia.org/wiki/ISO_week_date\" target=\"_blank\">http://en.wikipedia.org/wiki/ISO_week_date</a><br />\r\n<br />\r\n周算法选择<span class=\"STYLE1\">(4.8新增)</span><br />\r\n相关属性:<span class=\"STYLE2\">weekMethod</span><br />\r\n周算法不同的地方有一些差异<br />\r\n常见算法有两种<br />\r\n1. ISO8601:规定第一个星期四为第一周,默认值<br />\r\n2. MSExcel:1月1日所在的周\r\n			</p>\r\n		</div>\r\n		<div>\r\n			<h4>\r\n				示例1-2-2 利用onpicked事件把周赋值给另外的文本框\r\n			</h4>\r\n			<p>\r\n				&nbsp;&nbsp;\r\n            您选择了第(W格式)周, 另外您可以使用WW格式:周 <br />\r\n&lt;input type=\"text\" class=\"Wdate\" id=\"d122\" onFocus=\"WdatePicker({<span class=\"STYLE2\">isShowWeek:</span><span class=\"STYLE1\">true</span>,<span class=\"STYLE2\">onpicked:</span><span class=\"STYLE1\">function() {$dp.$(\'d122_1\').value=$dp.cal.getP(\'W\',\'W\');$dp.$(\'d122_2\').value=$dp.cal.getP(\'W\',\'WW\');}</span>})\"/&gt;<br />\r\n<br />\r\nonpicked 用法详见<a href=\"http://www.my97.net/dp/demo/resource/2.5.asp#m251\">自定义事件</a><br />\r\n$dp.cal.getP 用法详见<a href=\"http://www.my97.net/dp/demo/resource/999.asp#m5\">内置函数和属性</a>\r\n			</p>\r\n		</div>\r\n	</li>\r\n	<li>\r\n		只读开关,高亮周末功能 <a name=\"m214\"></a> \r\n		<p>\r\n			设置readOnly属性 true 或 false 可指定日期框是否只读 <br />\r\n设置highLineWeekDay属性 ture 或 false 可指定是否高亮周末\r\n		</p>\r\n	</li>\r\n	<li>\r\n		操作按钮自定义 <a name=\"m215\"></a> \r\n		<p>\r\n			清空按钮和今天按钮,可以根据需要进行自定义,它们分别对应 isShowClear 和 isShowToday 默认值都是true\r\n		</p>\r\n		<div>\r\n			<h4>\r\n				示例1-5 禁用清空功能\r\n			</h4>\r\n			<p>\r\n				最好把readOnly置为true,否则即使隐藏了清空按钮,用户依然可以在输入框里把值delete掉<br />\r\n<br />\r\n&lt;input class=\"Wdate\" type=\"text\" id=\"d15\" onFocus=\"WdatePicker({<span class=\"STYLE2\">isShowClear:</span><span class=\"STYLE1\">false</span>,<span class=\"STYLE2\">readOnly:</span><span class=\"STYLE1\">true</span>})\"/&gt;\r\n			</p>\r\n		</div>\r\n	</li>\r\n	<li>\r\n		自动选择显示位置<a name=\"m216\"></a> \r\n		<p>\r\n			当控件处在页面边界时,它会自动选择显示的位置,所以没有必要担心弹出框会被页面边界遮住的问题了.\r\n		</p>\r\n	</li>\r\n	<li>\r\n		自定义弹出位置 <a name=\"m217\"></a> \r\n		<p>\r\n			当控件处在页面边界时,它会自动选择显示的位置.此外你还可以使用position参数对弹出位置做调整.\r\n		</p>\r\n<br />\r\n		<div>\r\n			<h4>\r\n				示例1-6 通过position属性,自定义弹出位置\r\n			</h4>\r\n			<p>\r\n				使用positon属性指定,弹出日期的坐标为{left:100,top:50}<br />\r\n<br />\r\n&lt;input class=\"Wdate\" type=\"text\" id=\"d16\" onfocus=\"WdatePicker({<span class=\"STYLE2\">position:</span><span class=\"STYLE1\">{left:100,top:50}</span>})\"/&gt;<br />\r\n<br />\r\nposition属性的详细用法详见<a href=\"http://www.my97.net/dp/demo/resource/3.asp#m31\">属性表</a>\r\n			</p>\r\n		</div>\r\n	</li>\r\n	<li>\r\n		自定义星期的第一天<span class=\"STYLE1\">(4.6新增)</span><a name=\"m218\"></a> \r\n		<p>\r\n			各个国家的习惯不同,有些喜欢以星期日作为第一天,有些以星期一作为第一天.<br />\r\n相关属性:<span class=\"STYLE2\">firstDayOfWeek</span>: 可设置 0 - 6 的任意一个数字,0:星期日 1:星期一 以此类推\r\n		</p>\r\n		<div>\r\n			<h4>\r\n				示例1-7 以星期一作为第一天\r\n			</h4>\r\n			<p>\r\n				<br />\r\n&lt;input class=\"Wdate\" type=\"text\" id=\"d17\" onfocus=\"WdatePicker({<span class=\"STYLE2\">firstDayOfWeek:</span><span class=\"STYLE1\">1</span>})\"/&gt;\r\n			</p>\r\n		</div>\r\n	</li>\r\n</ol>\r\n<h3>\r\n	<a href=\"http://www.my97.net/dp/demo/resource/2.2.asp\">2. 特色功能</a> <a name=\"m22\"></a>\r\n</h3>\r\n<h3>\r\n	<a href=\"http://www.my97.net/dp/demo/resource/2.3.asp\">3. 多语言和自定义皮肤</a><a name=\"m23\"></a>\r\n</h3>\r\n<h3>\r\n	<a href=\"http://www.my97.net/dp/demo/resource/2.4.asp\">4. 日期范围限制</a><a name=\"m24\"></a>\r\n</h3>\r\n<h3>\r\n	<a href=\"http://www.my97.net/dp/demo/resource/2.5.asp\">5. 自定义事件</a><a name=\"m25\"></a>\r\n</h3>\r\n<h3>\r\n	<a href=\"http://www.my97.net/dp/demo/resource/2.6.asp\">6. 快速选择功能</a>\r\n</h3>', '2016-03-06 15:45:55', null, '1', '1. 常规功能\r\n\r\n\r\n	\r\n		支持多种调用模式  \r\n		\r\n			除了支持常规在input单击或获得焦点调用外,还支持使用其他的元素如:&lt;img&gt;&lt;div&gt;等触发WdatePicker函数来调用弹出日期框\r\n		\r\n		\r\n			\r\n				示例1-1-1 常规调用\r\n			\r\n			\r\n				\r\n&lt;input id=\"d11\" type=\"text\" onClick=\"WdatePicker()\"/&gt;\r\n			\r\n		\r\n		\r\n			\r\n				示例1-1-2 图标触发\r\n			\r\n			\r\n				 \r\n&lt;input id=\"d12\" type=\"text\"/&gt;\r\n&lt;img onclick=\"WdatePicker({el:\'d12\'})\"  src=\"../skin/datePicker.gif\" width=\"16\" height=\"22\" align=\"absmiddle\"&gt;\r\n注意:只需要传入控件的id即可\r\n			\r\n		\r\n	\r\n	\r\n		下拉,输入,导航选择日期 \r\n		\r\n			年月时分秒输入框都具备以下三种特性 \r\n1.\r\n          通过导航图标选择\r\n\r\n\r\n2. 直接使用键盘输入数字\r\n\r\n\r\n3. 直接从弹出的下拉框中选择\r\n\r\n\r\n另:年份输入框有智能提示功能,当用户连续点击同一个导航按钮5次时,会自动弹出年份下拉框\r\n		\r\n	\r\n	\r\n		支持周显示  \r\n		\r\n			可以通过配置isShowWeek属性决定是否限制周,并且在返回日期的时候还可以通过自带的自定义事件和API函数返回选择的周\r\n		\r\n\r\n		\r\n			\r\n				示例1-2-1 周显示简单应用\r\n			\r\n			\r\n				\r\n&lt;input id=\"d121\" type=\"text\" onfocus=\"WdatePicker({isShowWeek:true})\"/&gt;\r\n\r\n注意:周算法参考的是ISO8601定义的方法,如果您对此有疑问,请详见:http://en.wikipedia.org/wiki/ISO_week_date\r\n\r\n周算法选择(4.8新增)\r\n相关属性:weekMethod\r\n周算法不同的地方有一些差异\r\n常见算法有两种\r\n1. ISO8601:规定第一个星期四为第一周,默认值\r\n2. MSExcel:1月1日所在的周\r\n			\r\n		\r\n		\r\n			\r\n				示例1-2-2 利用onpicked事件把周赋值给另外的文本框\r\n			\r\n			\r\n				&nbsp;&nbsp;\r\n            您选择了第(W格式)周, 另外您可以使用WW格式:周 \r\n&lt;input type=\"text\" class=\"Wdate\" id=\"d122\" onFocus=\"WdatePicker({isShowWeek:true,onpicked:function() {$dp.$(\'d122_1\').value=$dp.cal.getP(\'W\',\'W\');$dp.$(\'d122_2\').value=$dp.cal.getP(\'W\',\'WW\');}})\"/&gt;\r\n\r\nonpicked 用法详见自定义事件\r\n$dp.cal.getP 用法详见内置函数和属性\r\n			\r\n		\r\n	\r\n	\r\n		只读开关,高亮周末功能  \r\n		\r\n			设置readOnly属性 true 或 false 可指定日期框是否只读 \r\n设置highLineWeekDay属性 ture 或 false 可指定是否高亮周末\r\n		\r\n	\r\n	\r\n		操作按钮自定义  \r\n		\r\n			清空按钮和今天按钮,可以根据需要进行自定义,它们分别对应 isShowClear 和 isShowToday 默认值都是true\r\n		\r\n		\r\n			\r\n				示例1-5 禁用清空功能\r\n			\r\n			\r\n				最好把readOnly置为true,否则即使隐藏了清空按钮,用户依然可以在输入框里把值delete掉\r\n\r\n&lt;input class=\"Wdate\" type=\"text\" id=\"d15\" onFocus=\"WdatePicker({isShowClear:false,readOnly:true})\"/&gt;\r\n			\r\n		\r\n	\r\n	\r\n		自动选择显示位置 \r\n		\r\n			当控件处在页面边界时,它会自动选择显示的位置,所以没有必要担心弹出框会被页面边界遮住的问题了.\r\n		\r\n	\r\n	\r\n		自定义弹出位置  \r\n		\r\n			当控件处在页面边界时,它会自动选择显示的位置.此外你还可以使用position参数对弹出位置做调整.\r\n		\r\n\r\n		\r\n			\r\n				示例1-6 通过position属性,自定义弹出位置\r\n			\r\n			\r\n				使用positon属性指定,弹出日期的坐标为{left:100,top:50}\r\n\r\n&lt;input class=\"Wdate\" type=\"text\" id=\"d16\" onfocus=\"WdatePicker({position:{left:100,top:50}})\"/&gt;\r\n\r\nposition属性的详细用法详见属性表\r\n			\r\n		\r\n	\r\n	\r\n		自定义星期的第一天(4.6新增) \r\n		\r\n			各个国家的习惯不同,有些喜欢以星期日作为第一天,有些以星期一作为第一天.\r\n相关属性:firstDayOfWeek: 可设置 0 - 6 的任意一个数字,0:星期日 1:星期一 以此类推\r\n		\r\n		\r\n			\r\n				示例1-7 以星期一作为第一天\r\n			\r\n			\r\n				\r\n&lt;input class=\"Wdate\" type=\"text\" id=\"d17\" onfocus=\"WdatePicker({firstDayOfWeek:1})\"/&gt;\r\n			\r\n		\r\n	\r\n\r\n\r\n	2. 特色功能 \r\n\r\n\r\n	3. 多语言和自定义皮肤\r\n\r\n\r\n	4. 日期范围限制\r\n\r\n\r\n	5. 自定义事件\r\n\r\n\r\n	6. 快速选择功能', '1');
INSERT INTO `c_blog` VALUES ('9', '1', 'kindeditor 图片上传配置方法', '参考url：&nbsp; <a href=\"http://jingyan.baidu.com/article/da1091fb3fee89027849d630.html\" target=\"_blank\">http://jingyan.baidu.com/article/da1091fb3fee89027849d630.html</a><br />', '2016-03-06 16:01:12', null, '0', '参考url：&nbsp; http://jingyan.baidu.com/article/da1091fb3fee89027849d630.html', '1');
INSERT INTO `c_blog` VALUES ('10', '2', '第一篇文章', '<p>\r\n	这是一个测试\r\n</p>\r\n<p>\r\n	<em><span style=\"color:#E56600;\">这是一个测试</span></em>\r\n</p>\r\n<p>\r\n	<a target=\"_blank\" href=\"http://www.baidu.com\">百度一下</a>\r\n</p>\r\n<p>\r\n	这是一个图片\r\n</p>\r\n<p>\r\n	<img src=\"/BlogMe/attached/image/20160306/20160306165749_219.jpg\" alt=\"\" />\r\n</p>', '2016-03-06 16:57:53', null, '1', '这是一个测试\r\n\r\n\r\n	这是一个测试\r\n\r\n\r\n	百度一下\r\n\r\n\r\n	这是一个图片', '1');

-- ----------------------------
-- Table structure for c_comment
-- ----------------------------
DROP TABLE IF EXISTS `c_comment`;
CREATE TABLE `c_comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `blogId` int(11) DEFAULT NULL,
  `commentUserId` int(11) DEFAULT NULL,
  `commentContent` varchar(2055) COLLATE utf8_unicode_ci DEFAULT NULL,
  `commentTime` datetime DEFAULT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_comment
-- ----------------------------
INSERT INTO `c_comment` VALUES ('1', '1', '3', '$(\"textarea[name=content]\").val()', '2016-03-06 14:13:03');
INSERT INTO `c_comment` VALUES ('2', '2', '3', 'KindEditor', '2016-03-06 14:14:18');
INSERT INTO `c_comment` VALUES ('3', '1', '3', 'KindEditor', '2016-03-06 14:15:35');
INSERT INTO `c_comment` VALUES ('4', '1', '3', 'KindEditor', '2016-03-06 14:15:52');
INSERT INTO `c_comment` VALUES ('5', '2', '3', 'KindEditor', '2016-03-06 14:19:49');
INSERT INTO `c_comment` VALUES ('6', '1', '3', 'KindEditor，我<span style=\"color:#E53333;\">是谁</span>', '2016-03-06 14:23:58');
INSERT INTO `c_comment` VALUES ('7', '1', '3', 'KindEditor，我<span style=\"color:#E53333;\">是谁</span>', '2016-03-06 14:24:35');
INSERT INTO `c_comment` VALUES ('8', '2', '3', 'KindEditor', '2016-03-06 14:34:11');
INSERT INTO `c_comment` VALUES ('9', '2', '3', '测试评论', '2016-03-06 14:34:55');
INSERT INTO `c_comment` VALUES ('10', '2', '3', 'KindEditor', '2016-03-06 14:36:01');
INSERT INTO `c_comment` VALUES ('11', '4', '3', '<p>\n	<span style=\"color:#E53333;\">中文换行</span>\n</p>\n<p>\n	<span style=\"color:#E53333;\">加颜色</span>\n</p>', '2016-03-06 14:45:02');
INSERT INTO `c_comment` VALUES ('12', '10', '2', '我自己来加一个评论<img src=\"http://localhost/BlogMe/jsFiles/kindeditor-4.1.10/plugins/emoticons/images/0.gif\" alt=\"\" border=\"0\" />', '2016-03-06 17:01:51');

-- ----------------------------
-- Table structure for c_right
-- ----------------------------
DROP TABLE IF EXISTS `c_right`;
CREATE TABLE `c_right` (
  `rightId` int(11) NOT NULL,
  `rightName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rightUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`rightId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_right
-- ----------------------------

-- ----------------------------
-- Table structure for c_user
-- ----------------------------
DROP TABLE IF EXISTS `c_user`;
CREATE TABLE `c_user` (
  `userId` int(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `loginName` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `lastLoginTime` datetime DEFAULT NULL,
  `status` decimal(1,0) DEFAULT NULL,
  `userType` decimal(1,0) DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_user
-- ----------------------------
INSERT INTO `c_user` VALUES ('1', 'taylor', 'taylor', '123456', '22', '11', '2016-03-02 00:00:00', null, '1', '2', '2016-03-02 16:52:20');
INSERT INTO `c_user` VALUES ('2', 'admin', 'admin', '111111', '19888888888', 'youxiang@yy.com', '2016-03-02 00:00:00', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('3', '1231', '123123', '1231', null, null, '2016-03-02 16:05:38', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('4', 'lihl', 'lihl', '123456', '1686868', '99!99', '2016-03-02 16:12:03', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('5', 'taylor', 'taylor', null, null, null, '2016-03-02 16:12:57', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('6', 'taylor', 'taylor', null, null, null, '2016-03-02 16:13:25', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('7', 'taylor', 'taylor', null, null, null, '2016-03-02 16:15:10', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('8', 'taylor', 'taylor', '111111', null, null, '2016-03-02 17:27:25', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('9', 'taylor1', 'taylor2', '111111', null, null, '2016-03-02 17:27:41', null, '1', '1', null);
INSERT INTO `c_user` VALUES ('10', '秋风', '秋风', '111111', null, null, '2016-03-04 14:39:20', null, '1', '2', null);

-- ----------------------------
-- Table structure for c_usertype
-- ----------------------------
DROP TABLE IF EXISTS `c_usertype`;
CREATE TABLE `c_usertype` (
  `userType` int(11) NOT NULL,
  `typeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`userType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_usertype
-- ----------------------------

-- ----------------------------
-- Table structure for c_user_right
-- ----------------------------
DROP TABLE IF EXISTS `c_user_right`;
CREATE TABLE `c_user_right` (
  `userId` int(11) NOT NULL,
  `rightId` int(11) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of c_user_right
-- ----------------------------

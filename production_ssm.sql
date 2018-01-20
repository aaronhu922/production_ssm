/*
Navicat MySQL Data Transfer

Source Server         : 111
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : production_ssm

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2017-04-14 20:58:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `custom`
-- ----------------------------
DROP TABLE IF EXISTS `custom`;
CREATE TABLE `custom` (
  `custom_id` varchar(40) NOT NULL,
  `custom_name` varchar(20) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `due_bottle` int(11) DEFAULT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `owner_name` varchar(20) DEFAULT NULL,
  `owner_tel` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`custom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
-- ----------------------------
-- Records of custom
-- ----------------------------

-- ----------------------------
-- Table structure for `c_order`
-- ----------------------------
DROP TABLE IF EXISTS `c_order`;
CREATE TABLE `c_order` (
  `order_id` varchar(40) NOT NULL,
  `custom_id` varchar(40) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `request_date` datetime DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  `total_money` decimal(10,2) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `FK_Reference_5` (`custom_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`custom_id`) REFERENCES `custom` (`custom_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of c_order


DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `uid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `order_id` varchar(40) NOT NULL COMMENT 'Order ID',
  `product_id` varchar(40) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `FK_Reference_38` (`order_id`),
  CONSTRAINT `FK_Reference_38` FOREIGN KEY (`order_id`) REFERENCES `c_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Order Items table';
-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `department_id` varchar(40) NOT NULL,
  `department_name` varchar(100) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('001', '项目部', '负责接洽项目，并负责项目进度控制、人员配置调度与风险管控');
INSERT INTO `department` VALUES ('002', '生产部', '负责制定生产计划，并组织生产。');
INSERT INTO `department` VALUES ('003', '物料部', '负责物料收支与调配。');
INSERT INTO `department` VALUES ('004', '财务部', '负责公司财务运作。');
INSERT INTO `department` VALUES ('005', '人力部', '负责公司人事。');
INSERT INTO `department` VALUES ('006', '物流部', '<span style=\"font-size:14px;\">负责公司物流调配。</span>');
INSERT INTO `department` VALUES ('007', '礼仪部', '负责前台接待及会务礼仪。');

-- ----------------------------
-- Table structure for `device`
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `device_id` varchar(40) NOT NULL,
  `device_name` varchar(100) DEFAULT NULL,
  `device_type_id` varchar(40) DEFAULT NULL,
  `device_status_id` varchar(40) DEFAULT NULL,
  `device_status` varchar(100) DEFAULT NULL,
  `device_purchase_date` datetime DEFAULT NULL,
  `device_purchase_price` decimal(10,2) DEFAULT NULL,
  `device_manufacture_date` datetime DEFAULT NULL,
  `device_service_life` datetime DEFAULT NULL,
  `device_keeper_id` varchar(40) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`device_id`),
  KEY `FK_Reference_18` (`device_type_id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`device_type_id`) REFERENCES `device_type` (`device_type_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('001', '焊接设备', '01', '1', '良好', '2016-08-09 08:08:01', '99.99', '2016-09-09 09:09:01', '2021-09-09 09:09:01', '002', '<span style=\"font-size:14px;\">状态良好.</span>');
INSERT INTO `device` VALUES ('002', '冲压设备', '01', '2', '良好', '2016-08-08 08:08:01', '99.99', '2016-09-09 09:09:02', '2021-09-09 09:09:02', '001', '<p>\r\n	This is good.\r\n</p>');
INSERT INTO `device` VALUES ('003', '空调', '02', '2', '故障', '2016-08-08 08:08:03', '99.97', '2016-09-09 09:09:03', '2021-09-09 09:09:03', '001', 'This is good.');
INSERT INTO `device` VALUES ('004', '冷风机', '02', '2', '故障', '2016-08-08 08:08:03', '99.97', '2016-09-09 09:09:04', '2021-09-09 09:09:04', '001', 'This is good.');
INSERT INTO `device` VALUES ('005', '叉车', '03', '3', '维修', '2016-08-08 08:08:05', '99.95', '2016-09-09 09:09:05', '2021-09-09 09:09:05', '001', 'This is good.');
INSERT INTO `device` VALUES ('006', '机械臂', '03', '3', '维修', '2016-08-08 08:08:05', '99.95', '2016-09-09 09:09:06', '2021-09-09 09:09:06', '002', 'This is good.');

-- ----------------------------
-- Table structure for `device_check`
-- ----------------------------
DROP TABLE IF EXISTS `device_check`;
CREATE TABLE `device_check` (
  `device_check_id` varchar(40) NOT NULL,
  `device_id` varchar(40) DEFAULT NULL,
  `device_check_emp_id` varchar(40) DEFAULT NULL,
  `device_check_date` datetime DEFAULT NULL,
  `device_check_result` varchar(5000) DEFAULT NULL,
  `device_check_fault_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`device_check_id`),
  KEY `FK_Reference_20` (`device_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_check
-- ----------------------------
INSERT INTO `device_check` VALUES ('001', '001', '002', '2016-07-20 08:08:08', 'Ok。', '无');
INSERT INTO `device_check` VALUES ('002', '002', '001', '2018-08-08 08:08:08', 'Ok', '002');
INSERT INTO `device_check` VALUES ('003', '003', '001', '2018-08-08 08:08:08', 'Ok', '003');
INSERT INTO `device_check` VALUES ('004', '004', '001', '2018-08-08 08:08:08', 'Ok', '004');
INSERT INTO `device_check` VALUES ('005', '005', '001', '2018-08-08 08:08:08', 'Ok', '006');
INSERT INTO `device_check` VALUES ('006', '006', '', '2018-08-08 08:08:08', 'Ok', '005');
INSERT INTO `device_check` VALUES ('321', '001', '001', '2016-12-21 11:05:20', '状态良好', '321');
INSERT INTO `device_check` VALUES ('424', '001', '002', '2016-12-22 00:00:00', '4325435gdg', '4324');

-- ----------------------------
-- Table structure for `device_fault`
-- ----------------------------
DROP TABLE IF EXISTS `device_fault`;
CREATE TABLE `device_fault` (
  `device_fault_id` varchar(40) NOT NULL,
  `device_id` varchar(40) DEFAULT NULL,
  `device_fault_cause` varchar(100) DEFAULT NULL,
  `device_fault_detail` varchar(5000) DEFAULT NULL,
  `device_fault_date` datetime DEFAULT NULL,
  `device_fault_maintenance` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`device_fault_id`),
  KEY `FK_Reference_21` (`device_id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_fault
-- ----------------------------
INSERT INTO `device_fault` VALUES ('001', '001', '台风', '哼哼哈嘿.', '2016-10-01 08:08:08', '人工');
INSERT INTO `device_fault` VALUES ('002', '002', '台风', '哼哼哈嘿', '2016-10-06 08:08:08', '人工');
INSERT INTO `device_fault` VALUES ('003', '003', '台风', '哼哼哈嘿', '2016-10-01 08:08:08', '人工');
INSERT INTO `device_fault` VALUES ('004', '004', '台风', '哼哼哈嘿', '2016-10-01 08:08:08', '人工');
INSERT INTO `device_fault` VALUES ('005', '005', '台风', '哼哼哈嘿', '2016-10-01 08:08:08', '人工');
INSERT INTO `device_fault` VALUES ('006', '006', '台风', '哼哼哈嘿', '2016-10-01 08:08:08', '人工');

-- ----------------------------
-- Table structure for `device_maintain`
-- ----------------------------
DROP TABLE IF EXISTS `device_maintain`;
CREATE TABLE `device_maintain` (
  `device_maintain_id` varchar(40) NOT NULL,
  `device_fault_id` varchar(40) DEFAULT NULL,
  `device_maintain_emp_id` varchar(10) DEFAULT NULL,
  `device_maintain_date` datetime DEFAULT NULL,
  `device_maintain_result` varchar(100) DEFAULT NULL,
  `device_maintain_cost` decimal(10,2) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`device_maintain_id`),
  KEY `FK_Reference_22` (`device_fault_id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`device_fault_id`) REFERENCES `device_fault` (`device_fault_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_maintain
-- ----------------------------
INSERT INTO `device_maintain` VALUES ('001', '001', '001', '2016-10-07 08:08:08', '维修成功', '88.88', '费用已结清。');
INSERT INTO `device_maintain` VALUES ('002', '002', '001', '2016-10-07 08:08:08', '维修成功', '88.88', 'K.O.');
INSERT INTO `device_maintain` VALUES ('003', '003', '002', '2016-10-07 08:08:08', '维修成功', '88.88', 'K.O.');
INSERT INTO `device_maintain` VALUES ('004', '004', '001', '2016-10-07 08:08:08', '维修成功', '88.88', 'K.O.');
INSERT INTO `device_maintain` VALUES ('005', '005', '002', '2016-10-07 08:08:08', '维修成功', '88.88', 'K.O.');

-- ----------------------------
-- Table structure for `device_type`
-- ----------------------------
DROP TABLE IF EXISTS `device_type`;
CREATE TABLE `device_type` (
  `device_type_id` varchar(40) NOT NULL,
  `device_type_name` varchar(100) DEFAULT NULL,
  `device_type_model` varchar(200) DEFAULT NULL,
  `device_type_spec` varchar(200) DEFAULT NULL,
  `device_type_supplier` varchar(100) DEFAULT NULL,
  `device_type_producer` varchar(100) DEFAULT NULL,
  `device_type_quantity` int(11) DEFAULT NULL,
  `device_type_warranty` datetime DEFAULT NULL,
  PRIMARY KEY (`device_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_type
-- ----------------------------
INSERT INTO `device_type` VALUES ('01', '加工设备', '中', 'A', '福建百斯特贸易有限公司', '福建永辉机械有限公司', '11', '2018-08-08 08:08:08');
INSERT INTO `device_type` VALUES ('02', '冷暖设备', '中', 'B', '珠海格力有限公司', '珠海格力有限公司', '12', '2018-08-08 08:08:08');
INSERT INTO `device_type` VALUES ('03', '传送设备', '小', 'C', '福建永辉机械有限公司', '福建永辉机械有限公司', '13', '2018-08-08 08:08:08');
INSERT INTO `device_type` VALUES ('04', '清洗设备', '大', 'D', '福建百斯特贸易有限公司', '福建永辉机械有限公司', '14', '2018-08-08 08:08:08');
INSERT INTO `device_type` VALUES ('05', '打磨设备', '中', 'E', '厦门天德设备有限公司', '厦门海科设备有限公司', '15', '2018-08-08 08:08:08');
INSERT INTO `device_type` VALUES ('06', '冲压设备', '大', 'A', '厦门天德设备公司', '湖南三一重工', '20', '2016-12-24 11:58:46');

-- ----------------------------
-- Table structure for `employee`
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` varchar(40) NOT NULL,
  `emp_name` varchar(40) DEFAULT NULL,
  `sex` char(1) DEFAULT NULL,
  `id_code` varchar(20) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `join_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `education` varchar(20) DEFAULT NULL,
  `degree` varchar(20) DEFAULT NULL,
  `major` varchar(40) DEFAULT NULL,
  `graduate_school` varchar(40) DEFAULT NULL,
  `education_form` varchar(40) DEFAULT NULL,
  `department_id` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `FK_Reference_30` (`department_id`),
  CONSTRAINT `FK_Reference_30` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('001', '王武', '1', '350321xxxxxxxxxxxx', null, null, '在职', '本科', '学士', '计算机', null, '全日制', '002');
INSERT INTO `employee` VALUES ('002', '张三', '2', '152346842123458618', '1970-01-01', '1970-01-01', '在职', '大专', '无', '软件工程', null, '全日制', '005');
INSERT INTO `employee` VALUES ('003', '刘高升', '1', '156423547861546872', null, null, '在职', '大专', '无', '人力资源', null, '全日制', '001');
INSERT INTO `employee` VALUES ('005', '刘亦菲', '2', '156432486625615156', null, null, '在职', '本科', '学士', '形体礼仪', null, '在职', '007');

-- ----------------------------
-- Table structure for `final_count_check`
-- ----------------------------
DROP TABLE IF EXISTS `final_count_check`;
CREATE TABLE `final_count_check` (
  `f_count_check_id` varchar(40) NOT NULL,
  `order_id` varchar(40) DEFAULT NULL,
  `check_item` varchar(40) DEFAULT NULL,
  `sample` int(11) DEFAULT NULL,
  `check_number` int(11) DEFAULT NULL,
  `unqualify` int(11) DEFAULT NULL,
  `qualify` decimal(3,2) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `measure_data` varchar(2000) DEFAULT NULL,
  `emp_id` varchar(40) DEFAULT NULL,
  `result` varchar(2000) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`f_count_check_id`),
  KEY `FK_Reference_25` (`order_id`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`order_id`) REFERENCES `c_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of final_count_check
-- ----------------------------
INSERT INTO `final_count_check` VALUES ('20156', '000006', '平整度', '3', '3', '6', '0.89', '2015-05-13 00:00:00', '6', '001', '良', '问题较多，需要重审1');
INSERT INTO `final_count_check` VALUES ('33398', '000003', '透光度', '3', '3', '6', '0.89', '2015-05-13 00:00:00', '6', '001', '良', '问题较多，需要重审');
INSERT INTO `final_count_check` VALUES ('33521', '000006', '重量', '3', '3', '6', '0.89', '2015-05-13 00:00:00', '6', '001', '良', '问题较多，需要重审');
INSERT INTO `final_count_check` VALUES ('33789', '000003', '色差', '3', '3', '6', '0.89', '2015-05-13 00:00:00', '6', '001', '良', '问题较多，需要重审');
INSERT INTO `final_count_check` VALUES ('89658', '000006', '大小', '3', '3', '6', '0.89', '2015-05-13 00:00:00', '6', '001', '良', '问题较多，需要重审');

-- ----------------------------
-- Table structure for `final_measuret_check`
-- ----------------------------
DROP TABLE IF EXISTS `final_measuret_check`;
CREATE TABLE `final_measuret_check` (
  `f_measure_check_id` varchar(40) NOT NULL,
  `order_id` varchar(40) DEFAULT NULL,
  `check_item` varchar(40) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `measure_data` varchar(2000) DEFAULT NULL,
  `emp_id` varchar(40) DEFAULT NULL,
  `result` varchar(2000) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`f_measure_check_id`),
  KEY `FK_Reference_27` (`order_id`),
  CONSTRAINT `FK_Reference_27` FOREIGN KEY (`order_id`) REFERENCES `c_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of final_measuret_check
-- ----------------------------
INSERT INTO `final_measuret_check` VALUES ('11022', '000006', '材料', '2015-05-13 00:00:00', '36m', '001', '优', '合格率高，做工精致a');
INSERT INTO `final_measuret_check` VALUES ('11069', '000009', '工具', '2015-05-13 00:00:00', '36m', '001', '优', '合格率高，做工精致');
INSERT INTO `final_measuret_check` VALUES ('11079', '000006', '工具', '2015-05-13 00:00:00', '36m', '001', '优', '合格率高，做工精致');
INSERT INTO `final_measuret_check` VALUES ('11749', '000015', '资料', '2015-05-13 00:00:00', '36m', '001', '优', '合格率高，做工精致');
INSERT INTO `final_measuret_check` VALUES ('18969', '000013', '文具', '2015-05-13 00:00:00', '36m', '001', '优', '合格率高，做工精致');
INSERT INTO `final_measuret_check` VALUES ('19519', '000002', '工具', '2015-05-13 00:00:00', '36m', '001', '优', '合格率高，做工精致');

-- ----------------------------
-- Table structure for `manufacture`
-- ----------------------------
DROP TABLE IF EXISTS `manufacture`;
CREATE TABLE `manufacture` (
  `manufacture_sn` varchar(40) NOT NULL,
  `order_id` varchar(40) DEFAULT NULL,
  `technology_id` varchar(40) DEFAULT NULL,
  `launch_quantity` int(11) DEFAULT NULL,
  `begin_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`manufacture_sn`),
  KEY `FK_Reference_26` (`order_id`),
  KEY `FK_Reference_9` (`technology_id`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`order_id`) REFERENCES `c_order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`technology_id`) REFERENCES `technology` (`technology_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manufacture
-- ----------------------------
INSERT INTO `manufacture` VALUES ('0001', '000002', '001', '15', '2016-10-27 09:23:01', '2016-10-28 09:23:05');
INSERT INTO `manufacture` VALUES ('0002', '000003', '002', '213', '2016-12-17 00:00:00', '2016-12-17 00:00:00');
INSERT INTO `manufacture` VALUES ('0003', '000002', '002', '31', '2016-12-17 00:00:00', '2016-12-17 00:00:00');
INSERT INTO `manufacture` VALUES ('0004', '000001', '001', '213', null, null);
INSERT INTO `manufacture` VALUES ('0007', '000003', '002', '143', '2016-12-21 00:00:00', '2016-12-21 00:00:00');

-- ----------------------------
-- Table structure for `material`
-- ----------------------------
DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `material_id` varchar(40) NOT NULL,
  `material_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `remaining` int(11) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO `material` VALUES ('BZ3004985112', '包装类', '正常', '50', '用于保护<em></em>和指导产品使用的物品。');
INSERT INTO `material` VALUES ('FJ9810053211', '附件类', '充足', '35', '起到附属作用并具有独立使用功能的元件');
INSERT INTO `material` VALUES ('FM3003745734', '辅料类', '正常', '2', '用于生产及周转的低值辅助材料');
INSERT INTO `material` VALUES ('GM3587100823', '过滤件', '正常', '5', '起到过滤作用的零部件');
INSERT INTO `material` VALUES ('RJ10033214-80', '软胶件', '短缺', '-12', '用于组装主机及附件的且用软质材料');
INSERT INTO `material` VALUES ('SJ0011212178', '塑胶件', '充足', '41', '用于组装主机和附件及后续加工用的注塑件');
INSERT INTO `material` VALUES ('WJ3002123490', '五金件', '正常', '3', '用于组装主机和附件及后序加工用的单个金属件');
INSERT INTO `material` VALUES ('ZJ1006435620', '杂件类', '短缺', '-10', '用于组装主机及附件的用混杂材料加工成的元件');

-- ----------------------------
-- Table structure for `material_consume`
-- ----------------------------
DROP TABLE IF EXISTS `material_consume`;
CREATE TABLE `material_consume` (
  `consume_id` varchar(40) NOT NULL,
  `work_id` varchar(40) DEFAULT NULL,
  `material_id` varchar(40) DEFAULT NULL,
  `consume_amount` int(11) DEFAULT NULL,
  `consume_date` datetime DEFAULT NULL,
  `sender` varchar(40) DEFAULT NULL,
  `receiver` varchar(40) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`consume_id`),
  KEY `FK_Reference_16` (`material_id`),
  KEY `FK_Reference_33` (`work_id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_33` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material_consume
-- ----------------------------
INSERT INTO `material_consume` VALUES ('A1187899', '001', 'WJ3002123490', '312', '2016-12-03 00:00:00', '齐鲁钢铁公司', '朝阳钢铁公司', '进口原料。');
INSERT INTO `material_consume` VALUES ('A1561810', '001', 'GM3587100823', '450', '2016-11-13 00:00:00', '齐鲁钢铁公司', '朝阳钢铁公司', '进口矿石');
INSERT INTO `material_consume` VALUES ('A1562771', '001', 'FM3003745734', '25', '2016-09-13 00:00:00', '齐鲁钢铁公司', '朝阳钢铁公司', '进口矿石');
INSERT INTO `material_consume` VALUES ('A1620202', '001', 'WJ3002123490', '31', '2016-09-12 00:00:00', '齐鲁钢铁公司', '朝阳钢铁公司', '煤炭焦炭');
INSERT INTO `material_consume` VALUES ('A1880923', '001', 'ZJ1006435620', '45', '2016-08-15 00:00:00', '齐鲁钢铁公司', '朝阳钢铁公司', '不锈钢原料');

-- ----------------------------
-- Table structure for `material_receive`
-- ----------------------------
DROP TABLE IF EXISTS `material_receive`;
CREATE TABLE `material_receive` (
  `receive_id` varchar(40) NOT NULL,
  `material_id` varchar(40) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `receive_date` datetime DEFAULT NULL,
  `sender` varchar(100) DEFAULT NULL,
  `receiver` varchar(40) DEFAULT NULL,
  `note` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`receive_id`),
  KEY `FK_Reference_15` (`material_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of material_receive
-- ----------------------------
INSERT INTO `material_receive` VALUES ('B1087893', 'RJ10033214-80', '21', '2016-12-20 00:00:00', '齐鲁钢铁公司', '朝阳钢铁公司', '粉矿3.67。');
INSERT INTO `material_receive` VALUES ('B108897', 'RJ10033214-80', '12', '2016-12-03 00:00:00', '齐鲁钢铁公司', '朝阳钢铁公司', '进口原料4.12');
INSERT INTO `material_receive` VALUES ('B12979001', 'FM3003745734', '51', '2016-12-03 00:00:00', '齐鲁钢铁公司', '朝阳钢铁公司', '纯净废铜5.12');
INSERT INTO `material_receive` VALUES ('B13048855', 'SJ0011212178', '71', '2016-12-03 00:00:00', '齐鲁钢铁公司', '朝阳钢铁公司', '进口原料1.34');
INSERT INTO `material_receive` VALUES ('B13409145', 'RJ10033214-80', '12', '2016-12-03 00:00:00', '齐鲁钢铁公司', '朝阳钢铁公司', '进口原料2.12');

-- ----------------------------
-- Table structure for `process`
-- ----------------------------
DROP TABLE IF EXISTS `process`;
CREATE TABLE `process` (
  `process_id` varchar(40) NOT NULL,
  `technology_plan_id` varchar(40) DEFAULT NULL,
  `sequence` int(11) DEFAULT NULL,
  `quota` int(11) DEFAULT NULL,
  PRIMARY KEY (`process_id`),
  KEY `FK_Reference_32` (`technology_plan_id`),
  CONSTRAINT `FK_Reference_32` FOREIGN KEY (`technology_plan_id`) REFERENCES `technology_plan` (`technology_plan_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of process
-- ----------------------------
INSERT INTO `process` VALUES ('01', '001', '5', '3232');
INSERT INTO `process` VALUES ('02', '001', '2', '2');
INSERT INTO `process` VALUES ('03', '002', '4', '8');

-- ----------------------------
-- Table structure for `process_count_check`
-- ----------------------------
DROP TABLE IF EXISTS `process_count_check`;
CREATE TABLE `process_count_check` (
  `p_count_check_id` varchar(40) NOT NULL,
  `process_id` varchar(40) DEFAULT NULL,
  `check_item` varchar(40) DEFAULT NULL,
  `sample` int(11) DEFAULT NULL,
  `check_number` int(11) DEFAULT NULL,
  `unqualify` int(11) DEFAULT NULL,
  `qualify` decimal(3,2) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `measure_data` varchar(2000) DEFAULT NULL,
  `emp_id` varchar(40) DEFAULT NULL,
  `result` varchar(2000) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`p_count_check_id`),
  KEY `FK_Reference_24` (`process_id`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`process_id`) REFERENCES `process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of process_count_check
-- ----------------------------
INSERT INTO `process_count_check` VALUES ('33124', '03', '电灯', '6', '4', '8', '0.88', '2015-05-13 00:00:00', '12', '001', '优秀', '产品质量过关，外表美观');
INSERT INTO `process_count_check` VALUES ('36124', '03', '电话机', '6', '4', '8', '0.88', '2015-05-13 00:00:00', '12', '003', '优秀', '产品质量过关，外表美观');
INSERT INTO `process_count_check` VALUES ('36174', '03', '包装', '6', '4', '8', '0.88', '2015-05-13 00:00:00', '12', '001', '优秀', '产品质量过关，外表美观');
INSERT INTO `process_count_check` VALUES ('36744', '03', '电话机', '6', '4', '8', '0.88', '2015-05-13 00:00:00', '12', '001', '优秀', '产品质量过关，外表美观');
INSERT INTO `process_count_check` VALUES ('36784', '03', '电话机', '6', '4', '8', '0.88', '2015-05-13 00:00:00', '12', '001', '优秀', '产品质量过关，外表美观');

-- ----------------------------
-- Table structure for `process_measure_check`
-- ----------------------------
DROP TABLE IF EXISTS `process_measure_check`;
CREATE TABLE `process_measure_check` (
  `p_measure_check_id` varchar(40) NOT NULL,
  `process_id` varchar(40) DEFAULT NULL,
  `check_item` varchar(40) DEFAULT NULL,
  `cdate` datetime DEFAULT NULL,
  `measure_data` varchar(2000) DEFAULT NULL,
  `emp_id` varchar(40) DEFAULT NULL,
  `result` varchar(2000) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`p_measure_check_id`),
  KEY `FK_Reference_23` (`process_id`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`process_id`) REFERENCES `process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of process_measure_check
-- ----------------------------
INSERT INTO `process_measure_check` VALUES ('025', '02', '耗时', '2016-12-24 00:00:00', '15h', '002', '良', '耗时良好。');
INSERT INTO `process_measure_check` VALUES ('73689', '03', '耗时', '2015-05-13 00:00:00', '37件', '002', '延时', '工序复杂，耗时1');
INSERT INTO `process_measure_check` VALUES ('79619', '03', '产品合格率', '2015-05-13 00:00:00', '37件', '001', '延时', '工序复杂，耗时');
INSERT INTO `process_measure_check` VALUES ('79689', '03', '工人工时', '2015-05-13 00:00:00', '37件', '003', '延时', '工序复杂，耗时');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` varchar(40) NOT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_type` varchar(100) DEFAULT NULL,
  `unit_price` decimal(10,2) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `id` bigint(20) NOT NULL COMMENT '主键',
  `name` varchar(128) NOT NULL COMMENT '资源名称',
  `type` varchar(32) NOT NULL COMMENT '资源类型：menu,button,',
  `url` varchar(128) DEFAULT NULL COMMENT '访问url地址',
  `percode` varchar(128) DEFAULT NULL COMMENT '权限代码字符串',
  `parentid` bigint(20) DEFAULT NULL COMMENT '父结点id',
  `parentids` varchar(128) DEFAULT NULL COMMENT '父结点id列表串',
  `sortstring` varchar(128) DEFAULT NULL COMMENT '排序号',
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('1', '权限', 'permission', '', 'order:edit', '0', '0/', '0', '1');
INSERT INTO `sys_permission` VALUES ('10', '订单管理', 'menu', '', null, '1', '0/1/', '1.', '1');
INSERT INTO `sys_permission` VALUES ('11', '订单新增', 'permission', 'order/add_judge', 'order:add', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('12', '订单修改', 'permission', 'order/edit_judge', 'order:edit', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('13', '订单删除', 'permission', 'order/delete_judge', 'order:delete', '11', '0/1/11/', '', '1');
INSERT INTO `sys_permission` VALUES ('20', '客户管理', 'menu', '', '', '1', '0/1/', '2.', '1');
INSERT INTO `sys_permission` VALUES ('21', '客户新增', 'permission', '', 'custom:add', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('22', '客户修改', 'permission', '', 'custom:edit', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('23', '客户删除', 'permission', '', 'custom:delete', '21', '0/1/21/', '', '1');
INSERT INTO `sys_permission` VALUES ('30', '产品管理', 'menu', null, null, null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('31', '产品新增', 'permission', null, 'product:add', null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('32', '产品修改', 'permission', null, 'product:edit', null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('33', '产品删除', 'permission', null, 'product:delete', null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('40', '部门管理', 'menu', null, null, null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('41', '部门新增', 'permission', null, 'department:add', null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('42', '部门修改', 'permission', null, 'department:edit', null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('43', '部门删除', 'permission', null, 'department:delete', null, null, null, '1');
INSERT INTO `sys_permission` VALUES ('50', '员工管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('51', '员工新增', 'permission', null, 'employee:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('52', '员工修改', 'permission', null, 'employee:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('53', '员工删除', 'permission', null, 'employee:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('60', '作业管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('61', '作业新增', 'permission', null, 'work:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('62', '作业修改', 'permission', null, 'work:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('63', '作业删除', 'permission', null, 'work:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('70', '生产计划管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('71', '生产计划新增', 'permission', null, 'manufacture:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('72', '生产计划修改', 'permission', null, 'manufacture:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('73', '生产计划删除', 'permission', null, 'manufacture:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('80', '生产派工管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('81', '生产派工新增', 'permission', null, 'task:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('82', '生产派工修改', 'permission', null, 'task:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('83', '生产派工删除', 'permission', null, 'task:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('90', '工艺管理', 'menu', null, '', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('91', '工艺新增', 'permission', null, 'technology:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('92', '工艺修改', 'permission', null, 'technology:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('93', '工艺删除', 'permission', null, 'technology:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('100', '工序管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('101', '工序新增', 'permission', null, 'process:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('102', '工序修改', 'permission', null, 'process:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('103', '工序删除', 'permission', null, 'process:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('110', '工艺计划管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('111', '工艺计划新增', 'permission', null, 'technologyPlan:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('112', '工艺计划修改', 'permission', null, 'technologyPlan:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('113', '工艺计划删除', 'permission', null, 'technologyPlan:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('120', '工艺要求管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('121', '工艺要求新增', 'permission', null, 'technologyRequirement:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('122', '工艺要求修改', 'permission', null, 'technologyRequirement:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('123', '工艺要求删除', 'permission', null, 'technologyRequirement:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('130', '成品计数质检', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('131', '成品计数质检新增', 'permission', null, 'fCountCheck:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('132', '成品计数质检修改', 'permission', null, 'fCountCheck:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('133', '成品计数质检删除', 'permission', null, 'fCountCheck:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('140', '成品计量质检', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('141', '成品计量质检新增', 'permission', null, 'fMeasureCheck:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('142', '成品计量质检修改', 'permission', null, 'fMeasureCheck:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('143', '成品计量质检删除', 'permission', null, 'fMeasureCheck:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('150', '工序计数质检', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('151', '工序计数质检新增', 'permission', null, 'pCountCheck:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('152', '工序计数质检修改', 'permission', null, 'pCountCheck:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('153', '工序计数质检删除', 'permission', null, 'pCountCheck:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('160', '工序计量质检', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('161', '工序计量质检新增', 'permission', null, 'pMeasureCheck:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('162', '工序计量质检修改', 'permission', null, 'pMeasureCheck:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('163', '工序计量质检删除', 'permission', null, 'pMeasureCheck:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('170', '不合格品申请', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('171', '不合格品申请新增', 'permission', null, 'unqualify:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('172', '不合格品申请修改', 'permission', null, 'unqualify:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('173', '不合格品申请删除', 'permission', null, 'unqualify:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('180', '物料管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('181', '物料新增', 'permission', null, 'material:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('182', '物料修改', 'permission', null, 'material:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('183', '物料删除', 'permission', null, 'material:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('190', '物料收入', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('191', '物料收入新增', 'permission', null, 'materialReceive:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('192', '物料收入修改', 'permission', null, 'materialReceive:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('193', '物料收入删除', 'permission', null, 'materialReceive:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('200', '用户管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('201', '用户新增', 'permission', null, 'user:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('202', '用户修改', 'permission', null, 'user:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('203', '用户删除', 'permission', null, 'user:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('210', '角色管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('211', '角色新增', 'permission', null, 'role:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('212', '角色修改', 'permission', null, 'role:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('213', '角色删除', 'permission', null, 'role:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('220', '物料消耗', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('221', '物料消耗新增', 'permission', null, 'materialConsume:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('222', '物料消耗修改', 'permission', null, 'materialConsume:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('223', '物料消耗删除', 'permission', null, 'materialConsume:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('230', '设备管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('231', '设备新增', 'permission', null, 'device:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('232', '设备修改', 'permission', null, 'device:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('233', '设备删除', 'permission', null, 'device:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('240', '设备例检管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('241', '设备例检新增', 'permission', null, 'deviceCheck:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('242', '设备例检修改', 'permission', null, 'deviceCheck:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('243', '设备例检删除', 'permission', null, 'deviceCheck:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('250', '设备故障管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('251', '设备故障新增', 'permission', null, 'deviceFault:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('252', '设备故障修改', 'permission', null, 'deviceFault:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('253', '设备故障删除', 'permission', null, 'deviceFault:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('260', '设备维修管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('261', '设备维修新增', 'permission', null, 'deviceMaintain:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('262', '设备维修修改', 'permission', null, 'deviceMaintain:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('263', '设备维修删除', 'permission', null, 'deviceMaintain:delete', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('270', '设备种类管理', 'menu', null, null, null, null, null, null);
INSERT INTO `sys_permission` VALUES ('271', '设备种类新增', 'permission', null, 'deviceType:add', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('272', '设备种类修改', 'permission', null, 'deviceType:edit', null, null, null, null);
INSERT INTO `sys_permission` VALUES ('273', '设备种类删除', 'permission', null, 'deviceType:delete', null, null, null, null);

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(36) NOT NULL,
  `role_name` varchar(128) NOT NULL,
  `available` char(1) DEFAULT NULL COMMENT '是否可用,1：可用，0不可用',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('001', '超级管理员', '1');
INSERT INTO `sys_role` VALUES ('002', '订单管理员', '1');
INSERT INTO `sys_role` VALUES ('004', '物料管理员', '1');
INSERT INTO `sys_role` VALUES ('005', '普通用户', '1');
INSERT INTO `sys_role` VALUES ('007', '设备管理员', '1');

-- ----------------------------
-- Table structure for `sys_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permission`;
CREATE TABLE `sys_role_permission` (
  `id` varchar(50) NOT NULL,
  `sys_role_id` varchar(50) NOT NULL COMMENT '角色id',
  `sys_permission_id` varchar(300) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_permission
-- ----------------------------
INSERT INTO `sys_role_permission` VALUES ('1456115611515', '002', '11,12,13,201,202,203,');
INSERT INTO `sys_role_permission` VALUES ('147729449886163', '15615615151', '11,12,13,231,232,233,271,273,');
INSERT INTO `sys_role_permission` VALUES ('147737863632731', '005', '11,33,81,83,91,93,101,102,103,121,192,131,133,151,153,173,273,252,51,53,');
INSERT INTO `sys_role_permission` VALUES ('148007157091762', '004', '181,182,183,191,192,193,221,222,223,');
INSERT INTO `sys_role_permission` VALUES ('148255367614063', '007', null);
INSERT INTO `sys_role_permission` VALUES ('149122370655248', '31931', null);
INSERT INTO `sys_role_permission` VALUES ('149122382565714', '424', null);
INSERT INTO `sys_role_permission` VALUES ('149122469890916', '3213', null);
INSERT INTO `sys_role_permission` VALUES ('149122510431476', '3214321', null);
INSERT INTO `sys_role_permission` VALUES ('149122513769244', '213213213', '11,12,13,');
INSERT INTO `sys_role_permission` VALUES ('ebc8a441-c6f9-11e4-b137-0adc305c3f21', '001', '11,12,13,21,22,23,31,32,33,61,62,63,71,72,73,81,82,83,91,92,93,101,102,103,111,112,113,121,122,123,181,182,183,191,192,193,221,222,223,131,132,133,141,142,143,151,152,153,161,162,163,171,172,173,231,232,233,271,272,273,241,242,243,251,252,253,261,262,263,41,42,43,51,52,53,201,202,203,211,212,213,');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(36) NOT NULL COMMENT '主键',
  `username` varchar(64) DEFAULT NULL COMMENT '姓名',
  `password` varchar(32) DEFAULT NULL COMMENT '密码',
  `locked` char(1) DEFAULT NULL COMMENT '账号是否锁定，1：锁定，0未锁定',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('001', '王经理', '11', '1');
INSERT INTO `sys_user` VALUES ('002', '22', '22', '1');
INSERT INTO `sys_user` VALUES ('003', '张三', 'aaa', '1');
INSERT INTO `sys_user` VALUES ('004', 'aa', 'aa', '1');
INSERT INTO `sys_user` VALUES ('005', '11', '11', '1');
INSERT INTO `sys_user` VALUES ('006', '王二', '12345', '2');
INSERT INTO `sys_user` VALUES ('007', '李大山', '11', '1');
INSERT INTO `sys_user` VALUES ('3213', 'ga', '22', '1');
INSERT INTO `sys_user` VALUES ('321321', '55', '55', '1');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` varchar(36) NOT NULL,
  `sys_user_id` varchar(32) NOT NULL,
  `sys_role_id` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('001', '001', '001');
INSERT INTO `sys_user_role` VALUES ('147705484492576', '003', '002');
INSERT INTO `sys_user_role` VALUES ('148228593447685', '004', '005');
INSERT INTO `sys_user_role` VALUES ('148232608456017', '002', '001');
INSERT INTO `sys_user_role` VALUES ('148232650257115', '005', '002');
INSERT INTO `sys_user_role` VALUES ('148237251058254', '321321', '004');
INSERT INTO `sys_user_role` VALUES ('148237503507696', '3213', '005');
INSERT INTO `sys_user_role` VALUES ('148249856407793', '006', '002');
INSERT INTO `sys_user_role` VALUES ('148255363744945', '007', '004');

-- ----------------------------
-- Table structure for `task`
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `task_id` varchar(40) NOT NULL,
  `manufacture_sn` varchar(40) DEFAULT NULL,
  `work_id` varchar(40) DEFAULT NULL,
  `task_quantity` int(11) DEFAULT NULL,
  `working_hours` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `FK_Reference_34` (`manufacture_sn`),
  KEY `FK_Reference_6` (`work_id`),
  CONSTRAINT `FK_Reference_34` FOREIGN KEY (`manufacture_sn`) REFERENCES `manufacture` (`manufacture_sn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`work_id`) REFERENCES `work` (`work_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('001', '0002', '001', '112', '700');
INSERT INTO `task` VALUES ('002', '0001', '001', '213', '221');
INSERT INTO `task` VALUES ('003', '0003', '003', '150', '15');
INSERT INTO `task` VALUES ('004', '0004', '004', '154', '851');

-- ----------------------------
-- Table structure for `technology`
-- ----------------------------
DROP TABLE IF EXISTS `technology`;
CREATE TABLE `technology` (
  `technology_id` varchar(40) NOT NULL,
  `technology_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `vital_process_period` varchar(50) DEFAULT NULL,
  `standard_capacity` int(11) DEFAULT NULL,
  `overtime_standard_capacity` int(11) DEFAULT NULL,
  `overtime_overfulfil_capacity` int(11) DEFAULT NULL,
  `double_capacity` int(11) DEFAULT NULL,
  `overfulfil_capacity` int(11) DEFAULT NULL,
  PRIMARY KEY (`technology_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of technology
-- ----------------------------
INSERT INTO `technology` VALUES ('001', '打磨精加工', '33.00', '12', '333', '333', '666', '1200', '1400');
INSERT INTO `technology` VALUES ('002', '打磨粗加工', '8.00', '3', '20', '25', '30', '40', '50');
INSERT INTO `technology` VALUES ('004', '抛光', '156.00', '1', '8', '2', '5', '5', '5');
INSERT INTO `technology` VALUES ('005', '打蜡', '7.00', '7', '7', '7', '7', '7', '7');
INSERT INTO `technology` VALUES ('006', '一体成型', '6.00', '6', '6', '6', '6', '66', '666');

-- ----------------------------
-- Table structure for `technology_plan`
-- ----------------------------
DROP TABLE IF EXISTS `technology_plan`;
CREATE TABLE `technology_plan` (
  `technology_plan_id` varchar(40) NOT NULL,
  `technology_id` varchar(40) DEFAULT NULL,
  `batch_amount` int(11) DEFAULT NULL,
  `start_plan` datetime DEFAULT NULL,
  `end_plan` datetime DEFAULT NULL,
  `commit_plan` datetime DEFAULT NULL,
  `technology_plan_start` datetime DEFAULT NULL,
  `technology_plan_end` datetime DEFAULT NULL,
  PRIMARY KEY (`technology_plan_id`),
  KEY `FK_Reference_31` (`technology_id`),
  CONSTRAINT `FK_Reference_31` FOREIGN KEY (`technology_id`) REFERENCES `technology` (`technology_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of technology_plan
-- ----------------------------
INSERT INTO `technology_plan` VALUES ('0008', '002', '30', '2016-12-29 00:00:00', '2016-12-24 00:00:00', '2017-01-10 00:00:00', null, null);
INSERT INTO `technology_plan` VALUES ('001', '002', '202', '2016-11-16 11:29:11', '2016-11-16 11:29:14', '2016-11-16 11:29:16', null, null);
INSERT INTO `technology_plan` VALUES ('002', '001', '56', '1970-01-01 08:00:00', '1970-01-01 08:00:00', '1970-01-01 08:00:00', null, null);
INSERT INTO `technology_plan` VALUES ('003', '002', '30', '2016-11-16 20:51:09', '2016-11-16 20:51:11', '2016-11-16 20:51:13', null, null);
INSERT INTO `technology_plan` VALUES ('004', '004', '321', '2016-12-21 00:00:00', '2016-12-21 00:00:00', '2016-12-21 00:00:00', null, null);

-- ----------------------------
-- Table structure for `technology_requirement`
-- ----------------------------
DROP TABLE IF EXISTS `technology_requirement`;
CREATE TABLE `technology_requirement` (
  `technology_requirement_id` varchar(40) NOT NULL,
  `technology_id` varchar(40) DEFAULT NULL,
  `requirement` varchar(2000) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `revise_time` datetime DEFAULT NULL,
  PRIMARY KEY (`technology_requirement_id`),
  KEY `FK_Reference_10` (`technology_id`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`technology_id`) REFERENCES `technology` (`technology_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of technology_requirement
-- ----------------------------
INSERT INTO `technology_requirement` VALUES ('01', '001', '<strong><em>dgfghfhgjf</em></strong>', '2016-11-30 16:07:08', '2016-11-30 16:07:10');
INSERT INTO `technology_requirement` VALUES ('02', '002', 'hijklmn', '2016-11-16 16:07:30', '2016-11-16 16:07:34');
INSERT INTO `technology_requirement` VALUES ('03', '005', '1321231', '2016-11-16 16:28:04', '2016-11-16 16:28:06');
INSERT INTO `technology_requirement` VALUES ('04', '002', '<strong>fdsfdsfdsafdsfcvvvvvcvffffwudali</strong>', '1970-01-01 08:00:00', '1970-01-01 08:00:00');
INSERT INTO `technology_requirement` VALUES ('05', '001', '<strong>dsafsffdsfafvvvv</strong>', '2016-11-16 19:51:50', '2016-11-16 19:51:51');
INSERT INTO `technology_requirement` VALUES ('06', '004', '抛光需仔细，反射面要达到要求', '2016-12-21 00:00:00', '2016-12-21 00:00:00');
INSERT INTO `technology_requirement` VALUES ('07', '002', '321321321', '2016-12-07 11:10:12', '2016-12-22 11:10:15');

-- ----------------------------
-- Table structure for `unqualify_apply`
-- ----------------------------
DROP TABLE IF EXISTS `unqualify_apply`;
CREATE TABLE `unqualify_apply` (
  `unqualify_apply_id` varchar(40) NOT NULL,
  `product_id` varchar(40) DEFAULT NULL,
  `unqualify_item` varchar(200) DEFAULT NULL,
  `unqualify_count` int(11) DEFAULT NULL,
  `assembly_date` datetime DEFAULT NULL,
  `emp_id` varchar(40) DEFAULT NULL,
  `apply_date` datetime DEFAULT NULL,
  `note` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`unqualify_apply_id`),
  KEY `FK_Reference_29` (`product_id`),
  CONSTRAINT `FK_Reference_29` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of unqualify_apply
-- ----------------------------
INSERT INTO `unqualify_apply` VALUES ('0001', '00001', '成像质量', '2', '2015-05-13 00:00:00', '001', '2015-05-13 00:00:00', '需要返厂');
INSERT INTO `unqualify_apply` VALUES ('0002', '00005', '平整度', '5', '2015-05-13 00:00:00', '002', '2015-05-13 00:00:00', '需要返厂');
INSERT INTO `unqualify_apply` VALUES ('0003', '00002', '音量', '15', '2016-12-21 00:00:00', '002', '2016-12-21 00:00:00', '需要返厂');
INSERT INTO `unqualify_apply` VALUES ('01231', '00003', '电池', '50', '2016-12-21 00:00:00', '003', '2016-12-24 12:15:16', '<span style=\"font-family:SimHei;font-size:16px;\">电池效率不达标，且电池耐久度不合格，<strong><span style=\"color:#E53333;\">存在一定的安全隐患</span></strong>。</span>');

-- ----------------------------
-- Table structure for `work`
-- ----------------------------
DROP TABLE IF EXISTS `work`;
CREATE TABLE `work` (
  `work_id` varchar(40) NOT NULL,
  `process_number` varchar(40) DEFAULT NULL,
  `product_id` varchar(40) DEFAULT NULL,
  `process_id` varchar(40) DEFAULT NULL,
  `device_id` varchar(40) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`work_id`),
  KEY `FK_Reference_12` (`process_id`),
  KEY `FK_Reference_17` (`device_id`),
  KEY `FK_Reference_7` (`product_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`process_id`) REFERENCES `process` (`process_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`device_id`) REFERENCES `device` (`device_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of work
-- ----------------------------
INSERT INTO `work` VALUES ('001', '1', '00004', '01', '001', '50');
INSERT INTO `work` VALUES ('002', '5', '00003', '02', '003', '32');
INSERT INTO `work` VALUES ('003', '1', '00002', '02', '002', '13');
INSERT INTO `work` VALUES ('004', '2', '00003', '03', '003', '15');
INSERT INTO `work` VALUES ('005', '3', '00002', '02', '005', '16');

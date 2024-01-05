create database BookingPitch

use BookingPitch

CREATE TABLE role (
    role_id NVARCHAR(5) PRIMARY KEY,
    role_name NVARCHAR(15)
);

CREATE TABLE district (
    district_id NVARCHAR(5) PRIMARY KEY,
    district_name NVARCHAR(50)
);

CREATE TABLE ward (
    ward_id NVARCHAR(5) PRIMARY KEY,
	district_id NVARCHAR(5),
    ward_name NVARCHAR(50)
	FOREIGN KEY (district_id) REFERENCES district(district_id),
);

CREATE TABLE member (
    member_id NVARCHAR(5) PRIMARY KEY,
	role_id NVARCHAR(5) NOT NULL,
	ward_id NVARCHAR(5),
	district_id NVARCHAR(5),
    user_name varchar(50) UNIQUE,
    pass varchar(20),
	full_name nvarchar(50),
    phone varchar(15),
	member_address nvarchar(50),
	email nvarchar(100) UNIQUE NOT NULL,
	img_link nvarchar(200),
	owner_status bit,
	member_status bit,
	FOREIGN KEY (district_id) REFERENCES district(district_id),
	FOREIGN KEY (role_id) REFERENCES role(role_id),
	FOREIGN KEY (ward_id) REFERENCES ward(ward_id),
);

CREATE TABLE pitch (
    pitch_id NVARCHAR(5) PRIMARY KEY,
    ward_id NVARCHAR(5) NOT NULL,
	district_id NVARCHAR(5) NOT NULL,
	member_id NVARCHAR(5) NOT NULL,
	pitch_name nvarchar(50),
    pitch_address nvarchar(50),
	estimation int,
	pitch_description NVARCHAR(500),
	pitch_status bit,
	FOREIGN KEY (district_id) REFERENCES district(district_id),
	FOREIGN KEY (member_id) REFERENCES member(member_id),
	FOREIGN KEY (ward_id) REFERENCES ward(ward_id),
);

CREATE TABLE children_pitch (
    children_pitch_id NVARCHAR(5) PRIMARY KEY,
	pitch_id NVARCHAR(5) NOT NULL,
	children_pitch_name nvarchar(50),
    children_pitch_type nvarchar(20),
	price decimal not null,
	status_children_pitch bit,
	FOREIGN KEY (pitch_id) REFERENCES pitch(pitch_id),
);

CREATE TABLE time(
	time_id NVARCHAR(5) PRIMARY KEY,
	time_start time,
	time_end time,
)

CREATE TABLE booking (
    booking_id NVARCHAR(5) PRIMARY KEY,
	children_pitch_id NVARCHAR(5) NOT NULL,
	member_id NVARCHAR(5) NOT NULL,
	booking_date datetime,
    time_id nvarchar(5),
	status_booking bit,
	reason_content NVARCHAR(300),
	FOREIGN KEY (children_pitch_id) REFERENCES children_pitch(children_pitch_id),
	FOREIGN KEY (member_id) REFERENCES member(member_id),
	FOREIGN KEY (time_id) REFERENCES time(time_id),
);

CREATE TABLE comment(
	comment_id NVARCHAR(5) PRIMARY KEY,
	pitch_id NVARCHAR(5) NOT NULL,
	member_id NVARCHAR(5) NOT NULL,
	comment_date datetime,
	content NVARCHAR(300),
	rating int,
	FOREIGN KEY (member_id) REFERENCES member(member_id),
	FOREIGN KEY (pitch_id) REFERENCES pitch(pitch_id),
)


INSERT INTO role
VALUES ('AD', 'admin')

INSERT INTO role
VALUES ('US', 'user')

INSERT INTO role
VALUES ('OW', 'owner')

INSERT INTO district
VALUES ('1', N'Quận 1');

INSERT INTO district
VALUES ('2', N'Quận 3');

INSERT INTO district
VALUES ('3', N'Quận 4');

INSERT INTO district
VALUES ('4', N'Quận 5');

INSERT INTO district
VALUES ('5', N'Quận 6');

INSERT INTO district
VALUES ('6', N'Quận 7');

INSERT INTO district
VALUES ('7', N'Quận 8');

INSERT INTO district
VALUES ('8', N'Quận 10');

INSERT INTO district
VALUES ('9', N'Quận 11');

INSERT INTO district
VALUES ('10', N'Quận 12');

INSERT INTO district
VALUES ('11', N'Quận Bình Tân');

INSERT INTO district
VALUES ('12', N'Quận Bình Thạnh');

INSERT INTO district
VALUES ('13', N'Quận Gò Vấp');

INSERT INTO district
VALUES ('14', N'Quận Phú Nhuận');

INSERT INTO district
VALUES ('15', N'Quận Tân Bình');

INSERT INTO district
VALUES ('16', N'Quận Tân Phú');

INSERT INTO district
VALUES ('17', N'Huyện Bình Chánh');

INSERT INTO district
VALUES ('18', N'Huyện Cần Giờ');

INSERT INTO district
VALUES ('19', N'Huyện Củ Chi');

INSERT INTO district
VALUES ('20', N'Huyện Hóc Môn');

INSERT INTO district
VALUES ('21', N'Huyện Nhà Bè');

INSERT INTO district
VALUES ('22', N'Thành Phố Thủ Đức');


INSERT INTO ward
VALUES ('1','1', N'Phường Bến Nghé');

INSERT INTO ward
VALUES ('2','1', N'Phường Bến Thành');

INSERT INTO ward
VALUES ('3','1', N'Phường Cầu Kho');

INSERT INTO ward
VALUES ('4','1', N'Phường Cầu Ông Lãnh');

INSERT INTO ward
VALUES ('5','1', N'Phường Cô Giang');

INSERT INTO ward
VALUES ('6','1', N'Phường Đa Kao');

INSERT INTO ward
VALUES ('7','1', N'Phường Nguyễn Cư Trinh');

INSERT INTO ward
VALUES ('8','1', N'Phường Nguyễn Thái Bình');

INSERT INTO ward
VALUES ('9','1', N'Phường Phạm Ngũ Lão');

INSERT INTO ward
VALUES ('10','1', N'Phường Tân Định');

INSERT INTO ward
VALUES ('11','2', N'Phường 01');

INSERT INTO ward
VALUES ('12','2', N'Phường 02');

INSERT INTO ward
VALUES ('13','2', N'Phường 03');

INSERT INTO ward
VALUES ('14','2', N'Phường 04');

INSERT INTO ward
VALUES ('15','2', N'Phường 05');

INSERT INTO ward
VALUES ('16','2', N'Phường Võ Thị Sáu');

INSERT INTO ward
VALUES ('17','2', N'Phường 09');

INSERT INTO ward
VALUES ('18','2', N'Phường 10');

INSERT INTO ward
VALUES ('19','2', N'Phường 11');

INSERT INTO ward
VALUES ('20','2', N'Phường 12');

INSERT INTO ward
VALUES ('21','2', N'Phường 13');

INSERT INTO ward
VALUES ('22','2', N'Phường 14');

INSERT INTO ward
VALUES ('23', '3', N'Phường 1')

INSERT INTO ward
VALUES ('24', '3', N'Phường 2')

INSERT INTO ward
VALUES ('25', '3', N'Phường 3')

INSERT INTO ward
VALUES ('26', '3', N'Phường 4')

INSERT INTO ward
VALUES ('27', '3', N'Phường 6')

INSERT INTO ward
VALUES ('28', '3', N'Phường 8')

INSERT INTO ward
VALUES ('29', '3', N'Phường 9')

INSERT INTO ward
VALUES ('30', '3', N'Phường 10')

INSERT INTO ward
VALUES ('31', '3', N'Phường 13')

INSERT INTO ward
VALUES ('32', '3', N'Phường 14')

INSERT INTO ward
VALUES ('33', '3', N'Phường 15')

INSERT INTO ward
VALUES ('34', '3', N'Phường 16')

INSERT INTO ward
VALUES ('35', '3', N'Phường 18')

INSERT INTO ward
VALUES ('36', '4', N'Phường 1')

INSERT INTO ward
VALUES ('37', '4', N'Phường 2')

INSERT INTO ward
VALUES ('38', '4', N'Phường 3')

INSERT INTO ward
VALUES ('39', '4', N'Phường 4')

INSERT INTO ward
VALUES ('40', '4', N'Phường 5')

INSERT INTO ward
VALUES ('41', '4', N'Phường 6')

INSERT INTO ward
VALUES ('42', '4', N'Phường 7')

INSERT INTO ward
VALUES ('43', '4', N'Phường 8')

INSERT INTO ward
VALUES ('44', '4', N'Phường 9')

INSERT INTO ward
VALUES ('45', '4', N'Phường 10')

INSERT INTO ward
VALUES ('46', '4', N'Phường 11')

INSERT INTO ward
VALUES ('47', '4', N'Phường 12')

INSERT INTO ward
VALUES ('48', '4', N'Phường 13')

INSERT INTO ward
VALUES ('49', '4', N'Phường 14')

INSERT INTO ward
VALUES ('50', '5', N'Phường 1')

INSERT INTO ward
VALUES ('51', '5', N'Phường 2')

INSERT INTO ward
VALUES ('52', '5', N'Phường 3')

INSERT INTO ward
VALUES ('53', '5', N'Phường 4')

INSERT INTO ward
VALUES ('54', '5', N'Phường 5')

INSERT INTO ward
VALUES ('55', '5', N'Phường 6')

INSERT INTO ward
VALUES ('56', '5', N'Phường 7')

INSERT INTO ward
VALUES ('57', '5', N'Phường 8')

INSERT INTO ward
VALUES ('58', '5', N'Phường 9')

INSERT INTO ward
VALUES ('59', '5', N'Phường 10')

INSERT INTO ward
VALUES ('60', '5', N'Phường 11')

INSERT INTO ward
VALUES ('61', '5', N'Phường 12')

INSERT INTO ward
VALUES ('62', '5', N'Phường 13')

INSERT INTO ward
VALUES ('63', '5', N'Phường 14')

INSERT INTO ward
VALUES ('64', '6', N'Phường Bình Thuận')

INSERT INTO ward
VALUES ('65', '6', N'Phường Phú Mỹ')

INSERT INTO ward
VALUES ('66', '6', N'Phường Phú Thuận')

INSERT INTO ward
VALUES ('67', '6', N'Phường Tân Hưng')

INSERT INTO ward
VALUES ('68', '6', N'Phường Tân Kiểng')

INSERT INTO ward
VALUES ('69', '6', N'Phường Tân Phong')

INSERT INTO ward
VALUES ('70', '6', N'Phường Tân Phú')

INSERT INTO ward
VALUES ('71', '6', N'Phường Tân Quy')

INSERT INTO ward
VALUES ('72', '6', N'Phường Tân Thuận Đông')

INSERT INTO ward
VALUES ('73', '6', N'Phường Tân Thuận Tây')

INSERT INTO ward
VALUES ('74', '7', N'Phường 1')

INSERT INTO ward
VALUES ('75', '7', N'Phường 2')

INSERT INTO ward
VALUES ('76', '7', N'Phường 3')

INSERT INTO ward
VALUES ('77', '7', N'Phường 4')

INSERT INTO ward
VALUES ('78', '7', N'Phường 5')

INSERT INTO ward
VALUES ('79', '7', N'Phường 6')

INSERT INTO ward
VALUES ('80', '7', N'Phường 7')

INSERT INTO ward
VALUES ('81', '7', N'Phường 8')

INSERT INTO ward
VALUES ('82', '7', N'Phường 9')

INSERT INTO ward
VALUES ('83', '7', N'Phường 10')

INSERT INTO ward
VALUES ('84', '7', N'Phường 11')

INSERT INTO ward
VALUES ('85', '7', N'Phường 12')

INSERT INTO ward
VALUES ('86', '7', N'Phường 13')

INSERT INTO ward
VALUES ('87', '7', N'Phường 14')

INSERT INTO ward
VALUES ('88', '7', N'Phường 15')

INSERT INTO ward
VALUES ('89', '7', N'Phường 16')

INSERT INTO ward
VALUES ('90', '8', N'Phường 1')

INSERT INTO ward
VALUES ('91', '8', N'Phường 2')

INSERT INTO ward
VALUES ('92', '8', N'Phường 4')

INSERT INTO ward
VALUES ('93', '8', N'Phường 5')

INSERT INTO ward
VALUES ('94', '8', N'Phường 6')

INSERT INTO ward
VALUES ('95', '8', N'Phường 7')

INSERT INTO ward
VALUES ('96', '8', N'Phường 8')

INSERT INTO ward
VALUES ('97', '8', N'Phường 9')

INSERT INTO ward
VALUES ('98', '8', N'Phường 10')

INSERT INTO ward
VALUES ('99', '8', N'Phường 11')

INSERT INTO ward
VALUES ('100', '8', N'Phường 12')

INSERT INTO ward
VALUES ('101', '8', N'Phường 13')

INSERT INTO ward
VALUES ('102', '8', N'Phường 14')

INSERT INTO ward
VALUES ('103', '8', N'Phường 15')

INSERT INTO ward
VALUES ('104', '9', N'Phường 1')

INSERT INTO ward
VALUES ('105', '9', N'Phường 2')

INSERT INTO ward
VALUES ('106', '9', N'Phường 3')

INSERT INTO ward
VALUES ('107', '9', N'Phường 4')

INSERT INTO ward
VALUES ('108', '9', N'Phường 5')

INSERT INTO ward
VALUES ('109', '9', N'Phường 6')

INSERT INTO ward
VALUES ('110', '9', N'Phường 7')

INSERT INTO ward
VALUES ('111', '9', N'Phường 8')

INSERT INTO ward
VALUES ('112', '9', N'Phường 9')

INSERT INTO ward
VALUES ('113', '9', N'Phường 10')

INSERT INTO ward
VALUES ('114', '9', N'Phường 11')

INSERT INTO ward
VALUES ('115', '9', N'Phường 12')

INSERT INTO ward
VALUES ('116', '9', N'Phường 13')

INSERT INTO ward
VALUES ('117', '9', N'Phường 14')

INSERT INTO ward
VALUES ('118', '9', N'Phường 15')

INSERT INTO ward
VALUES ('119', '9', N'Phường 16')

INSERT INTO ward
VALUES ('120', '10', N'Phường An Phú Đông')

INSERT INTO ward
VALUES ('121', '10', N'Phường Đông Hưng Thuận')

INSERT INTO ward
VALUES ('122', '10', N'Phường Hiệp Thành')

INSERT INTO ward
VALUES ('123', '10', N'Phường Tân Chánh Hiệp')

INSERT INTO ward
VALUES ('124', '10', N'Phường Tân Hưng Thuận')

INSERT INTO ward
VALUES ('125', '10', N'Phường Tân Thới Hiệp')

INSERT INTO ward
VALUES ('126', '10', N'Phường Tân Thới Nhất')

INSERT INTO ward
VALUES ('127', '10', N'Phường Thạnh Lộc')

INSERT INTO ward
VALUES ('128', '10', N'Phường Thạnh Xuân')

INSERT INTO ward
VALUES ('129', '10', N'Phường Thới An')

INSERT INTO ward
VALUES ('130', '10', N'Phường Trung Mỹ Tây')

INSERT INTO ward
VALUES ('131', '11', N'Phường An Lạc')

INSERT INTO ward
VALUES ('132', '11', N'Phường An Lạc A')

INSERT INTO ward
VALUES ('133', '11', N'Phường Bình Hưng Hòa')

INSERT INTO ward
VALUES ('134', '11', N'Phường Bình Hưng Hòa A')

INSERT INTO ward
VALUES ('135', '11', N'Phường Bình Hưng Hòa B')

INSERT INTO ward
VALUES ('136', '11', N'Phường Bình Trị Đông')

INSERT INTO ward
VALUES ('137', '11', N'Phường Bình Trị Đông A')

INSERT INTO ward
VALUES ('138', '11', N'Phường Bình Trị Đông B')

INSERT INTO ward
VALUES ('139', '11', N'Phường Tân Tạo')

INSERT INTO ward
VALUES ('140', '11', N'Phường Tân Tạo A')

INSERT INTO ward
VALUES ('141', '12', N'Phường 1')

INSERT INTO ward
VALUES ('142', '12', N'Phường 2')

INSERT INTO ward
VALUES ('143', '12', N'Phường 3')

INSERT INTO ward
VALUES ('144', '12', N'Phường 5')

INSERT INTO ward
VALUES ('145', '12', N'Phường 6')

INSERT INTO ward
VALUES ('146', '12', N'Phường 7')

INSERT INTO ward
VALUES ('147', '12', N'Phường 11')

INSERT INTO ward
VALUES ('148', '12', N'Phường 12')

INSERT INTO ward
VALUES ('149', '12', N'Phường 13')

INSERT INTO ward
VALUES ('150', '12', N'Phường 14')

INSERT INTO ward
VALUES ('151', '12', N'Phường 15')

INSERT INTO ward
VALUES ('152', '12', N'Phường 17')

INSERT INTO ward
VALUES ('153', '12', N'Phường 19')

INSERT INTO ward
VALUES ('154', '12', N'Phường 21')

INSERT INTO ward
VALUES ('155', '12', N'Phường 22')

INSERT INTO ward
VALUES ('156', '12', N'Phường 24')

INSERT INTO ward
VALUES ('157', '12', N'Phường 25')

INSERT INTO ward
VALUES ('158', '12', N'Phường 26')

INSERT INTO ward
VALUES ('159', '12', N'Phường 27')

INSERT INTO ward
VALUES ('160', '12', N'Phường 28')

INSERT INTO ward
VALUES ('161', '13', N'Phường 1')

INSERT INTO ward
VALUES ('162', '13', N'Phường 3')

INSERT INTO ward
VALUES ('163', '13', N'Phường 4')

INSERT INTO ward
VALUES ('164', '13', N'Phường 5')

INSERT INTO ward
VALUES ('165', '13', N'Phường 6')

INSERT INTO ward
VALUES ('166', '13', N'Phường 7')

INSERT INTO ward
VALUES ('167', '13', N'Phường 8')

INSERT INTO ward
VALUES ('168', '13', N'Phường 9')

INSERT INTO ward
VALUES ('169', '13', N'Phường 10')

INSERT INTO ward
VALUES ('170', '13', N'Phường 11')

INSERT INTO ward
VALUES ('171', '13', N'Phường 12')

INSERT INTO ward
VALUES ('172', '13', N'Phường 13')

INSERT INTO ward
VALUES ('173', '13', N'Phường 14')

INSERT INTO ward
VALUES ('174', '13', N'Phường 15')

INSERT INTO ward
VALUES ('175', '13', N'Phường 16')

INSERT INTO ward
VALUES ('176', '13', N'Phường 17')

INSERT INTO ward
VALUES ('177', '14', N'Phường 1')

INSERT INTO ward
VALUES ('178', '14', N'Phường 2')

INSERT INTO ward
VALUES ('179', '14', N'Phường 3')

INSERT INTO ward
VALUES ('180', '14', N'Phường 4')

INSERT INTO ward
VALUES ('181', '14', N'Phường 5')

INSERT INTO ward
VALUES ('182', '14', N'Phường 7')

INSERT INTO ward
VALUES ('183', '14', N'Phường 8')

INSERT INTO ward
VALUES ('184', '14', N'Phường 9')

INSERT INTO ward
VALUES ('185', '14', N'Phường 10')

INSERT INTO ward
VALUES ('186', '14', N'Phường 11')

INSERT INTO ward
VALUES ('187', '14', N'Phường 13')

INSERT INTO ward
VALUES ('188', '14', N'Phường 15')

INSERT INTO ward
VALUES ('189', '14', N'Phường 17')

INSERT INTO ward
VALUES ('190', '15', N'Phường 1')

INSERT INTO ward
VALUES ('191', '15', N'Phường 2')

INSERT INTO ward
VALUES ('192', '15', N'Phường 3')

INSERT INTO ward
VALUES ('193', '15', N'Phường 4')

INSERT INTO ward
VALUES ('194', '15', N'Phường 5')

INSERT INTO ward
VALUES ('195', '15', N'Phường 6')

INSERT INTO ward
VALUES ('196', '15', N'Phường 7')

INSERT INTO ward
VALUES ('197', '15', N'Phường 8')

INSERT INTO ward
VALUES ('198', '15', N'Phường 9')

INSERT INTO ward
VALUES ('199', '15', N'Phường 10')

INSERT INTO ward
VALUES ('200', '15', N'Phường 11')

INSERT INTO ward
VALUES ('201', '15', N'Phường 12')

INSERT INTO ward
VALUES ('202', '15', N'Phường 13')

INSERT INTO ward
VALUES ('203', '15', N'Phường 14')

INSERT INTO ward
VALUES ('204', '15', N'Phường 15')

INSERT INTO ward
VALUES ('205', '16', N'Phường Hiệp Tân')

INSERT INTO ward
VALUES ('206', '16', N'Phường Hòa Thạnh')

INSERT INTO ward
VALUES ('207', '16', N'Phường Phú Thạnh')

INSERT INTO ward
VALUES ('208', '16', N'Phường Phú Thọ Hòa')

INSERT INTO ward
VALUES ('209', '16', N'Phường Phú Trung')

INSERT INTO ward
VALUES ('210', '16', N'Phường Sơn Kỳ')

INSERT INTO ward
VALUES ('211', '16', N'Phường Tân Quý')

INSERT INTO ward
VALUES ('212', '16', N'Phường Tân Sơn Nhì')

INSERT INTO ward
VALUES ('213', '16', N'Phường Tân Thành')

INSERT INTO ward
VALUES ('214', '16', N'Phường Tân Thới Hòa')

INSERT INTO ward
VALUES ('215', '16', N'Phường Tây Thạnh')

INSERT INTO ward
VALUES ('216', '17', N'Thị Trấn Tân Túc')

INSERT INTO ward
VALUES ('217', '17', N'Xã An Phú Tây')

INSERT INTO ward
VALUES ('218', '17', N'Xã Bình Chánh')

INSERT INTO ward
VALUES ('219', '17', N'Xã Bình Hưng')

INSERT INTO ward
VALUES ('220', '17', N'Xã Bình Lợi')

INSERT INTO ward
VALUES ('221', '17', N'Xã Đa Phước')

INSERT INTO ward
VALUES ('222', '17', N'Xã Hưng Long')

INSERT INTO ward
VALUES ('223', '17', N'Xã Lê Minh Xuân')

INSERT INTO ward
VALUES ('224', '17', N'Xã Phạm Văn Hai')

INSERT INTO ward
VALUES ('225', '17', N'Xã Phong Phú')

INSERT INTO ward
VALUES ('226', '17', N'Xã Quy Đức')

INSERT INTO ward
VALUES ('227', '17', N'Xã Tân Kiên')

INSERT INTO ward
VALUES ('228', '17', N'Xã Tân Nhựt')

INSERT INTO ward
VALUES ('229', '17', N'Xã Tân Quý Tây')

INSERT INTO ward
VALUES ('230', '17', N'Xã Vĩnh Lộc A')

INSERT INTO ward
VALUES ('231', '17', N'Xã Vĩnh Lộc B')

INSERT INTO ward
VALUES ('232', '18', N'Thị Trấn Cần Thạnh')

INSERT INTO ward
VALUES ('233', '18', N'Xã An Thới Đông')

INSERT INTO ward
VALUES ('234', '18', N'Xã Bình Khánh')

INSERT INTO ward
VALUES ('235', '18', N'Xã Long Hòa')

INSERT INTO ward
VALUES ('236', '18', N'Xã Lý Nhơn')

INSERT INTO ward
VALUES ('237', '18', N'Xã Tam Thôn Hiệp')

INSERT INTO ward
VALUES ('238', '18', N'Xã Thạnh An')

INSERT INTO ward
VALUES ('239', '19', N'Thị Trấn Củ Chi')

INSERT INTO ward
VALUES ('240', '19', N'Xã An Nhơn Tây')

INSERT INTO ward
VALUES ('241', '19', N'Xã An Phú')

INSERT INTO ward
VALUES ('242', '19', N'Xã Bình Mỹ')

INSERT INTO ward
VALUES ('243', '19', N'Xã Hòa Phú')

INSERT INTO ward
VALUES ('244', '19', N'Xã Nhuận Đức')

INSERT INTO ward
VALUES ('245', '19', N'Xã Phạm Văn Cội')

INSERT INTO ward
VALUES ('246', '19', N'Xã Phú Hòa Đông')

INSERT INTO ward
VALUES ('247', '19', N'Xã Phú Mỹ Hưng')

INSERT INTO ward
VALUES ('248', '19', N'Xã Phước Hiệp')

INSERT INTO ward
VALUES ('249', '19', N'Xã Phước Thạnh')

INSERT INTO ward
VALUES ('250', '19', N'Xã Phước Vĩnh An')

INSERT INTO ward
VALUES ('251', '19', N'Xã Tân An Hội')

INSERT INTO ward
VALUES ('252', '19', N'Xã Tân Phú Trung')

INSERT INTO ward
VALUES ('253', '19', N'Xã Tân Thạnh Đông')

INSERT INTO ward
VALUES ('265', '20', N'Xã Tân Thới Nhì')

INSERT INTO ward
VALUES ('266', '20', N'Xã Tân Xuân')

INSERT INTO ward
VALUES ('267', '20', N'Xã Thới Tam Thôn')

INSERT INTO ward
VALUES ('268', '20', N'Xã Trung Chánh')

INSERT INTO ward
VALUES ('269', '20', N'Xã Xuân Thới Đông')

INSERT INTO ward
VALUES ('270', '20', N'Xã Xuân Thới Sơn')

INSERT INTO ward
VALUES ('271', '20', N'Xã Xuân Thới Thượng')

INSERT INTO ward
VALUES ('272', '21', N'Thị Trấn Nhà Bè')

INSERT INTO ward
VALUES ('273', '21', N'Xã Hiệp Phước')

INSERT INTO ward
VALUES ('274', '21', N'Xã Long Thới')

INSERT INTO ward
VALUES ('275', '21', N'Xã Nhơn Đức')

INSERT INTO ward
VALUES ('276', '21', N'Xã Phú Xuân')

INSERT INTO ward
VALUES ('277', '21', N'Xã Phước Kiển')

INSERT INTO ward
VALUES ('278', '21', N'Xã Phước Lộc')

INSERT INTO ward
VALUES ('279', '22', N'Phường An Khánh')

INSERT INTO ward
VALUES ('280', '22', N'Phường An Lợi Đông')

INSERT INTO ward
VALUES ('281', '22', N'Phường An Phú')

INSERT INTO ward
VALUES ('282', '22', N'Phường Bình Chiểu')

INSERT INTO ward
VALUES ('283', '22', N'Phường Bình Thọ')

INSERT INTO ward
VALUES ('284', '22', N'Phường Bình Trưng Đông')

INSERT INTO ward
VALUES ('285', '22', N'Phường Bình Trưng Tây')

INSERT INTO ward
VALUES ('286', '22', N'Phường Cát Lái')

INSERT INTO ward
VALUES ('287', '22', N'Phường  Hiệp Bình Chánh')

INSERT INTO ward
VALUES ('288', '22', N'Phường Hiệp Bình Phước')

INSERT INTO ward
VALUES ('289', '22', N'Phường Hiệp Phú')

INSERT INTO ward
VALUES ('290', '22', N'Phường Linh Chiểu')

INSERT INTO ward
VALUES ('291', '22', N'Phường Linh Đông')

INSERT INTO ward
VALUES ('292', '22', N'Phường Linh Tây')

INSERT INTO ward
VALUES ('293', '22', N'Phường Linh Trung')

INSERT INTO ward
VALUES ('294', '22', N'Phường Linh Xuân')

INSERT INTO ward
VALUES ('295', '22', N'Phường Long Bình')

INSERT INTO ward
VALUES ('296', '22', N'Phường Long Phước')

INSERT INTO ward
VALUES ('297', '22', N'Phường Long Thạnh Mỹ')

INSERT INTO ward
VALUES ('298', '22', N'Phường Long Trường')

INSERT INTO ward
VALUES ('299', '22', N'Phường Phú Hữu')

INSERT INTO ward
VALUES ('300', '22', N'Phường Phước Bình')

INSERT INTO ward
VALUES ('301', '22', N'Phường Phước Long A')

INSERT INTO ward
VALUES ('302', '22', N'Phường Phước Long B')

INSERT INTO ward
VALUES ('303', '22', N'Phường Tam Bình')

INSERT INTO ward
VALUES ('304', '22', N'Phường Tam Phú')

INSERT INTO ward
VALUES ('305', '22', N'Phường Tăng Nhơn Phú A')

INSERT INTO ward
VALUES ('306', '22', N'Phường Tăng Nhơn Phú B')

INSERT INTO ward
VALUES ('307', '22', N'Phường Tân Phú')

INSERT INTO ward
VALUES ('308', '22', N'Phường Thảo Điền')

INSERT INTO ward
VALUES ('309', '22', N'Phường Thạnh Mỹ Lợi')

INSERT INTO ward
VALUES ('310', '22', N'Phường Thủ Thiêm')

INSERT INTO ward
VALUES ('311', '22', N'Phường Trường Thạnh')

INSERT INTO ward
VALUES ('312', '22', N'Phường Trường Thọ')
INSERT INTO ward
VALUES ('254', '19', N'Xã Tân Thạnh Tây')

INSERT INTO ward
VALUES ('255', '19', N'Xã Tân Thông Hội')

INSERT INTO ward
VALUES ('256', '19', N'Xã Thái Mỹ')

INSERT INTO ward
VALUES ('257', '19', N'Xã Trung An')

INSERT INTO ward
VALUES ('258', '19', N'Xã Trung Lập Hạ')

INSERT INTO ward
VALUES ('259', '19', N'Xã Trung Lập Thượng')

INSERT INTO ward
VALUES ('260', '20', N'Thị Trấn Hóc Môn')

INSERT INTO ward
VALUES ('261', '20', N'Xã Bà Điểm')

INSERT INTO ward
VALUES ('262', '20', N'Xã Đông Thạnh')

INSERT INTO ward
VALUES ('263', '20', N'Xã Nhị Bình')

INSERT INTO ward
VALUES ('264', '20', N'Xã Tân Hiệp')



INSERT INTO member
VALUES ('U01','AD','1','1', 'admin','123', N'Lê Quốc Khánh', '0359798103', N'29 Cô Giang', 'minh@gmail.com', '/WebsiteOrderStadium/images/user.jpg',0,1)

INSERT INTO member
VALUES ('U02','OW','15','2', 'owner', '124', N'Phạm Cao Hoàng Minh', '0359798104', N'30 Trần Quốc Thảo', 'minhpchse150910@fpt.edu.vn', '/WebsiteOrderStadium/images/user.jpg',0,1)

INSERT INTO member
VALUES ('U03','US','30','3', 'user','125', N'Nguyễn Minh Khôi', '0359798105', N'31 Khánh Hội', 'minhkhoi11.04nhmk@gmail.com', '/WebsiteOrderStadium/images/user.jpg',0,1)

INSERT INTO member
VALUES ('U05','US','26','3', 'hoanm','125', N'Nguyễn Minh Hòa', '0981684126', N'31 Hiền Lương', 'namph13072@gmail.com', '/WebsiteOrderStadium/images/user.jpg',1,1)

INSERT INTO member
VALUES ('U04','OW','191','15', 'hoangnam', '1', N'Phạm Hoàng Nam', '0981684123', N'86 Phổ Quang', 'namphse150924@fpt.edu.vn', '/WebsiteOrderStadium/images/user.jpg',0,1)

INSERT INTO member
VALUES ('U06','OW','39','4', 'hoanghuy', '126', N'Phạm Cao Hoàng Huy', '0981684129', N'98 Trần Bình Trọng', 'hoanghuy1111@gmail.com', '/WebsiteOrderStadium/images/user.jpg',0,1)

INSERT INTO member
VALUES ('U07','OW','65','6', 'haidang', '127', N'Hồ Hải Đăng', '0981684147', N'148 Phạm Hữu Lầu', 'haidang345@gmail.com', '/WebsiteOrderStadium/images/user.jpg',0,1)

INSERT INTO member
VALUES ('U08','OW','83','7', 'minhnhat', '128', N'Nguyễn Minh Nhật', '0981684189', N'550 Bà Hạt', 'minhnhat102@gmail.com', '/WebsiteOrderStadium/images/user.jpg',0,1)

INSERT INTO member
VALUES ('U09','OW','98','8', 'ducluong', '130', N'Đào Đức Lương', '0981684148', N'493 Sư Vạn Hạnh', 'duocluong28@gmail.com', '/WebsiteOrderStadium/images/user.jpg',0,1)

INSERT INTO member
VALUES ('U10','OW','113','9', 'trunghieu', '131', N'Đỗ Trung Hiếu', '0981684199', N'555 Bình Thới', 'trunghieu69@gmail.com', '/WebsiteOrderStadium/images/user.jpg',0,1)

INSERT INTO pitch
VALUES ('P01','6','1','U02', N'Sân bóng đá Hoa Lư',N'Số 2 Đinh Tiên Hoàn',5
,N'Sân bóng được xây dựng cỏ tự nhiên rất đẹp. Hạ tầng được đồng bộ, đèn chiếu sáng, lưới chắn bóng đều rất tốt. ',1
)

INSERT INTO pitch
VALUES ('P02','27','3','U04', N'Sân bóng CLB Khánh Hội',N'Đường số 48',3
,N'Sân bóng được khai thác một thời gian dài nên đã xuống cấp nhiều, nên được bảo dưỡng thường xuyên. Hệ thống đèn chiếu khá tốt, vẫn cung cấp đủ ảnh sáng cho các trận đấu tối. Chỗ để xe rộng rãi, có cho thuê bóng, thuê giày, nước uống.Dịch vụ tại sân rất tốt, chủ sân vui vẻ, thân thiện. Sân là điểm đến yêu thích của cộng đồng người yêu bóng đá tại đây.',1
)

INSERT INTO pitch
VALUES ('P03','135','11','U02', N'Sân bóng đá Mini cỏ nhân tạo Hồng Bảy',N'399/45 Bình Thành',4
,N'Nằm ở trung tâm quận Bình Tân, Sân bóng Hồng Bảy là địa điểm yêu thích của công đồng bóng đá phủi quanh khu vực, bên cạnh đó chất lượng mặt cỏ tốt, thái độ nhân viên và giá thuê đều được đánh giá cao.',1
)

INSERT INTO pitch
VALUES ('P04','133','11','U02', N'Sân bóng Thiện Nhân',N'10/12 Đường số 10',1
, N'Được đầu tư khai thác một thời gian dài nên mặt Sân bóng Thiện Nhân có dấu hiệu xuống cấp, mặt cỏ xước và gãy ngọn nhiều. Hệ thống đèn chiếu còn tối, nhiều bóng đèn bị hỏng. Sân cần được nâng cấp và cải thiện. Tuy nhiên với giá thuê sân rẻ và vị trí thuận lợi nên sân vẫn là địa điểm yêu thích của nhiều cầu thủ và người hâm mộ bóng đá trên địa bàn.',1
)

INSERT INTO pitch
VALUES ('P05','227','17','U04', N'Sân bóng CLB Hoàng Long',N'D6/26 Dương Đình Cúc',5
,N'Sân thường xuyên được bảo trì và nâng cấp nên chất lượng sân không khỏi bàn cãi. Chất lượng cỏ mềm, ma sát tốt, hệ thống thoát nước ở sân nhanh, hiện đại. ',1
)

INSERT INTO pitch
VALUES ('P06','171','13','U04', N'Sân bóng An Hội',N'256 Phan Huy Ích',5
,N'Mặc dù đã được khai thác đưa vào sử dụng khá lâu nhưng chất lượng sân vẫn rất tuyệt vời. Đặc biệt là tại sân dịch vụ cho thuê đồ thi đấu rất tiện ích, nhanh chóng khi mà các cầu thủ quên mang đồ tham gia đi theo.',1
)

INSERT INTO pitch
VALUES ('P07','168','13','U02', N'Sân bóng Quang Tuyến 7',N'59/1 Phạm Văn Chiêu',2
,N'Sân bóng Quang Tuyến 7 phù hợp với đội hình 5 người. Nơi đây được lựa chọn là nơi thường xuyên gặp mặt, giao lưu của anh em cầu thủ. Với hệ thống sân đầy tiện ích, công trình phụ trợ được xây dựng bài bản, cỏ nhân tạo còn mới và không trơn trượt. ',1
)

INSERT INTO pitch
VALUES ('P08','287','22','U02', N'Sân bóng đá Đông Phương',N'Đường số 47',4
, N'Sân bóng đá Đông Phương nằm trong khu liên hiệp thể thao Đông Phương. Đây là sân bóng hiện đại, được đầu tư bài bản và đồng bộ từng hạng mục. Do đó, sân bóng đá nhân tạo Đông Phương đã trở thành điểm đến yêu thích củangười chơi thể thao trên địa bàn phường Bình Trưng Đông và Quận 2 nói riêng.',1
)

INSERT INTO pitch
VALUES ('P09','47','4','U02', N'Sân bóng đá Hùng Vương',N'Số 2 Nguyễn Kim',5
,N'Sân bóng đá nhân tạo Hùng Vương sở hữu không gian mát mẻ, thoáng đã. Tuy nhiên, chất lượng mặt cỏ được đánh giá ở mức tạm được. Nhà vệ sinh khá sạch sẽ',1
)

INSERT INTO pitch
VALUES ('P10','39','4','U04', N'Sân bóng đá Lam Sơn',N'Số 1 Trần Bình Trọng',5
,N'Sân bóng cũng đầu tư hệ thống công trình phụ trợ, nhà vệ sinh sạch sẽ. Dịch vụ rất tốt do đó luôn full khách, phải đặt sân trước để giữ chỗ.',1
)

INSERT INTO pitch
VALUES ('P11','2','1','U06', N'Sân bóng cung văn hóa Lao Động',N'Số 55B Nguyễn Thị Minh Khai',4
,N'Sân đầu tư mặt cỏ chất lượng tốt, được chăm sóc và bảo dưỡng thường xuyên. Hệ thống đèn chiếu sáng hiện đại, tốt, đảm bảo cung cấp đủ ánh sáng cho các trận đấu vào buổi tối',1
)

INSERT INTO pitch
VALUES ('P12','25','3','U06', N'Sân bóng CLB Khánh Hội',N'Số 9 đường số 48',4
,N'Hệ thống đèn chiếu khá tốt, vẫn cung cấp đủ ảnh sáng cho các trận đấu tối. Chỗ để xe rộng rãi, có cho thuê bóng, thuê giày, nước uống.Dịch vụ tại sân rất tốt, chủ sân vui vẻ, thân thiện. Sân là điểm đến yêu thích của cộng đồng người yêu bóng đá tại đây.',1
)

INSERT INTO pitch
VALUES ('P13','47','4','U06', N'Sân bóng đá Hùng Vương',N'Số 2 Nguyễn Kim',4
,N'Sân bóng đá nhân tạo Hùng Vương sở hữu không gian mát mẻ, thoáng đã. Với vị trí trong khuôn viên ký túc xá Đại học Sài Gòn, sân bóng thu hút được đông đảo các bạn sinh viên và các cầu thủ trẻ trong khu vực.',1
)

INSERT INTO pitch
VALUES ('P14','59','5','U06', N'Sân bóng đá Vườn Lan',N'Số 21 đường số 34',4
,N'Sân bóng Vườn Lan được đầu tư khai tác bài bản với chất lượng cỏ rất tốt. Hạ tầng đông bộ từ  hệ thống chiếu sáng đến lưới chắn bóng hiện đại, chất lượng.',1
)

INSERT INTO pitch
VALUES ('P15','60','5','U07', N'Sân bóng đá Futsal Quận 6',N'Đường số 10',4
,N'sân thi đấu trong nhà có thể thi đấu 1 sân 7 người. Sân được đầu tư khai tác bài bản với chất lượng cỏ rất tốt, hệ thống chiếu sáng, lưới chắn bóng hiện đại.',1
)

INSERT INTO pitch
VALUES ('P16','69','6','U07', N'Sân bóng Trường Nguyễn Thị Thập',N'Số 411/3 Nguyễn Thị Thập',4
,N'Sân bóng Trường Nguyễn Thị Thập sở hữu hệ thống cơ sở vật chất hiện đại, với hệ thống chiếu sáng hiện đại, cung cấp nguồn ánh sáng chân thực nhất cho người chơi trên sân.',1
)

INSERT INTO pitch
VALUES ('P17','72','6','U07', N'Sân bóng Cầu Trắng',N'Số 32 Bùi Văn Ba',4
,N'Sân bóng Cầu Trắng  được đầu tư bài bản, với chất lượng mặt cỏ tốt, mềm mại, hệ thống đèn chiếu sáng hiện đại.',1
)

INSERT INTO pitch
VALUES ('P18','83','7','U07', N'Sân bóng mini Hội Ngộ',N'Số 18 Bến Bình Đông',3
,N'Sân bóng mini Hội Ngộ được khai thác trong thời gian dài nên chất lượng sân không còn tốt, cỏ có dấu hiệu gãy ngọn.',1
)

INSERT INTO pitch
VALUES ('P19','89','7','U08', N'Sân bóng Phú Định',N'Số 72/112 Phú Định',3
,N'Được đầu tư khai thác một thời gian dài nên mặt sân có dấu hiệu xuống cấp, mặt cỏ xước và gãy ngọn nhiều.',1
)

INSERT INTO pitch
VALUES ('P20','297','22','U08', N'Sân bóng Kiến Ngộ',N'Đường số 154 Hoàng Hữu Nam',5
,N'Sân mới được  đầu tư, khai thác năm 2018 nên chất lượng sân rất tốt, mặt cỏ mềm, không trơn trượt. Hệ thống chiếu sáng chất lượng, hiện đại, đảm bảo cung cấp đủ ánh sáng cho các trận đấu buổi tối.',1
)

INSERT INTO pitch
VALUES ('P21','297','22','U08', N'Sân bóng Song Phát',N'Đường số 13',5
,N'Sân bóng Song Phát được đầu tư với mặt cỏ đẹp, mềm mại, không trơn tượt. Hệ thống luới đèn, bảng hiệu tỷ số rất hiện đại. Hệ thống đèn chiếu sáng đường chạy, lưới chắn bóng đều đẹp và đồng bộ, cung cấp đủ ảnh sáng cho các đội chơi.',1
)

INSERT INTO pitch
VALUES ('P22','302','22','U08', N'Sân bóng đá Cầu Nam Lý',N'Số 609 Hẻm 445',5
,N'Với chất lượng mặt cỏ nhân tạo chuẩn FIFA cùng hệ thống chiếu sáng hiện đại, không gian thoáng mát, chủ sân dễ tính.',1
)

INSERT INTO pitch
VALUES ('P23','287','22','U09', N'Sân bóng đá Bình Lợi',N'Số 207/3B đường Kha Vạn Cân',5
,N'Sân bóng Bình Lợi được trang bị hệ thống chiếu sáng hiện đại, đảm bảo cung cấp đủ ánh sáng cho các trận đấu vào buổi tối. Mặt cỏ đạt tiêu chuẩn, bằng phẳng, thoát nước tốt, không bị trơn trượt.',1
)

INSERT INTO pitch
VALUES ('P24','287','22','U09', N'Sân bóng đá Toàn Thắng',N'Đường số 40',5
,N'Với chất lượng mặt cỏ nhân tạo chuẩn FIFA cùng hệ thống chiếu sáng hiện đại.',1
)

INSERT INTO pitch
VALUES ('P25','288','22','U09', N'Sân bóng đá Hồng Long',N'Số 11 Khu phố 4',5
,N'Có khu dịch vụ, căng tin, công trình phụ trợ, vệ sinh
Có bảo vệ an ninh đảm bảo an toàn
Có khu gửi xe máy, ô tô rộng rãi
Cho thuê bóng, thuê giày đá bóng, nước giải khát',1
)

INSERT INTO pitch
VALUES ('P26','282','22','U09', N'Sân bóng đá Bảo Châu',N'Số 29 Đường Bình Chiểu',5
,N'Sân bóng được đầu tư mới hoàn toàn với chất lượng cỏ rất tốt, hệ thống chiếu sáng, lưới chắn bóng hiện đại. Hệ thống thoát nước tốt, luôn đảm bảo sân đấu trong mọi điều kiện thời tiết. ',1
)

INSERT INTO pitch
VALUES ('P27','157','12','U10', N'Sân cỏ nhân tạo D3',N'Số 44 đường D3',5
,N'Mặt sân được sử dụng loại cỏ nhân tạo cao cấp theo tiêu chuẩn FIFA, giúp người chơi có cảm giác bóng tốt hơn, lớp cỏ mềm và cao su đệm',1
)

INSERT INTO pitch
VALUES ('P28','174','13','U10', N'Sân cỏ nhân tạo Thống Nhất',N'Số 33/3A Thống Nhất',5
,N'Mặt sân được sử dụng loại cỏ nhân tạo cao cấp theo tiêu chuẩn FIFA, giúp người chơi có cảm giác bóng tốt hơn, lớp cỏ mềm và cao su đệm',1
)

INSERT INTO pitch
VALUES ('P29','205','16','U10', N'Sân cỏ nhân tạo Tân Thăng',N'Số 161/3 Lũy Bán Bích',5
,N'Mặt sân được sử dụng loại cỏ nhân tạo cao cấp theo tiêu chuẩn FIFA, giúp người chơi có cảm giác bóng tốt hơn, lớp cỏ mềm và cao su đệm',1
)

INSERT INTO pitch
VALUES ('P30','184','14','U10', N'Sân cỏ nhân tạo Phú Nhuận',N'Số 3 Hoàng Minh Giám',5
,N'Mặt sân được sử dụng loại cỏ nhân tạo cao cấp theo tiêu chuẩn FIFA, giúp người chơi có cảm giác bóng tốt hơn, lớp cỏ mềm và cao su đệm',1
)


INSERT INTO children_pitch
VALUES ('C01','P01',N'Sân số 1','5', 200000,1)

INSERT INTO children_pitch
VALUES ('C02','P01',N'Sân số 2','7', 250000,1)

INSERT INTO children_pitch
VALUES ('C03','P02',N'Sân số 1','5', 180000,1)

INSERT INTO children_pitch
VALUES ('C04','P05',N'Sân cỏ 1','5', 150000,1)

INSERT INTO children_pitch
VALUES ('C05','P01',N'Sân số 3','5', 200000, 1)

INSERT INTO children_pitch
VALUES ('C06','P05',N'Sân cỏ 2','5', 200000, 1)

INSERT INTO children_pitch
VALUES ('C07','P05',N'Sân cỏ 3','5', 350000, 1)

INSERT INTO children_pitch
VALUES ('C08','P08',N'Sân A01','5', 220000, 1)

INSERT INTO children_pitch
VALUES ('C09','P08',N'Sân A02','5', 230000, 1)

INSERT INTO children_pitch
VALUES ('C10','P01',N'Sân Bị Xóa','5', 270000, 0)

INSERT INTO children_pitch
VALUES ('C11','P08',N'Sân A03','5', 240000, 1)

INSERT INTO children_pitch
VALUES ('C12','P02',N'Sân số 2','5', 190000, 1)

INSERT INTO children_pitch
VALUES ('C13','P02',N'Sân số 2','5', 200000, 1)

INSERT INTO children_pitch
VALUES ('C14','P03',N'Sân số 1','5', 250000, 1)

INSERT INTO children_pitch
VALUES ('C15','P03',N'Sân số 2','5', 270000, 1)

INSERT INTO children_pitch
VALUES ('C16','P03',N'Sân số 3','7', 300000, 1)

INSERT INTO children_pitch
VALUES ('C17','P04',N'Sân số 1','5', 180000, 1)

INSERT INTO children_pitch
VALUES ('C18','P04',N'Sân số 2','5', 200000, 1)

INSERT INTO children_pitch
VALUES ('C19','P04',N'Sân số 3','7', 220000, 1)

INSERT INTO children_pitch
VALUES ('C20','P06',N'Sân số 1','5', 170000, 1)

INSERT INTO children_pitch
VALUES ('C21','P06',N'Sân số 2','5', 180000, 1)

INSERT INTO children_pitch
VALUES ('C22','P06',N'Sân số 3','7', 200000, 1)

INSERT INTO children_pitch
VALUES ('C23','P07',N'Sân số 1','5', 160000, 1)

INSERT INTO children_pitch
VALUES ('C24','P07',N'Sân số 2','5', 180000, 1)

INSERT INTO children_pitch
VALUES ('C25','P07',N'Sân số 3','7', 190000, 1)

INSERT INTO children_pitch
VALUES ('C26','P09',N'Sân số 1','5', 150000, 1)

INSERT INTO children_pitch
VALUES ('C27','P09',N'Sân số 2','5', 180000, 1)

INSERT INTO children_pitch
VALUES ('C28','P09',N'Sân số 3','7', 190000, 1)

INSERT INTO children_pitch
VALUES ('C29','P10',N'Sân số 1','5', 130000, 1)

INSERT INTO children_pitch
VALUES ('C30','P10',N'Sân số 2','5', 140000, 1)

INSERT INTO children_pitch
VALUES ('C31','P10',N'Sân số 3','7', 150000, 1)

INSERT INTO children_pitch
VALUES ('C32','P11',N'Sân số 1','5', 160000, 1)

INSERT INTO children_pitch
VALUES ('C33','P11',N'Sân số 2','5', 170000, 1)

INSERT INTO children_pitch
VALUES ('C34','P11',N'Sân số 3','7', 180000, 1)

INSERT INTO children_pitch
VALUES ('C35','P12',N'Sân số 1','5', 110000, 1)

INSERT INTO children_pitch
VALUES ('C36','P12',N'Sân số 2','5', 120000, 1)

INSERT INTO children_pitch
VALUES ('C37','P12',N'Sân số 3','7', 130000, 1)

INSERT INTO children_pitch
VALUES ('C38','P13',N'Sân số 1','5', 200000, 1)

INSERT INTO children_pitch
VALUES ('C39','P13',N'Sân số 2','7', 220000, 1)

INSERT INTO children_pitch
VALUES ('C40','P13',N'Sân số 3','5', 230000, 1)

INSERT INTO children_pitch
VALUES ('C41','P14',N'Sân số 1','7', 250000, 1)

INSERT INTO children_pitch
VALUES ('C42','P14',N'Sân số 2','5', 270000, 1)

INSERT INTO children_pitch
VALUES ('C43','P14',N'Sân số 3','7', 280000, 1)

INSERT INTO children_pitch
VALUES ('C44','P15',N'Sân số 1','5', 290000, 1)

INSERT INTO children_pitch
VALUES ('C45','P15',N'Sân số 2','7', 300000, 1)

INSERT INTO children_pitch
VALUES ('C46','P15',N'Sân số 3','7', 320000, 1)

INSERT INTO children_pitch
VALUES ('C47','P16',N'Sân số 1','5', 280000, 1)

INSERT INTO children_pitch
VALUES ('C48','P16',N'Sân số 2','7', 290000, 1)

INSERT INTO children_pitch
VALUES ('C49','P16',N'Sân số 3','7', 300000, 1)

INSERT INTO children_pitch
VALUES ('C50','P17',N'Sân số 1','5', 300000, 1)

INSERT INTO children_pitch
VALUES ('C51','P17',N'Sân số 2','7', 320000, 1)

INSERT INTO children_pitch
VALUES ('C52','P17',N'Sân số 3','5', 330000, 1)

INSERT INTO children_pitch
VALUES ('C53','P18',N'Sân số 1','7', 220000, 1)

INSERT INTO children_pitch
VALUES ('C54','P18',N'Sân số 2','5', 230000, 1)

INSERT INTO children_pitch
VALUES ('C55','P18',N'Sân số 3','7', 240000, 1)

INSERT INTO children_pitch
VALUES ('C56','P19',N'Sân số 1','5', 230000, 1)

INSERT INTO children_pitch
VALUES ('C57','P19',N'Sân số 2','7', 240000, 1)

INSERT INTO children_pitch
VALUES ('C58','P19',N'Sân số 3','5', 250000, 1)

INSERT INTO children_pitch
VALUES ('C59','P20',N'Sân số 1','5', 210000, 1)

INSERT INTO children_pitch
VALUES ('C60','P20',N'Sân số 2','5', 220000, 1)

INSERT INTO children_pitch
VALUES ('C61','P20',N'Sân số 3','7', 230000, 1)

INSERT INTO children_pitch
VALUES ('C62','P21',N'Sân số 1','7', 230000, 1)

INSERT INTO children_pitch
VALUES ('C63','P21',N'Sân số 2','5', 240000, 1)

INSERT INTO children_pitch
VALUES ('C64','P21',N'Sân số 3','7', 250000, 1)

INSERT INTO children_pitch
VALUES ('C65','P22',N'Sân số 1','5', 180000, 1)

INSERT INTO children_pitch
VALUES ('C66','P22',N'Sân số 2','7', 190000, 1)

INSERT INTO children_pitch
VALUES ('C67','P22',N'Sân số 3','5', 200000, 1)

INSERT INTO children_pitch
VALUES ('C68','P23',N'Sân số 1','5', 140000, 1)

INSERT INTO children_pitch
VALUES ('C69','P23',N'Sân số 2','7', 150000, 1)

INSERT INTO children_pitch
VALUES ('C70','P23',N'Sân số 3','7', 160000, 1)

INSERT INTO children_pitch
VALUES ('C71','P24',N'Sân số 1','5', 180000, 1)

INSERT INTO children_pitch
VALUES ('C72','P24',N'Sân số 2','7', 190000, 1)

INSERT INTO children_pitch
VALUES ('C73','P24',N'Sân số 3','5', 200000, 1)

INSERT INTO children_pitch
VALUES ('C74','P25',N'Sân số 1','5', 140000, 1)

INSERT INTO children_pitch
VALUES ('C75','P25',N'Sân số 2','5', 150000, 1)

INSERT INTO children_pitch
VALUES ('C76','P25',N'Sân số 3','7', 160000, 1)

INSERT INTO children_pitch
VALUES ('C77','P26',N'Sân số 1','5', 190000, 1)

INSERT INTO children_pitch
VALUES ('C78','P26',N'Sân số 2','7', 200000, 1)

INSERT INTO children_pitch
VALUES ('C79','P26',N'Sân số 3','5', 210000, 1)

INSERT INTO children_pitch
VALUES ('C80','P27',N'Sân số 1','5', 320000, 1)

INSERT INTO children_pitch
VALUES ('C81','P27',N'Sân số 2','7', 340000, 1)

INSERT INTO children_pitch
VALUES ('C82','P27',N'Sân số 3','7', 350000, 1)

INSERT INTO children_pitch
VALUES ('C83','P28',N'Sân số 1','5', 350000, 1)

INSERT INTO children_pitch
VALUES ('C84','P28',N'Sân số 2','5', 370000, 1)

INSERT INTO children_pitch
VALUES ('C85','P28',N'Sân số 3','7', 380000, 1)

INSERT INTO children_pitch
VALUES ('C86','P29',N'Sân số 1','5', 390000, 1)

INSERT INTO children_pitch
VALUES ('C87','P29',N'Sân số 2','7', 400000, 1)

INSERT INTO children_pitch
VALUES ('C88','P29',N'Sân số 3','5', 410000, 1)

INSERT INTO children_pitch
VALUES ('C89','P30',N'Sân số 1','5', 420000, 1)

INSERT INTO children_pitch
VALUES ('C90','P30',N'Sân số 2','7', 430000, 1)

INSERT INTO children_pitch
VALUES ('C91','P30',N'Sân số 3','5', 450000, 1)

INSERT INTO time
VALUES ('T01','05:00:00','06:00:00')

INSERT INTO time
VALUES ('T02','06:00:00','07:00:00')

INSERT INTO time
VALUES ('T03','07:00:00','08:00:00')

INSERT INTO time
VALUES ('T04','08:00:00','09:00:00')

INSERT INTO time
VALUES ('T05','09:00:00','10:00:00')

INSERT INTO time
VALUES ('T06','10:00:00','11:00:00')

INSERT INTO time
VALUES ('T07','11:00:00','12:00:00')

INSERT INTO time
VALUES ('T08','12:00:00','13:00:00')

INSERT INTO time
VALUES ('T09','13:00:00','14:00:00')

INSERT INTO time
VALUES ('T10','14:00:00','15:00:00')

INSERT INTO time
VALUES ('T11','15:00:00','16:00:00')

INSERT INTO time
VALUES ('T12','16:00:00','17:00:00')

INSERT INTO time
VALUES ('T13','17:00:00','18:00:00')

INSERT INTO time
VALUES ('T14','18:00:00','19:00:00')

INSERT INTO time
VALUES ('T15','19:00:00','20:00:00')

INSERT INTO time
VALUES ('T16','20:00:00','21:00:00')

INSERT INTO time
VALUES ('T17','21:00:00','22:00:00')

INSERT INTO time
VALUES ('T18','22:00:00','23:00:00')

INSERT INTO time
VALUES ('T19','23:00:00','23:59:00')

INSERT INTO booking
VALUES ('B01','C01','U03','2022/08/01','T17',1,'')

INSERT INTO booking
VALUES ('B03','C01','U03','2022/06/10','T02',1,'')

INSERT INTO booking
VALUES ('B02','C02','U03','2022/06/10','T19',1,'')

INSERT INTO booking
VALUES ('B05','C02','U03','2022/06/10','T08',0,N'Thích thì hủy')

INSERT INTO booking
VALUES ('B04','C01','U03','2022/06/11','T11',0,N'Kẹt giờ bay')

INSERT INTO comment
VALUES ('M01','P01','U03','2022/06/01 14:24:25',N'Sân bóng chất lượng',5)

INSERT INTO comment
VALUES ('M02','P01','U03','2022/06/02 8:32:16',N'Mặt sân rất tốt',4)

INSERT INTO comment
VALUES ('M03','P05','U03','2022/06/01 18:22:16',N'Nhìn mặt chủ sân thấy ghét',1)

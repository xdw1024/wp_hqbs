/*
Navicat PGSQL Data Transfer

Source Server         : 阿里云_120
Source Server Version : 90218
Source Host           : 120.25.168.113:5432
Source Database       : hqbs
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90218
File Encoding         : 65001

Date: 2017-08-14 16:46:46
*/


-- ----------------------------
-- Sequence structure for bgxf_app_menu_type_app_menu_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_app_menu_type_app_menu_type_id_seq";
CREATE SEQUENCE "public"."bgxf_app_menu_type_app_menu_type_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."bgxf_app_menu_type_app_menu_type_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for bgxf_carousel_img_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_carousel_img_id_seq";
CREATE SEQUENCE "public"."bgxf_carousel_img_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 80
 CACHE 1;
SELECT setval('"public"."bgxf_carousel_img_id_seq"', 80, true);

-- ----------------------------
-- Sequence structure for bgxf_cashier_setting_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_cashier_setting_id_seq";
CREATE SEQUENCE "public"."bgxf_cashier_setting_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bgxf_login_log_login_log_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_login_log_login_log_id_seq";
CREATE SEQUENCE "public"."bgxf_login_log_login_log_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bgxf_manage_account_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_manage_account_id_seq";
CREATE SEQUENCE "public"."bgxf_manage_account_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 83
 CACHE 1;
SELECT setval('"public"."bgxf_manage_account_id_seq"', 83, true);

-- ----------------------------
-- Sequence structure for bgxf_party_authorized_orgid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_party_authorized_orgid_seq";
CREATE SEQUENCE "public"."bgxf_party_authorized_orgid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 210
 CACHE 1;
SELECT setval('"public"."bgxf_party_authorized_orgid_seq"', 210, true);

-- ----------------------------
-- Sequence structure for bgxf_party_authorizedid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_party_authorizedid_seq";
CREATE SEQUENCE "public"."bgxf_party_authorizedid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bgxf_party_member_approve_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_party_member_approve_id_seq";
CREATE SEQUENCE "public"."bgxf_party_member_approve_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;
SELECT setval('"public"."bgxf_party_member_approve_id_seq"', 5, true);

-- ----------------------------
-- Sequence structure for bgxf_party_member_authorizedid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_party_member_authorizedid_seq";
CREATE SEQUENCE "public"."bgxf_party_member_authorizedid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bgxf_party_member_party_member_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_party_member_party_member_id_seq";
CREATE SEQUENCE "public"."bgxf_party_member_party_member_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 111
 CACHE 1;
SELECT setval('"public"."bgxf_party_member_party_member_id_seq"', 111, true);

-- ----------------------------
-- Sequence structure for bgxf_party_member_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_party_member_role_id_seq";
CREATE SEQUENCE "public"."bgxf_party_member_role_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 152
 CACHE 1;
SELECT setval('"public"."bgxf_party_member_role_id_seq"', 152, true);

-- ----------------------------
-- Sequence structure for bgxf_party_member_role_privilege_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_party_member_role_privilege_id_seq";
CREATE SEQUENCE "public"."bgxf_party_member_role_privilege_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bgxf_party_org_party_org_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_party_org_party_org_id_seq";
CREATE SEQUENCE "public"."bgxf_party_org_party_org_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 754
 CACHE 1;
SELECT setval('"public"."bgxf_party_org_party_org_id_seq"', 754, true);

-- ----------------------------
-- Sequence structure for bgxf_party_org_type_party_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_party_org_type_party_type_id_seq";
CREATE SEQUENCE "public"."bgxf_party_org_type_party_type_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 4
 CACHE 1;
SELECT setval('"public"."bgxf_party_org_type_party_type_id_seq"', 4, true);

-- ----------------------------
-- Sequence structure for bgxf_party_role_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_party_role_role_id_seq";
CREATE SEQUENCE "public"."bgxf_party_role_role_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 41
 CACHE 1;
SELECT setval('"public"."bgxf_party_role_role_id_seq"', 41, true);

-- ----------------------------
-- Sequence structure for bgxf_party_role_type_party_role_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_party_role_type_party_role_type_id_seq";
CREATE SEQUENCE "public"."bgxf_party_role_type_party_role_type_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 4
 CACHE 1;
SELECT setval('"public"."bgxf_party_role_type_party_role_type_id_seq"', 4, true);

-- ----------------------------
-- Sequence structure for bgxf_privilege_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_privilege_menu_id_seq";
CREATE SEQUENCE "public"."bgxf_privilege_menu_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bgxf_privilege_type_privilege_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_privilege_type_privilege_type_id_seq";
CREATE SEQUENCE "public"."bgxf_privilege_type_privilege_type_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bgxf_resource_library_resource_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_resource_library_resource_id_seq";
CREATE SEQUENCE "public"."bgxf_resource_library_resource_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 697
 CACHE 1;
SELECT setval('"public"."bgxf_resource_library_resource_id_seq"', 697, true);

-- ----------------------------
-- Sequence structure for bgxf_role_admin_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_role_admin_menu_id_seq";
CREATE SEQUENCE "public"."bgxf_role_admin_menu_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bgxf_role_prototype_role_prototype_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_role_prototype_role_prototype_id_seq";
CREATE SEQUENCE "public"."bgxf_role_prototype_role_prototype_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bgxf_sys_message_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_sys_message_id_seq";
CREATE SEQUENCE "public"."bgxf_sys_message_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 42
 CACHE 1;
SELECT setval('"public"."bgxf_sys_message_id_seq"', 42, true);

-- ----------------------------
-- Sequence structure for bgxf_sys_message_read_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_sys_message_read_id_seq";
CREATE SEQUENCE "public"."bgxf_sys_message_read_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 33
 CACHE 1;
SELECT setval('"public"."bgxf_sys_message_read_id_seq"', 33, true);

-- ----------------------------
-- Sequence structure for bgxf_sys_message_view_org_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_sys_message_view_org_id_seq";
CREATE SEQUENCE "public"."bgxf_sys_message_view_org_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 12944
 CACHE 1;
SELECT setval('"public"."bgxf_sys_message_view_org_id_seq"', 12944, true);

-- ----------------------------
-- Sequence structure for bgxf_sys_privilege_privilege_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_sys_privilege_privilege_id_seq";
CREATE SEQUENCE "public"."bgxf_sys_privilege_privilege_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bgxf_sys_role_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_sys_role_menu_id_seq";
CREATE SEQUENCE "public"."bgxf_sys_role_menu_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 19379
 CACHE 1;
SELECT setval('"public"."bgxf_sys_role_menu_id_seq"', 19379, true);

-- ----------------------------
-- Sequence structure for bgxf_sys_role_sys_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_sys_role_sys_role_id_seq";
CREATE SEQUENCE "public"."bgxf_sys_role_sys_role_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 53
 CACHE 1;
SELECT setval('"public"."bgxf_sys_role_sys_role_id_seq"', 53, true);

-- ----------------------------
-- Sequence structure for bgxf_sys_user_role_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_sys_user_role_id_seq";
CREATE SEQUENCE "public"."bgxf_sys_user_role_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 72
 CACHE 1;
SELECT setval('"public"."bgxf_sys_user_role_id_seq"', 72, true);

-- ----------------------------
-- Sequence structure for bgxf_system_setting_setting_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bgxf_system_setting_setting_id_seq";
CREATE SEQUENCE "public"."bgxf_system_setting_setting_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for hq_address_address_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_address_address_id_seq";
CREATE SEQUENCE "public"."hq_address_address_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."hq_address_address_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for hq_admin_menu_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_admin_menu_menu_id_seq";
CREATE SEQUENCE "public"."hq_admin_menu_menu_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 268
 CACHE 1;
SELECT setval('"public"."hq_admin_menu_menu_id_seq"', 268, true);

-- ----------------------------
-- Sequence structure for hq_app_menu_app_menu_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_app_menu_app_menu_id_seq";
CREATE SEQUENCE "public"."hq_app_menu_app_menu_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 51
 CACHE 1;
SELECT setval('"public"."hq_app_menu_app_menu_id_seq"', 51, true);

-- ----------------------------
-- Sequence structure for hq_bg_administrative_case_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_administrative_case_id_seq";
CREATE SEQUENCE "public"."hq_bg_administrative_case_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 17
 CACHE 1;
COMMENT ON SEQUENCE "public"."hq_bg_administrative_case_id_seq" IS 
'边管--行政案件自增';
SELECT setval('"public"."hq_bg_administrative_case_id_seq"', 17, true);

-- ----------------------------
-- Sequence structure for hq_bg_case_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_case_type_id_seq";
CREATE SEQUENCE "public"."hq_bg_case_type_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
COMMENT ON SEQUENCE "public"."hq_bg_case_type_id_seq" IS 
'边管--案例类型';
SELECT setval('"public"."hq_bg_case_type_id_seq"', 3, true);

-- ----------------------------
-- Sequence structure for hq_bg_collection_situation_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_collection_situation_id_seq";
CREATE SEQUENCE "public"."hq_bg_collection_situation_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 14
 CACHE 1;
COMMENT ON SEQUENCE "public"."hq_bg_collection_situation_id_seq" IS 
'边管--收缴情况';
SELECT setval('"public"."hq_bg_collection_situation_id_seq"', 14, true);

-- ----------------------------
-- Sequence structure for hq_bg_combat_situation_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_combat_situation_id_seq";
CREATE SEQUENCE "public"."hq_bg_combat_situation_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 12
 CACHE 1;
COMMENT ON SEQUENCE "public"."hq_bg_combat_situation_id_seq" IS 
'边管--打击处理情况';
SELECT setval('"public"."hq_bg_combat_situation_id_seq"', 12, true);

-- ----------------------------
-- Sequence structure for hq_bg_criminal_case_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_criminal_case_id_seq";
CREATE SEQUENCE "public"."hq_bg_criminal_case_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 61
 CACHE 1;
COMMENT ON SEQUENCE "public"."hq_bg_criminal_case_id_seq" IS 
'边管--刑事案件';
SELECT setval('"public"."hq_bg_criminal_case_id_seq"', 61, true);

-- ----------------------------
-- Sequence structure for hq_bg_illegal_immigration_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_illegal_immigration_id_seq";
CREATE SEQUENCE "public"."hq_bg_illegal_immigration_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 33
 CACHE 1;
COMMENT ON SEQUENCE "public"."hq_bg_illegal_immigration_id_seq" IS 
'边管--非法入境';
SELECT setval('"public"."hq_bg_illegal_immigration_id_seq"', 33, true);

-- ----------------------------
-- Sequence structure for hq_bg_illegal_immigration_persons_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_illegal_immigration_persons_id_seq";
CREATE SEQUENCE "public"."hq_bg_illegal_immigration_persons_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 46
 CACHE 1;
COMMENT ON SEQUENCE "public"."hq_bg_illegal_immigration_persons_id_seq" IS 
'边管--非法入境人员';
SELECT setval('"public"."hq_bg_illegal_immigration_persons_id_seq"', 46, true);

-- ----------------------------
-- Sequence structure for hq_bg_illegal_immigration_purpose_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_illegal_immigration_purpose_id_seq";
CREATE SEQUENCE "public"."hq_bg_illegal_immigration_purpose_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 8
 CACHE 1;
COMMENT ON SEQUENCE "public"."hq_bg_illegal_immigration_purpose_id_seq" IS 
'边管--非法入境_目的';
SELECT setval('"public"."hq_bg_illegal_immigration_purpose_id_seq"', 8, true);

-- ----------------------------
-- Sequence structure for hq_bg_illegal_immigration_seized_way_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_illegal_immigration_seized_way_id_seq";
CREATE SEQUENCE "public"."hq_bg_illegal_immigration_seized_way_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 7
 CACHE 1;
SELECT setval('"public"."hq_bg_illegal_immigration_seized_way_id_seq"', 7, true);

-- ----------------------------
-- Sequence structure for hq_bg_illegal_immigration_sourse_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_illegal_immigration_sourse_id_seq";
CREATE SEQUENCE "public"."hq_bg_illegal_immigration_sourse_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 4
 CACHE 1;
COMMENT ON SEQUENCE "public"."hq_bg_illegal_immigration_sourse_id_seq" IS 
'边管--非法入境_来源地';
SELECT setval('"public"."hq_bg_illegal_immigration_sourse_id_seq"', 4, true);

-- ----------------------------
-- Sequence structure for hq_bg_illegal_immigration_timeslot_timeslot_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_illegal_immigration_timeslot_timeslot_id_seq";
CREATE SEQUENCE "public"."hq_bg_illegal_immigration_timeslot_timeslot_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for hq_bg_illegal_immigration_wherego_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_illegal_immigration_wherego_id_seq";
CREATE SEQUENCE "public"."hq_bg_illegal_immigration_wherego_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 7
 CACHE 1;
SELECT setval('"public"."hq_bg_illegal_immigration_wherego_id_seq"', 7, true);

-- ----------------------------
-- Sequence structure for hq_bg_process_type_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_process_type_id_seq";
CREATE SEQUENCE "public"."hq_bg_process_type_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 12
 CACHE 1;
COMMENT ON SEQUENCE "public"."hq_bg_process_type_id_seq" IS 
'边管--处理方式';
SELECT setval('"public"."hq_bg_process_type_id_seq"', 12, true);

-- ----------------------------
-- Sequence structure for hq_bg_suppress_person_person_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_suppress_person_person_id_seq";
CREATE SEQUENCE "public"."hq_bg_suppress_person_person_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 18
 CACHE 1;
SELECT setval('"public"."hq_bg_suppress_person_person_id_seq"', 18, true);

-- ----------------------------
-- Sequence structure for hq_bg_suppress_smuggling_suppress_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_suppress_smuggling_suppress_id_seq";
CREATE SEQUENCE "public"."hq_bg_suppress_smuggling_suppress_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 52
 CACHE 1;
SELECT setval('"public"."hq_bg_suppress_smuggling_suppress_id_seq"', 52, true);

-- ----------------------------
-- Sequence structure for hq_bg_suppress_vehicle_vehicle_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_bg_suppress_vehicle_vehicle_id_seq";
CREATE SEQUENCE "public"."hq_bg_suppress_vehicle_vehicle_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 10
 CACHE 1;
SELECT setval('"public"."hq_bg_suppress_vehicle_vehicle_id_seq"', 10, true);

-- ----------------------------
-- Sequence structure for hq_month_month_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."hq_month_month_id_seq";
CREATE SEQUENCE "public"."hq_month_month_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for user_info_dataid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_info_dataid_seq";
CREATE SEQUENCE "public"."user_info_dataid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for user_info_fieldid_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_info_fieldid_seq";
CREATE SEQUENCE "public"."user_info_fieldid_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for bgxf_app_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."bgxf_app_menu";
CREATE TABLE "public"."bgxf_app_menu" (
"app_menu_id" int4 DEFAULT nextval('hq_app_menu_app_menu_id_seq'::regclass) NOT NULL,
"level" int4 NOT NULL,
"lft" int4 NOT NULL,
"rgt" int4 NOT NULL,
"menu_name" varchar(45) COLLATE "default" NOT NULL,
"parent_menu_id" int4,
"remark" int4,
"app_menu_type_id" int4 DEFAULT 1 NOT NULL,
"content" text COLLATE "default",
"icon_id" int4,
"sort_num" int4,
"status" int2 DEFAULT 1 NOT NULL,
"read_integral" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."bgxf_app_menu" IS 'app菜单表';
COMMENT ON COLUMN "public"."bgxf_app_menu"."app_menu_id" IS 'app栏目ID';
COMMENT ON COLUMN "public"."bgxf_app_menu"."menu_name" IS '栏目名称';
COMMENT ON COLUMN "public"."bgxf_app_menu"."parent_menu_id" IS '父栏目ID';
COMMENT ON COLUMN "public"."bgxf_app_menu"."remark" IS '备注';
COMMENT ON COLUMN "public"."bgxf_app_menu"."app_menu_type_id" IS '栏目类型';
COMMENT ON COLUMN "public"."bgxf_app_menu"."content" IS '为app外部的栏目预留字段';
COMMENT ON COLUMN "public"."bgxf_app_menu"."icon_id" IS '图标';
COMMENT ON COLUMN "public"."bgxf_app_menu"."sort_num" IS '排序';
COMMENT ON COLUMN "public"."bgxf_app_menu"."status" IS '1启用，0禁用隐藏';
COMMENT ON COLUMN "public"."bgxf_app_menu"."read_integral" IS '默认阅读积分';

-- ----------------------------
-- Records of bgxf_app_menu
-- ----------------------------
INSERT INTO "public"."bgxf_app_menu" VALUES ('13', '1', '1', '44', 'root', '-1', null, '1', null, null, '1', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('19', '2', '42', '43', '党建动态', '13', null, '1', '', '513', '106', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('20', '2', '32', '41', '农特电商', '13', null, '2', '', '539', '70', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('21', '2', '26', '31', '农家课堂', '13', null, '2', '', '540', '50', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('22', '2', '14', '25', '扶贫攻坚', '13', null, '2', '', '695', '80', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('27', '2', '2', '13', '两学一做', '13', null, '2', '', '537', '90', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('30', '3', '11', '12', '学党章党规', '27', null, '1', '', null, '99', '1', '6');
INSERT INTO "public"."bgxf_app_menu" VALUES ('31', '3', '9', '10', '学系列讲话', '27', null, '1', null, null, '98', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('32', '3', '7', '8', '做合格党员', '27', null, '1', null, null, '97', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('33', '3', '5', '6', '重要评论', '27', null, '1', null, null, '96', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('34', '3', '3', '4', '榜样力量', '27', null, '1', null, null, '95', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('35', '3', '21', '22', '第一书记风采', '22', null, '1', null, null, '89', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('36', '3', '19', '20', '扶贫要闻', '22', null, '1', null, null, '88', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('37', '3', '17', '18', '扶贫政策', '22', null, '1', '', null, '150', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('38', '3', '15', '16', '脱贫攻坚', '22', null, '1', null, '561', '86', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('39', '3', '39', '40', '特产网购', '20', null, '1', '', null, '79', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('40', '3', '37', '38', '农家饭票', '20', null, '1', null, null, '78', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('41', '3', '35', '36', '电商ABC', '20', null, '1', null, null, '77', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('42', '3', '33', '34', '电商大讲堂', '20', null, '1', null, null, '76', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('43', '3', '29', '30', '三农资讯', '21', null, '1', null, null, '69', '1', null);
INSERT INTO "public"."bgxf_app_menu" VALUES ('44', '3', '27', '28', '实用技术', '21', null, '1', null, null, '68', '1', null);

-- ----------------------------
-- Table structure for bgxf_app_menu_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."bgxf_app_menu_type";
CREATE TABLE "public"."bgxf_app_menu_type" (
"app_menu_type_id" int4 DEFAULT nextval('bgxf_app_menu_type_app_menu_type_id_seq'::regclass) NOT NULL,
"app_menu_type_name" varchar(60) COLLATE "default" NOT NULL,
"remark" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."bgxf_app_menu_type" IS 'app栏目类型';
COMMENT ON COLUMN "public"."bgxf_app_menu_type"."app_menu_type_id" IS '栏目类型ID';
COMMENT ON COLUMN "public"."bgxf_app_menu_type"."app_menu_type_name" IS '栏目类型名称';
COMMENT ON COLUMN "public"."bgxf_app_menu_type"."remark" IS '备注';

-- ----------------------------
-- Records of bgxf_app_menu_type
-- ----------------------------
INSERT INTO "public"."bgxf_app_menu_type" VALUES ('1', '图文内容', null);
INSERT INTO "public"."bgxf_app_menu_type" VALUES ('2', '二级栏目', null);
INSERT INTO "public"."bgxf_app_menu_type" VALUES ('4', '外部链接', null);

-- ----------------------------
-- Table structure for bgxf_sys_message
-- ----------------------------
DROP TABLE IF EXISTS "public"."bgxf_sys_message";
CREATE TABLE "public"."bgxf_sys_message" (
"id" int8 DEFAULT nextval('bgxf_sys_message_id_seq'::regclass) NOT NULL,
"content" text COLLATE "default" NOT NULL,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"status" int2 DEFAULT 1 NOT NULL,
"end_time" timestamp(6),
"maccount_id" int4,
"send_name" varchar(100) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."bgxf_sys_message" IS '系统消息表';
COMMENT ON COLUMN "public"."bgxf_sys_message"."content" IS '消息内容';
COMMENT ON COLUMN "public"."bgxf_sys_message"."status" IS '状态（0、不显示）';
COMMENT ON COLUMN "public"."bgxf_sys_message"."end_time" IS '消息结束显示时间';
COMMENT ON COLUMN "public"."bgxf_sys_message"."send_name" IS '发送人名字';

-- ----------------------------
-- Records of bgxf_sys_message
-- ----------------------------
INSERT INTO "public"."bgxf_sys_message" VALUES ('39', '<p>欢迎使用八桂先锋app</p>
', '2017-05-02 22:26:55', '1', '2017-05-05 00:00:00', null, 'qycbgly');
INSERT INTO "public"."bgxf_sys_message" VALUES ('40', '<p>系统升级，“八桂先锋”智慧党建手机APP将于2017年5月2日发布新版本！‍</p>
', '2017-05-02 22:39:30', '1', '2017-05-05 00:00:00', null, 'qycbgly');
INSERT INTO "public"."bgxf_sys_message" VALUES ('41', '<p>八桂先锋APP测试消息图片上传！</p>

<p><img alt="" src="http://222.217.61.85//upload/20170502/7b6a826c0dce461481a993c67580b106.jpg" style="height:385px; width:558px" /></p>
', '2017-05-02 22:43:28', '1', '2017-05-06 00:00:00', null, 'qycbgly');
INSERT INTO "public"."bgxf_sys_message" VALUES ('42', '<p>sadsasadsasdadsasadsasadsasdadsasadsasadsasdadsasadsasadsasdadsa</p>
', '2017-05-05 16:24:52', '1', '2017-05-30 16:24:43', '12', '超级管理员');

-- ----------------------------
-- Table structure for bgxf_sys_message_read
-- ----------------------------
DROP TABLE IF EXISTS "public"."bgxf_sys_message_read";
CREATE TABLE "public"."bgxf_sys_message_read" (
"id" int4 DEFAULT nextval('bgxf_sys_message_read_id_seq'::regclass) NOT NULL,
"party_member_id" int4 NOT NULL,
"message_id" int8 NOT NULL,
"status" int2 DEFAULT 1 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."bgxf_sys_message_read" IS '系统消息已读记录';
COMMENT ON COLUMN "public"."bgxf_sys_message_read"."status" IS '状态（1、已读，0未读，2、删除状态）';

-- ----------------------------
-- Records of bgxf_sys_message_read
-- ----------------------------
INSERT INTO "public"."bgxf_sys_message_read" VALUES ('30', '24', '40', '1');
INSERT INTO "public"."bgxf_sys_message_read" VALUES ('31', '24', '39', '1');
INSERT INTO "public"."bgxf_sys_message_read" VALUES ('32', '24', '41', '1');
INSERT INTO "public"."bgxf_sys_message_read" VALUES ('33', '24', '42', '1');

-- ----------------------------
-- Table structure for bgxf_sys_message_view_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."bgxf_sys_message_view_org";
CREATE TABLE "public"."bgxf_sys_message_view_org" (
"id" int4 DEFAULT nextval('bgxf_sys_message_view_org_id_seq'::regclass) NOT NULL,
"message_id" int8 NOT NULL,
"party_org_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."bgxf_sys_message_view_org" IS '系统消息阅读范围';

-- ----------------------------
-- Records of bgxf_sys_message_view_org
-- ----------------------------
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('9265', '40', '715');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('9277', '40', '453');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('9278', '40', '452');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('9291', '40', '454');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('9448', '40', '455');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12158', '39', '715');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12170', '39', '453');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12171', '39', '452');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12184', '39', '454');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12341', '39', '455');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12421', '41', '715');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12433', '41', '453');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12434', '41', '452');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12447', '41', '454');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12604', '41', '455');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12684', '42', '715');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12696', '42', '453');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12697', '42', '452');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12710', '42', '454');
INSERT INTO "public"."bgxf_sys_message_view_org" VALUES ('12867', '42', '455');

-- ----------------------------
-- Table structure for hq_address
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_address";
CREATE TABLE "public"."hq_address" (
"address_id" int4 DEFAULT nextval('hq_address_address_id_seq'::regclass) NOT NULL,
"address_name" varchar(45) COLLATE "default" NOT NULL,
"parent_address__id" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_address" IS '归属地';
COMMENT ON COLUMN "public"."hq_address"."address_id" IS '地址id';
COMMENT ON COLUMN "public"."hq_address"."address_name" IS '地址名称';
COMMENT ON COLUMN "public"."hq_address"."parent_address__id" IS '父地址id';

-- ----------------------------
-- Records of hq_address
-- ----------------------------
INSERT INTO "public"."hq_address" VALUES ('1', 'd', null);

-- ----------------------------
-- Table structure for hq_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_admin_menu";
CREATE TABLE "public"."hq_admin_menu" (
"menu_id" int4 DEFAULT nextval('hq_admin_menu_menu_id_seq'::regclass) NOT NULL,
"menu_name" varchar(45) COLLATE "default" NOT NULL,
"action" varchar(45) COLLATE "default",
"controller" varchar(45) COLLATE "default" DEFAULT NULL::character varying NOT NULL,
"sort_num" int4,
"method" varchar(45) COLLATE "default" DEFAULT NULL::character varying NOT NULL,
"status" int2,
"icon" varchar(45) COLLATE "default" DEFAULT NULL::character varying
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_admin_menu" IS '管理员菜单';
COMMENT ON COLUMN "public"."hq_admin_menu"."menu_id" IS '菜单ID';
COMMENT ON COLUMN "public"."hq_admin_menu"."menu_name" IS '菜单名称';
COMMENT ON COLUMN "public"."hq_admin_menu"."action" IS '活动';
COMMENT ON COLUMN "public"."hq_admin_menu"."controller" IS '控制器';
COMMENT ON COLUMN "public"."hq_admin_menu"."sort_num" IS '排序号';
COMMENT ON COLUMN "public"."hq_admin_menu"."method" IS '方法名';
COMMENT ON COLUMN "public"."hq_admin_menu"."status" IS '状态（1：显示；2：隐藏）';
COMMENT ON COLUMN "public"."hq_admin_menu"."icon" IS '图标';

-- ----------------------------
-- Records of hq_admin_menu
-- ----------------------------
INSERT INTO "public"."hq_admin_menu" VALUES ('17', '后台菜单管理', null, 'menu', '96', 'admin', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('18', '用户角色管理', null, 'role', '99', 'index', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('20', '组织架构管理', null, 'org', '1000', 'index', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('21', '用户管理', null, 'user', '100', 'index', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('22', '管理员管理', null, 'admin', '98', 'index', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('28', '审核管理', null, 'approve', '1', 'index', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('29', '管理员保存', null, 'admin', '1', 'save', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('30', '获取管理员编辑', null, 'admin', '1', 'edit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('31', '管理员状态修改', null, 'admin', '1', 'isuse', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('32', '删除管理员', null, 'admin', '1', 'delete', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('35', '轮播图编辑', null, 'carousel', '1', 'edit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('37', '文件保存', null, 'filemanager', '1', 'savefile', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('38', '显示服务器文件', null, 'filemanager', '1', 'showfile', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('39', '获取文件', null, 'filemanager', '1', 'getfile', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('40', '保存视频文件', null, 'filemanager', '1', 'savevideofile', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('41', 'SFTP视频文件', null, 'filemanager', '1', 'uploadvideosftp', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('43', '删除热点关注', null, 'hotnews', '1', 'delete', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('44', '编辑原有热点关注', null, 'hotnews', '1', 'edithot', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('45', '保存热点关注', null, 'hotnews', '1', 'save', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('46', '首页', null, 'index', '2000', 'index', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('47', '删除后台菜单', null, 'menu', '1', 'deleteadminmenu', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('48', '编辑后台菜单', null, 'menu', '1', 'editadminmenu', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('49', '保存后台菜单', null, 'menu', '1', 'saveAdminMenu', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('50', '添加前台菜单', null, 'menu', '1', 'insertNode', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('51', '重命名前台菜单', null, 'menu', '1', 'renameNode', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('52', '删除前台菜单', null, 'menu', '1', 'deleteNode', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('53', '保存前台栏目附加属性', null, 'menu', '1', 'saveMenuAttribute', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('54', '获取前台菜单', null, 'menu', '1', 'getAppMenu', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('55', '新建通知', null, 'Notify', '1', 'add', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('56', '通知保存', null, 'Notify', '1', 'save', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('57', '通知修改', null, 'Notify', '1', 'edit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('58', '新建组织', null, 'org', '1', 'insertNode', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('59', '组织重命名', null, 'org', '1', 'renameNode', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('60', '删除组织', null, 'org', '1', 'deleteNode', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('61', '保存组织附加属性', null, 'org', '1', 'saveOrgAttribute', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('62', '获取组织修改', null, 'org', '1', 'getOrg', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('63', '添加文章', null, 'posts', '1', 'add', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('65', '文章预览', null, 'posts', '1', 'preview', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('66', '文章修改', null, 'posts', '1', 'edit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('67', '管理员角色管理', null, 'role', '97', 'admin', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('68', '保存管理员角色', null, 'role', '1', 'saveAdminRole', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('69', '删除管理员角色', null, 'role', '1', 'deleteAdminRole', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('70', '编辑管理员角色', null, 'role', '1', 'editAdminRole', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('71', '保存管理员角色权限', null, 'role', '1', 'saveAdminRolePower', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('72', '删除党员角色', null, 'role', '1', 'deleteAppRole', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('73', '保存党员角色', null, 'role', '1', 'saveAppRole', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('74', '编辑党员角色', null, 'role', '1', 'editAppRole', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('75', '用户关联组织', null, 'user', '1', 'linkOrg', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('76', '组织获取用户信息', null, 'user', '1', 'getMember', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('77', '添加组织关联用户', null, 'user', '1', 'linkUser', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('78', '保存组织关联用户', null, 'user', '1', 'saveLinkUser', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('79', '删除组织关联用户', null, 'user', '1', 'deleteLinkUser', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('80', '删除党员信息', null, 'user', '1', 'delete', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('81', '编辑党员信息', null, 'user', '1', 'edit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('82', '保存党员信息', null, 'user', '1', 'save', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('83', '保存详细党员信息', null, 'user', '1', 'savememberinfo', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('84', '编辑党员详细信息', null, 'user', '1', 'editmemberinfo', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('85', '添加党员', null, 'user', '1', 'addpartymember', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('90', '远教点播模块与分类保存', null, 'course', '1', 'saveCate', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('91', '远教点播模块与分类删除', null, 'course', '1', 'delCate', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('93', '添加课程', null, 'course', '1', 'addCourse', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('94', '远教之窗课程管理', null, 'course', '1', 'course', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('95', '课程保存', null, 'course', '1', 'saveCourse', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('96', '管理员搜索', null, 'Admin', '1', 'searchAdmin', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('97', '课程修改', null, 'course', '1', 'editCourse', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('98', '添加视频', null, 'course', '1', 'upload', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('100', '党员个人积分记录', null, 'integer', '1', 'getrecord', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('101', '党员积分搜索', null, 'integer', '1', 'searchinteger', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('102', '视频保存', null, 'course', '1', 'saveVideo', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('103', '远教之窗分类状态修改', null, 'course', '1', 'cateStatus', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('104', '课程状态修改', null, 'course', '1', 'courseStatus', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('106', '热点关注搜索', null, 'hotnews', '1', 'searchhotnews', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('107', '课程保存（二）', null, 'course', '1', 'saveCourseAdmin', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('108', '轮播图搜索', null, 'carousel', '1', 'searchcarousel', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('109', '编辑新增热点关注', null, 'hotnews', '1', 'editaddhot', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('110', '党员信息搜索', null, 'user', '1', 'searchuser', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('111', '菜单搜索', null, 'menu', '1', 'searchmenu', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('112', '党员角色搜索', null, 'role', '1', 'searchrole', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('125', '角色分配', null, 'role', '1', 'assignAppRole', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('126', '删除党员角色', null, 'role', '1', 'deleteAppRoleMember', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('127', '保存党员角色', null, 'role', '1', 'saveAppRoleMember', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('128', '文章搜索', null, 'posts', '1', 'searchposts', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('129', '二级联动获取分类', null, 'course', '1', 'getCate', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('132', '注册审核操作', null, 'approve', '1', 'registerResult', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('133', '视频列表', null, 'course', '1', 'video', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('134', '通知搜索', null, 'notify', '1', 'searchnotify', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('135', '删除课程视频', null, 'course', '1', 'delVideo', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('136', '远教之窗', null, 'course', '1', 'general', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('137', 'ajax获取课程', null, 'course', '1', 'getCourseAjax', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('138', '保存文章', null, 'posts', '1', 'postsSave', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('139', '普通管理员上传视频', null, 'course', '1', 'generalUp', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('140', '上传党员表', null, 'user', '1', 'uploadfile', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('141', '党员批量注册', null, 'user', '1', 'userimport', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('142', 'Ajax分页获取视频', null, 'course', '1', 'videoAjaxPage', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('144', '文章编辑管理', null, 'posts', '1', 'postsEditSave', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('145', '文章审核编辑', null, 'approve', '1', 'postsApproveEdit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('146', '保存文章审核', null, 'approve', '1', 'postsEditSave', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('153', '搜索需要审核的注册信息', null, 'approve', '1', 'searchapprove', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('154', '视频审批预览', null, 'course', '1', 'preview', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('155', '视频搜索', null, 'course', '1', 'searchVideo', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('158', '系统消息删除', null, 'sysmessage', '1', 'delete', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('159', '新建系统消息编辑', null, 'sysmessage', '1', 'add', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('160', '新建系统消息保存', null, 'sysmessage', '1', 'saveadd', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('161', '系统消息修改', null, 'sysmessage', '1', 'edit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('162', '系统消息修改保存', null, 'sysmessage', '1', 'save', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('163', '系统消息搜索', null, 'sysmessage', '1', 'searchmessage', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('164', '视频排序', null, 'course', '1', 'sortVideo', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('166', '搜索管理员', null, 'admin', '1', 'searchAdmin', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('167', '拒绝文章通过的理由', null, 'approve', '1', 'denyApprove', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('168', '选择轮播图列表', null, 'carousel', '1', 'check', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('169', '搜索要设为轮播图的文章', null, 'carousel', '1', 'searchposts', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('170', '模块分类列表', null, 'course', '1', 'category', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('171', '删除课程', null, 'course', '1', 'delCourse', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('172', '根据课程id获取指定课程下视频列表（ajax返回）不分页', null, 'course', '1', 'videoAjax', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('173', '分类检索', null, 'course', '1', 'searchCate', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('174', '课程检索', null, 'course', '1', 'searchCourse', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('175', '超级管理员拖拽视频时显示列表', null, 'course', '1', 'additionalVideo', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('176', '登录页', null, 'login', '1', 'index', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('177', '登录验证', null, 'login', '1', 'login', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('178', '退出登录', null, 'login', '1', 'logout', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('179', '验证码显示', null, 'login', '1', 'checkVerify', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('180', '根据节点ID获取当前节点的信息', null, 'menu', '1', 'getNode', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('181', '添加根节点', null, 'menu', '1', 'addRootNode', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('182', '获取根节点', null, 'menu', '1', 'getRootNodeId', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('185', '新建通知编辑', null, 'notify', '1', 'add', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('186', '新建通知的保存', null, 'notify', '1', 'save', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('187', '通知修改', null, 'notify', '1', 'edit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('188', '1111111111', null, 'org', '1', 'saveFile', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('189', '111111111', null, 'org', '1', 'check', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('190', '节点插入', null, 'org', '1', 'insert', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('191', '获取某个节点的下一层子节点', null, 'org', '1', 'getChildNodes', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('192', '根据节点名称搜索', null, 'org', '1', 'searchNodes', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('193', '根据节点ID获取当前节点的信息', null, 'org', '1', 'getNode', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('194', '添加根节点', null, 'org', '1', 'addRootNode', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('195', '获取根节点', null, 'org', '1', 'getRootNodeId', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('196', '获取新闻审批失败状态', null, 'posts', '1', 'denyInfo', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('197', '文章删除', null, 'posts', '1', 'deletePost', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('198', '文章审核/取消审核', null, 'posts', '1', 'postsStatus', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('199', '1111111', null, 'role', '1', 'editRolePower', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('200', '管理员角色搜索', null, 'role', '1', 'searchsysrole', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('201', '快速编辑党员信息', null, 'user', '1', 'addedit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('209', '视频列表', null, 'video', '1', 'index', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('210', '视频上传', null, 'video', '1', 'upload', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('211', '视频保存', null, 'video', '1', 'save', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('212', '视频内容编辑', null, 'video', '1', 'edit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('213', '视频修改保存', null, 'video', '1', 'editSave', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('214', '视频分类列表', null, 'video', '1', 'category', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('215', '保存视频分类信息', null, 'video', '1', 'saveCate', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('216', '视频分类信息编辑', null, 'video', '1', 'editCate', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('217', '视频分类删除', null, 'video', '1', 'delCate', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('219', '三会一课修改', null, 'meetings', '1', 'edit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('220', '三会一课修改保存', null, 'meetings', '1', 'save', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('221', '三会一课搜索', null, 'meetings', '1', 'searchmeeting', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('222', '三会一课删除', null, 'meetings', '1', 'delete', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('223', '清空党员积分', null, 'integer', '1', 'resetintegral', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('224', '党员积分修改保存', null, 'integer', '1', 'save', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('226', '新增党务知识', null, 'affairs', '1', 'add', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('227', '编辑党务知识', null, 'affairs', '1', 'edit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('229', '党员之家删除', null, 'housenews', '1', 'delete', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('230', '党员之家修改', null, 'housenews', '1', 'edit', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('231', '党员之家修改保存', null, 'housenews', '1', 'save', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('232', '党员之家搜索', null, 'housenews', '1', 'searchhousenews', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('244', '党费管理_查询', null, 'payment', '0', 'search', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('245', '党费管理_确认支付', null, 'payment', '0', 'confirmPaySign', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('246', '党费管理_取消确认', null, 'payment', '0', 'cancelConfirmPaySign', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('247', '党费管理_删除记录', null, 'payment', '0', 'delPayment', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('249', '党费管理_统计数据', null, 'payment', '0', 'monthChartQuery', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('250', '党费管理_缴费记录', null, 'payment', '0', 'doQueryForMonthChart', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('252', '边管业务管理', null, 'Border', '69', 'index', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('253', '案件数据', null, 'Cases', '68', 'index', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('254', '缉私案件管理', null, 'Suppress', '66', 'index', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('255', '删除缉私案件信息', null, 'suppress', '1', 'deleteSuppress', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('256', '新增编辑缉私案件信息', null, 'suppress', '1', 'addSuppress', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('257', '新增缉私案件信息保存', null, 'suppress', '1', 'saveaddSuppress', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('258', '获取编辑缉私案件信息', null, 'suppress', '1', 'editSuppress', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('259', '保存缉私案件信息', null, 'suppress', '1', 'saveSuppress', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('260', '缉私案件信息搜索', null, 'suppress', '1', 'searchsuppress', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('261', '非法入境', null, 'illegal', '67', 'index', '0', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('262', '警务训练', null, 'police', '66', 'index', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('263', '日常办公', null, 'rcbg', '67', 'index', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('264', '指挥调度', null, 'zhdd', '65', 'index', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('265', '边境管理', null, 'bjgl', '68', 'index', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('266', '执法正规化', null, 'zfzgh', '63', 'index', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('267', '信息化建设', null, 'xxhjs', '64', 'index', '1', 'fa-user');
INSERT INTO "public"."hq_admin_menu" VALUES ('268', '部队管理', null, 'police', '1', 'forceManagement', '0', 'fa-user');

-- ----------------------------
-- Table structure for hq_bg_administrative_case
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_administrative_case";
CREATE TABLE "public"."hq_bg_administrative_case" (
"id" int4 DEFAULT nextval('hq_bg_administrative_case_id_seq'::regclass) NOT NULL,
"case_name" varchar(45) COLLATE "default",
"case_type_id" int4,
"option" int2,
"create_time" timestamp(6),
"org_id" int4,
"content" text COLLATE "default",
"accept_time" timestamp(6),
"investigate_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_administrative_case" IS '边管--行政案件（治安案件）';
COMMENT ON COLUMN "public"."hq_bg_administrative_case"."id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_administrative_case"."case_name" IS '案件名称';
COMMENT ON COLUMN "public"."hq_bg_administrative_case"."case_type_id" IS '案件类型';
COMMENT ON COLUMN "public"."hq_bg_administrative_case"."option" IS '动作（0：受理 1：查处';
COMMENT ON COLUMN "public"."hq_bg_administrative_case"."create_time" IS '时间';
COMMENT ON COLUMN "public"."hq_bg_administrative_case"."org_id" IS '单位';
COMMENT ON COLUMN "public"."hq_bg_administrative_case"."content" IS '案例描述';
COMMENT ON COLUMN "public"."hq_bg_administrative_case"."accept_time" IS '受理时间';
COMMENT ON COLUMN "public"."hq_bg_administrative_case"."investigate_time" IS '查处时间';

-- ----------------------------
-- Records of hq_bg_administrative_case
-- ----------------------------
INSERT INTO "public"."hq_bg_administrative_case" VALUES ('10', '车站偷窃案', '24', '0', '2017-06-22 15:11:50', '737', '案犯多次作案，目标多为放松警惕的乘客', '2017-06-07 16:33:16', null);
INSERT INTO "public"."hq_bg_administrative_case" VALUES ('11', '朝阳街金店失窃案', '24', '1', '2017-06-22 15:10:17', '737', '墙壁破损严重，店内贵重物品损失严重', '2017-06-02 16:33:42', '2017-06-07 16:33:32');
INSERT INTO "public"."hq_bg_administrative_case" VALUES ('12', '工厂厂房赌博案', '23', '1', '2017-06-22 15:08:16', '737', '聚众赌博', '2017-06-01 16:35:59', '2017-06-07 16:35:53');
INSERT INTO "public"."hq_bg_administrative_case" VALUES ('13', '撒打算', '23', '0', '2017-06-07 16:36:20', '741', '', '2017-06-05 16:36:06', null);
INSERT INTO "public"."hq_bg_administrative_case" VALUES ('14', '朝阳街电车盗窃案', '24', '0', '2017-06-22 15:07:35', '737', '案犯多次作案，目标多为电车', '2017-06-02 16:43:20', null);
INSERT INTO "public"."hq_bg_administrative_case" VALUES ('15', '信阳小区失窃案', '24', '0', '2017-06-22 15:06:18', '738', '户主遗失珍贵物品', '2017-06-07 17:25:08', null);
INSERT INTO "public"."hq_bg_administrative_case" VALUES ('16', '乐响KTV包厢吸毒案', '25', '1', '2017-06-22 15:05:06', '737', '在包厢聚众吸毒', '2017-06-01 18:21:29', '2017-06-06 18:21:32');
INSERT INTO "public"."hq_bg_administrative_case" VALUES ('17', '信阳小学伤人案', '26', '0', '2017-06-22 15:03:04', '737', '社会人员翻墙入校伤及学生', '2017-06-07 07:03:45', null);

-- ----------------------------
-- Table structure for hq_bg_case_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_case_type";
CREATE TABLE "public"."hq_bg_case_type" (
"id" int4 DEFAULT nextval('hq_bg_case_type_id_seq'::regclass) NOT NULL,
"type_name" varchar(45) COLLATE "default",
"parent_id" int4 DEFAULT 0,
"level" int2,
"path" varchar(255) COLLATE "default",
"type_category" int2
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_case_type" IS '边管--案例分类';
COMMENT ON COLUMN "public"."hq_bg_case_type"."id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_case_type"."type_name" IS '案例类型名称';
COMMENT ON COLUMN "public"."hq_bg_case_type"."parent_id" IS '父类ID';
COMMENT ON COLUMN "public"."hq_bg_case_type"."level" IS '层级';
COMMENT ON COLUMN "public"."hq_bg_case_type"."path" IS '路径（父类路径+本身ID）';
COMMENT ON COLUMN "public"."hq_bg_case_type"."type_category" IS '类型分类（1：刑事案件 2：行政案件 ）';

-- ----------------------------
-- Records of hq_bg_case_type
-- ----------------------------
INSERT INTO "public"."hq_bg_case_type" VALUES ('1', '杀人', '0', '1', '/1', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('2', '伤害', '0', '1', '/2', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('3', '伤害（致死）', '2', '2', '/2/3', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('4', '伤害（其他）', '2', '2', '/2/4', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('5', '强奸', '0', '1', '/5', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('6', '抢劫', '0', '1', '/6', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('7', '抢劫（入室）', '6', '2', '/6/7', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('8', '抢劫（机动车）', '6', '2', '/6/8', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('9', '抢劫（电动车）', '6', '2', '/6/9', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('10', '抢劫（其他）', '6', '2', '/6/10', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('11', '盗窃', '0', '1', '/11', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('12', '盗窃（入室）', '11', '2', '/11/12', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('13', '盗窃（机动车）', '11', '2', '/11/13', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('14', '盗窃（电动车）', '11', '2', '/11/14', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('15', '盗窃（其他）', '11', '2', '/11/15', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('16', '抢夺', '0', '1', '/16', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('17', '拐卖妇女儿童', '0', '1', '/17', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('18', '毒品犯罪', '0', '1', '/18', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('19', '偷越国边境', '0', '1', '/19', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('20', '组织运送他人偷越国边境', '0', '1', '/20', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('21', '其他', '0', '1', '/21', '1');
INSERT INTO "public"."hq_bg_case_type" VALUES ('22', '殴打他人', '0', '1', '/22', '2');
INSERT INTO "public"."hq_bg_case_type" VALUES ('23', '赌博', '0', '1', '/23', '2');
INSERT INTO "public"."hq_bg_case_type" VALUES ('24', '盗窃', '0', '1', '/24', '2');
INSERT INTO "public"."hq_bg_case_type" VALUES ('25', '毒品违法', '0', '1', '/25', '2');
INSERT INTO "public"."hq_bg_case_type" VALUES ('26', '故意伤害', '0', '1', '/26', '2');
INSERT INTO "public"."hq_bg_case_type" VALUES ('27', '卖淫嫖娼', '0', '1', '/27', '2');
INSERT INTO "public"."hq_bg_case_type" VALUES ('28', '偷越国边境', '0', '1', '/28', '2');
INSERT INTO "public"."hq_bg_case_type" VALUES ('29', '非法携带管制器具', '0', '1', '/29', '2');
INSERT INTO "public"."hq_bg_case_type" VALUES ('30', '诈骗', '0', '1', '/30', '2');
INSERT INTO "public"."hq_bg_case_type" VALUES ('31', '故意损坏财物', '0', '1', '/31', '2');
INSERT INTO "public"."hq_bg_case_type" VALUES ('32', '组织运输协助他人偷越国边境', '0', '1', '/32', '2');
INSERT INTO "public"."hq_bg_case_type" VALUES ('33', '其他', '0', '1', '/33', '2');

-- ----------------------------
-- Table structure for hq_bg_collection_situation
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_collection_situation";
CREATE TABLE "public"."hq_bg_collection_situation" (
"id" int4 DEFAULT nextval('hq_bg_collection_situation_id_seq'::regclass) NOT NULL,
"case_name" varchar(45) COLLATE "default",
"discounts" int4,
"time" timestamp(6),
"cs_car" int4,
"cs_motocycle" int4,
"cs_electric" int4,
"cs_gun_military" int4,
"cs_gun_other" int4,
"cs_bullet" int4,
"cs_explosive" int4,
"cs_detonator" int4,
"cs_narcotics_heroin" int4,
"cs_narcotics_other" int4,
"cs_money" int4,
"org_id" int4,
"case_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_collection_situation" IS '边管--收缴情况';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."case_name" IS '案件名称';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."discounts" IS '账物折款（万元）';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."time" IS '时间';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."cs_car" IS '收缴汽车';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."cs_motocycle" IS '收缴摩托车';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."cs_electric" IS '收缴电动车';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."cs_gun_military" IS '收缴枪支（军用）';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."cs_gun_other" IS '收缴枪支（其他）';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."cs_bullet" IS '收缴子弹';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."cs_explosive" IS '收缴炸药';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."cs_detonator" IS '收缴雷管';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."cs_narcotics_heroin" IS '收缴毒品（海洛因）';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."cs_narcotics_other" IS '收缴毒品（其他）';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."cs_money" IS '收缴赃款';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."org_id" IS '主管单位';
COMMENT ON COLUMN "public"."hq_bg_collection_situation"."case_time" IS '处理时间';

-- ----------------------------
-- Records of hq_bg_collection_situation
-- ----------------------------
INSERT INTO "public"."hq_bg_collection_situation" VALUES ('7', '强行越境案', '20', '2017-06-22 15:16:34', '1', '3', '0', '5', '2', '200', '1', '0', '50', '120', '20', '738', '2017-05-29 16:23:11');
INSERT INTO "public"."hq_bg_collection_situation" VALUES ('8', '中心广场枪击案', '48', '2017-06-07 16:40:15', '2', '2', '0', '8', '12', '500', '0', '0', '120', '120', '50', '741', '2017-05-28 16:40:11');
INSERT INTO "public"."hq_bg_collection_situation" VALUES ('9', '小巷群殴案', '5', '2017-06-07 16:49:13', '1', '3', '0', '1', '0', '15', '0', '0', '15', '25', '0', '738', '2017-04-20 16:43:07');
INSERT INTO "public"."hq_bg_collection_situation" VALUES ('10', '金店抢劫案', '50', '2017-06-22 15:15:52', '1', '2', '0', '2', '3', '120', '1', '0', '0', '0', '0', '737', '2017-05-29 16:46:53');
INSERT INTO "public"."hq_bg_collection_situation" VALUES ('13', '广场斗殴案', '0', '2017-06-22 15:15:01', '2', '5', '3', '0', '0', '0', '0', '0', '20', '0', '2', '738', '2017-06-15 14:59:00');
INSERT INTO "public"."hq_bg_collection_situation" VALUES ('14', '包厢吸毒案', '0', '2017-06-22 15:13:58', '2', '0', '0', '1', '0', '20', '0', '0', '20', '50', '10', '738', '2017-06-15 14:59:15');

-- ----------------------------
-- Table structure for hq_bg_collection_situation_goods
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_collection_situation_goods";
CREATE TABLE "public"."hq_bg_collection_situation_goods" (
"id" int4 NOT NULL,
"case_id" int4,
"goods_id" int4,
"data" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_collection_situation_goods" IS '边管--收缴物品';
COMMENT ON COLUMN "public"."hq_bg_collection_situation_goods"."id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_collection_situation_goods"."case_id" IS '案件ID';
COMMENT ON COLUMN "public"."hq_bg_collection_situation_goods"."goods_id" IS '物品ID';
COMMENT ON COLUMN "public"."hq_bg_collection_situation_goods"."data" IS '值';

-- ----------------------------
-- Records of hq_bg_collection_situation_goods
-- ----------------------------

-- ----------------------------
-- Table structure for hq_bg_combat_situation
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_combat_situation";
CREATE TABLE "public"."hq_bg_combat_situation" (
"id" int4 DEFAULT nextval('hq_bg_combat_situation_id_seq'::regclass) NOT NULL,
"case_name" varchar(45) COLLATE "default",
"suspect_criminal_count" int4,
"fled" int4,
"unfled" int4,
"total_count" int4,
"involved_num" int4,
"time" timestamp(6),
"org_id" int4,
"ts_criminal_custody" int4,
"ts_administrative_detention" int4,
"ts_arrest" int4,
"ts_imprisonment" int4,
"ts_fine" int4,
"ts_drug" int4,
"ts_other" int4,
"case_time" timestamp(6)
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_combat_situation" IS '边管--打击处理案件';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."case_name" IS '案件名称';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."suspect_criminal_count" IS '犯罪嫌疑人总数';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."fled" IS '网逃';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."unfled" IS '非网逃';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."total_count" IS '犯罪团伙总数';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."involved_num" IS '涉案人数';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."time" IS '时间';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."org_id" IS '单位ID';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."ts_criminal_custody" IS '刑事拘留人数';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."ts_administrative_detention" IS '行政拘留人数';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."ts_arrest" IS '逮捕人数';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."ts_imprisonment" IS '劳教人数';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."ts_fine" IS '罚款人数';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."ts_drug" IS '强行戒毒人数';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."ts_other" IS '其他人数';
COMMENT ON COLUMN "public"."hq_bg_combat_situation"."case_time" IS '处理时间';

-- ----------------------------
-- Records of hq_bg_combat_situation
-- ----------------------------
INSERT INTO "public"."hq_bg_combat_situation" VALUES ('8', '聚众吸毒', '12', '4', '8', '1', '9', '2017-06-07 16:12:12', '738', '1', '1', '2', '0', '0', '5', '0', '2017-05-30 16:12:07');
INSERT INTO "public"."hq_bg_combat_situation" VALUES ('9', '广场群殴案', '30', '8', '22', '2', '24', '2017-06-07 17:14:29', '737', '12', '10', '8', '0', '0', '0', '0', '2017-05-31 17:14:23');
INSERT INTO "public"."hq_bg_combat_situation" VALUES ('10', '车站抢劫案', '8', '2', '6', '1', '12', '2017-06-07 17:16:23', '741', '3', '1', '4', '0', '0', '0', '0', '2017-06-07 17:16:22');

-- ----------------------------
-- Table structure for hq_bg_combat_situation_process
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_combat_situation_process";
CREATE TABLE "public"."hq_bg_combat_situation_process" (
"id" int4 NOT NULL,
"combat_situation_id" int4,
"process_id" int4,
"data" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_combat_situation_process" IS '边管--打击处理_处理情况数据';
COMMENT ON COLUMN "public"."hq_bg_combat_situation_process"."id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_combat_situation_process"."combat_situation_id" IS '打击处理案件ID';
COMMENT ON COLUMN "public"."hq_bg_combat_situation_process"."process_id" IS '处理方式ID';
COMMENT ON COLUMN "public"."hq_bg_combat_situation_process"."data" IS '数值';

-- ----------------------------
-- Records of hq_bg_combat_situation_process
-- ----------------------------

-- ----------------------------
-- Table structure for hq_bg_criminal_case
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_criminal_case";
CREATE TABLE "public"."hq_bg_criminal_case" (
"id" int4 DEFAULT nextval('hq_bg_criminal_case_id_seq'::regclass) NOT NULL,
"case_name" varchar(45) COLLATE "default",
"case_type_id" int4,
"status" int2 DEFAULT 0,
"filing_time" timestamp(6),
"detection_time" timestamp(6),
"flag" int2 DEFAULT 0,
"create_time" timestamp(6),
"content" text COLLATE "default",
"org_id" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_criminal_case" IS '边管--刑事案件';
COMMENT ON COLUMN "public"."hq_bg_criminal_case"."id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_criminal_case"."case_name" IS '案件名称';
COMMENT ON COLUMN "public"."hq_bg_criminal_case"."case_type_id" IS '案件分类ID';
COMMENT ON COLUMN "public"."hq_bg_criminal_case"."status" IS '案件状态（默认0， 0：立案 1：破案）';
COMMENT ON COLUMN "public"."hq_bg_criminal_case"."filing_time" IS '立案时间';
COMMENT ON COLUMN "public"."hq_bg_criminal_case"."detection_time" IS '破案时间';
COMMENT ON COLUMN "public"."hq_bg_criminal_case"."flag" IS '是否补立（默认0，0：否 1：是）';
COMMENT ON COLUMN "public"."hq_bg_criminal_case"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."hq_bg_criminal_case"."content" IS '案件描述';
COMMENT ON COLUMN "public"."hq_bg_criminal_case"."org_id" IS '主管单位（所、检查站';

-- ----------------------------
-- Records of hq_bg_criminal_case
-- ----------------------------
INSERT INTO "public"."hq_bg_criminal_case" VALUES ('47', '衡阳菜市杀人案', '3', '0', '2017-06-01 16:50:37', null, '0', '2017-06-22 15:01:19', '矛盾冲突升级斗殴，伤人致死', '737');
INSERT INTO "public"."hq_bg_criminal_case" VALUES ('49', '越境案', '20', '1', '2016-12-05 17:01:32', '2017-02-03 17:01:43', '1', '2017-06-22 14:57:25', '晚上从山间小路越境', '737');
INSERT INTO "public"."hq_bg_criminal_case" VALUES ('51', '非法入境', '19', '0', '2017-06-01 21:48:01', null, '0', '2017-06-22 14:55:23', '巡逻员巡逻发现', '737');
INSERT INTO "public"."hq_bg_criminal_case" VALUES ('55', 'hj', '3', '0', '2017-06-08 07:32:34', null, '0', '2017-06-08 07:32:47', 'sadsfsaf', '740');
INSERT INTO "public"."hq_bg_criminal_case" VALUES ('56', '朝阳街杀人案', '3', '0', '2017-06-01 09:38:23', null, '0', '2017-06-22 14:53:17', '案发时间深夜，各种案件多发区', '737');
INSERT INTO "public"."hq_bg_criminal_case" VALUES ('60', '阳光小区失窃案', '12', '0', '2017-06-15 14:56:03', null, '0', '2017-06-22 14:51:33', '窗户受损，户主遗失珍贵物品', '738');
INSERT INTO "public"."hq_bg_criminal_case" VALUES ('61', '重庆餐馆故意伤人案', '4', '0', '2017-06-15 14:57:32', null, '0', '2017-06-22 14:49:44', '酗酒闹事，致人受伤', '738');

-- ----------------------------
-- Table structure for hq_bg_goods
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_goods";
CREATE TABLE "public"."hq_bg_goods" (
"id" int4 NOT NULL,
"goods_name" varchar(45) COLLATE "default",
"parent_id" int4,
"level" int2,
"path" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_goods" IS '边管--物品';
COMMENT ON COLUMN "public"."hq_bg_goods"."id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_goods"."goods_name" IS '物品名称';
COMMENT ON COLUMN "public"."hq_bg_goods"."parent_id" IS '父类ID';
COMMENT ON COLUMN "public"."hq_bg_goods"."level" IS '层级';
COMMENT ON COLUMN "public"."hq_bg_goods"."path" IS '路径';

-- ----------------------------
-- Records of hq_bg_goods
-- ----------------------------
INSERT INTO "public"."hq_bg_goods" VALUES ('1', '汽车', '0', '1', '/1');
INSERT INTO "public"."hq_bg_goods" VALUES ('2', '摩托车', '0', '1', '/2');
INSERT INTO "public"."hq_bg_goods" VALUES ('3', '电动车', '0', '1', '/3');
INSERT INTO "public"."hq_bg_goods" VALUES ('4', '枪支', '0', '1', '/4');
INSERT INTO "public"."hq_bg_goods" VALUES ('5', '军用', '4', '2', '/4/5');
INSERT INTO "public"."hq_bg_goods" VALUES ('6', '其他', '4', '2', '/4/6');
INSERT INTO "public"."hq_bg_goods" VALUES ('7', '子弹', '0', '1', '/7');
INSERT INTO "public"."hq_bg_goods" VALUES ('8', '炸弹（公斤）', '0', '1', '/8');
INSERT INTO "public"."hq_bg_goods" VALUES ('9', '雷管', '0', '1', '/9');
INSERT INTO "public"."hq_bg_goods" VALUES ('10', '毒品（克）', '0', '1', '/10');
INSERT INTO "public"."hq_bg_goods" VALUES ('11', '海洛因', '10', '2', '/10/11');
INSERT INTO "public"."hq_bg_goods" VALUES ('12', '其他', '10', '2', '/10/12');
INSERT INTO "public"."hq_bg_goods" VALUES ('13', '赃款（万元）', '0', '1', '/13');

-- ----------------------------
-- Table structure for hq_bg_illegal_immigration
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_illegal_immigration";
CREATE TABLE "public"."hq_bg_illegal_immigration" (
"illegal_id" int4 DEFAULT nextval('hq_bg_illegal_immigration_id_seq'::regclass) NOT NULL,
"org_id" int4,
"seized_time" timestamp(6),
"seized_addr" varchar(255) COLLATE "default",
"seized_person_num" int4,
"seized_way_id" int4,
"status" int2,
"marks" varchar(255) COLLATE "default",
"month_id" int4,
"theyear" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_illegal_immigration" IS '边管--非法入境';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration"."illegal_id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration"."org_id" IS '查获单位';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration"."seized_time" IS '查获时间';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration"."seized_addr" IS '查获地点';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration"."seized_person_num" IS '查获数量';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration"."seized_way_id" IS '查获方式ID';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration"."status" IS '0.已删除';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration"."marks" IS '备注';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration"."month_id" IS '月份';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration"."theyear" IS '年份';

-- ----------------------------
-- Records of hq_bg_illegal_immigration
-- ----------------------------
INSERT INTO "public"."hq_bg_illegal_immigration" VALUES ('27', '738', '2017-05-29 15:09:44', '河边', '3', '1', '1', '', '5', '2017');
INSERT INTO "public"."hq_bg_illegal_immigration" VALUES ('28', '738', '2017-05-09 15:12:03', '农家菜馆附近', '3', '3', '1', '', '5', '2017');
INSERT INTO "public"."hq_bg_illegal_immigration" VALUES ('29', '738', '2017-06-07 15:15:26', '检查岗附近', '3', '2', '1', '', '6', '2017');
INSERT INTO "public"."hq_bg_illegal_immigration" VALUES ('30', '740', '2017-05-30 15:23:00', '河边', '2', '4', '1', '', '5', '2017');
INSERT INTO "public"."hq_bg_illegal_immigration" VALUES ('31', '737', '2017-06-07 15:32:20', '北宁', '2', '7', '1', '', '6', '2017');
INSERT INTO "public"."hq_bg_illegal_immigration" VALUES ('32', '737', '2017-06-07 15:57:20', '罗山村入口', '1', '1', '1', '', '6', '2017');
INSERT INTO "public"."hq_bg_illegal_immigration" VALUES ('33', '737', '2017-06-08 07:19:57', '心阳村路口', '3', '1', '1', '', '6', '2017');

-- ----------------------------
-- Table structure for hq_bg_illegal_immigration_entry_place
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_illegal_immigration_entry_place";
CREATE TABLE "public"."hq_bg_illegal_immigration_entry_place" (
"entry_place_id" int4 DEFAULT nextval('hq_bg_illegal_immigration_wherego_id_seq'::regclass) NOT NULL,
"entry_place_name" varchar(45) COLLATE "default",
"use_field" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_illegal_immigration_entry_place" IS '边管--非法入境_入境地段';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_entry_place"."entry_place_id" IS '编号ID';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_entry_place"."entry_place_name" IS '非法入境区域名称';

-- ----------------------------
-- Records of hq_bg_illegal_immigration_entry_place
-- ----------------------------
INSERT INTO "public"."hq_bg_illegal_immigration_entry_place" VALUES ('1', '辖区便道通道', 'sidewalkarea');
INSERT INTO "public"."hq_bg_illegal_immigration_entry_place" VALUES ('2', '正规口岸', 'port');
INSERT INTO "public"."hq_bg_illegal_immigration_entry_place" VALUES ('3', '其他地区', 'otherarea');
INSERT INTO "public"."hq_bg_illegal_immigration_entry_place" VALUES ('4', '不详', 'unknownarea');

-- ----------------------------
-- Table structure for hq_bg_illegal_immigration_persons
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_illegal_immigration_persons";
CREATE TABLE "public"."hq_bg_illegal_immigration_persons" (
"person_id" int4 DEFAULT nextval('hq_bg_illegal_immigration_persons_id_seq'::regclass) NOT NULL,
"name" varchar(45) COLLATE "default",
"sex" int2,
"process_type_id" int4,
"remarks" text COLLATE "default",
"identity" varchar(45) COLLATE "default",
"age" int4,
"sourse_id" int4,
"purpose_id" int4,
"wherego_id" int4,
"entry_place_id" int4,
"time" date,
"illegal_id" int4,
"timeslot" int4,
"agegroup" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_illegal_immigration_persons" IS '边管--非法入境_人员信息';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."person_id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."name" IS '姓名';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."sex" IS '性别';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."process_type_id" IS '处理结果ID';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."remarks" IS '备注';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."identity" IS '身份';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."age" IS '年龄';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."sourse_id" IS '来源地ID';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."purpose_id" IS '入境目的ID';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."wherego_id" IS '去向ID';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."entry_place_id" IS '非法入境地段ID';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."time" IS '时间';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."illegal_id" IS '非法入境表id';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."timeslot" IS '入境时段';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_persons"."agegroup" IS '年龄段';

-- ----------------------------
-- Records of hq_bg_illegal_immigration_persons
-- ----------------------------
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('33', '华兵', '1', '12', '', '5215646546541', '32', '1', '1', '5', '1', '2017-05-28', '27', '1', '2');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('34', '鲁岩', '1', '12', '', '46548464646', '29', '1', '1', '5', '1', '2017-05-28', '27', '3', '2');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('35', '李慧', '0', '9', '', '3454564646', '26', '3', '2', '6', '3', '2017-05-08', '28', '2', '2');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('36', '木良', '1', '9', '', '23544543534543', '28', '3', '2', '6', '3', '2017-06-07', '28', '2', '2');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('37', '木柳', '0', '9', '', '5432545454', '4', '3', '2', '6', '3', '2017-05-08', '28', '2', '1');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('38', '黄江', '1', '10', '', '544544444', '47', '4', '8', '5', '4', '2017-05-30', '29', '3', '3');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('39', '赵珍', '0', '12', '', '465648844', '16', '2', '3', '5', '2', '2017-06-02', '29', '1', '2');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('40', '王艳', '0', '9', '', '54646528', '34', '2', '6', '5', '2', '2017-06-02', '29', '2', '2');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('41', '刘楠', '1', '9', '', '4234324324', '23', '4', '1', '6', '1', '2017-05-28', '30', '1', '2');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('42', '刘湛', '1', '9', '', '46456', '26', '4', '1', '5', '1', '2017-05-28', '30', '1', '2');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('43', '张三', '1', '8', '但发撒旦法', '999999198001010001', '56', '4', '7', '7', '4', '2017-06-07', '31', '4', '3');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('44', 'n1', '1', '9', '21111', '11111111111', '33', '1', '2', '5', '1', '2017-06-08', '33', '2', '2');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('45', 'n2', '1', '10', '34553', '2222123', '11', '2', '4', '6', '2', '2017-06-08', '33', '2', '1');
INSERT INTO "public"."hq_bg_illegal_immigration_persons" VALUES ('46', 'b3', '0', '10', '开放集散大夫的斯洛伐克和第三开发力度上分类的说法', '11423414141', '44', '3', '3', '7', '1', '2017-06-08', '33', '2', '2');

-- ----------------------------
-- Table structure for hq_bg_illegal_immigration_purpose
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_illegal_immigration_purpose";
CREATE TABLE "public"."hq_bg_illegal_immigration_purpose" (
"purpose_id" int4 DEFAULT nextval('hq_bg_illegal_immigration_purpose_id_seq'::regclass) NOT NULL,
"purpose_name" varchar(45) COLLATE "default",
"usefield" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_illegal_immigration_purpose" IS '边管--非法入境_入境目的';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_purpose"."purpose_id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_purpose"."purpose_name" IS '名称';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_purpose"."usefield" IS '使用标记';

-- ----------------------------
-- Records of hq_bg_illegal_immigration_purpose
-- ----------------------------
INSERT INTO "public"."hq_bg_illegal_immigration_purpose" VALUES ('1', '务工', 'work');
INSERT INTO "public"."hq_bg_illegal_immigration_purpose" VALUES ('2', '旅游', 'tour');
INSERT INTO "public"."hq_bg_illegal_immigration_purpose" VALUES ('3', '探亲', 'visit_family');
INSERT INTO "public"."hq_bg_illegal_immigration_purpose" VALUES ('4', '婚嫁', 'marriage');
INSERT INTO "public"."hq_bg_illegal_immigration_purpose" VALUES ('5', '治病', 'cure');
INSERT INTO "public"."hq_bg_illegal_immigration_purpose" VALUES ('6', '购物赶圩', 'shopping');
INSERT INTO "public"."hq_bg_illegal_immigration_purpose" VALUES ('7', '经商', 'business');
INSERT INTO "public"."hq_bg_illegal_immigration_purpose" VALUES ('8', '其他', 'otherpurpose');

-- ----------------------------
-- Table structure for hq_bg_illegal_immigration_seized_way
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_illegal_immigration_seized_way";
CREATE TABLE "public"."hq_bg_illegal_immigration_seized_way" (
"seized_way_id" int4 DEFAULT nextval('hq_bg_illegal_immigration_seized_way_id_seq'::regclass) NOT NULL,
"seized_name" varchar(45) COLLATE "default",
"usefield" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_illegal_immigration_seized_way" IS '边管--非法入境_查获方式';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_seized_way"."seized_way_id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_seized_way"."seized_name" IS '查获方式名称';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_seized_way"."usefield" IS '使用标记';

-- ----------------------------
-- Records of hq_bg_illegal_immigration_seized_way
-- ----------------------------
INSERT INTO "public"."hq_bg_illegal_immigration_seized_way" VALUES ('1', '巡逻发现', 'patrol');
INSERT INTO "public"."hq_bg_illegal_immigration_seized_way" VALUES ('2', '检查岗查获', 'checkpoints');
INSERT INTO "public"."hq_bg_illegal_immigration_seized_way" VALUES ('3', '路长举报', 'sidewalkfind');
INSERT INTO "public"."hq_bg_illegal_immigration_seized_way" VALUES ('4', '两翼便道查获', 'report');
INSERT INTO "public"."hq_bg_illegal_immigration_seized_way" VALUES ('5', '外单位移交', 'unit');
INSERT INTO "public"."hq_bg_illegal_immigration_seized_way" VALUES ('6', '工作中发现', 'workfind');
INSERT INTO "public"."hq_bg_illegal_immigration_seized_way" VALUES ('7', '获取线索', 'clue');

-- ----------------------------
-- Table structure for hq_bg_illegal_immigration_sourse
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_illegal_immigration_sourse";
CREATE TABLE "public"."hq_bg_illegal_immigration_sourse" (
"sourse_id" int4 DEFAULT nextval('hq_bg_illegal_immigration_sourse_id_seq'::regclass) NOT NULL,
"sourse_name" varchar(45) COLLATE "default",
"usefield" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_illegal_immigration_sourse" IS '边管--非法入境_人员来源地';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_sourse"."sourse_id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_sourse"."sourse_name" IS '来源地';

-- ----------------------------
-- Records of hq_bg_illegal_immigration_sourse
-- ----------------------------
INSERT INTO "public"."hq_bg_illegal_immigration_sourse" VALUES ('1', '广宁', 'guangning');
INSERT INTO "public"."hq_bg_illegal_immigration_sourse" VALUES ('2', '谅山', 'liangshan');
INSERT INTO "public"."hq_bg_illegal_immigration_sourse" VALUES ('3', '高平', 'gaoping');
INSERT INTO "public"."hq_bg_illegal_immigration_sourse" VALUES ('4', '其他', 'othersourse');

-- ----------------------------
-- Table structure for hq_bg_illegal_immigration_timeslot
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_illegal_immigration_timeslot";
CREATE TABLE "public"."hq_bg_illegal_immigration_timeslot" (
"timeslot_id" int4 DEFAULT nextval('hq_bg_illegal_immigration_timeslot_timeslot_id_seq'::regclass) NOT NULL,
"slotname" varchar(64) COLLATE "default",
"usefield" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_illegal_immigration_timeslot" IS '边管--非法入境--入境时段';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_timeslot"."slotname" IS '时段';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_timeslot"."usefield" IS '使用标记';

-- ----------------------------
-- Records of hq_bg_illegal_immigration_timeslot
-- ----------------------------
INSERT INTO "public"."hq_bg_illegal_immigration_timeslot" VALUES ('1', '8时-12时', 'morning');
INSERT INTO "public"."hq_bg_illegal_immigration_timeslot" VALUES ('2', '12时-18时', 'afternoom');
INSERT INTO "public"."hq_bg_illegal_immigration_timeslot" VALUES ('3', '18时-8时', 'night');
INSERT INTO "public"."hq_bg_illegal_immigration_timeslot" VALUES ('4', '不详', 'unknowntime');

-- ----------------------------
-- Table structure for hq_bg_illegal_immigration_wherego
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_illegal_immigration_wherego";
CREATE TABLE "public"."hq_bg_illegal_immigration_wherego" (
"wherego_id" int4 DEFAULT nextval('hq_bg_illegal_immigration_wherego_id_seq'::regclass) NOT NULL,
"wherego_name" varchar(45) COLLATE "default",
"usefield" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_illegal_immigration_wherego" IS '边管--非法入境_去向';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_wherego"."wherego_id" IS '编号ID';
COMMENT ON COLUMN "public"."hq_bg_illegal_immigration_wherego"."wherego_name" IS '名称';

-- ----------------------------
-- Records of hq_bg_illegal_immigration_wherego
-- ----------------------------
INSERT INTO "public"."hq_bg_illegal_immigration_wherego" VALUES ('5', '广东', 'guangdong');
INSERT INTO "public"."hq_bg_illegal_immigration_wherego" VALUES ('6', '辖区', 'beat');
INSERT INTO "public"."hq_bg_illegal_immigration_wherego" VALUES ('7', '其他', 'othergo');

-- ----------------------------
-- Table structure for hq_bg_process_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_process_type";
CREATE TABLE "public"."hq_bg_process_type" (
"id" int4 DEFAULT nextval('hq_bg_process_type_id_seq'::regclass) NOT NULL,
"process_type_name" varchar(45) COLLATE "default",
"usetables" varchar(46) COLLATE "default",
"usefield" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_process_type" IS '边管--处理情况（方式）';
COMMENT ON COLUMN "public"."hq_bg_process_type"."id" IS '编号';
COMMENT ON COLUMN "public"."hq_bg_process_type"."process_type_name" IS '处理方式名称';
COMMENT ON COLUMN "public"."hq_bg_process_type"."usetables" IS '使用的表';

-- ----------------------------
-- Records of hq_bg_process_type
-- ----------------------------
INSERT INTO "public"."hq_bg_process_type" VALUES ('1', '刑事拘留', 'case', null);
INSERT INTO "public"."hq_bg_process_type" VALUES ('2', '行政拘留', 'case', null);
INSERT INTO "public"."hq_bg_process_type" VALUES ('3', '逮捕', 'case', null);
INSERT INTO "public"."hq_bg_process_type" VALUES ('4', '劳教', 'case', null);
INSERT INTO "public"."hq_bg_process_type" VALUES ('5', '罚款', 'case', null);
INSERT INTO "public"."hq_bg_process_type" VALUES ('6', '强制戒毒', 'case', null);
INSERT INTO "public"."hq_bg_process_type" VALUES ('7', '其他', 'case', null);
INSERT INTO "public"."hq_bg_process_type" VALUES ('8', '拘留审查', 'illegal', 'detention');
INSERT INTO "public"."hq_bg_process_type" VALUES ('9', '便道遣返', 'illegal', 'sidewalk');
INSERT INTO "public"."hq_bg_process_type" VALUES ('10', '刑事拘留', 'illegal', 'criminal');
INSERT INTO "public"."hq_bg_process_type" VALUES ('11', '一线遣返', 'illegal', 'frontline');
INSERT INTO "public"."hq_bg_process_type" VALUES ('12', '其他', 'illegal', 'other');

-- ----------------------------
-- Table structure for hq_bg_suppress_person
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_suppress_person";
CREATE TABLE "public"."hq_bg_suppress_person" (
"person_id" int4 DEFAULT nextval('hq_bg_suppress_person_person_id_seq'::regclass) NOT NULL,
"name" varchar(64) COLLATE "default",
"sex" int2,
"mobile_num" varchar(64) COLLATE "default",
"suppress_id" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_suppress_person" IS '边管--缉私案件--涉案人员信息';
COMMENT ON COLUMN "public"."hq_bg_suppress_person"."person_id" IS '涉案人员ID';
COMMENT ON COLUMN "public"."hq_bg_suppress_person"."name" IS '姓名';
COMMENT ON COLUMN "public"."hq_bg_suppress_person"."sex" IS '性别（1.男 0.女）';
COMMENT ON COLUMN "public"."hq_bg_suppress_person"."mobile_num" IS '手机号码';
COMMENT ON COLUMN "public"."hq_bg_suppress_person"."suppress_id" IS '涉案id';

-- ----------------------------
-- Records of hq_bg_suppress_person
-- ----------------------------
INSERT INTO "public"."hq_bg_suppress_person" VALUES ('16', '胡义', '1', '15454525354', '51');
INSERT INTO "public"."hq_bg_suppress_person" VALUES ('17', '123456', '0', '13111225652', '51');
INSERT INTO "public"."hq_bg_suppress_person" VALUES ('18', 'ksk', '1', '12111111', '52');

-- ----------------------------
-- Table structure for hq_bg_suppress_smuggling
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_suppress_smuggling";
CREATE TABLE "public"."hq_bg_suppress_smuggling" (
"suppress_id" int4 DEFAULT nextval('hq_bg_suppress_smuggling_suppress_id_seq'::regclass) NOT NULL,
"org_id" int4,
"filing_time" timestamp(6),
"goods_type" varchar(64) COLLATE "default",
"goods" varchar(64) COLLATE "default",
"report" int4,
"goods_value" int4,
"goods_tranfer" int4,
"fines" int4,
"verify" int2,
"tranfer_result" varchar(64) COLLATE "default",
"vehicle_involved" int4,
"personnel_involved" int4,
"license_plate" varchar(32) COLLATE "default",
"storage_location" varchar(64) COLLATE "default",
"vehicle_model" varchar(64) COLLATE "default",
"mobile_num" varchar(64) COLLATE "default",
"corps_reply" varchar(64) COLLATE "default",
"vehicle_tranfer" int4,
"case_tranfer" varchar(32) COLLATE "default",
"case_return" varchar(64) COLLATE "default",
"case_result" varchar(64) COLLATE "default",
"notes" varchar(255) COLLATE "default",
"end_time" timestamp(6),
"status" int2 DEFAULT 1
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_suppress_smuggling" IS '边管--缉私案件统计表';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."org_id" IS '主管单位（所、检查站';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."filing_time" IS '立案时间';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."goods_type" IS '物品类别';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."goods" IS '详细物品';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."report" IS '上报数量（吨）';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."goods_value" IS '物品价值预估值（万）';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."goods_tranfer" IS '物品移交（吨）';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."fines" IS '罚没款（元）';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."verify" IS '核拨（次）';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."tranfer_result" IS '移交处理情况';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."vehicle_involved" IS '涉案车辆';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."personnel_involved" IS '涉案人员';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."license_plate" IS '车牌';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."storage_location" IS '存放地点';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."vehicle_model" IS '车辆型号';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."mobile_num" IS '手机号码';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."corps_reply" IS '总队批复';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."vehicle_tranfer" IS '移交车辆';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."case_tranfer" IS '移交案件';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."case_return" IS '案件返还';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."case_result" IS '处理情况';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."notes" IS '备注';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."end_time" IS '月报截止';
COMMENT ON COLUMN "public"."hq_bg_suppress_smuggling"."status" IS '0.已删除';

-- ----------------------------
-- Records of hq_bg_suppress_smuggling
-- ----------------------------
INSERT INTO "public"."hq_bg_suppress_smuggling" VALUES ('51', '738', '2017-05-28 15:26:30', '木材', '稀有木材', '5', '50', '5', '200000', '1', '已移交', '2', '4', null, null, null, null, '已接收', '2', '已移交', '', '', '', '2017-05-28 15:26:30', '1');
INSERT INTO "public"."hq_bg_suppress_smuggling" VALUES ('52', '737', '2017-06-08 07:26:07', '食品', '大米', '21', '11', '21', '60000', '1', '移交中', '2', '4', null, null, null, null, '1', '1', '移交中', '1', '', '', '2017-06-08 07:26:07', '1');

-- ----------------------------
-- Table structure for hq_bg_suppress_vehicle
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_bg_suppress_vehicle";
CREATE TABLE "public"."hq_bg_suppress_vehicle" (
"vehicle_id" int4 DEFAULT nextval('hq_bg_suppress_vehicle_vehicle_id_seq'::regclass) NOT NULL,
"license_plate" varchar(64) COLLATE "default",
"storage_location" varchar(64) COLLATE "default",
"vehicle_model" varchar(64) COLLATE "default",
"tranferstatus" int2,
"suppress_id" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_bg_suppress_vehicle" IS '边管--缉私案件--涉案车辆信息';
COMMENT ON COLUMN "public"."hq_bg_suppress_vehicle"."license_plate" IS '车牌';
COMMENT ON COLUMN "public"."hq_bg_suppress_vehicle"."storage_location" IS '存放地点';
COMMENT ON COLUMN "public"."hq_bg_suppress_vehicle"."vehicle_model" IS '车辆型号';
COMMENT ON COLUMN "public"."hq_bg_suppress_vehicle"."tranferstatus" IS '是否移交（1.移交）';
COMMENT ON COLUMN "public"."hq_bg_suppress_vehicle"."suppress_id" IS '涉案ID';

-- ----------------------------
-- Records of hq_bg_suppress_vehicle
-- ----------------------------
INSERT INTO "public"."hq_bg_suppress_vehicle" VALUES ('8', '桂A.454A1', '大队', '东风', '1', '51');
INSERT INTO "public"."hq_bg_suppress_vehicle" VALUES ('9', '湘G.562W1', '大队', '大运', '1', '51');
INSERT INTO "public"."hq_bg_suppress_vehicle" VALUES ('10', '个234kj', '健康度抵抗力', 'hhhh', '1', '52');

-- ----------------------------
-- Table structure for hq_login_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_login_log";
CREATE TABLE "public"."hq_login_log" (
"login_log_id" int8 DEFAULT nextval('bgxf_login_log_login_log_id_seq'::regclass) NOT NULL,
"party_member_id" int4,
"login_date_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_login_log" IS '登录日志';
COMMENT ON COLUMN "public"."hq_login_log"."party_member_id" IS '党员ID';
COMMENT ON COLUMN "public"."hq_login_log"."login_date_time" IS '登录时间';

-- ----------------------------
-- Records of hq_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for hq_manage_account
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_manage_account";
CREATE TABLE "public"."hq_manage_account" (
"maccount_id" int4 DEFAULT nextval('bgxf_manage_account_id_seq'::regclass) NOT NULL,
"maccount_name" varchar(30) COLLATE "default" NOT NULL,
"party_org_id" int8,
"mpassword" varchar(255) COLLATE "default" NOT NULL,
"mreal_name" varchar(60) COLLATE "default" DEFAULT NULL::character varying,
"is_use" int2,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"create_account_name" varchar(45) COLLATE "default" DEFAULT NULL::character varying,
"role_str" text COLLATE "default",
"last_ip" varchar(20) COLLATE "default",
"mobile_number" varchar(20) COLLATE "default",
"sort_num" int4 DEFAULT 0,
"view_org_id" int4,
"mpassword_change_time" timestamp(6) DEFAULT now() NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_manage_account" IS '管理员账户';
COMMENT ON COLUMN "public"."hq_manage_account"."maccount_name" IS '账户名';
COMMENT ON COLUMN "public"."hq_manage_account"."party_org_id" IS '所属组织ID';
COMMENT ON COLUMN "public"."hq_manage_account"."mpassword" IS '密码';
COMMENT ON COLUMN "public"."hq_manage_account"."mreal_name" IS '真实姓名';
COMMENT ON COLUMN "public"."hq_manage_account"."is_use" IS '是否启用（1、启用，0、禁用）';
COMMENT ON COLUMN "public"."hq_manage_account"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."hq_manage_account"."create_account_name" IS '创建改账户的账户名';
COMMENT ON COLUMN "public"."hq_manage_account"."role_str" IS '角色串';
COMMENT ON COLUMN "public"."hq_manage_account"."last_ip" IS '上次登录ip';
COMMENT ON COLUMN "public"."hq_manage_account"."mobile_number" IS '管理员手机号';
COMMENT ON COLUMN "public"."hq_manage_account"."sort_num" IS '排序号';
COMMENT ON COLUMN "public"."hq_manage_account"."view_org_id" IS '可见党组织（存父级组织ID）';
COMMENT ON COLUMN "public"."hq_manage_account"."mpassword_change_time" IS '密码修改时间';

-- ----------------------------
-- Records of hq_manage_account
-- ----------------------------
INSERT INTO "public"."hq_manage_account" VALUES ('12', 'demo', null, '$2y$10$fKnWBAq1hYucG8YGrQGSiOGO76YKs7jmS9gobQ3t930xIOED.1q4u', '超级管理员', '1', '2017-04-12 03:01:59', 'admin', null, '171.105.169.105', '', '1', null, '2017-05-08 11:21:45.73201');
INSERT INTO "public"."hq_manage_account" VALUES ('42', 'ceshi0002', '737', '$2y$10$LYnWyl/G58ZR/nlMhPmgouT/ZVXn85ViTlr6sTQCCiTQJPFjxn5bq', '测试_信息录入', '1', '2017-05-05 11:14:55', '超级管理员', null, '127.0.0.1', '1352323232', '0', null, '2017-05-10 09:57:27');
INSERT INTO "public"."hq_manage_account" VALUES ('70', 'slbad', '452', '$2y$10$6uw8.LDn4.5F2wVlmSWSC.qk3Cx5wVHlH88rTjTALinK6oTrPaY5C', '司令部_管理员', '1', '2017-05-22 15:45:00', '超级管理员', null, '0.0.0.0', '18267853425', '0', null, '2017-05-22 15:45:00');
INSERT INTO "public"."hq_manage_account" VALUES ('71', 'd1sad', '737', '$2y$10$C6iuyvqX.gcVA4R.jxBRrumbwYc8YWR6AVJu82Tuxctv4C6QmnTMi', 'D1所_管理员', '1', '2017-05-22 15:59:23', '超级管理员', null, '180.136.235.206', '18756784312', '0', null, '2017-05-22 15:59:23');
INSERT INTO "public"."hq_manage_account" VALUES ('72', 'd1sin', '737', '$2y$10$EOD7hiHDpMZ3LCIqb.WWJ.6U/XgVR6LBrYBjleFC.fQuz4h9dDdPS', 'D1所_信息录入员', '1', '2017-05-24 15:29:21', '超级管理员', null, '171.105.169.105', '13523237896', '0', null, '2017-05-24 15:29:21');
INSERT INTO "public"."hq_manage_account" VALUES ('73', 'dad', '735', '$2y$10$4Bv8H6J8Ce59k2a38.og1.YELYZdLKstgA0.4TJIvg3unmdrozUEK', 'D大队_管理员', '1', '2017-05-27 09:36:32', '超级管理员', null, '180.136.235.206', '', '0', null, '2017-05-27 09:36:32');
INSERT INTO "public"."hq_manage_account" VALUES ('74', 'd2sin', '738', '$2y$10$Bod09nKgtBhDWgJuwwoYFeTUrqUPWitYlbSj.01jgmuFYn9l.4BQe', 'D2所_信息录入员', '1', '2017-05-27 16:19:33', '超级管理员', null, '0.0.0.0', '', '1', null, '2017-05-27 16:19:33');
INSERT INTO "public"."hq_manage_account" VALUES ('75', 'd3sin', '739', '$2y$10$C4YaZ56yALGUytXOOb5cQebPvVBRFoFNMsN7v1Tpcgpyhzu7nL3fS', 'D3所_信息录入员', '1', '2017-05-27 16:20:34', '超级管理员', null, '127.0.0.1', '', '1', null, '2017-05-27 16:20:34');
INSERT INTO "public"."hq_manage_account" VALUES ('76', 'f1sin', '740', '$2y$10$rwgxQ2ToXhWFlfH8BVB.lOLAySfvgRp7L9iqAUcv.RtcfXuH55DTK', 'F1所_信息录入员', '1', '2017-05-27 16:22:12', '超级管理员', null, '113.16.141.178', '', '1', null, '2017-05-27 16:22:12');
INSERT INTO "public"."hq_manage_account" VALUES ('77', 'f2sin', '741', '$2y$10$Semcm0hNIKDw.M8BR1zMTudASior5Fs5KFNWrtznsfyzEga2eJzwa', 'F2所_信息录入员', '1', '2017-05-27 16:23:54', '超级管理员', null, '127.0.0.1', '', '1', null, '2017-05-27 16:23:54');
INSERT INTO "public"."hq_manage_account" VALUES ('78', 'd2sad', '738', '$2y$10$aUklDS07JVCisT12wPOKsuerSRK3Mia4SWH2jfWybKZovi3EGNJG6', 'D2所_管理员', '1', '2017-05-27 16:25:46', '超级管理员', null, null, '', '1', null, '2017-05-27 16:25:46');
INSERT INTO "public"."hq_manage_account" VALUES ('79', 'd3sad', '739', '$2y$10$I4pd9y/PHaZNyvZ4jM/0autBfWT63pP17bDHD3Qiy4F9IATCoPzqm', 'D3所_管理员', '1', '2017-05-27 16:30:23', '超级管理员', null, null, '', '1', null, '2017-05-27 16:30:23');
INSERT INTO "public"."hq_manage_account" VALUES ('80', 'dxad', '754', '$2y$10$k8iVhZDC59lJou5AwOtcvOo2mn4uioKme.ZawmjjEHxBDkcr4uTTu', 'qq', '1', '2017-06-02 16:28:28', '超级管理员', null, '0.0.0.0', '', '1', null, '2017-06-02 16:28:28');
INSERT INTO "public"."hq_manage_account" VALUES ('81', 'dadui', '734', '$2y$10$ZuB7vD.Ih48tkqqxWV9dKuimN56A2FU0d2EbqAMaQAuFHbzVJ8R9u', '大队管理员', '1', '2017-06-06 11:01:23', '超级管理员', null, '127.0.0.1', '13232323232', '1', null, '2017-06-06 11:01:23');
INSERT INTO "public"."hq_manage_account" VALUES ('82', 'dxjls', '754', '$2y$10$jNnvjSxc7OO6nqgUjtCXeuaSPiEIhbjL1T2DjDfwlvJX2RlKZqHQy', '东兴管理员', '1', '2017-06-06 11:03:19', '超级管理员', null, '127.0.0.1', '13535655655', '1', null, '2017-06-06 11:03:19');
INSERT INTO "public"."hq_manage_account" VALUES ('83', 'fad', '736', '$2y$10$mqcn3KHOcjSLWGkn.p8e1u5EBMGrNVsYIOngUiDCMsZgyeLdoRpjC', 'xczv', '1', '2017-06-06 17:28:47', '超级管理员', null, '0.0.0.0', '', '1', null, '2017-06-06 17:28:47');

-- ----------------------------
-- Table structure for hq_month
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_month";
CREATE TABLE "public"."hq_month" (
"month_id" int4 DEFAULT nextval('hq_month_month_id_seq'::regclass) NOT NULL,
"month_name" varchar(64) COLLATE "default",
"usefield" varchar(64) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_month" IS '月份';
COMMENT ON COLUMN "public"."hq_month"."month_name" IS '月份';

-- ----------------------------
-- Records of hq_month
-- ----------------------------
INSERT INTO "public"."hq_month" VALUES ('1', '1月', 'jan');
INSERT INTO "public"."hq_month" VALUES ('2', '2月', 'feb');
INSERT INTO "public"."hq_month" VALUES ('3', '3月', 'mar');
INSERT INTO "public"."hq_month" VALUES ('4', '4月', 'apr');
INSERT INTO "public"."hq_month" VALUES ('5', '5月', 'may');
INSERT INTO "public"."hq_month" VALUES ('6', '6月', 'jun');
INSERT INTO "public"."hq_month" VALUES ('7', '7月', 'jul');
INSERT INTO "public"."hq_month" VALUES ('8', '8月', 'aug');
INSERT INTO "public"."hq_month" VALUES ('9', '9月', 'sep');
INSERT INTO "public"."hq_month" VALUES ('10', '10月', 'oct');
INSERT INTO "public"."hq_month" VALUES ('11', '11月', 'nov');
INSERT INTO "public"."hq_month" VALUES ('12', '12月', 'dec');

-- ----------------------------
-- Table structure for hq_party_member
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_party_member";
CREATE TABLE "public"."hq_party_member" (
"party_member_id" int4 DEFAULT nextval('bgxf_party_member_party_member_id_seq'::regclass) NOT NULL,
"identity_card" varchar(18) COLLATE "default" DEFAULT NULL::character varying,
"password" varchar(64) COLLATE "default" DEFAULT NULL::character varying,
"name" varchar(45) COLLATE "default",
"mobile_num" varchar(11) COLLATE "default" NOT NULL,
"salary" numeric(9,2) DEFAULT NULL::numeric,
"last_login_time" timestamp(6),
"personal_integration" int4,
"party_membership_dues" numeric(7,2) DEFAULT NULL::numeric,
"create_time" timestamp(6) DEFAULT now() NOT NULL,
"alipay_account" varchar(50) COLLATE "default" DEFAULT NULL::character varying,
"weixin_account" varchar(50) COLLATE "default" DEFAULT NULL::character varying,
"baidu_channel_id" varchar(30) COLLATE "default" DEFAULT NULL::character varying,
"best_pay_account" varchar(30) COLLATE "default" DEFAULT NULL::character varying,
"role_str" varchar(30) COLLATE "default" DEFAULT NULL::character varying,
"sort_num" int4,
"sex" int2 DEFAULT 1,
"birthday" date,
"user_name" varchar(30) COLLATE "default",
"status" int2 DEFAULT 0 NOT NULL,
"register_type" int2 DEFAULT 0 NOT NULL,
"face_img_id" int8,
"view_org_id" int4,
"count_type" int2 DEFAULT 1 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_party_member" IS '党员';
COMMENT ON COLUMN "public"."hq_party_member"."party_member_id" IS '党员ID';
COMMENT ON COLUMN "public"."hq_party_member"."identity_card" IS '身份证';
COMMENT ON COLUMN "public"."hq_party_member"."password" IS '密码';
COMMENT ON COLUMN "public"."hq_party_member"."name" IS '姓名';
COMMENT ON COLUMN "public"."hq_party_member"."mobile_num" IS '手机号';
COMMENT ON COLUMN "public"."hq_party_member"."salary" IS '工资';
COMMENT ON COLUMN "public"."hq_party_member"."last_login_time" IS '最后登录时间';
COMMENT ON COLUMN "public"."hq_party_member"."personal_integration" IS '个人积分';
COMMENT ON COLUMN "public"."hq_party_member"."party_membership_dues" IS '党费';
COMMENT ON COLUMN "public"."hq_party_member"."create_time" IS '创建时间';
COMMENT ON COLUMN "public"."hq_party_member"."alipay_account" IS '支付宝账号';
COMMENT ON COLUMN "public"."hq_party_member"."weixin_account" IS '微信账号';
COMMENT ON COLUMN "public"."hq_party_member"."baidu_channel_id" IS '百度频道id';
COMMENT ON COLUMN "public"."hq_party_member"."best_pay_account" IS '翼支付账号';
COMMENT ON COLUMN "public"."hq_party_member"."role_str" IS '角色串';
COMMENT ON COLUMN "public"."hq_party_member"."sort_num" IS '排序号';
COMMENT ON COLUMN "public"."hq_party_member"."sex" IS '性别(1是男2是女)';
COMMENT ON COLUMN "public"."hq_party_member"."birthday" IS '生日';
COMMENT ON COLUMN "public"."hq_party_member"."user_name" IS '用户名';
COMMENT ON COLUMN "public"."hq_party_member"."status" IS '0未启用';
COMMENT ON COLUMN "public"."hq_party_member"."register_type" IS '0:管理员添加，1:自由注册';
COMMENT ON COLUMN "public"."hq_party_member"."face_img_id" IS '用户头像id';
COMMENT ON COLUMN "public"."hq_party_member"."view_org_id" IS '可见党组织id(与所属党组织不一样)';
COMMENT ON COLUMN "public"."hq_party_member"."count_type" IS '1：党员，0：其他';

-- ----------------------------
-- Records of hq_party_member
-- ----------------------------
INSERT INTO "public"."hq_party_member" VALUES ('24', '', '$2y$10$U7Jo8C3vNLzq8QXU.8DZbOy0MqeGsMq4O1E/SgdQ2B5HYoa4bTJT.', '李白', '123', '0.00', null, '0', '10.00', '2017-04-18 10:24:22', '', '', '', 'wd', null, '4', '1', '2017-04-12', 'libai', '1', '1', null, null, '1');
INSERT INTO "public"."hq_party_member" VALUES ('82', null, '$2y$10$lqJq4uAwv0wEsWocKtxZKumgRBv8jL9h26VQzic95Ipcd257AU.g6', '王小二', '123213', null, null, null, null, '2017-05-05 16:51:56', null, null, null, null, null, '0', '1', null, 'wx2', '0', '1', null, null, '1');
INSERT INTO "public"."hq_party_member" VALUES ('87', '', '$2y$10$U7Jo8C3vNLzq8QXU.8DZbOy0MqeGsMq4O1E/SgdQ2B5HYoa4bTJT.', '王武', '12332222', '0.00', null, '0', '0.00', '2017-05-08 09:37:28.598535', '', '', '', '', null, '222211', '1', null, 'wangwu', '2', '1', null, '17', '0');
INSERT INTO "public"."hq_party_member" VALUES ('100', '', '$2y$10$m2jJoGrTeqKi0P01HpLglu3DT.K9w3C9NVxeicsGciVURvyG1wFoe', '测试', '1809909970', '0.00', null, '0', '0.00', '2017-05-10 09:12:43', '', '', '', '', null, '222233', '0', null, 'ceshi', '1', '0', '694', '17', '1');
INSERT INTO "public"."hq_party_member" VALUES ('107', null, '$2y$10$Nq/lcLb6a0YbAOjGlJ32yeefa4Sd2gofeT1knLY71oPlkLDQtAmoG', '王小虎', '12313', null, null, null, null, '2017-05-10 17:22:23', null, null, null, null, null, '0', '1', null, 'wxh', '2', '1', null, '453', '1');
INSERT INTO "public"."hq_party_member" VALUES ('108', null, '$2y$10$fKnWBAq1hYucG8YGrQGSiOGO76YKs7jmS9gobQ3t930xIOED.1q4u', '李四', '18346574562', null, '2017-06-01 17:07:57', null, null, '2017-05-31 16:05:44', null, null, null, null, null, '0', '1', null, 'lisi', '1', '0', null, '737', '1');
INSERT INTO "public"."hq_party_member" VALUES ('109', null, '$2y$10$aWjnGUscKTOyCbrU0ZJaEOoWITGwLXpgJL4p3jQHIA4sCJCieIuHu', '黎明', '18923467783', null, null, null, null, '2017-05-31 16:07:13', null, null, null, null, null, '0', '1', null, 'liming', '1', '0', null, '735', '1');
INSERT INTO "public"."hq_party_member" VALUES ('110', null, '$2y$10$iKzncf632.CR2lSczdjnlOB3WFTJyvNG8cTzYsbTRHaG3ZxfSUfk6', '杨兰', '17812873546', null, null, null, null, '2017-05-31 16:08:22', null, null, null, null, null, '0', '0', null, 'yanglan', '1', '0', null, '735', '1');
INSERT INTO "public"."hq_party_member" VALUES ('111', null, '$2y$10$2H0C6n3LJ68mYMqkWFc6Ne/Ip7XlZyZ1CAIG0K1ja01O4S8h7y7e.', '宁历', '18721234567', null, null, null, null, '2017-05-31 16:09:31', null, null, null, null, null, '0', '1', null, 'ningli', '1', '0', null, '738', '1');

-- ----------------------------
-- Table structure for hq_party_member_approve
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_party_member_approve";
CREATE TABLE "public"."hq_party_member_approve" (
"id" int8 DEFAULT nextval('bgxf_party_member_approve_id_seq'::regclass) NOT NULL,
"party_member_id" int8,
"maccount_id" int4,
"level" int2 DEFAULT 1,
"status" int2 DEFAULT 0,
"content" text COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_party_member_approve" IS '党员注册审核';
COMMENT ON COLUMN "public"."hq_party_member_approve"."id" IS '编号';
COMMENT ON COLUMN "public"."hq_party_member_approve"."party_member_id" IS '用户ID';
COMMENT ON COLUMN "public"."hq_party_member_approve"."maccount_id" IS '审批人ID';
COMMENT ON COLUMN "public"."hq_party_member_approve"."level" IS '审批级别';
COMMENT ON COLUMN "public"."hq_party_member_approve"."status" IS '审批结果：0：未审核 1：审核通过 2：审核未通过 3：审核中';
COMMENT ON COLUMN "public"."hq_party_member_approve"."content" IS '不通过需要插入不通过理由';

-- ----------------------------
-- Records of hq_party_member_approve
-- ----------------------------

-- ----------------------------
-- Table structure for hq_party_member_info_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_party_member_info_data";
CREATE TABLE "public"."hq_party_member_info_data" (
"id" int8 DEFAULT nextval('user_info_dataid_seq'::regclass) NOT NULL,
"party_member_id" int4 NOT NULL,
"field_id" int4 NOT NULL,
"data" text COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_party_member_info_data" IS '用户属性值表';
COMMENT ON COLUMN "public"."hq_party_member_info_data"."id" IS '主键';
COMMENT ON COLUMN "public"."hq_party_member_info_data"."party_member_id" IS '用户id';
COMMENT ON COLUMN "public"."hq_party_member_info_data"."field_id" IS '属性id';
COMMENT ON COLUMN "public"."hq_party_member_info_data"."data" IS '属性值';

-- ----------------------------
-- Records of hq_party_member_info_data
-- ----------------------------

-- ----------------------------
-- Table structure for hq_party_member_info_field
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_party_member_info_field";
CREATE TABLE "public"."hq_party_member_info_field" (
"field_id" int4 DEFAULT nextval('user_info_fieldid_seq'::regclass) NOT NULL,
"field_name" text COLLATE "default" NOT NULL,
"default_data" text COLLATE "default" NOT NULL,
"description" text COLLATE "default" NOT NULL,
"params" text COLLATE "default" NOT NULL,
"status" int2 NOT NULL,
"visible" int2 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_party_member_info_field" IS '用户属性表';
COMMENT ON COLUMN "public"."hq_party_member_info_field"."field_id" IS '属性id（主键）';
COMMENT ON COLUMN "public"."hq_party_member_info_field"."field_name" IS '属性名称';
COMMENT ON COLUMN "public"."hq_party_member_info_field"."default_data" IS '属性默认值';
COMMENT ON COLUMN "public"."hq_party_member_info_field"."description" IS '属性描述';
COMMENT ON COLUMN "public"."hq_party_member_info_field"."params" IS '属性值';
COMMENT ON COLUMN "public"."hq_party_member_info_field"."status" IS '属性状态（1、可用，0、禁用）';
COMMENT ON COLUMN "public"."hq_party_member_info_field"."visible" IS '是否可见（1、可见，0、不可见）';

-- ----------------------------
-- Records of hq_party_member_info_field
-- ----------------------------

-- ----------------------------
-- Table structure for hq_party_member_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_party_member_org";
CREATE TABLE "public"."hq_party_member_org" (
"id" int4 DEFAULT nextval('bgxf_party_authorized_orgid_seq'::regclass) NOT NULL,
"party_org_id" int4 NOT NULL,
"party_member_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_party_member_org" IS '用户所属组织表';
COMMENT ON COLUMN "public"."hq_party_member_org"."id" IS '主键';
COMMENT ON COLUMN "public"."hq_party_member_org"."party_org_id" IS '组织id';

-- ----------------------------
-- Records of hq_party_member_org
-- ----------------------------
INSERT INTO "public"."hq_party_member_org" VALUES ('192', '454', '87');
INSERT INTO "public"."hq_party_member_org" VALUES ('198', '715', '100');
INSERT INTO "public"."hq_party_member_org" VALUES ('206', '453', '107');
INSERT INTO "public"."hq_party_member_org" VALUES ('207', '737', '108');
INSERT INTO "public"."hq_party_member_org" VALUES ('208', '735', '109');
INSERT INTO "public"."hq_party_member_org" VALUES ('209', '735', '110');
INSERT INTO "public"."hq_party_member_org" VALUES ('210', '738', '111');

-- ----------------------------
-- Table structure for hq_party_member_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_party_member_role";
CREATE TABLE "public"."hq_party_member_role" (
"role_id" int4 DEFAULT nextval('bgxf_party_member_role_id_seq'::regclass) NOT NULL,
"id" int4 DEFAULT nextval('bgxf_party_member_role_id_seq'::regclass) NOT NULL,
"party_member_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_party_member_role" IS '党员关联角色';
COMMENT ON COLUMN "public"."hq_party_member_role"."role_id" IS '角色ID';

-- ----------------------------
-- Records of hq_party_member_role
-- ----------------------------

-- ----------------------------
-- Table structure for hq_party_member_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_party_member_role_privilege";
CREATE TABLE "public"."hq_party_member_role_privilege" (
"role_id" int4 DEFAULT nextval('bgxf_party_member_role_privilege_id_seq'::regclass) NOT NULL,
"privilege_id" int4 NOT NULL,
"id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_party_member_role_privilege" IS '党员角色和权限关联';
COMMENT ON COLUMN "public"."hq_party_member_role_privilege"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."hq_party_member_role_privilege"."privilege_id" IS '权限ID';

-- ----------------------------
-- Records of hq_party_member_role_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for hq_party_org
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_party_org";
CREATE TABLE "public"."hq_party_org" (
"party_org_id" int4 DEFAULT nextval('bgxf_party_org_party_org_id_seq'::regclass) NOT NULL,
"party_type_id" int4,
"party_org_name" varchar(50) COLLATE "default" NOT NULL,
"pay_sign" int2 NOT NULL,
"app_menu" text COLLATE "default",
"lft" int4,
"rgt" int4,
"address_id" int4,
"level" int4,
"rank" int4,
"parent_org_id" int4,
"party_org_number" int8,
"party_org_level" int2
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_party_org" IS '党组织';
COMMENT ON COLUMN "public"."hq_party_org"."party_org_id" IS '党组织ID';
COMMENT ON COLUMN "public"."hq_party_org"."party_type_id" IS '党组织类型ID';
COMMENT ON COLUMN "public"."hq_party_org"."party_org_name" IS '党组织名称';
COMMENT ON COLUMN "public"."hq_party_org"."pay_sign" IS '可支付标识';
COMMENT ON COLUMN "public"."hq_party_org"."app_menu" IS '可见APP栏目';
COMMENT ON COLUMN "public"."hq_party_org"."address_id" IS '归属地';
COMMENT ON COLUMN "public"."hq_party_org"."rank" IS '排序';
COMMENT ON COLUMN "public"."hq_party_org"."parent_org_id" IS '父组织id';
COMMENT ON COLUMN "public"."hq_party_org"."party_org_number" IS '编码';
COMMENT ON COLUMN "public"."hq_party_org"."party_org_level" IS '党组织等级';

-- ----------------------------
-- Records of hq_party_org
-- ----------------------------
INSERT INTO "public"."hq_party_org" VALUES ('17', null, '支队', '0', '', '1', '82', null, '1', '1', '-1', '4500000000', null);
INSERT INTO "public"."hq_party_org" VALUES ('452', '1', '司令部', '0', null, '6', '73', null, '2', '1000', '17', '4501000000', null);
INSERT INTO "public"."hq_party_org" VALUES ('453', null, '办公室', '0', null, '71', '72', null, '3', '1', '452', '4501010000', null);
INSERT INTO "public"."hq_party_org" VALUES ('454', null, '政治处', '0', null, '4', '5', null, '2', '900', '17', '4502000000', null);
INSERT INTO "public"."hq_party_org" VALUES ('455', null, '后勤处', '0', null, '2', '3', null, '2', null, '17', '4503000000', null);
INSERT INTO "public"."hq_party_org" VALUES ('715', '1', '指挥中心', '0', null, '69', '70', null, '3', '1', '452', '4501020000', null);
INSERT INTO "public"."hq_party_org" VALUES ('721', null, '情报侦查科', '0', null, '67', '68', null, '3', '1', '452', '4501050000', null);
INSERT INTO "public"."hq_party_org" VALUES ('722', null, '警务训练科', '0', null, '65', '66', null, '3', '1', '452', '4501030000', null);
INSERT INTO "public"."hq_party_org" VALUES ('723', null, '边境管理科', '0', null, '63', '64', null, '3', '1', '452', '4501040000', null);
INSERT INTO "public"."hq_party_org" VALUES ('724', null, '法制科', '0', null, '61', '62', null, '3', '1', '452', '4501060000', null);
INSERT INTO "public"."hq_party_org" VALUES ('725', null, '信息化科', '0', null, '59', '60', null, '3', '1', '452', '4501070000', null);
INSERT INTO "public"."hq_party_org" VALUES ('726', null, '机要科', '0', null, '57', '58', null, '3', '1', '452', '4501080000', null);
INSERT INTO "public"."hq_party_org" VALUES ('727', null, '边防检查科', '0', null, '55', '56', null, '3', '1', '452', '4501090000', null);
INSERT INTO "public"."hq_party_org" VALUES ('728', null, '侦查队', '0', null, '53', '54', null, '3', '1', '452', '4501100000', null);
INSERT INTO "public"."hq_party_org" VALUES ('729', null, '训练基地', '0', null, '51', '52', null, '3', '1', '452', '4501110000', null);
INSERT INTO "public"."hq_party_org" VALUES ('730', null, '公司', '0', null, '49', '50', null, '3', '1', '452', '4501120000', null);
INSERT INTO "public"."hq_party_org" VALUES ('734', null, '大队', '0', null, '7', '48', null, '3', '1', '452', '4501130000', null);
INSERT INTO "public"."hq_party_org" VALUES ('735', null, 'D大队', '0', null, '40', '47', null, '4', '1', '734', '4501130100', null);
INSERT INTO "public"."hq_party_org" VALUES ('736', null, 'F大队', '0', null, '32', '39', null, '4', '1', '734', '4501130200', null);
INSERT INTO "public"."hq_party_org" VALUES ('737', null, 'D1所', '0', null, '45', '46', null, '5', '1', '735', '0', null);
INSERT INTO "public"."hq_party_org" VALUES ('738', null, 'D2所', '0', null, '43', '44', null, '5', '1', '735', '0', null);
INSERT INTO "public"."hq_party_org" VALUES ('739', null, 'D3所', '0', null, '41', '42', null, '5', '1', '735', '0', null);
INSERT INTO "public"."hq_party_org" VALUES ('740', null, 'F1所', '0', null, '37', '38', null, '5', '1', '736', '0', null);
INSERT INTO "public"."hq_party_org" VALUES ('741', null, 'F2所', '0', null, '35', '36', null, '5', '1', '736', '0', null);
INSERT INTO "public"."hq_party_org" VALUES ('742', null, 'F3所', '0', null, '33', '34', null, '5', '1', '736', '0', null);
INSERT INTO "public"."hq_party_org" VALUES ('743', null, 'G大队', '0', null, '26', '31', null, '4', '1', '734', '4501130300', null);
INSERT INTO "public"."hq_party_org" VALUES ('744', null, 'J大队', '0', null, '20', '25', null, '4', '1', '734', '4501130400', null);
INSERT INTO "public"."hq_party_org" VALUES ('745', null, 'G1所', '0', null, '29', '30', null, '5', '1', '743', null, null);
INSERT INTO "public"."hq_party_org" VALUES ('746', null, 'J1所', '0', null, '23', '24', null, '5', '1', '744', null, null);
INSERT INTO "public"."hq_party_org" VALUES ('747', null, 'D站', '0', null, '12', '19', null, '4', '1', '734', '4501130500', null);
INSERT INTO "public"."hq_party_org" VALUES ('748', null, '检查科', '0', null, '17', '18', null, '5', '1', '747', '0', null);
INSERT INTO "public"."hq_party_org" VALUES ('749', null, '办公室', '0', null, '15', '16', null, '5', '1', '747', null, null);
INSERT INTO "public"."hq_party_org" VALUES ('750', null, '情报科', '0', null, '13', '14', null, '5', '1', '747', null, null);
INSERT INTO "public"."hq_party_org" VALUES ('751', null, 'G2所', '0', null, '27', '28', null, '5', '1', '743', null, null);
INSERT INTO "public"."hq_party_org" VALUES ('752', null, 'J2所', '0', null, '21', '22', null, '5', '1', '744', '0', null);
INSERT INTO "public"."hq_party_org" VALUES ('753', null, '勤务中队', '0', null, '10', '11', null, '4', '1', '734', '4501130001', null);
INSERT INTO "public"."hq_party_org" VALUES ('754', null, '东兴拘留所', '0', null, '8', '9', null, '4', '1', '734', '4501130002', null);

-- ----------------------------
-- Table structure for hq_party_org_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_party_org_type";
CREATE TABLE "public"."hq_party_org_type" (
"party_type_id" int4 DEFAULT nextval('bgxf_party_org_type_party_type_id_seq'::regclass) NOT NULL,
"party_name" varchar(45) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_party_org_type" IS '党组织类型';
COMMENT ON COLUMN "public"."hq_party_org_type"."party_type_id" IS '党组织类型ID';
COMMENT ON COLUMN "public"."hq_party_org_type"."party_name" IS '党组织名称';

-- ----------------------------
-- Records of hq_party_org_type
-- ----------------------------
INSERT INTO "public"."hq_party_org_type" VALUES ('1', '党委');
INSERT INTO "public"."hq_party_org_type" VALUES ('2', '党总支');
INSERT INTO "public"."hq_party_org_type" VALUES ('3', '党支部');
INSERT INTO "public"."hq_party_org_type" VALUES ('4', '党小组');

-- ----------------------------
-- Table structure for hq_party_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_party_role";
CREATE TABLE "public"."hq_party_role" (
"role_id" int4 DEFAULT nextval('bgxf_party_role_role_id_seq'::regclass) NOT NULL,
"role_name" varchar(45) COLLATE "default" NOT NULL,
"sort_num" int4,
"party_role_type_id" int4,
"role_description" varchar(255) COLLATE "default",
"role_status" int2
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_party_role" IS '党员角色';
COMMENT ON COLUMN "public"."hq_party_role"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."hq_party_role"."role_name" IS '角色名称';
COMMENT ON COLUMN "public"."hq_party_role"."sort_num" IS '排序号';
COMMENT ON COLUMN "public"."hq_party_role"."party_role_type_id" IS '角色类型';
COMMENT ON COLUMN "public"."hq_party_role"."role_description" IS '角色描述';
COMMENT ON COLUMN "public"."hq_party_role"."role_status" IS '角色状态（1：启用；2：禁用）';

-- ----------------------------
-- Records of hq_party_role
-- ----------------------------
INSERT INTO "public"."hq_party_role" VALUES ('37', '普通战士', '0', '1', '基层战士', '1');
INSERT INTO "public"."hq_party_role" VALUES ('38', '站长', '0', '2', '基层站长', '1');
INSERT INTO "public"."hq_party_role" VALUES ('39', '所长', '0', '2', '基层所长', '1');
INSERT INTO "public"."hq_party_role" VALUES ('40', '大队长', '0', '2', '大队队长', '1');
INSERT INTO "public"."hq_party_role" VALUES ('41', '部长', '0', '2', '部长', '1');

-- ----------------------------
-- Table structure for hq_party_role_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_party_role_type";
CREATE TABLE "public"."hq_party_role_type" (
"party_role_type_id" int4 DEFAULT nextval('bgxf_party_role_type_party_role_type_id_seq'::regclass) NOT NULL,
"party_role_type_name" varchar(45) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_party_role_type" IS '党员角色类型';
COMMENT ON COLUMN "public"."hq_party_role_type"."party_role_type_id" IS '角色类型ID';
COMMENT ON COLUMN "public"."hq_party_role_type"."party_role_type_name" IS '角色类型名';

-- ----------------------------
-- Records of hq_party_role_type
-- ----------------------------
INSERT INTO "public"."hq_party_role_type" VALUES ('1', '基层人员');
INSERT INTO "public"."hq_party_role_type" VALUES ('2', '干部');
INSERT INTO "public"."hq_party_role_type" VALUES ('3', '领导');

-- ----------------------------
-- Table structure for hq_privilege_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_privilege_menu";
CREATE TABLE "public"."hq_privilege_menu" (
"privilege_type_id" int4 DEFAULT nextval('bgxf_privilege_menu_id_seq'::regclass) NOT NULL,
"menu_id" int4 NOT NULL,
"id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_privilege_menu" IS '权限菜单';
COMMENT ON COLUMN "public"."hq_privilege_menu"."privilege_type_id" IS '权限ID';
COMMENT ON COLUMN "public"."hq_privilege_menu"."menu_id" IS '菜单ID';

-- ----------------------------
-- Records of hq_privilege_menu
-- ----------------------------

-- ----------------------------
-- Table structure for hq_privilege_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_privilege_type";
CREATE TABLE "public"."hq_privilege_type" (
"privilege_type_id" int4 DEFAULT nextval('bgxf_privilege_type_privilege_type_id_seq'::regclass) NOT NULL,
"privilege_type_name" varchar(45) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_privilege_type" IS '权限';
COMMENT ON COLUMN "public"."hq_privilege_type"."privilege_type_id" IS '权限类型ID';
COMMENT ON COLUMN "public"."hq_privilege_type"."privilege_type_name" IS '权限类型名';

-- ----------------------------
-- Records of hq_privilege_type
-- ----------------------------

-- ----------------------------
-- Table structure for hq_resource_library
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_resource_library";
CREATE TABLE "public"."hq_resource_library" (
"resource_id" int8 DEFAULT nextval('bgxf_resource_library_resource_id_seq'::regclass) NOT NULL,
"maccount_id" int4,
"resource_type" varchar(50) COLLATE "default" DEFAULT NULL::character varying,
"resource_path" text COLLATE "default" NOT NULL,
"resource_name" varchar(100) COLLATE "default" DEFAULT NULL::character varying,
"resource_content" varchar(255) COLLATE "default" DEFAULT NULL::character varying,
"upload_time" timestamp(6) DEFAULT now() NOT NULL,
"resource_hash_name" varchar(255) COLLATE "default" NOT NULL,
"size" int4,
"resource_thumb_path" text COLLATE "default",
"party_member_id" int4
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_resource_library" IS '资源库';
COMMENT ON COLUMN "public"."hq_resource_library"."resource_id" IS '资源ID';
COMMENT ON COLUMN "public"."hq_resource_library"."maccount_id" IS '上传的管理员账户名';
COMMENT ON COLUMN "public"."hq_resource_library"."resource_type" IS '资源类型';
COMMENT ON COLUMN "public"."hq_resource_library"."resource_path" IS '路径';
COMMENT ON COLUMN "public"."hq_resource_library"."resource_name" IS '名称';
COMMENT ON COLUMN "public"."hq_resource_library"."resource_content" IS '内容';
COMMENT ON COLUMN "public"."hq_resource_library"."upload_time" IS '上传时间';
COMMENT ON COLUMN "public"."hq_resource_library"."resource_hash_name" IS '哈希名';
COMMENT ON COLUMN "public"."hq_resource_library"."size" IS '大小';
COMMENT ON COLUMN "public"."hq_resource_library"."party_member_id" IS '党员id（党员之家上传图片）';

-- ----------------------------
-- Records of hq_resource_library
-- ----------------------------
INSERT INTO "public"."hq_resource_library" VALUES ('508', '12', 'jpg', '/upload/20170502/5e6077ccf6e053b9c4f8e807ba307ca0.jpg', '1.jpg', null, '2017-05-02 15:30:12', '5e6077ccf6e053b9c4f8e807ba307ca0.jpg', '34421', '/upload/20170502/thumb/5e6077ccf6e053b9c4f8e807ba307ca0.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('509', '12', 'jpg', '/upload/20170502/254949e6d22e5ac684f331e1ee38eaba.jpg', '2.jpg', null, '2017-05-02 15:30:31', '254949e6d22e5ac684f331e1ee38eaba.jpg', '39140', '/upload/20170502/thumb/254949e6d22e5ac684f331e1ee38eaba.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('510', '12', 'jpg', '/upload/20170502/e0d49767bf573aebdf2611dd82bba580.jpg', '3.jpg', null, '2017-05-02 15:31:20', 'e0d49767bf573aebdf2611dd82bba580.jpg', '35147', '/upload/20170502/thumb/e0d49767bf573aebdf2611dd82bba580.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('511', '12', 'jpg', '/upload/20170502/65bf93b1d2639a7ecd34be6fec041723.jpg', '4.jpg', null, '2017-05-02 15:31:45', '65bf93b1d2639a7ecd34be6fec041723.jpg', '39361', '/upload/20170502/thumb/65bf93b1d2639a7ecd34be6fec041723.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('512', '12', 'jpg', '/upload/20170502/6625360d5302f34efca04ee7ca3714f4.jpg', '5.jpg', null, '2017-05-02 15:32:09', '6625360d5302f34efca04ee7ca3714f4.jpg', '38171', '/upload/20170502/thumb/6625360d5302f34efca04ee7ca3714f4.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('513', '12', 'png', '/upload/20170502/ac38fce17f38f90623e158779fa5c3d6.png', '党建工作.png', null, '2017-05-02 16:15:00', 'ac38fce17f38f90623e158779fa5c3d6.png', '2684', '/upload/20170502/thumb/ac38fce17f38f90623e158779fa5c3d6.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('514', null, 'png', '/upload/20170502/b81064d759223f93336cd6f6de52760a.png', 'ic_la.png', null, '2017-05-02 16:21:28.724809', 'b81064d759223f93336cd6f6de52760a', '7581', '/upload/20170502/thumb/b81064d759223f93336cd6f6de52760a.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('515', '12', 'mp4', '/upload/20170502/7da12dfcbc37b1d2be7347c2de09bba8.mp4', '3.mp4', null, '2017-05-02 16:32:45', '7da12dfcbc37b1d2be7347c2de09bba8.mp4', '192381342', null, null);
INSERT INTO "public"."hq_resource_library" VALUES ('516', null, 'png', '/upload/20170502/aa169f6743f1cca1767980930742e10c.png', 'ic_la.png', null, '2017-05-02 16:39:43.698026', 'aa169f6743f1cca1767980930742e10c', '7581', '/upload/20170502/thumb/aa169f6743f1cca1767980930742e10c.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('517', null, 'png', '/upload/20170502/8e948f16e0a247d4b50d66c5441f9086.png', 'gov.png', null, '2017-05-02 17:15:54.323265', '8e948f16e0a247d4b50d66c5441f9086', '9005', '/upload/20170502/thumb/8e948f16e0a247d4b50d66c5441f9086.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('520', null, 'png', '/upload/20170502/f372df2613679573f2d6486bf6dc5f33.png', 'ic_la.png', null, '2017-05-02 17:32:02.977081', 'f372df2613679573f2d6486bf6dc5f33', '7581', '/upload/20170502/thumb/f372df2613679573f2d6486bf6dc5f33.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('524', null, 'jpg', '/upload/20170502/8eadc27149991dff1d233746af75f19f.jpg', '1.jpg', null, '2017-05-02 17:44:08', '8eadc27149991dff1d233746af75f19f.jpg', '34421', '/upload/20170502/thumb/8eadc27149991dff1d233746af75f19f.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('525', null, 'jpg', '/upload/20170502/45f90f44b4037c85dc09f6b24f008bc2.jpg', '2.jpg', null, '2017-05-02 17:44:23', '45f90f44b4037c85dc09f6b24f008bc2.jpg', '39140', '/upload/20170502/thumb/45f90f44b4037c85dc09f6b24f008bc2.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('526', null, 'jpg', '/upload/20170502/61503c77d44f43727b9efe288033323c.jpg', '5.jpg', null, '2017-05-02 17:44:39', '61503c77d44f43727b9efe288033323c.jpg', '38171', '/upload/20170502/thumb/61503c77d44f43727b9efe288033323c.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('527', null, 'jpg', '/upload/20170502/d52d3e5feacbf9707aaa8523df1657e3.jpg', '3.jpg', null, '2017-05-02 17:45:04', 'd52d3e5feacbf9707aaa8523df1657e3.jpg', '35147', '/upload/20170502/thumb/d52d3e5feacbf9707aaa8523df1657e3.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('528', null, 'png', '/upload/20170502/6bd4475488f797f21df776d1f3ca640c.png', 'gov.png', null, '2017-05-02 17:59:26.778918', '6bd4475488f797f21df776d1f3ca640c', '9005', '/upload/20170502/thumb/6bd4475488f797f21df776d1f3ca640c.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('530', '12', 'png', '/upload/20170502/bce966e731258bcd6ce5dcdfc00f0411.png', '学习 (1).png', null, '2017-05-02 18:00:44', 'bce966e731258bcd6ce5dcdfc00f0411.png', '2299', '/upload/20170502/thumb/bce966e731258bcd6ce5dcdfc00f0411.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('531', '12', 'png', '/upload/20170502/97e44b859e68fe790c33c915a5c6a053.png', '学习 (1).png', null, '2017-05-02 18:00:51', '97e44b859e68fe790c33c915a5c6a053.png', '2299', '/upload/20170502/thumb/97e44b859e68fe790c33c915a5c6a053.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('532', '12', 'png', '/upload/20170502/44f2e922aa4343f80b7fc787dfeac874.png', '1478436878671.png', null, '2017-05-02 18:01:41', '44f2e922aa4343f80b7fc787dfeac874.png', '392', '/upload/20170502/thumb/44f2e922aa4343f80b7fc787dfeac874.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('533', '12', 'jpg', '/upload/20170502/742c28e4f33a3cb973a0855924167070.jpg', '1478436881343.jpg', null, '2017-05-02 18:03:54', '742c28e4f33a3cb973a0855924167070.jpg', '13144', '/upload/20170502/thumb/742c28e4f33a3cb973a0855924167070.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('534', '12', 'png', '/upload/20170502/2e83981a596ed379e955afbbadad1e89.png', '学习 (1).png', null, '2017-05-02 18:06:16', '2e83981a596ed379e955afbbadad1e89.png', '2299', '/upload/20170502/thumb/2e83981a596ed379e955afbbadad1e89.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('535', '12', 'jpg', '/upload/20170502/90de3b137625c96d45f9fa1bf81e7a59.jpg', '1478436881343.jpg', null, '2017-05-02 18:08:23', '90de3b137625c96d45f9fa1bf81e7a59.jpg', '13144', '/upload/20170502/thumb/90de3b137625c96d45f9fa1bf81e7a59.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('536', '12', 'jpg', '/upload/20170502/72466a5c0695c3ba560cdea79d552d3c.jpg', '1478436881343.jpg', null, '2017-05-02 18:08:52', '72466a5c0695c3ba560cdea79d552d3c.jpg', '13144', '/upload/20170502/thumb/72466a5c0695c3ba560cdea79d552d3c.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('537', '12', 'png', '/upload/20170502/1e4188e82806dbb784900a5a2c7946d5.png', '学习 (1).png', null, '2017-05-02 18:21:26', '1e4188e82806dbb784900a5a2c7946d5.png', '2299', '/upload/20170502/thumb/1e4188e82806dbb784900a5a2c7946d5.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('538', '12', 'png', '/upload/20170502/c67132c7b4e302bcf088a2726de91eb9.png', '扶贫云.png', null, '2017-05-02 18:21:33', 'c67132c7b4e302bcf088a2726de91eb9.png', '3312', '/upload/20170502/thumb/c67132c7b4e302bcf088a2726de91eb9.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('539', '12', 'png', '/upload/20170502/c42d7bdf2d2e5fe35c7a8d6934066690.png', '电商扶贫.png', null, '2017-05-02 18:21:42', 'c42d7bdf2d2e5fe35c7a8d6934066690.png', '1205', '/upload/20170502/thumb/c42d7bdf2d2e5fe35c7a8d6934066690.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('540', '12', 'png', '/upload/20170502/6795cca70712a1730e8f5f88d5fb207f.png', '农事.png', null, '2017-05-02 18:21:56', '6795cca70712a1730e8f5f88d5fb207f.png', '3252', '/upload/20170502/thumb/6795cca70712a1730e8f5f88d5fb207f.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('541', null, 'jpg', '/upload/20170502/51871584af1c59485bbae9023f76a2c6.jpg', 'd5f6b97cd8842b5.jpg', null, '2017-05-02 18:43:09.981972', '51871584af1c59485bbae9023f76a2c6', '20706', '/upload/20170502/thumb/51871584af1c59485bbae9023f76a2c6.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('542', null, 'jpg', '/upload/20170502/161d37408a5f76fa22726dc8414c3dd2.jpg', 'd5f6b97cd8842b5.jpg', null, '2017-05-02 18:45:18.854917', '161d37408a5f76fa22726dc8414c3dd2', '20706', '/upload/20170502/thumb/161d37408a5f76fa22726dc8414c3dd2.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('543', null, 'jpg', '/upload/20170502/6602e36c3fd6b75c282c19cda1d25ba2.jpg', 'd5f6b97cd8842b5.jpg', null, '2017-05-02 18:48:55.703957', '6602e36c3fd6b75c282c19cda1d25ba2', '20706', '/upload/20170502/thumb/6602e36c3fd6b75c282c19cda1d25ba2.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('544', null, 'jpg', '/upload/20170502/6864638f415c643eec54bc4ddbfa4332.jpg', 'd5f6b97cd8842b5.jpg', null, '2017-05-02 18:49:26.174924', '6864638f415c643eec54bc4ddbfa4332', '20706', '/upload/20170502/thumb/6864638f415c643eec54bc4ddbfa4332.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('545', null, 'jpg', '/upload/20170502/a82bcd84c56ae92354bcd70b80991fd7.jpg', 'd5f6b97cd8842b5.jpg', null, '2017-05-02 18:52:39.830062', 'a82bcd84c56ae92354bcd70b80991fd7', '20706', '/upload/20170502/thumb/a82bcd84c56ae92354bcd70b80991fd7.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('546', null, 'jpg', '/upload/20170502/5995e3bdf580e8ff172a32f77157304d.jpg', 'd5f6b97cd8842b5.jpg', null, '2017-05-02 18:52:44.614962', '5995e3bdf580e8ff172a32f77157304d', '20706', '/upload/20170502/thumb/5995e3bdf580e8ff172a32f77157304d.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('547', null, 'jpg', '/upload/20170502/677b2035909ae669f3de279ddd2ef000.jpg', 'cd6aae0f77e0fde.jpg', null, '2017-05-02 18:52:45.930923', '677b2035909ae669f3de279ddd2ef000', '465392', '/upload/20170502/thumb/677b2035909ae669f3de279ddd2ef000.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('548', null, 'jpg', '/upload/20170502/365514514402320fde9eb23cbcf387be.jpg', 'cd6aae0f77e0fde.jpg', null, '2017-05-02 18:52:46.002938', '365514514402320fde9eb23cbcf387be', '465392', '/upload/20170502/thumb/365514514402320fde9eb23cbcf387be.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('549', null, 'jpg', '/upload/20170502/39b1c6ef8338b762f9d7a75e2105855e.jpg', 'd5f6b97cd8842b5.jpg', null, '2017-05-02 18:53:29.705433', '39b1c6ef8338b762f9d7a75e2105855e', '20706', '/upload/20170502/thumb/39b1c6ef8338b762f9d7a75e2105855e.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('550', null, 'jpg', '/upload/20170502/09f2e38991e340097f643531f40b7b1d.jpg', 'd5f6b97cd8842b5.jpg', null, '2017-05-02 18:53:35.163638', '09f2e38991e340097f643531f40b7b1d', '20706', '/upload/20170502/thumb/09f2e38991e340097f643531f40b7b1d.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('551', null, 'jpg', '/upload/20170502/63068ea6dd8f10fc17a9e83341cec079.jpg', 'd5f6b97cd8842b5.jpg', null, '2017-05-02 18:53:50.42293', '63068ea6dd8f10fc17a9e83341cec079', '20706', '/upload/20170502/thumb/63068ea6dd8f10fc17a9e83341cec079.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('552', null, 'jpg', '/upload/20170502/14d6ce6d9b79fdaea255bfa9591fa9b1.jpg', 'd5f6b97cd8842b5.jpg', null, '2017-05-02 18:55:05.42123', '14d6ce6d9b79fdaea255bfa9591fa9b1', '20706', '/upload/20170502/thumb/14d6ce6d9b79fdaea255bfa9591fa9b1.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('553', '12', 'png', '/upload/20170502/304247b6644741817370fa1410868353.png', '讲话.png', null, '2017-05-02 21:02:58', '304247b6644741817370fa1410868353.png', '763278', '/upload/20170502/thumb/304247b6644741817370fa1410868353.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('554', '12', 'jpg', '/upload/20170502/36b53eded0be0affed443bde9ae4e90f.jpg', '红色传奇1套.jpg', null, '2017-05-02 21:17:06', '36b53eded0be0affed443bde9ae4e90f.jpg', '111767', '/upload/20170502/thumb/36b53eded0be0affed443bde9ae4e90f.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('555', null, 'png', '/upload/20170502/6158e710d0891682fb2a6dc39a593367.png', 'ic_la.png', null, '2017-05-02 21:41:59.111661', '6158e710d0891682fb2a6dc39a593367', '7581', '/upload/20170502/thumb/6158e710d0891682fb2a6dc39a593367.png', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('556', '12', 'exe', '/upload/20170502/ab88221e5709900951fc24e183f7d58e.exe', 'QQMusic.exe', null, '2017-05-02 21:53:56', 'ab88221e5709900951fc24e183f7d58e.exe', '460904', null, null);
INSERT INTO "public"."hq_resource_library" VALUES ('557', null, 'jpg', '/upload/20170502/cae834e23b3a88af96db2086bfca1301.jpg', '$PYXT$S7OGTUC_M)_9KZ[{M.jpg', null, '2017-05-02 22:11:55', 'cae834e23b3a88af96db2086bfca1301.jpg', '18251', '/upload/20170502/thumb/cae834e23b3a88af96db2086bfca1301.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('558', null, 'jpg', '/upload/20170502/a9ec5455d56d8d64a92db1c00ef5d21b.jpg', '%LY(S]`2O0NAY5JA)[{34O0.jpg', null, '2017-05-02 22:12:00', 'a9ec5455d56d8d64a92db1c00ef5d21b.jpg', '304431', '/upload/20170502/thumb/a9ec5455d56d8d64a92db1c00ef5d21b.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('559', null, 'jpg', '/upload/20170502/2a1c7f44d5af803b4df161ee01d72bd9.jpg', '%9YO(7K3KY@T3}SU$8IQUV8.jpg', null, '2017-05-02 22:12:05', '2a1c7f44d5af803b4df161ee01d72bd9.jpg', '94927', '/upload/20170502/thumb/2a1c7f44d5af803b4df161ee01d72bd9.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('560', null, 'png', '/upload/20170502/bb893588127dee53f589126eefed2afe.png', '@2YE09ED)VG]O5A$[D9O24K.png', null, '2017-05-02 22:12:19', 'bb893588127dee53f589126eefed2afe.png', '10377', '/upload/20170502/thumb/bb893588127dee53f589126eefed2afe.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('561', null, 'gif', '/upload/20170502/4df95d28ddf867721d57cd4b5b30b87c.gif', ']2U3UBYGI1HC6HBQG3J7V5H.gif', null, '2017-05-02 22:12:27', '4df95d28ddf867721d57cd4b5b30b87c.gif', '2087', '/upload/20170502/thumb/4df95d28ddf867721d57cd4b5b30b87c.gif', null);
INSERT INTO "public"."hq_resource_library" VALUES ('562', '12', 'jpg', '/upload/20170502/7b6a826c0dce461481a993c67580b106.jpg', '~1A7KYZ1_V)3LIA{@NRH%YQ.jpg', null, '2017-05-02 22:43:01', '7b6a826c0dce461481a993c67580b106.jpg', '46984', '/upload/20170502/thumb/7b6a826c0dce461481a993c67580b106.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('563', '12', 'jpg', '/upload/20170502/a10884934d2a9a89be012d9080e695b1.jpg', 'beauty.jpg', null, '2017-05-02 22:58:21', 'a10884934d2a9a89be012d9080e695b1.jpg', '304923', '/upload/20170502/thumb/a10884934d2a9a89be012d9080e695b1.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('564', '12', 'jpg', '/upload/20170502/6a553e49796ae4929503155563f44847.jpg', 'timg.jpg', null, '2017-05-02 23:01:05', '6a553e49796ae4929503155563f44847.jpg', '49963', '/upload/20170502/thumb/6a553e49796ae4929503155563f44847.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('565', '12', 'jpg', '/upload/20170502/a0703a51caa2eaa60d87ed60134afd34.jpg', '下载.jpg', null, '2017-05-02 23:03:39', 'a0703a51caa2eaa60d87ed60134afd34.jpg', '11604', '/upload/20170502/thumb/a0703a51caa2eaa60d87ed60134afd34.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('566', '12', 'jpg', '/upload/20170502/932a6a86c57ae1e4f68e728d2698caea.jpg', 'u=2833883659,1591627717&fm=23&gp=0.jpg', null, '2017-05-02 23:18:38', '932a6a86c57ae1e4f68e728d2698caea.jpg', '17730', '/upload/20170502/thumb/932a6a86c57ae1e4f68e728d2698caea.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('567', null, 'jpg', '/upload/20170502/5f51cd28da671397cb096055e934c7e8.jpg', 'magazine-unlock-01-2..jpg', null, '2017-05-02 23:23:40.801909', '5f51cd28da671397cb096055e934c7e8', '479683', '/upload/20170502/thumb/5f51cd28da671397cb096055e934c7e8.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('568', '12', 'png', '/upload/20170502/44ae5a41ca6c94b8b812e492fa6da1d6.png', '讲话.png', null, '2017-05-02 23:53:39', '44ae5a41ca6c94b8b812e492fa6da1d6.png', '763278', '/upload/20170502/thumb/44ae5a41ca6c94b8b812e492fa6da1d6.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('569', null, 'jpg', '/upload/20170503/c39fee53c0c716d2955f8a664745ebca.jpg', '11290111_986384.jpg', null, '2017-05-03 11:02:54', 'c39fee53c0c716d2955f8a664745ebca.jpg', '82018', '/upload/20170503/thumb/c39fee53c0c716d2955f8a664745ebca.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('570', null, 'jpg', '/upload/20170503/b752adb80ef480df3a1884e16581f134.jpg', 'magazine-unlock-06-2..jpg', null, '2017-05-03 11:19:02.878897', 'b752adb80ef480df3a1884e16581f134', '495517', '/upload/20170503/thumb/b752adb80ef480df3a1884e16581f134.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('571', null, 'jpg', '/upload/20170503/9e88f5d657ea2eda22451eb2f8de9d73.jpg', 'magazine-unlock-06-2..jpg', null, '2017-05-03 11:19:03.171962', '9e88f5d657ea2eda22451eb2f8de9d73', '495517', '/upload/20170503/thumb/9e88f5d657ea2eda22451eb2f8de9d73.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('572', null, 'png', '/upload/20170503/f6547fecc2eec041e1586f6fd5bb7e1f.png', 'Screenshot_2.png', null, '2017-05-03 11:50:06.399778', 'f6547fecc2eec041e1586f6fd5bb7e1f', '530122', '/upload/20170503/thumb/f6547fecc2eec041e1586f6fd5bb7e1f.png', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('573', null, 'png', '/upload/20170503/cc820c7af09266f68be7285c6b3183f0.png', 'Screenshot_2.png', null, '2017-05-03 11:50:06.448594', 'cc820c7af09266f68be7285c6b3183f0', '530122', '/upload/20170503/thumb/cc820c7af09266f68be7285c6b3183f0.png', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('574', null, 'jpg', '/upload/20170503/e77cec149b51c844132c92cc7f26c814.jpg', '33546-1j0jmco.jpg', null, '2017-05-03 11:51:51', 'e77cec149b51c844132c92cc7f26c814.jpg', '3627', '/upload/20170503/thumb/e77cec149b51c844132c92cc7f26c814.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('575', null, 'jpg', '/upload/20170503/9c8617ddd1c4c839c44739d6935b72a1.jpg', 'magazine-unlock-05-2..jpg', null, '2017-05-03 12:11:20.172556', '9c8617ddd1c4c839c44739d6935b72a1', '505913', '/upload/20170503/thumb/9c8617ddd1c4c839c44739d6935b72a1.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('576', null, 'jpg', '/upload/20170503/f0055d134ee0d5d36237705ae8abf73a.jpg', 'magazine-unlock-05-2..jpg', null, '2017-05-03 12:11:20.436803', 'f0055d134ee0d5d36237705ae8abf73a', '505913', '/upload/20170503/thumb/f0055d134ee0d5d36237705ae8abf73a.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('577', null, 'png', '/upload/20170503/77ff39566da94809847f015a6efce656.png', 'Screenshot_201.png', null, '2017-05-03 17:59:49.706919', '77ff39566da94809847f015a6efce656', '670886', '/upload/20170503/thumb/77ff39566da94809847f015a6efce656.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('578', null, 'png', '/upload/20170503/0fd3a80752bc06a52fe3fe321ba05ad9.png', 'Screenshot_201.png', null, '2017-05-03 17:59:54.584368', '0fd3a80752bc06a52fe3fe321ba05ad9', '670886', '/upload/20170503/thumb/0fd3a80752bc06a52fe3fe321ba05ad9.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('579', null, 'png', '/upload/20170504/e4c07d0ab13eb5104ca047a4028ac9a6.png', 'gov.png', null, '2017-05-04 15:54:44.282921', 'e4c07d0ab13eb5104ca047a4028ac9a6', '7481', '/upload/20170504/thumb/e4c07d0ab13eb5104ca047a4028ac9a6.png', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('580', null, 'png', '/upload/20170504/239220526067012bdac20195bda5f0a2.png', 'Screenshot_201.png', null, '2017-05-04 15:56:16.419034', '239220526067012bdac20195bda5f0a2', '134480', '/upload/20170504/thumb/239220526067012bdac20195bda5f0a2.png', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('581', null, 'jpg', '/upload/20170504/81a9e25a3af064502ebc811d4ed1b951.jpg', 'Pictur.jpg', null, '2017-05-04 15:57:48.360098', '81a9e25a3af064502ebc811d4ed1b951', '552847', '/upload/20170504/thumb/81a9e25a3af064502ebc811d4ed1b951.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('582', null, 'jpg', '/upload/20170504/3a78024dd2fc8de977fbab67a75c2a73.jpg', 'Picture_.jpg', null, '2017-05-04 16:01:48.696128', '3a78024dd2fc8de977fbab67a75c2a73', '582655', '/upload/20170504/thumb/3a78024dd2fc8de977fbab67a75c2a73.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('583', null, 'jpg', '/upload/20170504/5ffd58855697e5b43fd462a493670225.jpg', 'Picture_1.jpg', null, '2017-05-04 16:02:33.452083', '5ffd58855697e5b43fd462a493670225', '544198', '/upload/20170504/thumb/5ffd58855697e5b43fd462a493670225.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('584', null, 'jpg', '/upload/20170504/49a48d2b9cb0cf9c6fe25cd009858c91.jpg', 'Picture_1.jpg', null, '2017-05-04 16:04:32.539409', '49a48d2b9cb0cf9c6fe25cd009858c91', '449405', '/upload/20170504/thumb/49a48d2b9cb0cf9c6fe25cd009858c91.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('585', null, 'jpg', '/upload/20170504/1b7354c20e80d853fff79d1028de30bd.jpg', 'Picture_.jpg', null, '2017-05-04 16:15:08.794921', '1b7354c20e80d853fff79d1028de30bd', '413398', '/upload/20170504/thumb/1b7354c20e80d853fff79d1028de30bd.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('586', null, 'jpg', '/upload/20170504/f0fca8b8db3a05307116db3d492100fe.jpg', '少.jpg', null, '2017-05-04 16:19:26.934918', 'f0fca8b8db3a05307116db3d492100fe', '217494', '/upload/20170504/thumb/f0fca8b8db3a05307116db3d492100fe.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('587', null, 'jpg', '/upload/20170504/6d02d33234ffaf0887c194b761295c18.jpg', '少.jpg', null, '2017-05-04 16:19:27.019771', '6d02d33234ffaf0887c194b761295c18', '217494', '/upload/20170504/thumb/6d02d33234ffaf0887c194b761295c18.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('588', null, 'jpg', '/upload/20170504/af2e9e8b5c3920fbde1401ff3ce0cb41.jpg', '1492410792000107e6eb7f9d3133bf2576e7d68f28583fd12069718a5422ff811ad0a8.jpg', null, '2017-05-04 16:25:31.569093', 'af2e9e8b5c3920fbde1401ff3ce0cb41', '10717', '/upload/20170504/thumb/af2e9e8b5c3920fbde1401ff3ce0cb41.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('589', null, 'jpg', '/upload/20170504/05c8d5f11c75806b40de671fb456f3a4.jpg', '少.jpg', null, '2017-05-04 16:26:13.393264', '05c8d5f11c75806b40de671fb456f3a4', '217494', '/upload/20170504/thumb/05c8d5f11c75806b40de671fb456f3a4.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('590', null, 'jpg', '/upload/20170504/df585114950c8d025401ffb719b7b89c.jpg', '少.jpg', null, '2017-05-04 16:26:13.973789', 'df585114950c8d025401ffb719b7b89c', '217494', '/upload/20170504/thumb/df585114950c8d025401ffb719b7b89c.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('591', null, 'jpg', '/upload/20170504/9662e0c2571eb4051e838ce7b0e39590.jpg', 'CropTmpFile-.jpg', null, '2017-05-04 16:29:25.823247', '9662e0c2571eb4051e838ce7b0e39590', '457815', '/upload/20170504/thumb/9662e0c2571eb4051e838ce7b0e39590.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('592', null, 'jpg', '/upload/20170504/6f932ac453eb667474480b6ececc07fe.jpg', 'CropTmpFile-.jpg', null, '2017-05-04 16:31:50.860746', '6f932ac453eb667474480b6ececc07fe', '457815', '/upload/20170504/thumb/6f932ac453eb667474480b6ececc07fe.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('593', null, 'png', '/upload/20170504/f78e4a4d8375815d92be6f13a170ef4f.png', 'IMG_20170.png', null, '2017-05-04 16:31:51.468542', 'f78e4a4d8375815d92be6f13a170ef4f', '647599', '/upload/20170504/thumb/f78e4a4d8375815d92be6f13a170ef4f.png', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('594', null, 'png', '/upload/20170504/72b551d5dfd671eb0d1933701f6a63a0.png', 'IMG_20170.png', null, '2017-05-04 16:31:51.470268', '72b551d5dfd671eb0d1933701f6a63a0', '474402', '/upload/20170504/thumb/72b551d5dfd671eb0d1933701f6a63a0.png', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('595', null, 'JPEG', '/upload/20170504/3d67f014499f5c8b2a773481ba309bab.JPEG', 'bgxf_p.JPEG', null, '2017-05-04 16:38:13.181037', '3d67f014499f5c8b2a773481ba309bab', '442974', '/upload/20170504/thumb/3d67f014499f5c8b2a773481ba309bab.JPEG', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('596', null, 'JPEG', '/upload/20170504/8ceab809c91177ba73477fde0a08e068.JPEG', 'bgxf_p.JPEG', null, '2017-05-04 16:41:59.991599', '8ceab809c91177ba73477fde0a08e068', '464258', '/upload/20170504/thumb/8ceab809c91177ba73477fde0a08e068.JPEG', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('597', null, 'JPEG', '/upload/20170504/d78312fc1112d93151e6655565d2e18d.JPEG', 'bgxf_p.JPEG', null, '2017-05-04 16:44:32.836535', 'd78312fc1112d93151e6655565d2e18d', '488615', '/upload/20170504/thumb/d78312fc1112d93151e6655565d2e18d.JPEG', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('598', null, 'jpg', '/upload/20170504/bd6181e870ccd7fddcd12a8ddb4ac7a2.jpg', 'CropTmpFile-.jpg', null, '2017-05-04 17:09:10.96936', 'bd6181e870ccd7fddcd12a8ddb4ac7a2', '492735', '/upload/20170504/thumb/bd6181e870ccd7fddcd12a8ddb4ac7a2.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('599', '12', 'jpg', '/upload/20170504/4080d4c604e27635db149203dc3e68cd.jpg', '中共十八大讲话.jpg', null, '2017-05-04 17:10:48', '4080d4c604e27635db149203dc3e68cd.jpg', '17797', '/upload/20170504/thumb/4080d4c604e27635db149203dc3e68cd.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('600', null, 'jpg', '/upload/20170504/03596c4f30d70bed92fc4f1ea616da1d.jpg', 'CropTmpFile-.jpg', null, '2017-05-04 17:18:33.195732', '03596c4f30d70bed92fc4f1ea616da1d', '22105', '/upload/20170504/thumb/03596c4f30d70bed92fc4f1ea616da1d.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('601', null, 'jpg', '/upload/20170504/2b8cec587c80a5e265f47d673d81523f.jpg', 'CropTmpFile-.jpg', null, '2017-05-04 17:21:17.171033', '2b8cec587c80a5e265f47d673d81523f', '6463', '/upload/20170504/thumb/2b8cec587c80a5e265f47d673d81523f.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('602', null, 'jpg', '/upload/20170504/f238caa0c99fd149d90e140c279c7665.jpg', 'CropTmpFile-.jpg', null, '2017-05-04 17:22:52.696193', 'f238caa0c99fd149d90e140c279c7665', '80646', '/upload/20170504/thumb/f238caa0c99fd149d90e140c279c7665.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('603', null, 'png', '/upload/20170504/693972ec3bca3463c53b32ad77051ad3.png', 'IMG_20170.png', null, '2017-05-04 17:39:38.304982', '693972ec3bca3463c53b32ad77051ad3', '537111', '/upload/20170504/thumb/693972ec3bca3463c53b32ad77051ad3.png', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('604', null, 'png', '/upload/20170504/1229c7ed67f9aa7c35b953d0950a9524.png', 'IMG_20161.png', null, '2017-05-04 17:41:58.891439', '1229c7ed67f9aa7c35b953d0950a9524', '172153', '/upload/20170504/thumb/1229c7ed67f9aa7c35b953d0950a9524.png', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('605', null, 'jpg', '/upload/20170504/461731fec9e3d36201c2fea29311667b.jpg', 'Picture_1.jpg', null, '2017-05-04 17:43:01.995157', '461731fec9e3d36201c2fea29311667b', '435340', '/upload/20170504/thumb/461731fec9e3d36201c2fea29311667b.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('606', null, 'jpg', '/upload/20170504/06368b930f5f1d65358670417151fff0.jpg', 'IMG_20170.jpg', null, '2017-05-04 17:45:06.162922', '06368b930f5f1d65358670417151fff0', '530699', '/upload/20170504/thumb/06368b930f5f1d65358670417151fff0.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('607', null, 'jpg', '/upload/20170504/fc028c0a874c55cf4b3d80d331bb3079.jpg', 'Picture_.jpg', null, '2017-05-04 17:53:22.354167', 'fc028c0a874c55cf4b3d80d331bb3079', '647897', '/upload/20170504/thumb/fc028c0a874c55cf4b3d80d331bb3079.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('608', null, 'jpg', '/upload/20170505/911698f93218f83e48244cc8e378720a.jpg', 'Picture_1.jpg', null, '2017-05-05 09:17:51.062219', '911698f93218f83e48244cc8e378720a', '435340', '/upload/20170505/thumb/911698f93218f83e48244cc8e378720a.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('609', null, 'png', '/upload/20170505/434bbe3359939ad74385459f24fa2e80.png', 'comme.png', null, '2017-05-05 12:04:14.425749', '434bbe3359939ad74385459f24fa2e80', '5910', '/upload/20170505/thumb/434bbe3359939ad74385459f24fa2e80.png', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('610', null, 'jpg', '/upload/20170505/62569c8c5a36f28c57ecf7a83d00ed1a.jpg', 'IMG_20170.jpg', null, '2017-05-05 12:04:18.348213', '62569c8c5a36f28c57ecf7a83d00ed1a', '530699', '/upload/20170505/thumb/62569c8c5a36f28c57ecf7a83d00ed1a.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('611', null, 'jpg', '/upload/20170505/b552dec6d0f4d391f1027cdcf4c8262e.jpg', 'Picture_.jpg', null, '2017-05-05 12:04:19.165127', 'b552dec6d0f4d391f1027cdcf4c8262e', '382571', '/upload/20170505/thumb/b552dec6d0f4d391f1027cdcf4c8262e.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('612', null, 'jpg', '/upload/20170505/84bd012446f2a64c3cd06a2a78096253.jpg', '【20150727.jpg', null, '2017-05-05 12:09:48.734879', '84bd012446f2a64c3cd06a2a78096253', '172565', '/upload/20170505/thumb/84bd012446f2a64c3cd06a2a78096253.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('613', null, 'jpg', '/upload/20170505/0736b4b86f56709b4414d5ba3b06cf00.jpg', '2016082.jpg', null, '2017-05-05 12:09:48.835932', '0736b4b86f56709b4414d5ba3b06cf00', '255912', '/upload/20170505/thumb/0736b4b86f56709b4414d5ba3b06cf00.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('614', null, 'gif', '/upload/20170505/912f963c296269625ef99537e99b74f5.gif', 'd7e33673a19c470.gif', null, '2017-05-05 16:45:05.388586', '912f963c296269625ef99537e99b74f5', '182404', '/upload/20170505/thumb/912f963c296269625ef99537e99b74f5.gif', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('615', null, 'jpg', '/upload/20170505/6ebc2b6c10fa527831263911947f790f.jpg', 'IMG_20170.jpg', null, '2017-05-05 16:45:30.929819', '6ebc2b6c10fa527831263911947f790f', '121998', '/upload/20170505/thumb/6ebc2b6c10fa527831263911947f790f.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('616', null, 'jpg', '/upload/20170505/57064f236a113c9b7de81dea57488a52.jpg', '71927f5.jpg', null, '2017-05-05 17:19:23.610821', '57064f236a113c9b7de81dea57488a52', '377528', '/upload/20170505/thumb/57064f236a113c9b7de81dea57488a52.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('617', null, 'png', '/upload/20170505/b1bc201bca78a37bf49120fe0ebb004e.png', 'gov.png', null, '2017-05-05 18:42:14.39092', 'b1bc201bca78a37bf49120fe0ebb004e', '7209', '/upload/20170505/thumb/b1bc201bca78a37bf49120fe0ebb004e.png', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('618', null, 'jpg', '/upload/20170505/070f293cc3ca063a849a0adeab6e1fb1.jpg', 'IMG_20170.jpg', null, '2017-05-05 18:42:37.515546', '070f293cc3ca063a849a0adeab6e1fb1', '530699', '/upload/20170505/thumb/070f293cc3ca063a849a0adeab6e1fb1.jpg', '24');
INSERT INTO "public"."hq_resource_library" VALUES ('619', '12', 'jpg', '/upload/20170505/4d3c753a97331efc8aa04502bbd9a501.jpg', '学习雷锋讲话.jpg', null, '2017-05-05 18:47:17', '4d3c753a97331efc8aa04502bbd9a501.jpg', '17797', '/upload/20170505/thumb/4d3c753a97331efc8aa04502bbd9a501.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('620', '12', 'jpg', '/upload/20170505/0f03b8b019bd95c9210ebe17f2677ed4.jpg', '习大大.jpg', null, '2017-05-05 18:54:48', '0f03b8b019bd95c9210ebe17f2677ed4.jpg', '17797', '/upload/20170505/thumb/0f03b8b019bd95c9210ebe17f2677ed4.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('621', '12', 'jpg', '/upload/20170508/e5ba0453ba40880939ebe6426095d282.jpg', '24506295313410818.jpg', null, '2017-05-08 17:10:35', 'e5ba0453ba40880939ebe6426095d282.jpg', '153216', '/upload/20170508/thumb/e5ba0453ba40880939ebe6426095d282.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('622', '12', 'jpg', '/upload/20170508/0ae97bec9d96af2cfc927b6d7d31a666.jpg', '24506295313410818.jpg', null, '2017-05-08 17:16:26', '0ae97bec9d96af2cfc927b6d7d31a666.jpg', '153216', '/upload/20170508/thumb/0ae97bec9d96af2cfc927b6d7d31a666.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('623', '12', 'jpg', '/upload/20170508/8627ced4415d01fe2c7a390abad27528.jpg', '24506295313410818.jpg', null, '2017-05-08 17:17:48', '8627ced4415d01fe2c7a390abad27528.jpg', '153216', '/upload/20170508/thumb/8627ced4415d01fe2c7a390abad27528.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('624', '12', 'gif', '/upload/20170508/e6a2742dd740d36d41c2ddf1ac659e6a.gif', '1111.gif', null, '2017-05-08 17:19:00', 'e6a2742dd740d36d41c2ddf1ac659e6a.gif', '178853', '/upload/20170508/thumb/e6a2742dd740d36d41c2ddf1ac659e6a.gif', null);
INSERT INTO "public"."hq_resource_library" VALUES ('625', '12', 'jpg', '/upload/20170508/d5828f9c39f40b729566235ef0668a4a.jpg', '24506295313410818.jpg', null, '2017-05-08 17:21:47', 'd5828f9c39f40b729566235ef0668a4a.jpg', '153216', '/upload/20170508/thumb/d5828f9c39f40b729566235ef0668a4a.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('626', '12', 'jpg', '/upload/20170508/fb1a5cb1dc0db5827790f47034d84b6d.jpg', '24506295313410818.jpg', null, '2017-05-08 17:24:22', 'fb1a5cb1dc0db5827790f47034d84b6d.jpg', '153216', '/upload/20170508/thumb/fb1a5cb1dc0db5827790f47034d84b6d.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('627', '12', 'jpg', '/upload/20170508/bdf82bc59be5e7b6f5ae9902870a2d5b.jpg', '24506295313410818.jpg', null, '2017-05-08 17:25:12', 'bdf82bc59be5e7b6f5ae9902870a2d5b.jpg', '153216', '/upload/20170508/thumb/bdf82bc59be5e7b6f5ae9902870a2d5b.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('628', '12', 'jpg', '/upload/20170508/b3cf0f7813441af9a4fcf8db2544606c.jpg', '24506295313410818.jpg', null, '2017-05-08 17:25:38', 'b3cf0f7813441af9a4fcf8db2544606c.jpg', '153216', '/upload/20170508/thumb/b3cf0f7813441af9a4fcf8db2544606c.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('629', '12', 'png', '/upload/20170508/aa0761073125ce2c3cf38cf3d3005aaa.png', '屏幕截图.png', null, '2017-05-08 17:30:03', 'aa0761073125ce2c3cf38cf3d3005aaa.png', '18065', '/upload/20170508/thumb/aa0761073125ce2c3cf38cf3d3005aaa.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('630', '12', 'jpg', '/upload/20170508/f40c2f1efd856c4921227ad98760e325.jpg', '24506295313410818.jpg', null, '2017-05-08 17:36:35', 'f40c2f1efd856c4921227ad98760e325.jpg', '153216', '/upload/20170508/thumb/f40c2f1efd856c4921227ad98760e325.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('631', '12', 'jpg', '/upload/20170508/8955827a8e9e3bd8cc05dd1d91ad07cd.jpg', '24506295313410818.jpg', null, '2017-05-08 17:37:25', '8955827a8e9e3bd8cc05dd1d91ad07cd.jpg', '153216', '/upload/20170508/thumb/8955827a8e9e3bd8cc05dd1d91ad07cd.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('632', '12', 'jpg', '/upload/20170508/737ef881472ab89d0c9c6280c6537c9d.jpg', '24506295313410818.jpg', null, '2017-05-08 17:38:35', '737ef881472ab89d0c9c6280c6537c9d.jpg', '153216', '/upload/20170508/thumb/737ef881472ab89d0c9c6280c6537c9d.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('633', '12', 'jpg', '/upload/20170509/a2cf810cd43eaeead24cb505b3161eae.jpg', '24506295313410818.jpg', null, '2017-05-09 15:02:06', 'a2cf810cd43eaeead24cb505b3161eae.jpg', '153216', '/upload/20170509/thumb/a2cf810cd43eaeead24cb505b3161eae.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('634', '12', 'png', '/upload/20170509/5448b8cadfa0ad4f5f0a279c0ccfc6ff.png', '屏幕截图.png', null, '2017-05-09 15:24:47', '5448b8cadfa0ad4f5f0a279c0ccfc6ff.png', '18065', '/upload/20170509/thumb/5448b8cadfa0ad4f5f0a279c0ccfc6ff.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('635', '12', 'gif', '/upload/20170509/58af1356b36c59181bd3fc7826a9c668.gif', '1111.gif', null, '2017-05-09 15:25:00', '58af1356b36c59181bd3fc7826a9c668.gif', '178853', '/upload/20170509/thumb/58af1356b36c59181bd3fc7826a9c668.gif', null);
INSERT INTO "public"."hq_resource_library" VALUES ('636', '12', 'jpg', '/upload/20170509/536c1a38ed6992e33b9708696ad1df06.jpg', '24506295313410818.jpg', null, '2017-05-09 15:30:08', '536c1a38ed6992e33b9708696ad1df06.jpg', '153216', '/upload/20170509/thumb/536c1a38ed6992e33b9708696ad1df06.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('637', '12', 'png', '/upload/20170509/b010d56a5183db511c32088443361eda.png', '屏幕截图.png', null, '2017-05-09 15:30:18', 'b010d56a5183db511c32088443361eda.png', '18065', '/upload/20170509/thumb/b010d56a5183db511c32088443361eda.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('638', '12', 'png', '/upload/20170509/91626d3ccbc1a772b74fe16dc206549f.png', '屏幕截图.png', null, '2017-05-09 15:31:12', '91626d3ccbc1a772b74fe16dc206549f.png', '18065', '/upload/20170509/thumb/91626d3ccbc1a772b74fe16dc206549f.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('639', '12', 'png', '/upload/20170509/68d3581f8e92d27da8018f403b6ba699.png', '屏幕截图.png', null, '2017-05-09 15:33:27', '68d3581f8e92d27da8018f403b6ba699.png', '18065', '/upload/20170509/thumb/68d3581f8e92d27da8018f403b6ba699.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('640', '12', 'jpg', '/upload/20170509/e8def87bdc53702687ae3024d1fc4ddd.jpg', '24506295313410818.jpg', null, '2017-05-09 15:34:15', 'e8def87bdc53702687ae3024d1fc4ddd.jpg', '153216', '/upload/20170509/thumb/e8def87bdc53702687ae3024d1fc4ddd.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('641', '12', 'jpg', '/upload/20170509/3fc9c52606f3f11394993b130dc74fac.jpg', '24506295313410818.jpg', null, '2017-05-09 15:34:29', '3fc9c52606f3f11394993b130dc74fac.jpg', '153216', '/upload/20170509/thumb/3fc9c52606f3f11394993b130dc74fac.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('642', '12', 'jpg', '/upload/20170509/b3e444af04d6276d93a3d617d824f60a.jpg', '24506295313410818.jpg', null, '2017-05-09 15:35:29', 'b3e444af04d6276d93a3d617d824f60a.jpg', '153216', '/upload/20170509/thumb/b3e444af04d6276d93a3d617d824f60a.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('643', '12', 'jpg', '/upload/20170509/3fc560395496a1e1e16c396debb7010a.jpg', '24506295313410818.jpg', null, '2017-05-09 15:36:16', '3fc560395496a1e1e16c396debb7010a.jpg', '153216', '/upload/20170509/thumb/3fc560395496a1e1e16c396debb7010a.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('644', '12', 'jpg', '/upload/20170509/a9c4bcaee662c214110647ca6dd3b586.jpg', '24506295313410818.jpg', null, '2017-05-09 15:36:52', 'a9c4bcaee662c214110647ca6dd3b586.jpg', '153216', '/upload/20170509/thumb/a9c4bcaee662c214110647ca6dd3b586.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('645', '12', 'jpg', '/upload/20170509/aa2de523a1a6e7291c220f8204733192.jpg', '24506295313410818.jpg', null, '2017-05-09 15:37:05', 'aa2de523a1a6e7291c220f8204733192.jpg', '153216', '/upload/20170509/thumb/aa2de523a1a6e7291c220f8204733192.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('646', '12', 'jpg', '/upload/20170509/3950a3b873c4744544a0f4ae240b1b4d.jpg', '24506295313410818.jpg', null, '2017-05-09 15:38:08', '3950a3b873c4744544a0f4ae240b1b4d.jpg', '153216', '/upload/20170509/thumb/3950a3b873c4744544a0f4ae240b1b4d.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('647', '12', 'png', '/upload/20170509/dab69719ed428295ec131abf7e35fd22.png', '屏幕截图.png', null, '2017-05-09 15:38:29', 'dab69719ed428295ec131abf7e35fd22.png', '18065', '/upload/20170509/thumb/dab69719ed428295ec131abf7e35fd22.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('648', '12', 'png', '/upload/20170509/6d8bdb9d69b2936ff3e1a4d427fdef93.png', '屏幕截图.png', null, '2017-05-09 15:42:53', '6d8bdb9d69b2936ff3e1a4d427fdef93.png', '18065', '/upload/20170509/thumb/6d8bdb9d69b2936ff3e1a4d427fdef93.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('649', '12', 'jpg', '/upload/20170509/a33dea195491e683468d92149a96d74f.jpg', '24506295313410818.jpg', null, '2017-05-09 15:42:53', 'a33dea195491e683468d92149a96d74f.jpg', '153216', '/upload/20170509/thumb/a33dea195491e683468d92149a96d74f.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('650', '12', 'png', '/upload/20170509/41e230a0b4c0a36b35b67e70b438c9db.png', '屏幕截图.png', null, '2017-05-09 15:49:11', '41e230a0b4c0a36b35b67e70b438c9db.png', '18065', '/upload/20170509/thumb/41e230a0b4c0a36b35b67e70b438c9db.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('651', '12', 'jpg', '/upload/20170509/a74a4fe7a252be4d2291fd09b8f0d9a4.jpg', '24506295313410818.jpg', null, '2017-05-09 15:49:15', 'a74a4fe7a252be4d2291fd09b8f0d9a4.jpg', '153216', '/upload/20170509/thumb/a74a4fe7a252be4d2291fd09b8f0d9a4.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('652', '12', 'gif', '/upload/20170509/805bea96ee903d152b8c4b28f1fa745f.gif', '1111.gif', null, '2017-05-09 15:50:23', '805bea96ee903d152b8c4b28f1fa745f.gif', '178853', '/upload/20170509/thumb/805bea96ee903d152b8c4b28f1fa745f.gif', null);
INSERT INTO "public"."hq_resource_library" VALUES ('653', '12', 'png', '/upload/20170509/f02d620b7adc30dead662e7fda54206f.png', '屏幕截图.png', null, '2017-05-09 16:06:35', 'f02d620b7adc30dead662e7fda54206f.png', '18065', '/upload/20170509/thumb/f02d620b7adc30dead662e7fda54206f.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('654', '12', 'jpg', '/upload/20170509/39d0e99253b2ed75067d980984a0a6c3.jpg', '24506295313410818.jpg', null, '2017-05-09 16:06:42', '39d0e99253b2ed75067d980984a0a6c3.jpg', '153216', '/upload/20170509/thumb/39d0e99253b2ed75067d980984a0a6c3.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('655', '12', 'gif', '/upload/20170509/07aea9f2cd8d119571a3d38319ed2e3e.gif', '1111.gif', null, '2017-05-09 16:08:58', '07aea9f2cd8d119571a3d38319ed2e3e.gif', '178853', '/upload/20170509/thumb/07aea9f2cd8d119571a3d38319ed2e3e.gif', null);
INSERT INTO "public"."hq_resource_library" VALUES ('656', '12', 'png', '/upload/20170509/a9763c1f6e5adf82f4f3edb13fad0c89.png', '屏幕截图.png', null, '2017-05-09 16:14:20', 'a9763c1f6e5adf82f4f3edb13fad0c89.png', '18065', '/upload/20170509/thumb/a9763c1f6e5adf82f4f3edb13fad0c89.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('657', '12', 'jpg', '/upload/20170509/001104578af01a0e862e933cd4a05656.jpg', '24506295313410818.jpg', null, '2017-05-09 16:14:24', '001104578af01a0e862e933cd4a05656.jpg', '153216', '/upload/20170509/thumb/001104578af01a0e862e933cd4a05656.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('658', '12', 'jpg', '/upload/20170509/2e3a711a7094dd2fd34ad663cc114ec3.jpg', '24506295313410818.jpg', null, '2017-05-09 16:23:37', '2e3a711a7094dd2fd34ad663cc114ec3.jpg', '153216', '/upload/20170509/thumb/2e3a711a7094dd2fd34ad663cc114ec3.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('659', '12', 'jpg', '/upload/20170509/d10c9e2028317e234db75ca5cfa1a0ae.jpg', '24506295313410818.jpg', null, '2017-05-09 16:26:50', 'd10c9e2028317e234db75ca5cfa1a0ae.jpg', '153216', '/upload/20170509/thumb/d10c9e2028317e234db75ca5cfa1a0ae.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('660', '12', 'jpg', '/upload/20170509/23992d0bb20d2dba8dbf4716237e3694.jpg', '24506295313410818.jpg', null, '2017-05-09 16:35:45', '23992d0bb20d2dba8dbf4716237e3694.jpg', '153216', '/upload/20170509/thumb/23992d0bb20d2dba8dbf4716237e3694.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('661', '12', 'png', '/upload/20170509/c1c0668e3c9fb7451365d7c43a63f0bf.png', '屏幕截图.png', null, '2017-05-09 16:42:03', 'c1c0668e3c9fb7451365d7c43a63f0bf.png', '18065', '/upload/20170509/thumb/c1c0668e3c9fb7451365d7c43a63f0bf.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('662', '12', 'png', '/upload/20170509/787596de181d7254c50b02bdced80dc3.png', '屏幕截图.png', null, '2017-05-09 16:43:54', '787596de181d7254c50b02bdced80dc3.png', '18065', '/upload/20170509/thumb/787596de181d7254c50b02bdced80dc3.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('663', '12', 'jpg', '/upload/20170509/c55a3fc12414199c7e1d52737993403f.jpg', '24506295313410818.jpg', null, '2017-05-09 16:43:57', 'c55a3fc12414199c7e1d52737993403f.jpg', '153216', '/upload/20170509/thumb/c55a3fc12414199c7e1d52737993403f.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('664', '12', 'png', '/upload/20170509/b474640c0bf5f2f77ef409e043b5fe3f.png', '屏幕截图.png', null, '2017-05-09 17:04:10', 'b474640c0bf5f2f77ef409e043b5fe3f.png', '18065', '/upload/20170509/thumb/b474640c0bf5f2f77ef409e043b5fe3f.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('665', '12', 'gif', '/upload/20170509/2c22aa63b565265b742c019ac7cbbb4d.gif', '1111.gif', null, '2017-05-09 17:04:14', '2c22aa63b565265b742c019ac7cbbb4d.gif', '178853', '/upload/20170509/thumb/2c22aa63b565265b742c019ac7cbbb4d.gif', null);
INSERT INTO "public"."hq_resource_library" VALUES ('666', '12', 'png', '/upload/20170509/f835a3dc9717cebe49f63a6a19a4e9dd.png', '屏幕截图.png', null, '2017-05-09 17:05:13', 'f835a3dc9717cebe49f63a6a19a4e9dd.png', '18065', '/upload/20170509/thumb/f835a3dc9717cebe49f63a6a19a4e9dd.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('667', '12', 'jpg', '/upload/20170509/34e9298f3d49eeaf377bd445f262c26f.jpg', '24506295313410818.jpg', null, '2017-05-09 17:05:13', '34e9298f3d49eeaf377bd445f262c26f.jpg', '153216', '/upload/20170509/thumb/34e9298f3d49eeaf377bd445f262c26f.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('668', '12', 'jpg', '/upload/20170509/e1ee234f7a9b0222c5a6ca5069278ef6.jpg', '24506295313410818.jpg', null, '2017-05-09 17:15:35', 'e1ee234f7a9b0222c5a6ca5069278ef6.jpg', '153216', '/upload/20170509/thumb/e1ee234f7a9b0222c5a6ca5069278ef6.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('669', '12', 'png', '/upload/20170509/bed54a4da230ff7ba952457c28bbbb21.png', '屏幕截图.png', null, '2017-05-09 17:34:15', 'bed54a4da230ff7ba952457c28bbbb21.png', '18065', '/upload/20170509/thumb/bed54a4da230ff7ba952457c28bbbb21.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('670', null, 'png', '/upload/20170510/e067baffb6b2c63161c9be9d5ffe0266.png', 'ic_la.png', null, '2017-05-10 09:38:47.661831', 'e067baffb6b2c63161c9be9d5ffe0266', '5137', '/upload/20170510/thumb/e067baffb6b2c63161c9be9d5ffe0266.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('671', null, 'png', '/upload/20170510/5f642461a066e78cb109026f89208e88.png', 'gov.png', null, '2017-05-10 09:38:47.665142', '5f642461a066e78cb109026f89208e88', '6386', '/upload/20170510/thumb/5f642461a066e78cb109026f89208e88.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('672', null, 'png', '/upload/20170510/ae82bbaf614df8750c10585b69b8fd57.png', 'comme.png', null, '2017-05-10 09:38:47.678924', 'ae82bbaf614df8750c10585b69b8fd57', '2417', '/upload/20170510/thumb/ae82bbaf614df8750c10585b69b8fd57.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('673', null, 'png', '/upload/20170510/88ed81116ac067334317023d92de1f26.png', 'ic_la.png', null, '2017-05-10 09:39:38.960598', '88ed81116ac067334317023d92de1f26', '5137', '/upload/20170510/thumb/88ed81116ac067334317023d92de1f26.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('674', null, 'png', '/upload/20170510/8024281e39def167c54bfc71d69d87ed.png', 'comme.png', null, '2017-05-10 09:40:04.286915', '8024281e39def167c54bfc71d69d87ed', '2417', '/upload/20170510/thumb/8024281e39def167c54bfc71d69d87ed.png', null);
INSERT INTO "public"."hq_resource_library" VALUES ('675', null, 'jpg', '/upload/20170510/0406552e6eb068cdc5a7e2d522c7ebf0.jpg', '2016082.jpg', null, '2017-05-10 11:24:49.113276', '0406552e6eb068cdc5a7e2d522c7ebf0', '525088', '/upload/20170510/thumb/0406552e6eb068cdc5a7e2d522c7ebf0.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('676', '12', 'jpg', '/upload/20170510/b517d5b83096c3f3fc4bfa0d9caa250d.jpg', 'timg.jpg', null, '2017-05-10 14:54:44', 'b517d5b83096c3f3fc4bfa0d9caa250d.jpg', '3482', '/upload/20170510/thumb/b517d5b83096c3f3fc4bfa0d9caa250d.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('677', '12', 'jpg', '/upload/20170510/32aea82ecf7f23f164e9525c7b66dd3b.jpg', 'timg.jpg', null, '2017-05-10 15:21:01', '32aea82ecf7f23f164e9525c7b66dd3b.jpg', '3482', '/upload/20170510/thumb/32aea82ecf7f23f164e9525c7b66dd3b.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('678', '12', 'jpg', '/upload/20170510/d21b718a40d2bcb033fd2e88e191b33d.jpg', 'img4.jpg', null, '2017-05-10 15:40:48', 'd21b718a40d2bcb033fd2e88e191b33d.jpg', '351638', '/upload/20170510/thumb/d21b718a40d2bcb033fd2e88e191b33d.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('679', '12', 'jpg', '/upload/20170510/40fe490b89144095559ac82b00f875da.jpg', 'timg.jpg', null, '2017-05-10 15:42:03', '40fe490b89144095559ac82b00f875da.jpg', '3482', '/upload/20170510/thumb/40fe490b89144095559ac82b00f875da.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('680', '12', 'jpg', '/upload/20170510/1681e59f5b99f1a4b972ad361c4d81c3.jpg', 'timg.jpg', null, '2017-05-10 16:08:24', '1681e59f5b99f1a4b972ad361c4d81c3.jpg', '3482', '/upload/20170510/thumb/1681e59f5b99f1a4b972ad361c4d81c3.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('681', '12', 'jpg', '/upload/20170510/7a6374be06a1da10d7df993411162cd9.jpg', 'timg.jpg', null, '2017-05-10 16:28:56', '7a6374be06a1da10d7df993411162cd9.jpg', '3482', '/upload/20170510/thumb/7a6374be06a1da10d7df993411162cd9.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('682', '12', 'jpg', '/upload/20170510/cd665bad83a262eeaf6b0968ddb694df.jpg', 'timg.jpg', null, '2017-05-10 16:53:09', 'cd665bad83a262eeaf6b0968ddb694df.jpg', '3482', '/upload/20170510/thumb/cd665bad83a262eeaf6b0968ddb694df.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('683', '12', 'jpg', '/upload/20170510/0f4c013bb0960cb5be5a179362592c68.jpg', 'img3.jpg', null, '2017-05-10 16:53:55', '0f4c013bb0960cb5be5a179362592c68.jpg', '309300', '/upload/20170510/thumb/0f4c013bb0960cb5be5a179362592c68.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('684', '12', 'jpg', '/upload/20170510/39002ef35f14b14931360440eb9c394c.jpg', 'img4.jpg', null, '2017-05-10 17:05:30', '39002ef35f14b14931360440eb9c394c.jpg', '351638', '/upload/20170510/thumb/39002ef35f14b14931360440eb9c394c.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('685', '12', 'jpg', '/upload/20170510/3440873faa25ef0741f22e32129fba27.jpg', 'img4.jpg', null, '2017-05-10 17:29:16', '3440873faa25ef0741f22e32129fba27.jpg', '351638', '/upload/20170510/thumb/3440873faa25ef0741f22e32129fba27.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('686', '12', 'jpg', '/upload/20170510/b18e86fbfd0037aed6ad2d75151b3b0b.jpg', 'img4.jpg', null, '2017-05-10 17:30:31', 'b18e86fbfd0037aed6ad2d75151b3b0b.jpg', '351638', '/upload/20170510/thumb/b18e86fbfd0037aed6ad2d75151b3b0b.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('687', '12', 'jpg', '/upload/20170511/5125ee2b0de65f22a7788dbbc6aeb9d0.jpg', '习大大.jpg', null, '2017-05-11 10:07:58', '5125ee2b0de65f22a7788dbbc6aeb9d0.jpg', '17797', '/upload/20170511/thumb/5125ee2b0de65f22a7788dbbc6aeb9d0.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('688', '12', 'jpg', '/upload/20170511/6b1f7fc389e902f059c67e318914f56d.jpg', '习大大.jpg', null, '2017-05-11 10:12:34', '6b1f7fc389e902f059c67e318914f56d.jpg', '17797', '/upload/20170511/thumb/6b1f7fc389e902f059c67e318914f56d.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('691', '12', 'jpg', '/upload/20170511/6f02ea7bf308c3bb4e6d223225f50e20.jpg', '习大大.jpg', null, '2017-05-11 10:18:04', '6f02ea7bf308c3bb4e6d223225f50e20.jpg', '17797', '/upload/20170511/thumb/6f02ea7bf308c3bb4e6d223225f50e20.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('692', '12', 'jpg', '/upload/20170511/41eccc94ae122c59ff25c3f2551f0223.jpg', '习大大.jpg', null, '2017-05-11 10:21:31', '41eccc94ae122c59ff25c3f2551f0223.jpg', '17797', '/upload/20170511/thumb/41eccc94ae122c59ff25c3f2551f0223.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('693', '12', 'jpg', '/upload/20170511/82f9f41d0120c474b917f2dd8d9cfe49.jpg', '习进平讲话精神.jpg', null, '2017-05-11 11:18:36', '82f9f41d0120c474b917f2dd8d9cfe49.jpg', '17797', '/upload/20170511/thumb/82f9f41d0120c474b917f2dd8d9cfe49.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('694', '12', 'jpg', '/upload/20170511/922e7f5efcd2fe45d1c1edea1646f571.jpg', '学习雷锋讲话.jpg', null, '2017-05-11 14:55:08', '922e7f5efcd2fe45d1c1edea1646f571.jpg', '17797', '/upload/20170511/thumb/922e7f5efcd2fe45d1c1edea1646f571.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('695', '12', 'jpg', '/upload/20170511/c9bcbe8c4befa7fea500e5e583da901a.jpg', '习大大.jpg', null, '2017-05-11 15:07:36', 'c9bcbe8c4befa7fea500e5e583da901a.jpg', '17797', '/upload/20170511/thumb/c9bcbe8c4befa7fea500e5e583da901a.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('696', '12', 'jpg', '/upload/20170511/49be158388825c0f3899ac152cae681e.jpg', '中共十八大讲话.jpg', null, '2017-05-11 16:15:18', '49be158388825c0f3899ac152cae681e.jpg', '17797', '/upload/20170511/thumb/49be158388825c0f3899ac152cae681e.jpg', null);
INSERT INTO "public"."hq_resource_library" VALUES ('697', null, 'png', '/upload/20170512/ae2ecf9c45f499cbcc62979886bfdaac.png', 'IMG_20161.png', null, '2017-05-12 10:49:15.947988', 'ae2ecf9c45f499cbcc62979886bfdaac', '253752', '/upload/20170512/thumb/ae2ecf9c45f499cbcc62979886bfdaac.png', '24');

-- ----------------------------
-- Table structure for hq_role_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_role_admin_menu";
CREATE TABLE "public"."hq_role_admin_menu" (
"role_id" int4 DEFAULT nextval('bgxf_role_admin_menu_id_seq'::regclass) NOT NULL,
"menu_id" int4 NOT NULL,
"id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_role_admin_menu" IS '角色菜单';
COMMENT ON COLUMN "public"."hq_role_admin_menu"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."hq_role_admin_menu"."menu_id" IS '菜单ID';

-- ----------------------------
-- Records of hq_role_admin_menu
-- ----------------------------

-- ----------------------------
-- Table structure for hq_role_prototype
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_role_prototype";
CREATE TABLE "public"."hq_role_prototype" (
"role_prototype_id" int4 DEFAULT nextval('bgxf_role_prototype_role_prototype_id_seq'::regclass) NOT NULL,
"role_prototype_name" varchar(255) COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_role_prototype" IS '系统角色原型表（直接定死）';
COMMENT ON COLUMN "public"."hq_role_prototype"."role_prototype_id" IS '原型id';
COMMENT ON COLUMN "public"."hq_role_prototype"."role_prototype_name" IS '系统角色原型';

-- ----------------------------
-- Records of hq_role_prototype
-- ----------------------------
INSERT INTO "public"."hq_role_prototype" VALUES ('1', '超级管理员（拥有系统所有权限）');
INSERT INTO "public"."hq_role_prototype" VALUES ('2', '普通管理员（拥有系统一部分权限）');
INSERT INTO "public"."hq_role_prototype" VALUES ('3', '文章发布员（拥有发布文章的权限）');
INSERT INTO "public"."hq_role_prototype" VALUES ('4', '文章初审员（拥有对文章初级审批的权限）');
INSERT INTO "public"."hq_role_prototype" VALUES ('5', '文章终审员（拥有对文章终级审批的权限）');
INSERT INTO "public"."hq_role_prototype" VALUES ('6', '党费管理员（拥有对党费管理的权限）');

-- ----------------------------
-- Table structure for hq_sys_privilege
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_sys_privilege";
CREATE TABLE "public"."hq_sys_privilege" (
"privilege_id" int4 DEFAULT nextval('bgxf_sys_privilege_privilege_id_seq'::regclass) NOT NULL,
"privilege_type_id" int4,
"privilege_name" varchar(45) COLLATE "default" NOT NULL,
"sort_num" int4,
"status" int2 NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_sys_privilege" IS '系统权限';
COMMENT ON COLUMN "public"."hq_sys_privilege"."privilege_id" IS '权限id';
COMMENT ON COLUMN "public"."hq_sys_privilege"."privilege_type_id" IS '权限类型';
COMMENT ON COLUMN "public"."hq_sys_privilege"."privilege_name" IS '权限名';
COMMENT ON COLUMN "public"."hq_sys_privilege"."sort_num" IS '排序号';
COMMENT ON COLUMN "public"."hq_sys_privilege"."status" IS '状态';

-- ----------------------------
-- Records of hq_sys_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for hq_sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_sys_role";
CREATE TABLE "public"."hq_sys_role" (
"sys_role_id" int4 DEFAULT nextval('bgxf_sys_role_sys_role_id_seq'::regclass) NOT NULL,
"sys_role_name" varchar(30) COLLATE "default" NOT NULL,
"sort_num" int4,
"role_prototype" int2 NOT NULL,
"sys_role_describe" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_sys_role" IS '系统角色';
COMMENT ON COLUMN "public"."hq_sys_role"."sys_role_id" IS '系统角色';
COMMENT ON COLUMN "public"."hq_sys_role"."sys_role_name" IS '角色名';
COMMENT ON COLUMN "public"."hq_sys_role"."sort_num" IS '排序号';
COMMENT ON COLUMN "public"."hq_sys_role"."role_prototype" IS '角色原型（bgxf_role_prototype表外键，数据库写死）';
COMMENT ON COLUMN "public"."hq_sys_role"."sys_role_describe" IS '角色描述';

-- ----------------------------
-- Records of hq_sys_role
-- ----------------------------
INSERT INTO "public"."hq_sys_role" VALUES ('11', '超级管理员', '1', '1', '超级管理员，拥有最高权限');
INSERT INTO "public"."hq_sys_role" VALUES ('51', '普通管理员', '6', '2', '各级中的管理员，拥有与组织架构对等的权限');
INSERT INTO "public"."hq_sys_role" VALUES ('53', '信息录入员', '3', '2', '所、站等负责信息录入的人员');

-- ----------------------------
-- Table structure for hq_sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_sys_role_menu";
CREATE TABLE "public"."hq_sys_role_menu" (
"sys_role_id" int4 NOT NULL,
"menu_id" int4 NOT NULL,
"id" int4 DEFAULT nextval('bgxf_sys_role_menu_id_seq'::regclass) NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_sys_role_menu" IS '系统角色菜单';
COMMENT ON COLUMN "public"."hq_sys_role_menu"."sys_role_id" IS '角色ID';
COMMENT ON COLUMN "public"."hq_sys_role_menu"."menu_id" IS '菜单ID';

-- ----------------------------
-- Records of hq_sys_role_menu
-- ----------------------------
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '189', '18434');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '188', '18435');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '142', '18436');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '41', '18437');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '137', '18438');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '219', '18439');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '220', '18440');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '222', '18441');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '221', '18442');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '140', '18443');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '129', '18444');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '82', '18445');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '73', '18446');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '127', '18447');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '53', '18448');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '49', '18449');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '138', '18450');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '146', '18451');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '45', '18452');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '68', '18453');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '71', '18454');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '78', '18455');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '61', '18456');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '259', '18457');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '215', '18458');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '40', '18459');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '83', '18460');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '267', '18461');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '100', '18462');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '230', '18463');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '231', '18464');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '229', '18465');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '232', '18466');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '110', '18467');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '141', '18468');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '224', '18469');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '101', '18470');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '112', '18471');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '173', '18472');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '80', '18473');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '72', '18474');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '126', '18475');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '52', '18476');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '47', '18477');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '43', '18478');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '32', '18479');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '69', '18480');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '60', '18481');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '79', '18482');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '255', '18483');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '171', '18484');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '135', '18485');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '17', '18486');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '28', '18487');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '201', '18488');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '266', '18489');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '167', '18490');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '264', '18491');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '166', '18492');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '169', '18493');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '153', '18494');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '37', '18495');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '66', '18496');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '197', '18497');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '198', '18498');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '145', '18499');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '128', '18500');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '144', '18501');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '65', '18502');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '226', '18503');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '257', '18504');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '256', '18505');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '160', '18506');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '159', '18507');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '58', '18508');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '55', '18509');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '186', '18510');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '185', '18511');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '263', '18512');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '38', '18513');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '139', '18514');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '193', '18515');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '180', '18516');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '192', '18517');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '172', '18518');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '253', '18519');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '170', '18520');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '132', '18521');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '85', '18522');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '50', '18523');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '63', '18524');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '181', '18525');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '194', '18526');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '77', '18527');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '98', '18528');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '93', '18529');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '223', '18530');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '106', '18531');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '75', '18532');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '21', '18533');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '18', '18534');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '176', '18535');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '177', '18536');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '29', '18537');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '96', '18538');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '31', '18539');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '22', '18540');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '200', '18541');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '67', '18542');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '161', '18543');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '162', '18544');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '158', '18545');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '163', '18546');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '20', '18547');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '76', '18548');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '59', '18549');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '260', '18550');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '254', '18551');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '227', '18552');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '81', '18553');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '74', '18554');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '84', '18555');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '44', '18556');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '48', '18557');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '109', '18558');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '70', '18559');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '190', '18560');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '54', '18561');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '39', '18562');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '196', '18563');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '191', '18564');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '195', '18565');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '182', '18566');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '30', '18567');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '62', '18568');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '258', '18569');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '111', '18570');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '210', '18571');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '211', '18572');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '102', '18573');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '213', '18574');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '212', '18575');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '216', '18576');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '214', '18577');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '217', '18578');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '133', '18579');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '209', '18580');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '154', '18581');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '164', '18582');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '155', '18583');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '125', '18584');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '262', '18585');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '95', '18586');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '107', '18587');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '97', '18588');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '174', '18589');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '104', '18590');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '175', '18591');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '108', '18592');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '35', '18593');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '265', '18594');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '252', '18595');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '136', '18596');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '103', '18597');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '94', '18598');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '90', '18599');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '91', '18600');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '178', '18601');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '168', '18602');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '56', '18603');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '57', '18604');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '187', '18605');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '134', '18606');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '51', '18607');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '261', '18608');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '46', '18609');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('11', '179', '18610');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '142', '19222');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '41', '19223');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '137', '19224');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '140', '19225');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '129', '19226');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '82', '19227');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '53', '19228');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '138', '19229');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '146', '19230');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '45', '19231');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '78', '19232');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '61', '19233');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '259', '19234');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '215', '19235');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '40', '19236');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '83', '19237');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '267', '19238');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '100', '19239');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '230', '19240');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '231', '19241');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '229', '19242');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '232', '19243');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '110', '19244');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '141', '19245');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '224', '19246');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '101', '19247');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '247', '19248');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '246', '19249');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '244', '19250');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '245', '19251');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '249', '19252');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '250', '19253');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '173', '19254');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '80', '19255');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '52', '19256');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '43', '19257');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '60', '19258');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '79', '19259');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '255', '19260');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '171', '19261');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '135', '19262');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '28', '19263');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '201', '19264');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '266', '19265');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '167', '19266');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '264', '19267');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '169', '19268');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '153', '19269');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '37', '19270');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '66', '19271');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '197', '19272');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '198', '19273');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '145', '19274');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '128', '19275');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '144', '19276');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '65', '19277');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '226', '19278');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '257', '19279');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '256', '19280');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '160', '19281');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '159', '19282');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '58', '19283');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '55', '19284');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '186', '19285');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '185', '19286');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '263', '19287');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '38', '19288');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '139', '19289');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '180', '19290');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '193', '19291');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '192', '19292');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '172', '19293');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '253', '19294');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '170', '19295');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '132', '19296');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '85', '19297');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '50', '19298');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '63', '19299');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '181', '19300');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '194', '19301');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '77', '19302');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '98', '19303');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '93', '19304');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '223', '19305');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '106', '19306');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '75', '19307');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '21', '19308');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '176', '19309');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '177', '19310');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '161', '19311');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '162', '19312');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '158', '19313');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '163', '19314');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '20', '19315');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '76', '19316');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '59', '19317');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '260', '19318');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '254', '19319');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '227', '19320');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '81', '19321');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '74', '19322');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '84', '19323');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '44', '19324');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '109', '19325');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '190', '19326');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '54', '19327');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '39', '19328');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '196', '19329');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '191', '19330');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '195', '19331');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '182', '19332');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '62', '19333');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '258', '19334');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '111', '19335');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '210', '19336');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '211', '19337');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '102', '19338');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '213', '19339');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '212', '19340');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '216', '19341');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '214', '19342');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '217', '19343');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '209', '19344');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '133', '19345');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '154', '19346');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '164', '19347');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '155', '19348');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '125', '19349');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '262', '19350');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '95', '19351');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '107', '19352');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '97', '19353');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '174', '19354');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '104', '19355');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '108', '19356');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '35', '19357');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '265', '19358');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '252', '19359');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '136', '19360');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '103', '19361');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '94', '19362');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '90', '19363');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '91', '19364');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '178', '19365');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '168', '19366');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '56', '19367');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '57', '19368');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '187', '19369');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '134', '19370');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '51', '19371');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '261', '19372');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '46', '19373');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('51', '179', '19374');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('53', '253', '19375');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('53', '254', '19376');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('53', '252', '19377');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('53', '261', '19378');
INSERT INTO "public"."hq_sys_role_menu" VALUES ('53', '46', '19379');

-- ----------------------------
-- Table structure for hq_sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_sys_user_role";
CREATE TABLE "public"."hq_sys_user_role" (
"maccount_id" int4 NOT NULL,
"sys_role_id" int4 NOT NULL,
"id" int4 DEFAULT nextval('bgxf_sys_user_role_id_seq'::regclass) NOT NULL
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_sys_user_role" IS '系统用户角色';
COMMENT ON COLUMN "public"."hq_sys_user_role"."maccount_id" IS '管理账户名';
COMMENT ON COLUMN "public"."hq_sys_user_role"."sys_role_id" IS '角色ID';

-- ----------------------------
-- Records of hq_sys_user_role
-- ----------------------------
INSERT INTO "public"."hq_sys_user_role" VALUES ('12', '11', '1');
INSERT INTO "public"."hq_sys_user_role" VALUES ('42', '53', '39');
INSERT INTO "public"."hq_sys_user_role" VALUES ('70', '51', '57');
INSERT INTO "public"."hq_sys_user_role" VALUES ('71', '51', '60');
INSERT INTO "public"."hq_sys_user_role" VALUES ('72', '53', '61');
INSERT INTO "public"."hq_sys_user_role" VALUES ('73', '51', '62');
INSERT INTO "public"."hq_sys_user_role" VALUES ('74', '53', '63');
INSERT INTO "public"."hq_sys_user_role" VALUES ('75', '53', '64');
INSERT INTO "public"."hq_sys_user_role" VALUES ('76', '53', '65');
INSERT INTO "public"."hq_sys_user_role" VALUES ('77', '53', '66');
INSERT INTO "public"."hq_sys_user_role" VALUES ('78', '51', '67');
INSERT INTO "public"."hq_sys_user_role" VALUES ('79', '51', '68');
INSERT INTO "public"."hq_sys_user_role" VALUES ('80', '51', '69');
INSERT INTO "public"."hq_sys_user_role" VALUES ('81', '51', '70');
INSERT INTO "public"."hq_sys_user_role" VALUES ('82', '51', '71');
INSERT INTO "public"."hq_sys_user_role" VALUES ('83', '51', '72');

-- ----------------------------
-- Table structure for hq_system_setting
-- ----------------------------
DROP TABLE IF EXISTS "public"."hq_system_setting";
CREATE TABLE "public"."hq_system_setting" (
"setting_id" int4 DEFAULT nextval('bgxf_system_setting_setting_id_seq'::regclass) NOT NULL,
"payment_method" varchar(45) COLLATE "default" DEFAULT NULL::character varying,
"notice_method" varchar(45) COLLATE "default" DEFAULT NULL::character varying,
"front_maintain_state" int2,
"back_end_maintain_state" int2
)
WITH (OIDS=FALSE)

;
COMMENT ON TABLE "public"."hq_system_setting" IS '系统设置';

-- ----------------------------
-- Records of hq_system_setting
-- ----------------------------

-- ----------------------------
-- View structure for get_app_menu
-- ----------------------------
CREATE OR REPLACE VIEW "public"."get_app_menu" AS 
SELECT am.app_menu_id, am.menu_name, am.content, am.level, amt.remark, r.resource_path, amt.app_menu_type_name FROM ((bgxf_app_menu am LEFT JOIN bgxf_app_menu_type amt ON ((am.app_menu_type_id = amt.app_menu_type_id))) LEFT JOIN hq_resource_library r ON ((am.icon_id = r.resource_id)));

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."bgxf_app_menu_type_app_menu_type_id_seq" OWNED BY "bgxf_app_menu_type"."app_menu_type_id";
ALTER SEQUENCE "public"."bgxf_login_log_login_log_id_seq" OWNED BY "hq_login_log"."login_log_id";
ALTER SEQUENCE "public"."bgxf_party_member_party_member_id_seq" OWNED BY "hq_party_member"."party_member_id";
ALTER SEQUENCE "public"."bgxf_party_org_party_org_id_seq" OWNED BY "hq_party_org"."party_org_id";
ALTER SEQUENCE "public"."bgxf_party_org_type_party_type_id_seq" OWNED BY "hq_party_org_type"."party_type_id";
ALTER SEQUENCE "public"."bgxf_party_role_role_id_seq" OWNED BY "hq_party_role"."role_id";
ALTER SEQUENCE "public"."bgxf_party_role_type_party_role_type_id_seq" OWNED BY "hq_party_role_type"."party_role_type_id";
ALTER SEQUENCE "public"."bgxf_privilege_type_privilege_type_id_seq" OWNED BY "hq_privilege_type"."privilege_type_id";
ALTER SEQUENCE "public"."bgxf_resource_library_resource_id_seq" OWNED BY "hq_resource_library"."resource_id";
ALTER SEQUENCE "public"."bgxf_role_prototype_role_prototype_id_seq" OWNED BY "hq_role_prototype"."role_prototype_id";
ALTER SEQUENCE "public"."bgxf_sys_privilege_privilege_id_seq" OWNED BY "hq_sys_privilege"."privilege_id";
ALTER SEQUENCE "public"."bgxf_sys_role_sys_role_id_seq" OWNED BY "hq_sys_role"."sys_role_id";
ALTER SEQUENCE "public"."bgxf_system_setting_setting_id_seq" OWNED BY "hq_system_setting"."setting_id";
ALTER SEQUENCE "public"."hq_address_address_id_seq" OWNED BY "hq_address"."address_id";
ALTER SEQUENCE "public"."hq_admin_menu_menu_id_seq" OWNED BY "hq_admin_menu"."menu_id";
ALTER SEQUENCE "public"."hq_app_menu_app_menu_id_seq" OWNED BY "bgxf_app_menu"."app_menu_id";
ALTER SEQUENCE "public"."hq_bg_illegal_immigration_timeslot_timeslot_id_seq" OWNED BY "hq_bg_illegal_immigration_timeslot"."timeslot_id";
ALTER SEQUENCE "public"."hq_bg_suppress_person_person_id_seq" OWNED BY "hq_bg_suppress_person"."person_id";
ALTER SEQUENCE "public"."hq_bg_suppress_smuggling_suppress_id_seq" OWNED BY "hq_bg_suppress_smuggling"."suppress_id";
ALTER SEQUENCE "public"."hq_bg_suppress_vehicle_vehicle_id_seq" OWNED BY "hq_bg_suppress_vehicle"."vehicle_id";
ALTER SEQUENCE "public"."hq_month_month_id_seq" OWNED BY "hq_month"."month_id";

-- ----------------------------
-- Primary Key structure for table bgxf_app_menu
-- ----------------------------
ALTER TABLE "public"."bgxf_app_menu" ADD PRIMARY KEY ("app_menu_id");

-- ----------------------------
-- Primary Key structure for table bgxf_app_menu_type
-- ----------------------------
ALTER TABLE "public"."bgxf_app_menu_type" ADD PRIMARY KEY ("app_menu_type_id");

-- ----------------------------
-- Primary Key structure for table bgxf_sys_message
-- ----------------------------
ALTER TABLE "public"."bgxf_sys_message" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bgxf_sys_message_read
-- ----------------------------
ALTER TABLE "public"."bgxf_sys_message_read" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bgxf_sys_message_view_org
-- ----------------------------
ALTER TABLE "public"."bgxf_sys_message_view_org" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_address
-- ----------------------------
ALTER TABLE "public"."hq_address" ADD PRIMARY KEY ("address_id");

-- ----------------------------
-- Primary Key structure for table hq_admin_menu
-- ----------------------------
ALTER TABLE "public"."hq_admin_menu" ADD PRIMARY KEY ("menu_id");

-- ----------------------------
-- Primary Key structure for table hq_bg_administrative_case
-- ----------------------------
ALTER TABLE "public"."hq_bg_administrative_case" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_bg_case_type
-- ----------------------------
ALTER TABLE "public"."hq_bg_case_type" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_bg_collection_situation
-- ----------------------------
ALTER TABLE "public"."hq_bg_collection_situation" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_bg_collection_situation_goods
-- ----------------------------
ALTER TABLE "public"."hq_bg_collection_situation_goods" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_bg_combat_situation
-- ----------------------------
ALTER TABLE "public"."hq_bg_combat_situation" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_bg_combat_situation_process
-- ----------------------------
ALTER TABLE "public"."hq_bg_combat_situation_process" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_bg_criminal_case
-- ----------------------------
ALTER TABLE "public"."hq_bg_criminal_case" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_bg_goods
-- ----------------------------
ALTER TABLE "public"."hq_bg_goods" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_bg_illegal_immigration
-- ----------------------------
ALTER TABLE "public"."hq_bg_illegal_immigration" ADD PRIMARY KEY ("illegal_id");

-- ----------------------------
-- Primary Key structure for table hq_bg_illegal_immigration_entry_place
-- ----------------------------
ALTER TABLE "public"."hq_bg_illegal_immigration_entry_place" ADD PRIMARY KEY ("entry_place_id");

-- ----------------------------
-- Primary Key structure for table hq_bg_illegal_immigration_persons
-- ----------------------------
ALTER TABLE "public"."hq_bg_illegal_immigration_persons" ADD PRIMARY KEY ("person_id");

-- ----------------------------
-- Primary Key structure for table hq_bg_illegal_immigration_purpose
-- ----------------------------
ALTER TABLE "public"."hq_bg_illegal_immigration_purpose" ADD PRIMARY KEY ("purpose_id");

-- ----------------------------
-- Primary Key structure for table hq_bg_illegal_immigration_seized_way
-- ----------------------------
ALTER TABLE "public"."hq_bg_illegal_immigration_seized_way" ADD PRIMARY KEY ("seized_way_id");

-- ----------------------------
-- Primary Key structure for table hq_bg_illegal_immigration_sourse
-- ----------------------------
ALTER TABLE "public"."hq_bg_illegal_immigration_sourse" ADD PRIMARY KEY ("sourse_id");

-- ----------------------------
-- Primary Key structure for table hq_bg_illegal_immigration_timeslot
-- ----------------------------
ALTER TABLE "public"."hq_bg_illegal_immigration_timeslot" ADD PRIMARY KEY ("timeslot_id");

-- ----------------------------
-- Primary Key structure for table hq_bg_illegal_immigration_wherego
-- ----------------------------
ALTER TABLE "public"."hq_bg_illegal_immigration_wherego" ADD PRIMARY KEY ("wherego_id");

-- ----------------------------
-- Primary Key structure for table hq_bg_process_type
-- ----------------------------
ALTER TABLE "public"."hq_bg_process_type" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_bg_suppress_person
-- ----------------------------
ALTER TABLE "public"."hq_bg_suppress_person" ADD PRIMARY KEY ("person_id");

-- ----------------------------
-- Primary Key structure for table hq_bg_suppress_smuggling
-- ----------------------------
ALTER TABLE "public"."hq_bg_suppress_smuggling" ADD PRIMARY KEY ("suppress_id");

-- ----------------------------
-- Primary Key structure for table hq_bg_suppress_vehicle
-- ----------------------------
ALTER TABLE "public"."hq_bg_suppress_vehicle" ADD PRIMARY KEY ("vehicle_id");

-- ----------------------------
-- Primary Key structure for table hq_login_log
-- ----------------------------
ALTER TABLE "public"."hq_login_log" ADD PRIMARY KEY ("login_log_id");

-- ----------------------------
-- Primary Key structure for table hq_manage_account
-- ----------------------------
ALTER TABLE "public"."hq_manage_account" ADD PRIMARY KEY ("maccount_id");

-- ----------------------------
-- Primary Key structure for table hq_month
-- ----------------------------
ALTER TABLE "public"."hq_month" ADD PRIMARY KEY ("month_id");

-- ----------------------------
-- Primary Key structure for table hq_party_member
-- ----------------------------
ALTER TABLE "public"."hq_party_member" ADD PRIMARY KEY ("party_member_id");

-- ----------------------------
-- Primary Key structure for table hq_party_member_approve
-- ----------------------------
ALTER TABLE "public"."hq_party_member_approve" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_party_member_info_data
-- ----------------------------
ALTER TABLE "public"."hq_party_member_info_data" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_party_member_info_field
-- ----------------------------
ALTER TABLE "public"."hq_party_member_info_field" ADD PRIMARY KEY ("field_id");

-- ----------------------------
-- Primary Key structure for table hq_party_member_org
-- ----------------------------
ALTER TABLE "public"."hq_party_member_org" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_party_member_role
-- ----------------------------
ALTER TABLE "public"."hq_party_member_role" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_party_member_role_privilege
-- ----------------------------
ALTER TABLE "public"."hq_party_member_role_privilege" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_party_org
-- ----------------------------
ALTER TABLE "public"."hq_party_org" ADD PRIMARY KEY ("party_org_id");

-- ----------------------------
-- Primary Key structure for table hq_party_org_type
-- ----------------------------
ALTER TABLE "public"."hq_party_org_type" ADD PRIMARY KEY ("party_type_id");

-- ----------------------------
-- Primary Key structure for table hq_party_role
-- ----------------------------
ALTER TABLE "public"."hq_party_role" ADD PRIMARY KEY ("role_id");

-- ----------------------------
-- Primary Key structure for table hq_party_role_type
-- ----------------------------
ALTER TABLE "public"."hq_party_role_type" ADD PRIMARY KEY ("party_role_type_id");

-- ----------------------------
-- Primary Key structure for table hq_privilege_menu
-- ----------------------------
ALTER TABLE "public"."hq_privilege_menu" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_privilege_type
-- ----------------------------
ALTER TABLE "public"."hq_privilege_type" ADD PRIMARY KEY ("privilege_type_id");

-- ----------------------------
-- Primary Key structure for table hq_resource_library
-- ----------------------------
ALTER TABLE "public"."hq_resource_library" ADD PRIMARY KEY ("resource_id");

-- ----------------------------
-- Primary Key structure for table hq_role_admin_menu
-- ----------------------------
ALTER TABLE "public"."hq_role_admin_menu" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_role_prototype
-- ----------------------------
ALTER TABLE "public"."hq_role_prototype" ADD PRIMARY KEY ("role_prototype_id");

-- ----------------------------
-- Primary Key structure for table hq_sys_privilege
-- ----------------------------
ALTER TABLE "public"."hq_sys_privilege" ADD PRIMARY KEY ("privilege_id");

-- ----------------------------
-- Primary Key structure for table hq_sys_role
-- ----------------------------
ALTER TABLE "public"."hq_sys_role" ADD PRIMARY KEY ("sys_role_id");

-- ----------------------------
-- Primary Key structure for table hq_sys_role_menu
-- ----------------------------
ALTER TABLE "public"."hq_sys_role_menu" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_sys_user_role
-- ----------------------------
ALTER TABLE "public"."hq_sys_user_role" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table hq_system_setting
-- ----------------------------
ALTER TABLE "public"."hq_system_setting" ADD PRIMARY KEY ("setting_id");

-- ----------------------------
-- Foreign Key structure for table "public"."bgxf_app_menu"
-- ----------------------------
ALTER TABLE "public"."bgxf_app_menu" ADD FOREIGN KEY ("icon_id") REFERENCES "public"."hq_resource_library" ("resource_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."bgxf_app_menu" ADD FOREIGN KEY ("app_menu_type_id") REFERENCES "public"."bgxf_app_menu_type" ("app_menu_type_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."bgxf_sys_message"
-- ----------------------------
ALTER TABLE "public"."bgxf_sys_message" ADD FOREIGN KEY ("maccount_id") REFERENCES "public"."hq_manage_account" ("maccount_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."bgxf_sys_message_read"
-- ----------------------------
ALTER TABLE "public"."bgxf_sys_message_read" ADD FOREIGN KEY ("message_id") REFERENCES "public"."bgxf_sys_message" ("id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."bgxf_sys_message_read" ADD FOREIGN KEY ("party_member_id") REFERENCES "public"."hq_party_member" ("party_member_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."bgxf_sys_message_view_org"
-- ----------------------------
ALTER TABLE "public"."bgxf_sys_message_view_org" ADD FOREIGN KEY ("party_org_id") REFERENCES "public"."hq_party_org" ("party_org_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."bgxf_sys_message_view_org" ADD FOREIGN KEY ("message_id") REFERENCES "public"."bgxf_sys_message" ("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_address"
-- ----------------------------
ALTER TABLE "public"."hq_address" ADD FOREIGN KEY ("parent_address__id") REFERENCES "public"."hq_address" ("address_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_login_log"
-- ----------------------------
ALTER TABLE "public"."hq_login_log" ADD FOREIGN KEY ("party_member_id") REFERENCES "public"."hq_party_member" ("party_member_id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_manage_account"
-- ----------------------------
ALTER TABLE "public"."hq_manage_account" ADD FOREIGN KEY ("party_org_id") REFERENCES "public"."hq_party_org" ("party_org_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_party_member"
-- ----------------------------
ALTER TABLE "public"."hq_party_member" ADD FOREIGN KEY ("view_org_id") REFERENCES "public"."hq_party_org" ("party_org_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."hq_party_member" ADD FOREIGN KEY ("face_img_id") REFERENCES "public"."hq_resource_library" ("resource_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_party_member_approve"
-- ----------------------------
ALTER TABLE "public"."hq_party_member_approve" ADD FOREIGN KEY ("maccount_id") REFERENCES "public"."hq_manage_account" ("maccount_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."hq_party_member_approve" ADD FOREIGN KEY ("party_member_id") REFERENCES "public"."hq_party_member" ("party_member_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_party_member_info_data"
-- ----------------------------
ALTER TABLE "public"."hq_party_member_info_data" ADD FOREIGN KEY ("party_member_id") REFERENCES "public"."hq_party_member" ("party_member_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."hq_party_member_info_data" ADD FOREIGN KEY ("field_id") REFERENCES "public"."hq_party_member_info_field" ("field_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_party_member_org"
-- ----------------------------
ALTER TABLE "public"."hq_party_member_org" ADD FOREIGN KEY ("party_member_id") REFERENCES "public"."hq_party_member" ("party_member_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."hq_party_member_org" ADD FOREIGN KEY ("party_org_id") REFERENCES "public"."hq_party_org" ("party_org_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_party_member_role"
-- ----------------------------
ALTER TABLE "public"."hq_party_member_role" ADD FOREIGN KEY ("role_id") REFERENCES "public"."hq_party_role" ("role_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."hq_party_member_role" ADD FOREIGN KEY ("party_member_id") REFERENCES "public"."hq_party_member" ("party_member_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_party_member_role_privilege"
-- ----------------------------
ALTER TABLE "public"."hq_party_member_role_privilege" ADD FOREIGN KEY ("role_id") REFERENCES "public"."hq_party_role" ("role_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."hq_party_member_role_privilege" ADD FOREIGN KEY ("privilege_id") REFERENCES "public"."hq_sys_privilege" ("privilege_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_party_org"
-- ----------------------------
ALTER TABLE "public"."hq_party_org" ADD FOREIGN KEY ("address_id") REFERENCES "public"."hq_address" ("address_id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."hq_party_org" ADD FOREIGN KEY ("party_type_id") REFERENCES "public"."hq_party_org_type" ("party_type_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_party_role"
-- ----------------------------
ALTER TABLE "public"."hq_party_role" ADD FOREIGN KEY ("party_role_type_id") REFERENCES "public"."hq_party_role_type" ("party_role_type_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_privilege_menu"
-- ----------------------------
ALTER TABLE "public"."hq_privilege_menu" ADD FOREIGN KEY ("privilege_type_id") REFERENCES "public"."hq_privilege_type" ("privilege_type_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."hq_privilege_menu" ADD FOREIGN KEY ("menu_id") REFERENCES "public"."hq_admin_menu" ("menu_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_resource_library"
-- ----------------------------
ALTER TABLE "public"."hq_resource_library" ADD FOREIGN KEY ("party_member_id") REFERENCES "public"."hq_party_member" ("party_member_id") ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE "public"."hq_resource_library" ADD FOREIGN KEY ("maccount_id") REFERENCES "public"."hq_manage_account" ("maccount_id") ON DELETE SET NULL ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_role_admin_menu"
-- ----------------------------
ALTER TABLE "public"."hq_role_admin_menu" ADD FOREIGN KEY ("role_id") REFERENCES "public"."hq_party_role" ("role_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."hq_role_admin_menu" ADD FOREIGN KEY ("menu_id") REFERENCES "public"."hq_admin_menu" ("menu_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_sys_privilege"
-- ----------------------------
ALTER TABLE "public"."hq_sys_privilege" ADD FOREIGN KEY ("privilege_type_id") REFERENCES "public"."hq_privilege_type" ("privilege_type_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_sys_role"
-- ----------------------------
ALTER TABLE "public"."hq_sys_role" ADD FOREIGN KEY ("role_prototype") REFERENCES "public"."hq_role_prototype" ("role_prototype_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_sys_role_menu"
-- ----------------------------
ALTER TABLE "public"."hq_sys_role_menu" ADD FOREIGN KEY ("sys_role_id") REFERENCES "public"."hq_sys_role" ("sys_role_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."hq_sys_role_menu" ADD FOREIGN KEY ("menu_id") REFERENCES "public"."hq_admin_menu" ("menu_id") ON DELETE CASCADE ON UPDATE SET NULL;

-- ----------------------------
-- Foreign Key structure for table "public"."hq_sys_user_role"
-- ----------------------------
ALTER TABLE "public"."hq_sys_user_role" ADD FOREIGN KEY ("sys_role_id") REFERENCES "public"."hq_sys_role" ("sys_role_id") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."hq_sys_user_role" ADD FOREIGN KEY ("maccount_id") REFERENCES "public"."hq_manage_account" ("maccount_id") ON DELETE CASCADE ON UPDATE CASCADE;

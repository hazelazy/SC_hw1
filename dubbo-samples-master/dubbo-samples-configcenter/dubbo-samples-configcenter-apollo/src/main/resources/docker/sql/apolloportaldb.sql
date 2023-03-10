-- Licensed to the Apache Software Foundation (ASF) under one or more
-- contributor license agreements.  See the NOTICE file distributed with
-- this work for additional information regarding copyright ownership.
-- The ASF licenses this file to You under the Apache License, Version 2.0
-- (the "License"); you may not use this file except in compliance with
-- the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

--
-- Copyright 2022 Apollo Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
-- http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# Create Database
# ------------------------------------------------------------
CREATE DATABASE IF NOT EXISTS ApolloPortalDB DEFAULT CHARACTER SET = utf8mb4;

Use ApolloPortalDB;

# Dump of table app
# ------------------------------------------------------------

DROP TABLE IF EXISTS `App`;

CREATE TABLE `App` (
                       `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
                       `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                       `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '?????????',
                       `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '??????Id',
                       `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '????????????',
                       `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
                       `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
                       `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                       `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                       `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                       `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                       `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                       `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                       PRIMARY KEY (`Id`),
                       UNIQUE KEY `UK_AppId_DeletedAt` (`AppId`,`DeletedAt`),
                       KEY `DataChange_LastTime` (`DataChange_LastTime`),
                       KEY `IX_Name` (`Name`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='?????????';



# Dump of table appnamespace
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AppNamespace`;

CREATE TABLE `AppNamespace` (
                                `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????',
                                `Name` varchar(32) NOT NULL DEFAULT '' COMMENT 'namespace????????????????????????????????????',
                                `AppId` varchar(64) NOT NULL DEFAULT '' COMMENT 'app id',
                                `Format` varchar(32) NOT NULL DEFAULT 'properties' COMMENT 'namespace???format??????',
                                `IsPublic` bit(1) NOT NULL DEFAULT b'0' COMMENT 'namespace???????????????',
                                `Comment` varchar(64) NOT NULL DEFAULT '' COMMENT '??????',
                                `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                                `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                                `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                                `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                                PRIMARY KEY (`Id`),
                                UNIQUE KEY `UK_AppId_Name_DeletedAt` (`AppId`,`Name`,`DeletedAt`),
                                KEY `Name_AppId` (`Name`,`AppId`),
                                KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='??????namespace??????';



# Dump of table consumer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Consumer`;

CREATE TABLE `Consumer` (
                            `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                            `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                            `Name` varchar(500) NOT NULL DEFAULT 'default' COMMENT '?????????',
                            `OrgId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '??????Id',
                            `OrgName` varchar(64) NOT NULL DEFAULT 'default' COMMENT '????????????',
                            `OwnerName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerName',
                            `OwnerEmail` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ownerEmail',
                            `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                            `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                            `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                            `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                            `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                            `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                            PRIMARY KEY (`Id`),
                            UNIQUE KEY `UK_AppId_DeletedAt` (`AppId`,`DeletedAt`),
                            KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='??????API?????????';



# Dump of table consumeraudit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ConsumerAudit`;

CREATE TABLE `ConsumerAudit` (
                                 `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                                 `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
                                 `Uri` varchar(1024) NOT NULL DEFAULT '' COMMENT '?????????Uri',
                                 `Method` varchar(16) NOT NULL DEFAULT '' COMMENT '?????????Method',
                                 `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                                 `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                                 PRIMARY KEY (`Id`),
                                 KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
                                 KEY `IX_ConsumerId` (`ConsumerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer?????????';



# Dump of table consumerrole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ConsumerRole`;

CREATE TABLE `ConsumerRole` (
                                `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                                `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'Consumer Id',
                                `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
                                `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                                `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                                `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                                `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                                PRIMARY KEY (`Id`),
                                UNIQUE KEY `UK_ConsumerId_RoleId_DeletedAt` (`ConsumerId`,`RoleId`,`DeletedAt`),
                                KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
                                KEY `IX_RoleId` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer???role????????????';



# Dump of table consumertoken
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ConsumerToken`;

CREATE TABLE `ConsumerToken` (
                                 `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                                 `ConsumerId` int(11) unsigned DEFAULT NULL COMMENT 'ConsumerId',
                                 `Token` varchar(128) NOT NULL DEFAULT '' COMMENT 'token',
                                 `Expires` datetime NOT NULL DEFAULT '2099-01-01 00:00:00' COMMENT 'token????????????',
                                 `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                 `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                 `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                                 `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                                 `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                                 `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                                 PRIMARY KEY (`Id`),
                                 UNIQUE KEY `UK_Token_DeletedAt` (`Token`,`DeletedAt`),
                                 KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='consumer token???';

# Dump of table favorite
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Favorite`;

CREATE TABLE `Favorite` (
                            `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
                            `UserId` varchar(32) NOT NULL DEFAULT 'default' COMMENT '???????????????',
                            `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                            `Position` int(32) NOT NULL DEFAULT '10000' COMMENT '????????????',
                            `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                            `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                            `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                            `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                            `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                            `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                            PRIMARY KEY (`Id`),
                            UNIQUE KEY `UK_UserId_AppId_DeletedAt` (`UserId`,`AppId`,`DeletedAt`),
                            KEY `AppId` (`AppId`(191)),
                            KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COMMENT='???????????????';

# Dump of table permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Permission`;

CREATE TABLE `Permission` (
                              `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                              `PermissionType` varchar(32) NOT NULL DEFAULT '' COMMENT '????????????',
                              `TargetId` varchar(256) NOT NULL DEFAULT '' COMMENT '??????????????????',
                              `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                              `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                              `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                              `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                              `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                              `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                              PRIMARY KEY (`Id`),
                              UNIQUE KEY `UK_TargetId_PermissionType_DeletedAt` (`TargetId`,`PermissionType`,`DeletedAt`),
                              KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='permission???';



# Dump of table role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Role`;

CREATE TABLE `Role` (
                        `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                        `RoleName` varchar(256) NOT NULL DEFAULT '' COMMENT 'Role name',
                        `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                        `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                        `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                        `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                        `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                        `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                        PRIMARY KEY (`Id`),
                        UNIQUE KEY `UK_RoleName_DeletedAt` (`RoleName`,`DeletedAt`),
                        KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='?????????';



# Dump of table rolepermission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `RolePermission`;

CREATE TABLE `RolePermission` (
                                  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                                  `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
                                  `PermissionId` int(10) unsigned DEFAULT NULL COMMENT 'Permission Id',
                                  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                  `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                                  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                                  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                                  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                                  PRIMARY KEY (`Id`),
                                  UNIQUE KEY `UK_RoleId_PermissionId_DeletedAt` (`RoleId`,`PermissionId`,`DeletedAt`),
                                  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
                                  KEY `IX_PermissionId` (`PermissionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='???????????????????????????';



# Dump of table serverconfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ServerConfig`;

CREATE TABLE `ServerConfig` (
                                `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                                `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????Key',
                                `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '????????????',
                                `Comment` varchar(1024) DEFAULT '' COMMENT '??????',
                                `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                                `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                                `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                                `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                                PRIMARY KEY (`Id`),
                                UNIQUE KEY `UK_Key_DeletedAt` (`Key`,`DeletedAt`),
                                KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='????????????????????????';



# Dump of table userrole
# ------------------------------------------------------------

DROP TABLE IF EXISTS `UserRole`;

CREATE TABLE `UserRole` (
                            `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                            `UserId` varchar(128) DEFAULT '' COMMENT '??????????????????',
                            `RoleId` int(10) unsigned DEFAULT NULL COMMENT 'Role Id',
                            `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                            `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                            `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                            `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                            `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                            `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                            PRIMARY KEY (`Id`),
                            UNIQUE KEY `UK_UserId_RoleId_DeletedAt` (`UserId`,`RoleId`,`DeletedAt`),
                            KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
                            KEY `IX_RoleId` (`RoleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='?????????role????????????';

# Dump of table Users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
                         `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                         `Username` varchar(64) NOT NULL DEFAULT 'default' COMMENT '??????????????????',
                         `Password` varchar(512) NOT NULL DEFAULT 'default' COMMENT '??????',
                         `UserDisplayName` varchar(512) NOT NULL DEFAULT 'default' COMMENT '????????????',
                         `Email` varchar(64) NOT NULL DEFAULT 'default' COMMENT '????????????',
                         `Enabled` tinyint(4) DEFAULT NULL COMMENT '????????????',
                         PRIMARY KEY (`Id`),
                         UNIQUE KEY `UK_Username` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='?????????';


# Dump of table Authorities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Authorities`;

CREATE TABLE `Authorities` (
                               `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                               `Username` varchar(64) NOT NULL,
                               `Authority` varchar(50) NOT NULL,
                               PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


# Config
# ------------------------------------------------------------
INSERT INTO `ServerConfig` (`Key`, `Value`, `Comment`)
VALUES
    ('apollo.portal.envs', 'dev', '????????????????????????'),
    ('organizations', '[{\"orgId\":\"TEST1\",\"orgName\":\"????????????1\"},{\"orgId\":\"TEST2\",\"orgName\":\"????????????2\"}]', '????????????'),
    ('superAdmin', 'apollo', 'Portal???????????????'),
    ('api.readTimeout', '10000', 'http??????read timeout'),
    ('consumer.token.salt', 'someSalt', 'consumer token salt'),
    ('admin.createPrivateNamespace.switch', 'true', '???????????????????????????????????????namespace'),
    ('configView.memberOnly.envs', 'dev', '????????????????????????????????????????????????????????????env?????????????????????'),
    ('apollo.portal.meta.servers', '{}', '?????????Meta Service??????');

INSERT INTO `Users` (`Username`, `Password`, `UserDisplayName`, `Email`, `Enabled`)
VALUES
    ('apollo', '$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS', 'apollo', 'apollo@acme.com', 1);

INSERT INTO `Authorities` (`Username`, `Authority`) VALUES ('apollo', 'ROLE_user');

# Sample Data
# ------------------------------------------------------------
INSERT INTO `App` (`AppId`, `Name`, `OrgId`, `OrgName`, `OwnerName`, `OwnerEmail`)
VALUES
	('SampleApp', 'Sample App', 'TEST1', '????????????1', 'apollo', 'apollo@acme.com');

INSERT INTO `AppNamespace` (`Name`, `AppId`, `Format`, `IsPublic`, `Comment`)
VALUES
    ('application', 'SampleApp', 'properties', 0, 'default app namespace');

INSERT INTO `AppNamespace` (`Name`, `AppId`, `Format`, `IsPublic`, `Comment`)
VALUES
    ('dubbo', 'SampleApp', 'properties', 0, 'dubbo');


INSERT INTO `Permission` (`Id`, `PermissionType`, `TargetId`)
VALUES
    (1, 'CreateCluster', 'SampleApp'),
    (2, 'CreateNamespace', 'SampleApp'),
    (3, 'AssignRole', 'SampleApp'),
    (4, 'ModifyNamespace', 'SampleApp+application'),
    (5, 'ReleaseNamespace', 'SampleApp+application'),
    (6, 'ModifyNamespace', 'SampleApp+dubbo'),
    (7, 'ReleaseNamespace', 'SampleApp+dubbo');

INSERT INTO `Role` (`Id`, `RoleName`)
VALUES
    (1, 'Master+SampleApp'),
    (2, 'ModifyNamespace+SampleApp+application'),
    (3, 'ReleaseNamespace+SampleApp+application'),
    (4, 'ModifyNamespace+SampleApp+dubbo'),
    (5, 'ReleaseNamespace+SampleApp+dubbo');

INSERT INTO `RolePermission` (`RoleId`, `PermissionId`)
VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 4),
    (3, 5),
    (4, 6),
    (5, 7);

INSERT INTO `UserRole` (`UserId`, `RoleId`)
VALUES
    ('apollo', 1),
    ('apollo', 2),
    ('apollo', 3);

-- spring session (https://github.com/spring-projects/spring-session/blob/faee8f1bdb8822a5653a81eba838dddf224d92d6/spring-session-jdbc/src/main/resources/org/springframework/session/jdbc/schema-mysql.sql)
CREATE TABLE SPRING_SESSION (
                                PRIMARY_ID CHAR(36) NOT NULL,
                                SESSION_ID CHAR(36) NOT NULL,
                                CREATION_TIME BIGINT NOT NULL,
                                LAST_ACCESS_TIME BIGINT NOT NULL,
                                MAX_INACTIVE_INTERVAL INT NOT NULL,
                                EXPIRY_TIME BIGINT NOT NULL,
                                PRINCIPAL_NAME VARCHAR(100),
                                CONSTRAINT SPRING_SESSION_PK PRIMARY KEY (PRIMARY_ID)
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

CREATE UNIQUE INDEX SPRING_SESSION_IX1 ON SPRING_SESSION (SESSION_ID);
CREATE INDEX SPRING_SESSION_IX2 ON SPRING_SESSION (EXPIRY_TIME);
CREATE INDEX SPRING_SESSION_IX3 ON SPRING_SESSION (PRINCIPAL_NAME);

CREATE TABLE SPRING_SESSION_ATTRIBUTES (
                                           SESSION_PRIMARY_ID CHAR(36) NOT NULL,
                                           ATTRIBUTE_NAME VARCHAR(200) NOT NULL,
                                           ATTRIBUTE_BYTES BLOB NOT NULL,
                                           CONSTRAINT SPRING_SESSION_ATTRIBUTES_PK PRIMARY KEY (SESSION_PRIMARY_ID, ATTRIBUTE_NAME),
                                           CONSTRAINT SPRING_SESSION_ATTRIBUTES_FK FOREIGN KEY (SESSION_PRIMARY_ID) REFERENCES SPRING_SESSION(PRIMARY_ID) ON DELETE CASCADE
) ENGINE=InnoDB ROW_FORMAT=DYNAMIC;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

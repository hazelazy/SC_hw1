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
CREATE DATABASE IF NOT EXISTS ApolloConfigDB DEFAULT CHARACTER SET = utf8mb4;

Use ApolloConfigDB;

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



# Dump of table audit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Audit`;

CREATE TABLE `Audit` (
                         `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
                         `EntityName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '??????',
                         `EntityId` int(10) unsigned DEFAULT NULL COMMENT '??????ID',
                         `OpName` varchar(50) NOT NULL DEFAULT 'default' COMMENT '????????????',
                         `Comment` varchar(500) DEFAULT NULL COMMENT '??????',
                         `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                         `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                         `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                         `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                         `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                         `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                         PRIMARY KEY (`Id`),
                         KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='???????????????';



# Dump of table cluster
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Cluster`;

CREATE TABLE `Cluster` (
                           `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????',
                           `Name` varchar(32) NOT NULL DEFAULT '' COMMENT '????????????',
                           `AppId` varchar(64) NOT NULL DEFAULT '' COMMENT 'App id',
                           `ParentClusterId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '???cluster',
                           `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                           `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                           `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                           `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                           `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                           `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                           PRIMARY KEY (`Id`),
                           UNIQUE KEY `UK_AppId_Name_DeletedAt` (`AppId`,`Name`,`DeletedAt`),
                           KEY `IX_ParentClusterId` (`ParentClusterId`),
                           KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='??????';



# Dump of table commit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Commit`;

CREATE TABLE `Commit` (
                          `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
                          `ChangeSets` longtext NOT NULL COMMENT '???????????????',
                          `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                          `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
                          `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
                          `Comment` varchar(500) DEFAULT NULL COMMENT '??????',
                          `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                          `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                          `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                          `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                          `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                          `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                          PRIMARY KEY (`Id`),
                          KEY `DataChange_LastTime` (`DataChange_LastTime`),
                          KEY `AppId` (`AppId`(191)),
                          KEY `ClusterName` (`ClusterName`(191)),
                          KEY `NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='commit ?????????';

# Dump of table grayreleaserule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `GrayReleaseRule`;

CREATE TABLE `GrayReleaseRule` (
                                   `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????',
                                   `AppId` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                                   `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
                                   `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
                                   `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'branch name',
                                   `Rules` varchar(16000) DEFAULT '[]' COMMENT '????????????',
                                   `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '???????????????release',
                                   `BranchStatus` tinyint(2) DEFAULT '1' COMMENT '??????????????????: 0:????????????,1:????????????????????? 2???????????????',
                                   `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                   `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                   `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                                   `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                                   `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                                   `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                                   PRIMARY KEY (`Id`),
                                   KEY `DataChange_LastTime` (`DataChange_LastTime`),
                                   KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='???????????????';


# Dump of table instance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Instance`;

CREATE TABLE `Instance` (
                            `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                            `AppId` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                            `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
                            `DataCenter` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'Data Center Name',
                            `Ip` varchar(32) NOT NULL DEFAULT '' COMMENT 'instance ip',
                            `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                            `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                            PRIMARY KEY (`Id`),
                            UNIQUE KEY `IX_UNIQUE_KEY` (`AppId`,`ClusterName`,`Ip`,`DataCenter`),
                            KEY `IX_IP` (`Ip`),
                            KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='???????????????????????????';



# Dump of table instanceconfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `InstanceConfig`;

CREATE TABLE `InstanceConfig` (
                                  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                                  `InstanceId` int(11) unsigned DEFAULT NULL COMMENT 'Instance Id',
                                  `ConfigAppId` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'Config App Id',
                                  `ConfigClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Cluster Name',
                                  `ConfigNamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'Config Namespace Name',
                                  `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '?????????Key',
                                  `ReleaseDeliveryTime` timestamp NULL DEFAULT NULL COMMENT '??????????????????',
                                  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                                  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                                  PRIMARY KEY (`Id`),
                                  UNIQUE KEY `IX_UNIQUE_KEY` (`InstanceId`,`ConfigAppId`,`ConfigNamespaceName`),
                                  KEY `IX_ReleaseKey` (`ReleaseKey`),
                                  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`),
                                  KEY `IX_Valid_Namespace` (`ConfigAppId`,`ConfigClusterName`,`ConfigNamespaceName`,`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='???????????????????????????';



# Dump of table item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Item`;

CREATE TABLE `Item` (
                        `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                        `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '??????NamespaceId',
                        `Key` varchar(128) NOT NULL DEFAULT 'default' COMMENT '?????????Key',
                        `Value` longtext NOT NULL COMMENT '????????????',
                        `Comment` varchar(1024) DEFAULT '' COMMENT '??????',
                        `LineNum` int(10) unsigned DEFAULT '0' COMMENT '??????',
                        `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                        `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                        `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                        `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                        `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                        `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                        PRIMARY KEY (`Id`),
                        KEY `IX_GroupId` (`NamespaceId`),
                        KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='????????????';



# Dump of table namespace
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Namespace`;

CREATE TABLE `Namespace` (
                             `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????',
                             `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                             `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Cluster Name',
                             `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'Namespace Name',
                             `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                             `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                             `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                             `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                             `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                             `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                             PRIMARY KEY (`Id`),
                             UNIQUE KEY `UK_AppId_ClusterName_NamespaceName_DeletedAt` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191),`DeletedAt`),
                             KEY `DataChange_LastTime` (`DataChange_LastTime`),
                             KEY `IX_NamespaceName` (`NamespaceName`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='????????????';



# Dump of table namespacelock
# ------------------------------------------------------------

DROP TABLE IF EXISTS `NamespaceLock`;

CREATE TABLE `NamespaceLock` (
                                 `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????id',
                                 `NamespaceId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '??????NamespaceId',
                                 `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                                 `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                                 `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                                 `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                                 `IsDeleted` bit(1) DEFAULT b'0' COMMENT '?????????',
                                 `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                 PRIMARY KEY (`Id`),
                                 UNIQUE KEY `UK_NamespaceId_DeletedAt` (`NamespaceId`,`DeletedAt`),
                                 KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='namespace????????????';



# Dump of table release
# ------------------------------------------------------------

DROP TABLE IF EXISTS `Release`;

CREATE TABLE `Release` (
                           `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????',
                           `ReleaseKey` varchar(64) NOT NULL DEFAULT '' COMMENT '?????????Key',
                           `Name` varchar(64) NOT NULL DEFAULT 'default' COMMENT '????????????',
                           `Comment` varchar(256) DEFAULT NULL COMMENT '????????????',
                           `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                           `ClusterName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
                           `NamespaceName` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
                           `Configurations` longtext NOT NULL COMMENT '????????????',
                           `IsAbandoned` bit(1) NOT NULL DEFAULT b'0' COMMENT '????????????',
                           `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                           `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                           `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                           `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                           `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                           `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                           PRIMARY KEY (`Id`),
                           UNIQUE KEY `UK_ReleaseKey_DeletedAt` (`ReleaseKey`,`DeletedAt`),
                           KEY `AppId_ClusterName_GroupName` (`AppId`(191),`ClusterName`(191),`NamespaceName`(191)),
                           KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='??????';


# Dump of table releasehistory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ReleaseHistory`;

CREATE TABLE `ReleaseHistory` (
                                  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                                  `AppId` varchar(64) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                                  `ClusterName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'ClusterName',
                                  `NamespaceName` varchar(32) NOT NULL DEFAULT 'default' COMMENT 'namespaceName',
                                  `BranchName` varchar(32) NOT NULL DEFAULT 'default' COMMENT '???????????????',
                                  `ReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '?????????Release Id',
                                  `PreviousReleaseId` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '??????????????????ReleaseId',
                                  `Operation` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '???????????????0: ???????????????1: ?????????2: ???????????????3: ?????????????????????4: ?????????????????????????????????5: ????????????????????????????????????6: ????????????????????????????????????7: ????????????',
                                  `OperationContext` longtext NOT NULL COMMENT '?????????????????????',
                                  `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                  `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                  `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                                  `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                                  `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                                  `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                                  PRIMARY KEY (`Id`),
                                  KEY `IX_Namespace` (`AppId`,`ClusterName`,`NamespaceName`,`BranchName`),
                                  KEY `IX_ReleaseId` (`ReleaseId`),
                                  KEY `IX_DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='????????????';


# Dump of table releasemessage
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ReleaseMessage`;

CREATE TABLE `ReleaseMessage` (
                                  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????',
                                  `Message` varchar(1024) NOT NULL DEFAULT '' COMMENT '?????????????????????',
                                  `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                                  PRIMARY KEY (`Id`),
                                  KEY `DataChange_LastTime` (`DataChange_LastTime`),
                                  KEY `IX_Message` (`Message`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='????????????';



# Dump of table serverconfig
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ServerConfig`;

CREATE TABLE `ServerConfig` (
                                `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????Id',
                                `Key` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????Key',
                                `Cluster` varchar(32) NOT NULL DEFAULT 'default' COMMENT '????????????????????????default???????????????????????????',
                                `Value` varchar(2048) NOT NULL DEFAULT 'default' COMMENT '????????????',
                                `Comment` varchar(1024) DEFAULT '' COMMENT '??????',
                                `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                                `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                                `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                                `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                                `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                                `DataChange_LastTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                                PRIMARY KEY (`Id`),
                                UNIQUE KEY `UK_Key_Cluster_DeletedAt` (`Key`,`Cluster`,`DeletedAt`),
                                KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='????????????????????????';

# Dump of table accesskey
# ------------------------------------------------------------

DROP TABLE IF EXISTS `AccessKey`;

CREATE TABLE `AccessKey` (
                             `Id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '????????????',
                             `AppId` varchar(500) NOT NULL DEFAULT 'default' COMMENT 'AppID',
                             `Secret` varchar(128) NOT NULL DEFAULT '' COMMENT 'Secret',
                             `IsEnabled` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: enabled, 0: disabled',
                             `IsDeleted` bit(1) NOT NULL DEFAULT b'0' COMMENT '1: deleted, 0: normal',
                             `DeletedAt` BIGINT(20) NOT NULL DEFAULT '0' COMMENT 'Delete timestamp based on milliseconds',
                             `DataChange_CreatedBy` varchar(64) NOT NULL DEFAULT 'default' COMMENT '?????????????????????',
                             `DataChange_CreatedTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '????????????',
                             `DataChange_LastModifiedBy` varchar(64) DEFAULT '' COMMENT '???????????????????????????',
                             `DataChange_LastTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '??????????????????',
                             PRIMARY KEY (`Id`),
                             UNIQUE KEY `UK_AppId_Secret_DeletedAt` (`AppId`,`Secret`,`DeletedAt`),
                             KEY `DataChange_LastTime` (`DataChange_LastTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='????????????';

# Config
# ------------------------------------------------------------
INSERT INTO `ServerConfig` (`Key`, `Cluster`, `Value`, `Comment`)
VALUES
    ('eureka.service.url', 'default', 'http://localhost:8080/eureka/', 'Eureka??????Url?????????service?????????????????????'),
    ('namespace.lock.switch', 'default', 'false', '??????????????????????????????????????????'),
    ('item.value.length.limit', 'default', '20000', 'item value??????????????????'),
    ('config-service.cache.enabled', 'default', 'false', 'ConfigService??????????????????????????????????????????????????????????????????????????????'),
    ('item.key.length.limit', 'default', '128', 'item key ??????????????????');

# Sample Data
# ------------------------------------------------------------
INSERT INTO `App` (`AppId`, `Name`, `OrgId`, `OrgName`, `OwnerName`, `OwnerEmail`)
VALUES
	('SampleApp', 'Sample App', 'TEST1', '????????????1', 'apollo', 'apollo@acme.com');

INSERT INTO `AppNamespace` (`Id`,`Name`, `AppId`, `Format`, `IsPublic`, `Comment`)
VALUES
    (1, 'application', 'SampleApp', 'properties', 0, 'default app namespace');

INSERT INTO `AppNamespace` (`Id`,`Name`, `AppId`, `Format`, `IsPublic`, `Comment`)
VALUES
    (2, 'dubbo', 'SampleApp', 'properties', 0, 'apollo');

INSERT INTO `Audit` VALUES (1,'Namespace',2,'INSERT',NULL,_binary '\0','\0','apollo','2021-01-05 22:07:21',NULL,'2021-01-05 22:07:21'),(2,'AppNamespace',2,'INSERT',NULL,_binary '\0','\0','apollo','2021-01-05 22:07:21',NULL,'2021-01-05 22:07:21'),(3,'Item',2,'INSERT',NULL,_binary '\0','\0','apollo','2021-01-05 22:07:56',NULL,'2021-01-05 22:07:56'),(4,'Item',2,'UPDATE',NULL,_binary '\0','\0','apollo','2021-01-05 22:14:39',NULL,'2021-01-05 22:14:39'),(5,'Release',2,'INSERT',NULL,_binary '\0','\0','apollo','2021-01-05 22:14:43',NULL,'2021-01-05 22:14:43'),(6,'ReleaseHistory',2,'INSERT',NULL,_binary '\0','\0','apollo','2021-01-05 22:14:43',NULL,'2021-01-05 22:14:43');

INSERT INTO `Cluster` (`Name`, `AppId`)
VALUES
    ('default', 'SampleApp');

INSERT INTO `Namespace` (`Id`, `AppId`, `ClusterName`, `NamespaceName`)
VALUES
    (1, 'SampleApp', 'default', 'application');

INSERT INTO `Namespace` (`Id`, `AppId`, `ClusterName`, `NamespaceName`)
VALUES
    (2, 'SampleApp', 'default', 'dubbo');

INSERT INTO `Commit` VALUES (1,'{\"createItems\":[{\"namespaceId\":2,\"key\":\"dubbo.registry.address\",\"value\":\"zookeeper://dubbo-samples-configcenter-apollo:2181\",\"lineNum\":1,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2021-01-06 20:07:56\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2021-01-06 20:07:56\"}],\"updateItems\":[],\"deleteItems\":[]}','SampleApp','default','dubbo',NULL,_binary '\0','\0','apollo','2021-01-05 22:07:56','apollo','2021-01-05 22:07:56'),(2,'{\"createItems\":[],\"updateItems\":[{\"oldItem\":{\"namespaceId\":2,\"key\":\"dubbo.registry.address\",\"value\":\"zookeeper://dubbo-samples-configcenter-apollo:2181\",\"lineNum\":1,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2021-01-06 20:07:56\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2021-01-06 20:07:56\"},\"newItem\":{\"namespaceId\":2,\"key\":\"dubbo.registry.address\",\"value\":\"zookeeper://dubbo-samples-configcenter-apollo:2181?backup\\u003d127.0.0.1:2181\",\"comment\":\"\",\"lineNum\":1,\"id\":2,\"isDeleted\":false,\"dataChangeCreatedBy\":\"apollo\",\"dataChangeCreatedTime\":\"2021-01-06 20:07:56\",\"dataChangeLastModifiedBy\":\"apollo\",\"dataChangeLastModifiedTime\":\"2021-01-06 20:14:38\"}}],\"deleteItems\":[]}','SampleApp','default','dubbo',NULL,_binary '\0','\0','apollo','2021-01-05 22:14:39','apollo','2021-01-05 22:14:39');


INSERT INTO `Item` (`NamespaceId`, `Key`, `Value`, `Comment`, `LineNum`)
VALUES
    (1, 'timeout', '100', 'sample timeout??????', 1);

INSERT INTO `Item` (`NamespaceId`, `Key`, `Value`, `Comment`, `LineNum`)
VALUES
    (2, 'dubbo.registry.address', 'zookeeper://dubbo-samples-configcenter-apollo:2181?backup=127.0.0.1:2181', 'registry adress', 1);


INSERT INTO `Release` (`ReleaseKey`, `Name`, `Comment`, `AppId`, `ClusterName`, `NamespaceName`, `Configurations`)
VALUES
    ('20161009155425-d3a0749c6e20bc15', '20161009155424-release', 'Sample??????', 'SampleApp', 'default', 'application', '{\"timeout\":\"100\"}');

INSERT INTO `Release` (`ReleaseKey`, `Name`, `Comment`, `AppId`, `ClusterName`, `NamespaceName`, `Configurations`)
VALUES
    ('20210106201443-f273857abac82340', '20210106201440-release', 'Sample??????', 'SampleApp', 'default', 'dubbo', '{\"dubbo.registry.address\":\"zookeeper://dubbo-samples-configcenter-apollo:2181?backup\\u003d127.0.0.1:2181\"}');

INSERT INTO `ReleaseHistory` (`AppId`, `ClusterName`, `NamespaceName`, `BranchName`, `ReleaseId`, `PreviousReleaseId`, `Operation`, `OperationContext`, `DataChange_CreatedBy`, `DataChange_LastModifiedBy`)
VALUES
    ('SampleApp', 'default', 'application', 'default', 1, 0, 0, '{}', 'apollo', 'apollo');

INSERT INTO `ReleaseHistory` (`AppId`, `ClusterName`, `NamespaceName`, `BranchName`, `ReleaseId`, `PreviousReleaseId`, `Operation`, `OperationContext`, `DataChange_CreatedBy`, `DataChange_LastModifiedBy`)
VALUES
    ('SampleApp', 'default', 'dubbo', 'default', 2, 0, 0, '{}', 'apollo', 'apollo');

INSERT INTO `ReleaseMessage` (`Message`)
VALUES
    ('SampleApp+default+application');

INSERT INTO `ReleaseMessage` (`Message`)
VALUES
    ('SampleApp+default+dubbo');

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

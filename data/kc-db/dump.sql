-- MySQL dump 10.13  Distrib 8.2.0, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak_db
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` text,
  `REPRESENTATION` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('00e8d385-9021-4b7c-85fe-89c279468395',NULL,'basic-auth','master','a2b52bf3-1199-4055-8670-e73325a73d90',0,10,_binary '\0',NULL,NULL),('026bce88-193b-4844-b33f-bc59d725ed94',NULL,'auth-otp-form','master','3d5a6dd8-1445-4d59-8169-ed30b5c1b04d',0,20,_binary '\0',NULL,NULL),('0652b1a2-d1fc-4b8d-b96a-49abc2de0f5a',NULL,'direct-grant-validate-username','master','e740d4b7-0ea2-4915-a752-790ed80276c4',0,10,_binary '\0',NULL,NULL),('06ab00f9-1573-4a66-993b-0661a2375e4e',NULL,NULL,'E-Shop','10336480-7665-4dcd-9a9c-29b20578150c',1,30,_binary '','f13ce5ae-b70f-4619-b2cf-14bf2f0413ee',NULL),('06b4f182-b2de-4da3-a9ce-605ccae41f50',NULL,'no-cookie-redirect','E-Shop','ca4f1c1d-9b69-4914-84af-a69e55555c58',0,10,_binary '\0',NULL,NULL),('0ce94183-50b6-4b68-b06f-7acd2469db19',NULL,'registration-password-action','master','56733d23-c883-4e8e-89d9-a80a3d8eda13',0,50,_binary '\0',NULL,NULL),('100ebb85-115b-486f-9808-4506af730a60',NULL,'reset-credential-email','E-Shop','6999727d-3f7c-4f45-b7c4-1dbaaf426c0c',0,20,_binary '\0',NULL,NULL),('11c462da-f086-4250-b136-7f278b80736c',NULL,'conditional-user-configured','E-Shop','87d75377-6ffa-4243-a897-6dda285887e6',0,10,_binary '\0',NULL,NULL),('1453a555-a79d-4418-a86b-4569025789e5',NULL,'auth-username-password-form','E-Shop','d9b659f2-d7c6-441a-b7a6-ca8212abd738',0,10,_binary '\0',NULL,NULL),('1a6cf526-9f8d-49b9-b6ad-82698aea7cc8',NULL,'registration-password-action','E-Shop','529d1f97-5e77-4be1-9364-3356730d4249',0,50,_binary '\0',NULL,NULL),('1b3c5d22-ec81-41e1-8070-fd8e3650b42d',NULL,'direct-grant-validate-otp','E-Shop','f13ce5ae-b70f-4619-b2cf-14bf2f0413ee',0,20,_binary '\0',NULL,NULL),('1fa35f93-edee-4242-a888-2f61256defa4',NULL,'client-secret-jwt','master','139aa4e0-b91c-4db1-8df8-c07c3ea5ed16',2,30,_binary '\0',NULL,NULL),('1fd6a352-104e-4a9b-92c7-6359a60681c7',NULL,NULL,'E-Shop','ca4f1c1d-9b69-4914-84af-a69e55555c58',0,20,_binary '','1941f12b-04c5-4029-b737-f765d233ead4',NULL),('20b2aae9-5f99-4550-b2ee-14d0593307a2',NULL,'direct-grant-validate-password','E-Shop','10336480-7665-4dcd-9a9c-29b20578150c',0,20,_binary '\0',NULL,NULL),('23c9d0ff-f24d-47b1-9410-4f44d1daacf2',NULL,'auth-cookie','master','567773b7-676f-493c-ad64-bf99bcb88f9d',2,10,_binary '\0',NULL,NULL),('24561247-283f-4ecb-8472-0a48efd05290',NULL,'auth-spnego','E-Shop','8494a0f1-0a66-42b8-b4c2-93a6a7e6f77c',3,20,_binary '\0',NULL,NULL),('2643e314-6e52-4004-8c51-640d144c02f3',NULL,NULL,'E-Shop','6999727d-3f7c-4f45-b7c4-1dbaaf426c0c',1,40,_binary '','0c981fdb-8e0e-4cdc-b06f-11fd6207f6bc',NULL),('296f8be9-c3d9-466f-95ff-937ae3a19034',NULL,'conditional-user-configured','master','91341a89-1269-4a29-b8f8-6c1ec26aa525',0,10,_binary '\0',NULL,NULL),('2a1d09db-60ae-4bed-a654-133f0c0b5915',NULL,'client-x509','E-Shop','db270677-e384-4a04-b7b2-f12149e34065',2,40,_binary '\0',NULL,NULL),('2a6afabd-4494-4838-8638-0a56778b3cb5',NULL,'registration-user-creation','E-Shop','529d1f97-5e77-4be1-9364-3356730d4249',0,20,_binary '\0',NULL,NULL),('2b2ac4f0-5fb7-47b4-9d5e-c1e696a9a172',NULL,'auth-otp-form','master','6b155745-a15b-4acf-b8df-71a511ffb0c6',0,20,_binary '\0',NULL,NULL),('2c7eb1c6-0bbd-44ee-b1b7-ba6968271605',NULL,'docker-http-basic-authenticator','master','06ac6c6a-a0da-45da-8d61-85a1bfe1e420',0,10,_binary '\0',NULL,NULL),('2dff51d4-b21a-4d11-9772-e1509e67d2e8',NULL,'conditional-user-configured','master','3d5a6dd8-1445-4d59-8169-ed30b5c1b04d',0,10,_binary '\0',NULL,NULL),('3188dea4-d51a-410d-8ea1-0a26bea8580e',NULL,'identity-provider-redirector','E-Shop','8494a0f1-0a66-42b8-b4c2-93a6a7e6f77c',2,25,_binary '\0',NULL,NULL),('35b327a1-2ab4-44cc-a0f3-ef9c8cc307ed',NULL,'client-secret','E-Shop','db270677-e384-4a04-b7b2-f12149e34065',2,10,_binary '\0',NULL,NULL),('3e990bce-bc43-4567-ad19-eb24aa6b4be9',NULL,'conditional-user-configured','E-Shop','0b5417d2-2eea-4f73-9152-ced0d8bd90ec',0,10,_binary '\0',NULL,NULL),('3f508649-db88-4208-ad8f-66171cf286e6',NULL,'registration-profile-action','E-Shop','529d1f97-5e77-4be1-9364-3356730d4249',0,40,_binary '\0',NULL,NULL),('429bdab7-484f-401e-9cd8-65666f801555',NULL,'idp-review-profile','master','4ff82b1b-2164-481e-b682-7e8a736cbf34',0,10,_binary '\0',NULL,'72a7f432-d565-46f3-8aa5-d894b1cf11ec'),('44073c36-4bfd-48ed-a502-fd680aa4388c',NULL,'client-secret-jwt','E-Shop','db270677-e384-4a04-b7b2-f12149e34065',2,30,_binary '\0',NULL,NULL),('467adbd3-e4b0-4ce3-b0fd-a89c97b89046',NULL,'conditional-user-configured','master','1d7d3bad-230c-4fc2-8132-6b2fa19b3283',0,10,_binary '\0',NULL,NULL),('46d6a29e-bac0-4bbe-892a-6ab6c1efba73',NULL,'idp-email-verification','E-Shop','efa60567-7657-4e5a-8feb-d79690569e9f',2,10,_binary '\0',NULL,NULL),('48757d08-d4fa-4254-a40b-01922214dc62',NULL,'registration-page-form','master','3fa60aa7-103e-4490-bc06-a80e0d20d207',0,10,_binary '','56733d23-c883-4e8e-89d9-a80a3d8eda13',NULL),('4ab1078f-7d58-4466-a485-3b01fffa28c0',NULL,'idp-username-password-form','E-Shop','595745aa-9ac0-4a80-9d00-ef093a25c706',0,10,_binary '\0',NULL,NULL),('4b16a9c6-5170-4820-83f8-d22c055df3d8',NULL,'idp-email-verification','master','bc08f641-35d0-4499-a588-888e71b6e392',2,10,_binary '\0',NULL,NULL),('4dffb58a-a640-4c26-840b-5ffa8b046dee',NULL,'identity-provider-redirector','master','567773b7-676f-493c-ad64-bf99bcb88f9d',2,25,_binary '\0',NULL,NULL),('4e094871-023a-4d88-8e18-412267f755e2',NULL,NULL,'master','e740d4b7-0ea2-4915-a752-790ed80276c4',1,30,_binary '','1d7d3bad-230c-4fc2-8132-6b2fa19b3283',NULL),('4e5a054c-8ee9-4911-96a7-a53fcd43b05f',NULL,NULL,'master','3ee101f4-d8a9-4f0d-85bf-be2869cbd2f7',2,20,_binary '','ae28e2eb-8ad8-4aae-9bf1-e8b9c85e3aeb',NULL),('4f30eb34-c983-487d-a336-3a5f83a58a53',NULL,'reset-otp','E-Shop','0c981fdb-8e0e-4cdc-b06f-11fd6207f6bc',0,20,_binary '\0',NULL,NULL),('51f7850b-81d6-45f5-a21f-ed562a4c97b7',NULL,'reset-credentials-choose-user','master','d71d8fe9-82bf-41ff-bcd7-90106cefefeb',0,10,_binary '\0',NULL,NULL),('549bcea1-e1cd-4e40-976c-ab18e014b9c1',NULL,'registration-recaptcha-action','E-Shop','529d1f97-5e77-4be1-9364-3356730d4249',3,60,_binary '\0',NULL,NULL),('597e7414-1792-4b7a-825c-a6a152887ee7',NULL,'auth-spnego','master','567773b7-676f-493c-ad64-bf99bcb88f9d',3,20,_binary '\0',NULL,NULL),('5b3b0a48-fa80-4374-a204-aad5b3d85fac',NULL,NULL,'E-Shop','9173603e-9a49-4361-ae2c-a9a0f649212b',2,20,_binary '','de17636e-aa19-440a-b7f1-56a4a75866d5',NULL),('6224f47e-2f57-478f-be63-de9264766d88',NULL,'basic-auth-otp','master','a2b52bf3-1199-4055-8670-e73325a73d90',3,20,_binary '\0',NULL,NULL),('64885197-07e9-4336-a46c-411de59bcd88',NULL,NULL,'E-Shop','d9b659f2-d7c6-441a-b7a6-ca8212abd738',1,20,_binary '','87d75377-6ffa-4243-a897-6dda285887e6',NULL),('68e94d8b-f409-4541-9de5-b86b01902887',NULL,'auth-otp-form','E-Shop','0b5417d2-2eea-4f73-9152-ced0d8bd90ec',0,20,_binary '\0',NULL,NULL),('6a8152b1-9499-43fc-b231-cc3417cce78c',NULL,'http-basic-authenticator','master','99624801-a68c-40f2-b35f-f5a82e45b3ff',0,10,_binary '\0',NULL,NULL),('6e66fd63-54f7-4842-83d2-039fb61802f9',NULL,NULL,'E-Shop','de17636e-aa19-440a-b7f1-56a4a75866d5',0,20,_binary '','efa60567-7657-4e5a-8feb-d79690569e9f',NULL),('74ffb3ef-73f3-4661-88e5-ea4bdf353d41',NULL,'auth-username-password-form','master','78c37910-7250-4856-9b1c-7eefb2536d2d',0,10,_binary '\0',NULL,NULL),('7ebe2cc2-bf79-487e-a455-fd8737101d17',NULL,'idp-review-profile','E-Shop','2bd09094-637c-49ca-a9d2-cc6870aeb955',0,10,_binary '\0',NULL,'69b69763-5c86-4381-9530-f422bdeef1b1'),('83366233-bc39-40d6-9250-7bb59def1d0a',NULL,'direct-grant-validate-username','E-Shop','10336480-7665-4dcd-9a9c-29b20578150c',0,10,_binary '\0',NULL,NULL),('86c5684c-ed50-4930-a9f8-240db99d551e',NULL,'idp-confirm-link','E-Shop','de17636e-aa19-440a-b7f1-56a4a75866d5',0,10,_binary '\0',NULL,NULL),('88738fff-e651-4f9d-8488-0ec49c4c217a',NULL,NULL,'E-Shop','efa60567-7657-4e5a-8feb-d79690569e9f',2,20,_binary '','595745aa-9ac0-4a80-9d00-ef093a25c706',NULL),('8b1465a7-1e4e-437d-8a74-7a6a7794f99b',NULL,'reset-password','master','d71d8fe9-82bf-41ff-bcd7-90106cefefeb',0,30,_binary '\0',NULL,NULL),('8bff88d3-c855-49de-acb8-697499322b93',NULL,NULL,'master','7999c457-3c73-4b60-9610-50a3382ef76b',1,20,_binary '','6b155745-a15b-4acf-b8df-71a511ffb0c6',NULL),('8e2e3041-edd1-4b4e-8903-45d3e904a8ca',NULL,'registration-page-form','E-Shop','055129f4-38cb-43b1-bb40-d11245206240',0,10,_binary '','529d1f97-5e77-4be1-9364-3356730d4249',NULL),('90cd2f03-647c-44a7-b832-aad936926365',NULL,'auth-otp-form','E-Shop','87d75377-6ffa-4243-a897-6dda285887e6',0,20,_binary '\0',NULL,NULL),('9184ac5d-80f4-4aae-9f14-cf6b89fd5350',NULL,'idp-username-password-form','master','7999c457-3c73-4b60-9610-50a3382ef76b',0,10,_binary '\0',NULL,NULL),('91863612-b99a-4d36-b6dc-61f2caaf71bd',NULL,'conditional-user-configured','master','6b155745-a15b-4acf-b8df-71a511ffb0c6',0,10,_binary '\0',NULL,NULL),('95c9940d-f71d-42c9-a929-45ca4f2ca81a',NULL,NULL,'master','d8c4f83b-996b-44fa-b3cf-3d65606c789c',0,20,_binary '','a2b52bf3-1199-4055-8670-e73325a73d90',NULL),('9d1993a7-efe6-4963-a6c0-234a6146a03c',NULL,'registration-profile-action','master','56733d23-c883-4e8e-89d9-a80a3d8eda13',0,40,_binary '\0',NULL,NULL),('9d5e26b7-dc4c-4619-bf85-586572cd576c',NULL,NULL,'master','78c37910-7250-4856-9b1c-7eefb2536d2d',1,20,_binary '','3d5a6dd8-1445-4d59-8169-ed30b5c1b04d',NULL),('9dae937c-295c-4202-b85f-f70ad3f3cde1',NULL,'auth-cookie','E-Shop','8494a0f1-0a66-42b8-b4c2-93a6a7e6f77c',2,10,_binary '\0',NULL,NULL),('a0c66648-ab71-42ff-a5bd-f5c746c53d98',NULL,NULL,'E-Shop','2bd09094-637c-49ca-a9d2-cc6870aeb955',0,20,_binary '','9173603e-9a49-4361-ae2c-a9a0f649212b',NULL),('a1f4e858-5de1-4e97-8810-85def1cd305b',NULL,'client-x509','master','139aa4e0-b91c-4db1-8df8-c07c3ea5ed16',2,40,_binary '\0',NULL,NULL),('a5d555d5-1d6d-49be-896e-845bbccfa33d',NULL,'basic-auth-otp','E-Shop','1941f12b-04c5-4029-b737-f765d233ead4',3,20,_binary '\0',NULL,NULL),('a7966305-849e-4da1-ad84-1dfc8c670c6e',NULL,'idp-create-user-if-unique','E-Shop','9173603e-9a49-4361-ae2c-a9a0f649212b',2,10,_binary '\0',NULL,'e9754eb1-395a-482f-b308-b5a19e1dc63a'),('a965e8a1-57dc-43f3-b72f-c7eb4a1fbda2',NULL,'direct-grant-validate-password','master','e740d4b7-0ea2-4915-a752-790ed80276c4',0,20,_binary '\0',NULL,NULL),('ac8a891e-4fca-4ec2-9d1b-6905a774746b',NULL,NULL,'master','bc08f641-35d0-4499-a588-888e71b6e392',2,20,_binary '','7999c457-3c73-4b60-9610-50a3382ef76b',NULL),('b89909b8-ae9c-473f-a9c3-61a4ec997029',NULL,'no-cookie-redirect','master','d8c4f83b-996b-44fa-b3cf-3d65606c789c',0,10,_binary '\0',NULL,NULL),('ba9b423d-6816-4898-a50e-0804d3777d32',NULL,'conditional-user-configured','E-Shop','f13ce5ae-b70f-4619-b2cf-14bf2f0413ee',0,10,_binary '\0',NULL,NULL),('bb2fdb04-46af-4d20-9375-868cfd0f53fd',NULL,'conditional-user-configured','E-Shop','0c981fdb-8e0e-4cdc-b06f-11fd6207f6bc',0,10,_binary '\0',NULL,NULL),('bf86fc1a-0deb-4b90-942c-3b9770e713a2',NULL,'registration-user-creation','master','56733d23-c883-4e8e-89d9-a80a3d8eda13',0,20,_binary '\0',NULL,NULL),('c0f244d0-a720-4a86-a953-33d9d32df14f',NULL,'client-jwt','master','139aa4e0-b91c-4db1-8df8-c07c3ea5ed16',2,20,_binary '\0',NULL,NULL),('c17986c9-f6b0-45dc-afa2-fb205c14d6a5',NULL,NULL,'master','567773b7-676f-493c-ad64-bf99bcb88f9d',2,30,_binary '','78c37910-7250-4856-9b1c-7eefb2536d2d',NULL),('c2b83d6d-4320-4b8c-81e5-e84333474edb',NULL,'docker-http-basic-authenticator','E-Shop','49dfe5a3-01af-493b-b3d0-e05c501f5c93',0,10,_binary '\0',NULL,NULL),('c81e4adb-7d6d-45fa-9e4f-4a4aebbc23b4',NULL,'idp-create-user-if-unique','master','3ee101f4-d8a9-4f0d-85bf-be2869cbd2f7',2,10,_binary '\0',NULL,'d23d0e0c-a08c-4086-9f12-4172d207c6a2'),('cac39d35-cf9f-437e-a193-3e44c6ed18bf',NULL,NULL,'master','d71d8fe9-82bf-41ff-bcd7-90106cefefeb',1,40,_binary '','91341a89-1269-4a29-b8f8-6c1ec26aa525',NULL),('cca96ca3-0185-49be-85ca-ef36426b52dd',NULL,'reset-password','E-Shop','6999727d-3f7c-4f45-b7c4-1dbaaf426c0c',0,30,_binary '\0',NULL,NULL),('d2c4ec54-c943-4f20-b8a0-9048dc94970d',NULL,'registration-recaptcha-action','master','56733d23-c883-4e8e-89d9-a80a3d8eda13',3,60,_binary '\0',NULL,NULL),('d4c888fb-ecfa-4d7d-954b-d25145dfb923',NULL,'idp-confirm-link','master','ae28e2eb-8ad8-4aae-9bf1-e8b9c85e3aeb',0,10,_binary '\0',NULL,NULL),('d5790c90-b59f-4f66-8674-a7755fc6dc63',NULL,'direct-grant-validate-otp','master','1d7d3bad-230c-4fc2-8132-6b2fa19b3283',0,20,_binary '\0',NULL,NULL),('d856ea92-26e5-4fd8-8ab4-094cd113d6cb',NULL,'reset-otp','master','91341a89-1269-4a29-b8f8-6c1ec26aa525',0,20,_binary '\0',NULL,NULL),('d9ea54d3-6423-4efd-84e3-0353776b0433',NULL,'basic-auth','E-Shop','1941f12b-04c5-4029-b737-f765d233ead4',0,10,_binary '\0',NULL,NULL),('dab3f314-c749-4742-a933-63c5a8a32b0e',NULL,'reset-credentials-choose-user','E-Shop','6999727d-3f7c-4f45-b7c4-1dbaaf426c0c',0,10,_binary '\0',NULL,NULL),('de7308b7-bfa2-4e28-adca-5579027866dc',NULL,'auth-spnego','E-Shop','1941f12b-04c5-4029-b737-f765d233ead4',3,30,_binary '\0',NULL,NULL),('de822839-1334-4ec1-838f-466355fcb7c0',NULL,'auth-spnego','master','a2b52bf3-1199-4055-8670-e73325a73d90',3,30,_binary '\0',NULL,NULL),('e0da5913-9c0a-4176-b793-13f5b49a2a01',NULL,NULL,'E-Shop','8494a0f1-0a66-42b8-b4c2-93a6a7e6f77c',2,30,_binary '','d9b659f2-d7c6-441a-b7a6-ca8212abd738',NULL),('e256ab61-c66c-42f5-b8ee-a3b629321b5b',NULL,NULL,'E-Shop','595745aa-9ac0-4a80-9d00-ef093a25c706',1,20,_binary '','0b5417d2-2eea-4f73-9152-ced0d8bd90ec',NULL),('e5bcfe6a-22b9-4b96-ae58-ab0814b83636',NULL,'client-secret','master','139aa4e0-b91c-4db1-8df8-c07c3ea5ed16',2,10,_binary '\0',NULL,NULL),('e5e36524-ed7d-475d-9e46-aa2dcdc0e2d6',NULL,'client-jwt','E-Shop','db270677-e384-4a04-b7b2-f12149e34065',2,20,_binary '\0',NULL,NULL),('f1604bcd-95f2-4aa8-af84-a827234c4d65',NULL,'reset-credential-email','master','d71d8fe9-82bf-41ff-bcd7-90106cefefeb',0,20,_binary '\0',NULL,NULL),('f30a2070-18fa-4a95-916d-b370095cf113',NULL,NULL,'master','ae28e2eb-8ad8-4aae-9bf1-e8b9c85e3aeb',0,20,_binary '','bc08f641-35d0-4499-a588-888e71b6e392',NULL),('f71d4ea0-5da0-4596-856a-fd5d7842a8a9',NULL,'http-basic-authenticator','E-Shop','912f3a8f-1f03-46d0-9317-296657b5cbf7',0,10,_binary '\0',NULL,NULL),('fad07768-21f5-4052-8ef0-e1a0e87b3c40',NULL,NULL,'master','4ff82b1b-2164-481e-b682-7e8a736cbf34',0,20,_binary '','3ee101f4-d8a9-4f0d-85bf-be2869cbd2f7',NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('055129f4-38cb-43b1-bb40-d11245206240','registration','registration flow','E-Shop','basic-flow',_binary '',_binary ''),('06ac6c6a-a0da-45da-8d61-85a1bfe1e420','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('0b5417d2-2eea-4f73-9152-ced0d8bd90ec','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','E-Shop','basic-flow',_binary '\0',_binary ''),('0c981fdb-8e0e-4cdc-b06f-11fd6207f6bc','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','E-Shop','basic-flow',_binary '\0',_binary ''),('10336480-7665-4dcd-9a9c-29b20578150c','direct grant','OpenID Connect Resource Owner Grant','E-Shop','basic-flow',_binary '',_binary ''),('139aa4e0-b91c-4db1-8df8-c07c3ea5ed16','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('1941f12b-04c5-4029-b737-f765d233ead4','Authentication Options','Authentication options.','E-Shop','basic-flow',_binary '\0',_binary ''),('1d7d3bad-230c-4fc2-8132-6b2fa19b3283','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('2bd09094-637c-49ca-a9d2-cc6870aeb955','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','E-Shop','basic-flow',_binary '',_binary ''),('3d5a6dd8-1445-4d59-8169-ed30b5c1b04d','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('3ee101f4-d8a9-4f0d-85bf-be2869cbd2f7','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('3fa60aa7-103e-4490-bc06-a80e0d20d207','registration','registration flow','master','basic-flow',_binary '',_binary ''),('49dfe5a3-01af-493b-b3d0-e05c501f5c93','docker auth','Used by Docker clients to authenticate against the IDP','E-Shop','basic-flow',_binary '',_binary ''),('4ff82b1b-2164-481e-b682-7e8a736cbf34','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('529d1f97-5e77-4be1-9364-3356730d4249','registration form','registration form','E-Shop','form-flow',_binary '\0',_binary ''),('56733d23-c883-4e8e-89d9-a80a3d8eda13','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('567773b7-676f-493c-ad64-bf99bcb88f9d','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('595745aa-9ac0-4a80-9d00-ef093a25c706','Verify Existing Account by Re-authentication','Reauthentication of existing account','E-Shop','basic-flow',_binary '\0',_binary ''),('6999727d-3f7c-4f45-b7c4-1dbaaf426c0c','reset credentials','Reset credentials for a user if they forgot their password or something','E-Shop','basic-flow',_binary '',_binary ''),('6b155745-a15b-4acf-b8df-71a511ffb0c6','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('78c37910-7250-4856-9b1c-7eefb2536d2d','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('7999c457-3c73-4b60-9610-50a3382ef76b','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('8494a0f1-0a66-42b8-b4c2-93a6a7e6f77c','browser','browser based authentication','E-Shop','basic-flow',_binary '',_binary ''),('87d75377-6ffa-4243-a897-6dda285887e6','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','E-Shop','basic-flow',_binary '\0',_binary ''),('912f3a8f-1f03-46d0-9317-296657b5cbf7','saml ecp','SAML ECP Profile Authentication Flow','E-Shop','basic-flow',_binary '',_binary ''),('91341a89-1269-4a29-b8f8-6c1ec26aa525','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('9173603e-9a49-4361-ae2c-a9a0f649212b','User creation or linking','Flow for the existing/non-existing user alternatives','E-Shop','basic-flow',_binary '\0',_binary ''),('99624801-a68c-40f2-b35f-f5a82e45b3ff','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('a2b52bf3-1199-4055-8670-e73325a73d90','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('ae28e2eb-8ad8-4aae-9bf1-e8b9c85e3aeb','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('bc08f641-35d0-4499-a588-888e71b6e392','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('ca4f1c1d-9b69-4914-84af-a69e55555c58','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','E-Shop','basic-flow',_binary '',_binary ''),('d71d8fe9-82bf-41ff-bcd7-90106cefefeb','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('d8c4f83b-996b-44fa-b3cf-3d65606c789c','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('d9b659f2-d7c6-441a-b7a6-ca8212abd738','forms','Username, password, otp and other auth forms.','E-Shop','basic-flow',_binary '\0',_binary ''),('db270677-e384-4a04-b7b2-f12149e34065','clients','Base authentication for clients','E-Shop','client-flow',_binary '',_binary ''),('de17636e-aa19-440a-b7f1-56a4a75866d5','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','E-Shop','basic-flow',_binary '\0',_binary ''),('e740d4b7-0ea2-4915-a752-790ed80276c4','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('efa60567-7657-4e5a-8feb-d79690569e9f','Account verification options','Method with which to verity the existing account','E-Shop','basic-flow',_binary '\0',_binary ''),('f13ce5ae-b70f-4619-b2cf-14bf2f0413ee','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','E-Shop','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('69b69763-5c86-4381-9530-f422bdeef1b1','review profile config','E-Shop'),('72a7f432-d565-46f3-8aa5-d894b1cf11ec','review profile config','master'),('d23d0e0c-a08c-4086-9f12-4172d207c6a2','create unique user config','master'),('e9754eb1-395a-482f-b308-b5a19e1dc63a','create unique user config','E-Shop');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('69b69763-5c86-4381-9530-f422bdeef1b1','missing','update.profile.on.first.login'),('72a7f432-d565-46f3-8aa5-d894b1cf11ec','missing','update.profile.on.first.login'),('d23d0e0c-a08c-4086-9f12-4172d207c6a2','false','require.password.update.after.registration'),('e9754eb1-395a-482f-b308-b5a19e1dc63a','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('0014a2dd-faaa-4d6f-a780-65f741c420a1',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('06ada848-0832-48aa-85c1-4edcd32466ef',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/E-Shop/account/',_binary '\0',NULL,_binary '\0','E-Shop','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '',_binary '\0','master-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('16231c59-6866-4260-85c1-7718403d3773',_binary '',_binary '\0','admin-cli',0,_binary '',NULL,NULL,_binary '\0',NULL,_binary '\0','E-Shop','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '',_binary '\0','E-Shop-realm',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','E-Shop Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/E-Shop/console/',_binary '\0',NULL,_binary '\0','E-Shop','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '',_binary '\0','realm-management',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','E-Shop','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('a435858d-9d77-4e8d-8e78-884b5f356d67',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','E-Shop','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('a5b2fcca-88c0-4087-840d-e5525002cf4d',_binary '',_binary '\0','admin-cli',0,_binary '\0','BQdIipQduVxWBl7Nqw5Qq8fFXIOxa6zZ',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '','client-secret',NULL,NULL,'3d1fc6d3-7013-4a85-bcb2-7aa5f04cbd16',_binary '\0',_binary '\0',_binary '',_binary '\0'),('a7294a4e-28b6-4cdb-86d4-42af42972ce8',_binary '',_binary '\0','account',0,_binary '',NULL,'/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b40ebd44-a01e-4903-bd15-3895c66866da',_binary '',_binary '','frontend-app',0,_binary '\0','spxkUSHmR4D3955m1E6asFBVD0pMi0mU','http://localhost:3000',_binary '\0',NULL,_binary '\0','E-Shop','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('ce7dc481-b365-47f8-919d-3676a3a64308',_binary '',_binary '\0','account-console',0,_binary '',NULL,'/realms/E-Shop/account/',_binary '\0',NULL,_binary '\0','E-Shop','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d55de1f0-98c2-4e82-9f2d-3ccf0d3f59df',_binary '',_binary '\0','broker',0,_binary '\0',NULL,NULL,_binary '',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('efd1931c-a641-4f68-9a76-a847fad0b51c',_binary '',_binary '\0','security-admin-console',0,_binary '',NULL,'/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  KEY `IDX_CLIENT_ATT_BY_NAME_VALUE` (`NAME`,`VALUE`(255)),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('0014a2dd-faaa-4d6f-a780-65f741c420a1','S256','pkce.code.challenge.method'),('51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf','S256','pkce.code.challenge.method'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','backchannel.logout.revoke.offline.tokens'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','backchannel.logout.session.required'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','client_credentials.use_refresh_token'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','display.on.consent.screen'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','exclude.session.state.from.auth.response'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','id.token.as.detached.signature'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','oauth2.device.authorization.grant.enabled'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','oidc.ciba.grant.enabled'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','require.pushed.authorization.requests'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','saml_force_name_id_format'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','saml.artifact.binding'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','saml.assertion.signature'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','saml.authnstatement'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','saml.client.signature'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','saml.encrypt'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','saml.force.post.binding'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','saml.multivalued.roles'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','saml.onetimeuse.condition'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','saml.server.signature'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','saml.server.signature.keyinfo.ext'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','false','tls.client.certificate.bound.access.tokens'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','true','use.refresh.tokens'),('b40ebd44-a01e-4903-bd15-3895c66866da','216000','access.token.lifespan'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','backchannel.logout.revoke.offline.tokens'),('b40ebd44-a01e-4903-bd15-3895c66866da','true','backchannel.logout.session.required'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','client_credentials.use_refresh_token'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','display.on.consent.screen'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','exclude.session.state.from.auth.response'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','id.token.as.detached.signature'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','oauth2.device.authorization.grant.enabled'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','oidc.ciba.grant.enabled'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','require.pushed.authorization.requests'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','saml_force_name_id_format'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','saml.artifact.binding'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','saml.assertion.signature'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','saml.authnstatement'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','saml.client.signature'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','saml.encrypt'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','saml.force.post.binding'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','saml.multivalued.roles'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','saml.onetimeuse.condition'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','saml.server.signature'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','saml.server.signature.keyinfo.ext'),('b40ebd44-a01e-4903-bd15-3895c66866da','false','tls.client.certificate.bound.access.tokens'),('b40ebd44-a01e-4903-bd15-3895c66866da','true','use.refresh.tokens'),('ce7dc481-b365-47f8-919d-3676a3a64308','S256','pkce.code.challenge.method'),('efd1931c-a641-4f68-9a76-a847fad0b51c','S256','pkce.code.challenge.method');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('0b9ca758-ecdc-442f-b4b7-eb45447b551e','roles','E-Shop','OpenID Connect scope for add user roles to the access token','openid-connect'),('1b4c37bd-0642-4d01-944e-35f67cafd6f4','address','master','OpenID Connect built-in scope: address','openid-connect'),('2187b1de-a95f-413f-8308-ea8294fec455','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('29ef25af-6d88-467a-b174-c42a1bb11a6e','role_list','E-Shop','SAML role list','saml'),('433b2ccd-c94f-4b37-966d-bc98dd416bbf','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('477cbdd9-a00c-4005-b71a-3d2d1a66103e','web-origins','E-Shop','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('6ba8dfee-89ce-423a-898e-7f2666bd7d92','profile','E-Shop','OpenID Connect built-in scope: profile','openid-connect'),('747f4dc5-1dc1-4cf5-a015-963d38f5216b','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('91f8fbe7-e919-46f0-b6e2-32735fc57ab7','email','E-Shop','OpenID Connect built-in scope: email','openid-connect'),('b71c7127-277a-463e-9bc0-dfd20bca6294','phone','E-Shop','OpenID Connect built-in scope: phone','openid-connect'),('b94aa4e2-c6a1-40fe-a9e5-b8889ac196cd','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('b97e3d96-395c-4751-bdd4-be1139159dee','role_list','master','SAML role list','saml'),('c1a84955-c770-4d26-920a-0c3a3479ba7f','microprofile-jwt','E-Shop','Microprofile - JWT built-in scope','openid-connect'),('c34ffec1-b1ad-40c3-b4cf-01697ccde3ac','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('c73192ab-2ac8-461d-a33c-6e94621f5f22','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e','address','E-Shop','OpenID Connect built-in scope: address','openid-connect'),('e43ee7ee-2db9-4b2f-87ea-4fe3dfe84348','offline_access','E-Shop','OpenID Connect built-in scope: offline_access','openid-connect'),('f500d521-831f-48c2-ba3b-7da49f4cc685','email','master','OpenID Connect built-in scope: email','openid-connect');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` text,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('0b9ca758-ecdc-442f-b4b7-eb45447b551e','${rolesScopeConsentText}','consent.screen.text'),('0b9ca758-ecdc-442f-b4b7-eb45447b551e','true','display.on.consent.screen'),('0b9ca758-ecdc-442f-b4b7-eb45447b551e','false','include.in.token.scope'),('1b4c37bd-0642-4d01-944e-35f67cafd6f4','${addressScopeConsentText}','consent.screen.text'),('1b4c37bd-0642-4d01-944e-35f67cafd6f4','true','display.on.consent.screen'),('1b4c37bd-0642-4d01-944e-35f67cafd6f4','true','include.in.token.scope'),('2187b1de-a95f-413f-8308-ea8294fec455','false','display.on.consent.screen'),('2187b1de-a95f-413f-8308-ea8294fec455','true','include.in.token.scope'),('29ef25af-6d88-467a-b174-c42a1bb11a6e','${samlRoleListScopeConsentText}','consent.screen.text'),('29ef25af-6d88-467a-b174-c42a1bb11a6e','true','display.on.consent.screen'),('433b2ccd-c94f-4b37-966d-bc98dd416bbf','${rolesScopeConsentText}','consent.screen.text'),('433b2ccd-c94f-4b37-966d-bc98dd416bbf','true','display.on.consent.screen'),('433b2ccd-c94f-4b37-966d-bc98dd416bbf','false','include.in.token.scope'),('477cbdd9-a00c-4005-b71a-3d2d1a66103e','','consent.screen.text'),('477cbdd9-a00c-4005-b71a-3d2d1a66103e','false','display.on.consent.screen'),('477cbdd9-a00c-4005-b71a-3d2d1a66103e','false','include.in.token.scope'),('6ba8dfee-89ce-423a-898e-7f2666bd7d92','${profileScopeConsentText}','consent.screen.text'),('6ba8dfee-89ce-423a-898e-7f2666bd7d92','true','display.on.consent.screen'),('6ba8dfee-89ce-423a-898e-7f2666bd7d92','true','include.in.token.scope'),('747f4dc5-1dc1-4cf5-a015-963d38f5216b','${offlineAccessScopeConsentText}','consent.screen.text'),('747f4dc5-1dc1-4cf5-a015-963d38f5216b','true','display.on.consent.screen'),('91f8fbe7-e919-46f0-b6e2-32735fc57ab7','${emailScopeConsentText}','consent.screen.text'),('91f8fbe7-e919-46f0-b6e2-32735fc57ab7','true','display.on.consent.screen'),('91f8fbe7-e919-46f0-b6e2-32735fc57ab7','true','include.in.token.scope'),('b71c7127-277a-463e-9bc0-dfd20bca6294','${phoneScopeConsentText}','consent.screen.text'),('b71c7127-277a-463e-9bc0-dfd20bca6294','true','display.on.consent.screen'),('b71c7127-277a-463e-9bc0-dfd20bca6294','true','include.in.token.scope'),('b94aa4e2-c6a1-40fe-a9e5-b8889ac196cd','','consent.screen.text'),('b94aa4e2-c6a1-40fe-a9e5-b8889ac196cd','false','display.on.consent.screen'),('b94aa4e2-c6a1-40fe-a9e5-b8889ac196cd','false','include.in.token.scope'),('b97e3d96-395c-4751-bdd4-be1139159dee','${samlRoleListScopeConsentText}','consent.screen.text'),('b97e3d96-395c-4751-bdd4-be1139159dee','true','display.on.consent.screen'),('c1a84955-c770-4d26-920a-0c3a3479ba7f','false','display.on.consent.screen'),('c1a84955-c770-4d26-920a-0c3a3479ba7f','true','include.in.token.scope'),('c34ffec1-b1ad-40c3-b4cf-01697ccde3ac','${profileScopeConsentText}','consent.screen.text'),('c34ffec1-b1ad-40c3-b4cf-01697ccde3ac','true','display.on.consent.screen'),('c34ffec1-b1ad-40c3-b4cf-01697ccde3ac','true','include.in.token.scope'),('c73192ab-2ac8-461d-a33c-6e94621f5f22','${phoneScopeConsentText}','consent.screen.text'),('c73192ab-2ac8-461d-a33c-6e94621f5f22','true','display.on.consent.screen'),('c73192ab-2ac8-461d-a33c-6e94621f5f22','true','include.in.token.scope'),('dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e','${addressScopeConsentText}','consent.screen.text'),('dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e','true','display.on.consent.screen'),('dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e','true','include.in.token.scope'),('e43ee7ee-2db9-4b2f-87ea-4fe3dfe84348','${offlineAccessScopeConsentText}','consent.screen.text'),('e43ee7ee-2db9-4b2f-87ea-4fe3dfe84348','true','display.on.consent.screen'),('f500d521-831f-48c2-ba3b-7da49f4cc685','${emailScopeConsentText}','consent.screen.text'),('f500d521-831f-48c2-ba3b-7da49f4cc685','true','display.on.consent.screen'),('f500d521-831f-48c2-ba3b-7da49f4cc685','true','include.in.token.scope');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(255) NOT NULL,
  `SCOPE_ID` varchar(255) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0014a2dd-faaa-4d6f-a780-65f741c420a1','1b4c37bd-0642-4d01-944e-35f67cafd6f4',_binary '\0'),('0014a2dd-faaa-4d6f-a780-65f741c420a1','2187b1de-a95f-413f-8308-ea8294fec455',_binary '\0'),('0014a2dd-faaa-4d6f-a780-65f741c420a1','433b2ccd-c94f-4b37-966d-bc98dd416bbf',_binary ''),('0014a2dd-faaa-4d6f-a780-65f741c420a1','747f4dc5-1dc1-4cf5-a015-963d38f5216b',_binary '\0'),('0014a2dd-faaa-4d6f-a780-65f741c420a1','b94aa4e2-c6a1-40fe-a9e5-b8889ac196cd',_binary ''),('0014a2dd-faaa-4d6f-a780-65f741c420a1','c34ffec1-b1ad-40c3-b4cf-01697ccde3ac',_binary ''),('0014a2dd-faaa-4d6f-a780-65f741c420a1','c73192ab-2ac8-461d-a33c-6e94621f5f22',_binary '\0'),('0014a2dd-faaa-4d6f-a780-65f741c420a1','f500d521-831f-48c2-ba3b-7da49f4cc685',_binary ''),('06ada848-0832-48aa-85c1-4edcd32466ef','0b9ca758-ecdc-442f-b4b7-eb45447b551e',_binary ''),('06ada848-0832-48aa-85c1-4edcd32466ef','477cbdd9-a00c-4005-b71a-3d2d1a66103e',_binary ''),('06ada848-0832-48aa-85c1-4edcd32466ef','6ba8dfee-89ce-423a-898e-7f2666bd7d92',_binary ''),('06ada848-0832-48aa-85c1-4edcd32466ef','91f8fbe7-e919-46f0-b6e2-32735fc57ab7',_binary ''),('06ada848-0832-48aa-85c1-4edcd32466ef','b71c7127-277a-463e-9bc0-dfd20bca6294',_binary '\0'),('06ada848-0832-48aa-85c1-4edcd32466ef','c1a84955-c770-4d26-920a-0c3a3479ba7f',_binary '\0'),('06ada848-0832-48aa-85c1-4edcd32466ef','dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e',_binary '\0'),('06ada848-0832-48aa-85c1-4edcd32466ef','e43ee7ee-2db9-4b2f-87ea-4fe3dfe84348',_binary '\0'),('0aa7022b-4395-459d-9e6d-df7a41accaa4','1b4c37bd-0642-4d01-944e-35f67cafd6f4',_binary '\0'),('0aa7022b-4395-459d-9e6d-df7a41accaa4','2187b1de-a95f-413f-8308-ea8294fec455',_binary '\0'),('0aa7022b-4395-459d-9e6d-df7a41accaa4','433b2ccd-c94f-4b37-966d-bc98dd416bbf',_binary ''),('0aa7022b-4395-459d-9e6d-df7a41accaa4','747f4dc5-1dc1-4cf5-a015-963d38f5216b',_binary '\0'),('0aa7022b-4395-459d-9e6d-df7a41accaa4','b94aa4e2-c6a1-40fe-a9e5-b8889ac196cd',_binary ''),('0aa7022b-4395-459d-9e6d-df7a41accaa4','c34ffec1-b1ad-40c3-b4cf-01697ccde3ac',_binary ''),('0aa7022b-4395-459d-9e6d-df7a41accaa4','c73192ab-2ac8-461d-a33c-6e94621f5f22',_binary '\0'),('0aa7022b-4395-459d-9e6d-df7a41accaa4','f500d521-831f-48c2-ba3b-7da49f4cc685',_binary ''),('16231c59-6866-4260-85c1-7718403d3773','0b9ca758-ecdc-442f-b4b7-eb45447b551e',_binary ''),('16231c59-6866-4260-85c1-7718403d3773','477cbdd9-a00c-4005-b71a-3d2d1a66103e',_binary ''),('16231c59-6866-4260-85c1-7718403d3773','6ba8dfee-89ce-423a-898e-7f2666bd7d92',_binary ''),('16231c59-6866-4260-85c1-7718403d3773','91f8fbe7-e919-46f0-b6e2-32735fc57ab7',_binary ''),('16231c59-6866-4260-85c1-7718403d3773','b71c7127-277a-463e-9bc0-dfd20bca6294',_binary '\0'),('16231c59-6866-4260-85c1-7718403d3773','c1a84955-c770-4d26-920a-0c3a3479ba7f',_binary '\0'),('16231c59-6866-4260-85c1-7718403d3773','dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e',_binary '\0'),('16231c59-6866-4260-85c1-7718403d3773','e43ee7ee-2db9-4b2f-87ea-4fe3dfe84348',_binary '\0'),('51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf','0b9ca758-ecdc-442f-b4b7-eb45447b551e',_binary ''),('51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf','477cbdd9-a00c-4005-b71a-3d2d1a66103e',_binary ''),('51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf','6ba8dfee-89ce-423a-898e-7f2666bd7d92',_binary ''),('51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf','91f8fbe7-e919-46f0-b6e2-32735fc57ab7',_binary ''),('51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf','b71c7127-277a-463e-9bc0-dfd20bca6294',_binary '\0'),('51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf','c1a84955-c770-4d26-920a-0c3a3479ba7f',_binary '\0'),('51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf','dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e',_binary '\0'),('51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf','e43ee7ee-2db9-4b2f-87ea-4fe3dfe84348',_binary '\0'),('9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa','0b9ca758-ecdc-442f-b4b7-eb45447b551e',_binary ''),('9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa','477cbdd9-a00c-4005-b71a-3d2d1a66103e',_binary ''),('9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa','6ba8dfee-89ce-423a-898e-7f2666bd7d92',_binary ''),('9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa','91f8fbe7-e919-46f0-b6e2-32735fc57ab7',_binary ''),('9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa','b71c7127-277a-463e-9bc0-dfd20bca6294',_binary '\0'),('9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa','c1a84955-c770-4d26-920a-0c3a3479ba7f',_binary '\0'),('9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa','dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e',_binary '\0'),('9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa','e43ee7ee-2db9-4b2f-87ea-4fe3dfe84348',_binary '\0'),('a435858d-9d77-4e8d-8e78-884b5f356d67','0b9ca758-ecdc-442f-b4b7-eb45447b551e',_binary ''),('a435858d-9d77-4e8d-8e78-884b5f356d67','477cbdd9-a00c-4005-b71a-3d2d1a66103e',_binary ''),('a435858d-9d77-4e8d-8e78-884b5f356d67','6ba8dfee-89ce-423a-898e-7f2666bd7d92',_binary ''),('a435858d-9d77-4e8d-8e78-884b5f356d67','91f8fbe7-e919-46f0-b6e2-32735fc57ab7',_binary ''),('a435858d-9d77-4e8d-8e78-884b5f356d67','b71c7127-277a-463e-9bc0-dfd20bca6294',_binary '\0'),('a435858d-9d77-4e8d-8e78-884b5f356d67','c1a84955-c770-4d26-920a-0c3a3479ba7f',_binary '\0'),('a435858d-9d77-4e8d-8e78-884b5f356d67','dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e',_binary '\0'),('a435858d-9d77-4e8d-8e78-884b5f356d67','e43ee7ee-2db9-4b2f-87ea-4fe3dfe84348',_binary '\0'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','1b4c37bd-0642-4d01-944e-35f67cafd6f4',_binary '\0'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','2187b1de-a95f-413f-8308-ea8294fec455',_binary '\0'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','433b2ccd-c94f-4b37-966d-bc98dd416bbf',_binary ''),('a5b2fcca-88c0-4087-840d-e5525002cf4d','747f4dc5-1dc1-4cf5-a015-963d38f5216b',_binary '\0'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','b94aa4e2-c6a1-40fe-a9e5-b8889ac196cd',_binary ''),('a5b2fcca-88c0-4087-840d-e5525002cf4d','c34ffec1-b1ad-40c3-b4cf-01697ccde3ac',_binary ''),('a5b2fcca-88c0-4087-840d-e5525002cf4d','c73192ab-2ac8-461d-a33c-6e94621f5f22',_binary '\0'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','f500d521-831f-48c2-ba3b-7da49f4cc685',_binary ''),('a7294a4e-28b6-4cdb-86d4-42af42972ce8','1b4c37bd-0642-4d01-944e-35f67cafd6f4',_binary '\0'),('a7294a4e-28b6-4cdb-86d4-42af42972ce8','2187b1de-a95f-413f-8308-ea8294fec455',_binary '\0'),('a7294a4e-28b6-4cdb-86d4-42af42972ce8','433b2ccd-c94f-4b37-966d-bc98dd416bbf',_binary ''),('a7294a4e-28b6-4cdb-86d4-42af42972ce8','747f4dc5-1dc1-4cf5-a015-963d38f5216b',_binary '\0'),('a7294a4e-28b6-4cdb-86d4-42af42972ce8','b94aa4e2-c6a1-40fe-a9e5-b8889ac196cd',_binary ''),('a7294a4e-28b6-4cdb-86d4-42af42972ce8','c34ffec1-b1ad-40c3-b4cf-01697ccde3ac',_binary ''),('a7294a4e-28b6-4cdb-86d4-42af42972ce8','c73192ab-2ac8-461d-a33c-6e94621f5f22',_binary '\0'),('a7294a4e-28b6-4cdb-86d4-42af42972ce8','f500d521-831f-48c2-ba3b-7da49f4cc685',_binary ''),('b40ebd44-a01e-4903-bd15-3895c66866da','0b9ca758-ecdc-442f-b4b7-eb45447b551e',_binary ''),('b40ebd44-a01e-4903-bd15-3895c66866da','477cbdd9-a00c-4005-b71a-3d2d1a66103e',_binary ''),('b40ebd44-a01e-4903-bd15-3895c66866da','6ba8dfee-89ce-423a-898e-7f2666bd7d92',_binary ''),('b40ebd44-a01e-4903-bd15-3895c66866da','91f8fbe7-e919-46f0-b6e2-32735fc57ab7',_binary ''),('b40ebd44-a01e-4903-bd15-3895c66866da','b71c7127-277a-463e-9bc0-dfd20bca6294',_binary '\0'),('b40ebd44-a01e-4903-bd15-3895c66866da','c1a84955-c770-4d26-920a-0c3a3479ba7f',_binary '\0'),('b40ebd44-a01e-4903-bd15-3895c66866da','dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e',_binary '\0'),('b40ebd44-a01e-4903-bd15-3895c66866da','e43ee7ee-2db9-4b2f-87ea-4fe3dfe84348',_binary '\0'),('ce7dc481-b365-47f8-919d-3676a3a64308','0b9ca758-ecdc-442f-b4b7-eb45447b551e',_binary ''),('ce7dc481-b365-47f8-919d-3676a3a64308','477cbdd9-a00c-4005-b71a-3d2d1a66103e',_binary ''),('ce7dc481-b365-47f8-919d-3676a3a64308','6ba8dfee-89ce-423a-898e-7f2666bd7d92',_binary ''),('ce7dc481-b365-47f8-919d-3676a3a64308','91f8fbe7-e919-46f0-b6e2-32735fc57ab7',_binary ''),('ce7dc481-b365-47f8-919d-3676a3a64308','b71c7127-277a-463e-9bc0-dfd20bca6294',_binary '\0'),('ce7dc481-b365-47f8-919d-3676a3a64308','c1a84955-c770-4d26-920a-0c3a3479ba7f',_binary '\0'),('ce7dc481-b365-47f8-919d-3676a3a64308','dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e',_binary '\0'),('ce7dc481-b365-47f8-919d-3676a3a64308','e43ee7ee-2db9-4b2f-87ea-4fe3dfe84348',_binary '\0'),('d55de1f0-98c2-4e82-9f2d-3ccf0d3f59df','1b4c37bd-0642-4d01-944e-35f67cafd6f4',_binary '\0'),('d55de1f0-98c2-4e82-9f2d-3ccf0d3f59df','2187b1de-a95f-413f-8308-ea8294fec455',_binary '\0'),('d55de1f0-98c2-4e82-9f2d-3ccf0d3f59df','433b2ccd-c94f-4b37-966d-bc98dd416bbf',_binary ''),('d55de1f0-98c2-4e82-9f2d-3ccf0d3f59df','747f4dc5-1dc1-4cf5-a015-963d38f5216b',_binary '\0'),('d55de1f0-98c2-4e82-9f2d-3ccf0d3f59df','b94aa4e2-c6a1-40fe-a9e5-b8889ac196cd',_binary ''),('d55de1f0-98c2-4e82-9f2d-3ccf0d3f59df','c34ffec1-b1ad-40c3-b4cf-01697ccde3ac',_binary ''),('d55de1f0-98c2-4e82-9f2d-3ccf0d3f59df','c73192ab-2ac8-461d-a33c-6e94621f5f22',_binary '\0'),('d55de1f0-98c2-4e82-9f2d-3ccf0d3f59df','f500d521-831f-48c2-ba3b-7da49f4cc685',_binary ''),('efd1931c-a641-4f68-9a76-a847fad0b51c','1b4c37bd-0642-4d01-944e-35f67cafd6f4',_binary '\0'),('efd1931c-a641-4f68-9a76-a847fad0b51c','2187b1de-a95f-413f-8308-ea8294fec455',_binary '\0'),('efd1931c-a641-4f68-9a76-a847fad0b51c','433b2ccd-c94f-4b37-966d-bc98dd416bbf',_binary ''),('efd1931c-a641-4f68-9a76-a847fad0b51c','747f4dc5-1dc1-4cf5-a015-963d38f5216b',_binary '\0'),('efd1931c-a641-4f68-9a76-a847fad0b51c','b94aa4e2-c6a1-40fe-a9e5-b8889ac196cd',_binary ''),('efd1931c-a641-4f68-9a76-a847fad0b51c','c34ffec1-b1ad-40c3-b4cf-01697ccde3ac',_binary ''),('efd1931c-a641-4f68-9a76-a847fad0b51c','c73192ab-2ac8-461d-a33c-6e94621f5f22',_binary '\0'),('efd1931c-a641-4f68-9a76-a847fad0b51c','f500d521-831f-48c2-ba3b-7da49f4cc685',_binary '');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('747f4dc5-1dc1-4cf5-a015-963d38f5216b','9b07c509-b263-4b65-ad23-59fc9309fe74'),('e43ee7ee-2db9-4b2f-87ea-4fe3dfe84348','146bf024-745e-4a7b-85b9-8ca42e95b4db');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  `CLIENT_SESSION` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('067a1445-3c10-40f0-bb62-28ef29fda266','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('07d29315-8251-460a-89c6-f94852bb95d5','aes-generated','E-Shop','aes-generated','org.keycloak.keys.KeyProvider','E-Shop',NULL),('0a2b6bae-5175-4db4-9f37-ab6c3bf47d0b','rsa-generated','E-Shop','rsa-generated','org.keycloak.keys.KeyProvider','E-Shop',NULL),('1a726d66-6400-4ca5-a6e3-dad6d5577980','Max Clients Limit','E-Shop','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','E-Shop','anonymous'),('2a47660c-0ce5-4728-a9a9-c75a70113b34','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('2b246977-8a3c-441f-9ce4-f33120f81729','Consent Required','E-Shop','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','E-Shop','anonymous'),('2d1dc624-7bf4-4d60-a9c4-8efe5d07dddf','Trusted Hosts','E-Shop','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','E-Shop','anonymous'),('37768b3e-88b0-4045-b1db-160896803a87','Full Scope Disabled','E-Shop','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','E-Shop','anonymous'),('458b1eaf-e1e7-4ceb-8fdf-d998e73553d0','Allowed Protocol Mapper Types','E-Shop','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','E-Shop','authenticated'),('79389f0a-3c4f-484d-aa82-40bf1a253fcf','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('85aec1a7-bd1e-4d6a-aa8b-09f2ecdc99f2','aes-generated','master','aes-generated','org.keycloak.keys.KeyProvider','master',NULL),('8f8a96d7-60f3-4935-a06d-e58ddc82c832','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('96362b25-95cf-46f7-8743-3345e3480b2f','Allowed Protocol Mapper Types','E-Shop','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','E-Shop','anonymous'),('98a64dac-f807-4851-b055-b8c970189146','rsa-enc-generated','E-Shop','rsa-enc-generated','org.keycloak.keys.KeyProvider','E-Shop',NULL),('9dad47aa-e77a-478f-b0b5-bdaf490a1b9b','hmac-generated','E-Shop','hmac-generated','org.keycloak.keys.KeyProvider','E-Shop',NULL),('b1a5e6f0-719b-4185-88bc-4ae291f2dd95','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('b8fd3abb-803d-43dc-8ac2-dc9032624c5a','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('be05d18f-4618-4376-a4bc-d1720c5a7fec','Allowed Client Scopes','E-Shop','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','E-Shop','anonymous'),('c10daed8-b6a3-4063-b7a2-bdbba43bd623','Allowed Client Scopes','E-Shop','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','E-Shop','authenticated'),('cb4d4393-a656-4ced-bc78-f20111cea7fc','hmac-generated','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('cb6327d5-2bf2-426c-8016-23096cf0f326','rsa-generated','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('d0198308-010d-487e-912b-1070ce05ceb5','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('d0b3d952-b9c4-4367-9950-c663504f88c7','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('e1f2b46c-6719-45dc-ad9d-bfc256bc52fa','rsa-enc-generated','master','rsa-enc-generated','org.keycloak.keys.KeyProvider','master',NULL);
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('0463ad58-4dad-444b-92cd-23fcf86767f2','07d29315-8251-460a-89c6-f94852bb95d5','secret','V1GJnMVJTKXeXegbiBVqZQ'),('095a7095-93e7-4467-8bf4-8449dbbbcd0c','2d1dc624-7bf4-4d60-a9c4-8efe5d07dddf','client-uris-must-match','true'),('0e5b1817-c81f-4a5a-956e-ef35c4ed4074','cb6327d5-2bf2-426c-8016-23096cf0f326','priority','100'),('114331ca-3ab0-47a5-aa6d-d3f01047f255','79389f0a-3c4f-484d-aa82-40bf1a253fcf','allowed-protocol-mapper-types','oidc-address-mapper'),('11f723b6-ca04-4c4c-9fb2-832ce9843a90','98a64dac-f807-4851-b055-b8c970189146','keyUse','ENC'),('14f98be5-330e-4620-ad56-cc6d2aafbc58','b8fd3abb-803d-43dc-8ac2-dc9032624c5a','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('191f1811-86ca-4b0f-8b57-1dfdf2c2b589','b8fd3abb-803d-43dc-8ac2-dc9032624c5a','allowed-protocol-mapper-types','saml-role-list-mapper'),('1af42f6a-c463-4f74-afa1-d5fc8d942284','b8fd3abb-803d-43dc-8ac2-dc9032624c5a','allowed-protocol-mapper-types','oidc-full-name-mapper'),('1f5bfe7f-e423-42af-ad18-24ec710716a3','458b1eaf-e1e7-4ceb-8fdf-d998e73553d0','allowed-protocol-mapper-types','oidc-address-mapper'),('214a8aa4-0711-4fef-883c-ab7a36615d05','0a2b6bae-5175-4db4-9f37-ab6c3bf47d0b','privateKey','MIIEowIBAAKCAQEAo24CfExcmECjtefJ2EkdhbESd3PeulNiq+9uP9Ky/BLT3O2tptQz1Bf0GpvMy5fnBNYdFqOKkJ1L7SjeJo9GfKksJXbZt8r2VkRR62+4ofa/MdXME1Qs+w1z2+csttJsgmOi/2KJPjJ5KbQFWc8yYYmFVW+5MG1IZrpm/4sq//ZToCp8T95DihyqN/Zc0eoeU2gKL3SavxDgnkbihKsO9XSTWM85bzmhoPrpdb4BwMeiYGnoXp+8zmpW7k92LWP4PviWPteYxslm53RXaC+KvdMUUogO4tTgzo3yvFGoQke6smVbcYleph4izzzeryTUTKW11DzrA54KkOhvJy7XzwIDAQABAoIBACJO79qkNTQJLdT8KdVr0/TC7XuCKZm385jglKZ1VvmwAiX5B2FkXtUBik8jseRzqR3MzSJ5hpdBTjUlRS2XGlcFNK1Qu/fndbs6cHAabgoiQJT3qvXLz/2MH2xkpXBj0D+3Jvqx9tnFwsXMcusdohfzxLfg0mGmL3LRYtn2nzpIZ3mtmB7G+jWDs5k/mk0lNejEKEDU3k5BrvGycbBsVzF6hwh3N7O2dBci4SHvI/lMmQfaCls5sHcrLYPP1PT8FRmaTmUfS4HRWzPDaY6GS14DpytDLC3C/MUmvjvbFzB5PrnFx3e6NQ9yUBQMXXbLUx7oB4lSApHOLvv8bcr49mECgYEA47wU0knl9pFwdbSwJHl+iN1f+OkeYu4TcUuH5GSNGGuUmLTK9g0PE3zeecI7ZeXCbn3LiP8WQHGfQWiZESHb93ymnOyC8sfr2LcBpqPcxCU1eamCYi6VtsD3VGBSNYWxjTe8ZNO0FGX29bRjeTq4NrO5Ov7abo2gro6AQelR8nkCgYEAt7a8uYjx/jdE/O79EHl52srhO8ry+4HyNfykgdlyHNX79HtWGGIWwrurJlX8CsjPyx4RXLUXw202LN/u31FAlhuI8KlFHkC4LEGqv53iIPwlYOxWVE1Afn2dGvr0VrjbaXNIOB+k5XFAOwQ244RDWJjT8nQmryaYwNutZnOpSocCgYEAzCIWY90bxiXeMZQSY8+HzbTpxxtnQnR3dxGmMOK02tPr8en1GBLilaxTW77wMUl/PD2ESTumPYPbpezVb9by7meMjZMvWeI8lRiN4Up2pFdaFMEN/2YUiylzSe3BIvrBCX2RYKunerVfZiUZGVy6LUZyXeB9+aT4CB/x9aLn8rkCgYBcrI4fefm5J+BhR53ZRa42tMlSBFr2jOLGYSALcMmjyj5DYkRYIIMi0NDRkeaG+i34ZL6VabUHHHyLvpsdhDt0fYdi/8CiNjux955O8zIzOX8Rmaci96VlKbCq/5Vqee4VD9aKmUvxgmPIYaPeucXPV6jzUayCBpJgF3EtkYMA2QKBgFQH7EulV3vZn1Iip7kVVFdp7FBXtTgBfizkm0uTW/A8Wo92EViJMkLCo/kgA7EiTNEiBWzccx4JAGNa1G8ddScRNuTrsNr9SHAC58x/FR4BBKIG8Po5dNp9aGV4UtGsBGX90MQICToKUvdDDEAO7gfi8LpUumTSVTvvVIzFwTLa'),('2815f35f-fbf6-410b-a78d-4bec06c97894','07d29315-8251-460a-89c6-f94852bb95d5','priority','100'),('28a648c9-a319-41bb-8417-06830454992f','1a726d66-6400-4ca5-a6e3-dad6d5577980','max-clients','200'),('2a21cba9-bcca-4eda-a565-21dab40b64b4','458b1eaf-e1e7-4ceb-8fdf-d998e73553d0','allowed-protocol-mapper-types','saml-role-list-mapper'),('2d26699f-7b31-4b81-bddf-ad407fd73553','e1f2b46c-6719-45dc-ad9d-bfc256bc52fa','keyUse','ENC'),('2d27a9b5-8098-461e-8136-d9a0db0cbfea','0a2b6bae-5175-4db4-9f37-ab6c3bf47d0b','certificate','MIICmzCCAYMCBgGMdP/tsDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZFLVNob3AwHhcNMjMxMjE2MjMzNzU4WhcNMzMxMjE2MjMzOTM4WjARMQ8wDQYDVQQDDAZFLVNob3AwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCjbgJ8TFyYQKO158nYSR2FsRJ3c966U2Kr724/0rL8EtPc7a2m1DPUF/Qam8zLl+cE1h0Wo4qQnUvtKN4mj0Z8qSwldtm3yvZWRFHrb7ih9r8x1cwTVCz7DXPb5yy20myCY6L/Yok+MnkptAVZzzJhiYVVb7kwbUhmumb/iyr/9lOgKnxP3kOKHKo39lzR6h5TaAovdJq/EOCeRuKEqw71dJNYzzlvOaGg+ul1vgHAx6Jgaehen7zOalbuT3YtY/g++JY+15jGyWbndFdoL4q90xRSiA7i1ODOjfK8UahCR7qyZVtxiV6mHiLPPN6vJNRMpbXUPOsDngqQ6G8nLtfPAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAYMjefrnnm33YHGR1EivhyRKS72Cwxy6LL9VSSKf6Cj4RXtZLm7OYtW8kKeSN/7MkMJ/TRtHyjl0b5QfU9YeevVdbcRLh1o539nEOGYvsedX8Oj6EhYlpgOuwu0/JBXfmuYm3KTKm8sSOs5Bk3Zq0Z2jo2pfIXnl3uMnBDcGPSYcucj1TRp/JhcIb/dNiF2D3yoEFLuqzF8i8fWIoYJYmJYxnQJk9l7TVLprcW+xvC1RLrd8jeMmnKztdAwU74b6tYJbhS22+7XaRiajIARkcAclg1zSfk9/N0pAiqImXOFn+atAqVMRdhh2jt/g6pjmf22lhb4Ve8oVO43GZ6ozk0='),('2dc1ecf9-35c1-476e-9fde-d5cae592a17e','cb4d4393-a656-4ced-bc78-f20111cea7fc','priority','100'),('336da01e-7713-4373-8d54-cf31cc2588d7','0a2b6bae-5175-4db4-9f37-ab6c3bf47d0b','keyUse','SIG'),('35bdf67d-4907-4978-9abc-79eceb4d806d','96362b25-95cf-46f7-8743-3345e3480b2f','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('3b9bde75-4811-4e31-917d-08c6ed869d6e','79389f0a-3c4f-484d-aa82-40bf1a253fcf','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('3ecfbc5e-33b8-48e5-b887-f9623ce6a2ef','e1f2b46c-6719-45dc-ad9d-bfc256bc52fa','algorithm','RSA-OAEP'),('3fce9719-90d1-4e12-b330-a3bcd30f0ca8','98a64dac-f807-4851-b055-b8c970189146','certificate','MIICmzCCAYMCBgGMdP/uHTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZFLVNob3AwHhcNMjMxMjE2MjMzNzU4WhcNMzMxMjE2MjMzOTM4WjARMQ8wDQYDVQQDDAZFLVNob3AwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDCIU1q00m/GOsAbce9s2qn0R/KF7auKL+nwWPmoxPLY5XkD4ocNzDgy7RXC+Hnmhuig2fER03EtIqisBGXwuj62jPm2lPY+y9Xg9eCU2eDC/s8BQCaXdbotp+kSeXQthjeW8ao66VmhBe2yHJ3cCJHOADNB+kGCicrpEy+vXgKCE9yRSq2dq0pCRw3TiVQBWh6BAzoIcnoKuBogwXNFVYeZ9nZwalaNYkv8wfDHxP5rs+nc1bhaY5Xi1lIV/uC/X1MPP63z6TqYAfipGo4ODu79c6Jg+McBfnH84AoWly9Zbwp64FnHhblxfUodmi4MDN0eXqNmf8psz5lcaNe5cRbAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAcCCpfEBOpcBjsG5rSZzqd02Emg8GtFZdH0JEHbDETqqDsDXoxWO0q1GoEFiwx/R34sCjsSQukUOD0XA/rQ8Kh3klZlTw0D+NolCUpObjwRuilyAfLap0SVZAaIBm9FIWF05QKJAwQVaymDgPzr8Lgqa5OoG0mom34OxxvtkQ2WnrcooFO6IqmAN9EfLdwaMu37goXxg24/ZdDGi7WkJYREvV/QnMFGmXeM5bM2nhP42+HMoGLizZ5E5jSOQQmVfn936u87JHwDO+RAgFqC1q0mYPprriweSQ+jzrpb1lqZW20kKBO+9e5BadNWoPPGIFsh5gDnk5VJMgz3IXkmaeA='),('43403c30-d246-4df4-8eba-6af7e274eef1','9dad47aa-e77a-478f-b0b5-bdaf490a1b9b','kid','42d2310b-2033-4a8b-8ee7-e57d92ce2b49'),('442eb1b7-1584-4398-a86a-337ea522e085','458b1eaf-e1e7-4ceb-8fdf-d998e73553d0','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('44b9cb14-4698-4510-8331-8d7adeaa222d','79389f0a-3c4f-484d-aa82-40bf1a253fcf','allowed-protocol-mapper-types','saml-user-property-mapper'),('49314c7e-20a1-4981-a484-26a698275aff','98a64dac-f807-4851-b055-b8c970189146','privateKey','MIIEpQIBAAKCAQEAwiFNatNJvxjrAG3HvbNqp9Efyhe2rii/p8Fj5qMTy2OV5A+KHDcw4Mu0Vwvh55obooNnxEdNxLSKorARl8Lo+toz5tpT2PsvV4PXglNngwv7PAUAml3W6LafpEnl0LYY3lvGqOulZoQXtshyd3AiRzgAzQfpBgonK6RMvr14CghPckUqtnatKQkcN04lUAVoegQM6CHJ6CrgaIMFzRVWHmfZ2cGpWjWJL/MHwx8T+a7Pp3NW4WmOV4tZSFf7gv19TDz+t8+k6mAH4qRqODg7u/XOiYPjHAX5x/OAKFpcvWW8KeuBZx4W5cX1KHZouDAzdHl6jZn/KbM+ZXGjXuXEWwIDAQABAoIBAGUeZa4EOsCwoRBLHqTghOi/FHj3Gy/ih9pA8OGdBl2GFPiDY6RI10vwr5I73UL/Ue+31OA3Z/nTNPeDENblLugjqq9QACbgyAsk4KfA/AUVw5rC3EqMILp9DfDMkUnC4HdKhNNOU4xvt8584Kr4HNLOCBTETwvXVAn2fgdIt/M48cGYQ9YQ+DuQ1kalH+utYHzYFILk+9FgXNSCuPY8TxOGVzs7s+kG1DI83flUudDyoUivd5K/gVuWjN8lAPQoldwGK51lHqQYgeF7as+soslVAX5sjoKw5wD4+SdKimxSh/Pj/Xp2BUkD1xUDkHW4xgT8cXu/ceK66S4lYqRfKfkCgYEA8/D0t3DCjpwvApdElozDI3WtOLoTzikH0N4I+uxXNOpjhHTNbKahh1UzVYkKVCTJUBNRJER2VH3xST4S3V+VjCjcMdzryC9PbqJc1f0T1RLu351/mNk3IJNm+0DaZwsuogrlhahD3NJj2Y8yVtmLKSv0pUqocqjWIajxLZ9twKUCgYEAy7n+NfyDTgngxKArWER/bJ5YiyFka9eF4i/OrMNpS+W44tE+L4MuKLUSh9zJK94SeCMXtFM1vjezz7q0WFSxth1uWLIedAKmqkoSQe8mRblauRyr0KjgXm3s58WNo/LOX6xNFoWR4k/34YiVNSD3P48yADzqLCFCDVUi20nxYP8CgYEApxbS6JuqCDje0m1+o4iDWVSPdB2w1zOvkNelWwprqWkrBV1kIBn65lHruZkGpCAWbGzu1WK3kqQ5k6ubDFseekS6nsTuE86kH+nCoSiaXwZ67FxbO/z9D6knjs4bSx2TsZa5JFXfNfA+SJUXK/oSof7jshxzSSZwldm8aT2c1akCgYEAwzJVINLt2DLcumigvzT6Rk89lSkMd8uLyxl1U9DzrbXQvPoxNALjkjtUIvrngXGIjrVI/A0SHExwq6M/MrcLguuWE8OuLAdyOw03ixchu4KKK30OHqIAQFnguH1vZdu54q9LOT4Hdiia3+wm0j3gyHRiOxoiYOAI0o91E1k4vm8CgYEAsmsv1EHRsNjvj4GWB1im/uNnCWJ/PQwB6LnBDXEchxPc1wJi8HsNYekxWQjkUsTO0D1CLYINa2f5jJnw01HzpT5I7iu0tESgcN8JQ61Fi9jOagFef8IvzWaTN78/M/6K/n8yWYPXdKh/uHTq1pq1AO3lP9FuanYCC2sjv2dxy/Q='),('4a6e8382-63cf-44e5-850f-95bc1cabdd47','85aec1a7-bd1e-4d6a-aa8b-09f2ecdc99f2','kid','f0f7925e-14ef-46cb-a37d-e1ed97ddb931'),('4b15ff06-5476-4ec7-b505-85373e8fa7ac','b1a5e6f0-719b-4185-88bc-4ae291f2dd95','host-sending-registration-request-must-match','true'),('4d958625-5eb0-43ba-8880-a7ee887b5aef','067a1445-3c10-40f0-bb62-28ef29fda266','allow-default-scopes','true'),('4dd0dfca-2ed8-4664-83a9-a5114176e217','79389f0a-3c4f-484d-aa82-40bf1a253fcf','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('56bcdfc8-5736-4cad-aed7-163c11e7dca2','96362b25-95cf-46f7-8743-3345e3480b2f','allowed-protocol-mapper-types','oidc-full-name-mapper'),('583e6e99-477e-4185-b62d-fb1b485cc2b2','96362b25-95cf-46f7-8743-3345e3480b2f','allowed-protocol-mapper-types','oidc-address-mapper'),('5a38da09-02b1-4fcb-9d7e-2bdcef1e9887','9dad47aa-e77a-478f-b0b5-bdaf490a1b9b','algorithm','HS256'),('5feaf48e-9150-4ead-a012-db8dcf688ed4','c10daed8-b6a3-4063-b7a2-bdbba43bd623','allow-default-scopes','true'),('61c1ca6e-3d0c-4fad-99d4-73f7f1ee61f6','79389f0a-3c4f-484d-aa82-40bf1a253fcf','allowed-protocol-mapper-types','saml-role-list-mapper'),('647ec0ae-5e69-4dad-ae95-ac26ac12e3e1','cb4d4393-a656-4ced-bc78-f20111cea7fc','algorithm','HS256'),('649ddd02-59b1-4d87-bcfa-46221a8c7379','cb4d4393-a656-4ced-bc78-f20111cea7fc','secret','dnT49kxD2UVQQkhQ8131UVtlRuhqCTTeCDUF1_v6wvZ3UcfLdwHW9sKMkGqY3ZL_UGsMhMeePSTAND-B6JdAUA'),('64ad0884-567d-4067-8143-1f9216ed5211','cb6327d5-2bf2-426c-8016-23096cf0f326','keyUse','SIG'),('64c744b7-0c0c-40d3-998f-58a0eddf8b90','96362b25-95cf-46f7-8743-3345e3480b2f','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('6b039250-5c04-4ab8-8f31-60b0fc5b08be','9dad47aa-e77a-478f-b0b5-bdaf490a1b9b','secret','-k1EXH2aSKdpNKh6bwJqO4-7HhPPU2PfD26PvfOL80ryWkkqldCy6SNyMR6B-JN3K_vueHlKh0jX-H9vFWG6MQ'),('6b376122-6a64-46cf-956d-80f89ee50e20','79389f0a-3c4f-484d-aa82-40bf1a253fcf','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('739aadf4-c467-4e4f-b723-0cb61f674838','9dad47aa-e77a-478f-b0b5-bdaf490a1b9b','priority','100'),('74ff81c9-e66f-4237-9b02-786c86d8e51d','b8fd3abb-803d-43dc-8ac2-dc9032624c5a','allowed-protocol-mapper-types','oidc-address-mapper'),('75c8f397-558a-4245-9b25-b93496372b3d','b8fd3abb-803d-43dc-8ac2-dc9032624c5a','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('79086812-cc0d-4e45-8ebd-6ace9f4fe946','458b1eaf-e1e7-4ceb-8fdf-d998e73553d0','allowed-protocol-mapper-types','saml-user-property-mapper'),('7a47f65c-8a6b-4180-af97-83ec65ed9033','0a2b6bae-5175-4db4-9f37-ab6c3bf47d0b','priority','100'),('7cf5d299-ed81-4cd0-85c8-5b26d600e11b','98a64dac-f807-4851-b055-b8c970189146','algorithm','RSA-OAEP'),('8139d890-814d-4e5c-a225-72d6fc1221d4','85aec1a7-bd1e-4d6a-aa8b-09f2ecdc99f2','priority','100'),('85fa9f48-9ea4-4201-8619-f9880f8e1d96','b8fd3abb-803d-43dc-8ac2-dc9032624c5a','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('934bd5d1-2586-4c54-8523-97c0bfd303c2','96362b25-95cf-46f7-8743-3345e3480b2f','allowed-protocol-mapper-types','saml-user-property-mapper'),('98842f77-16a7-458c-92c3-e30d8303b7ec','458b1eaf-e1e7-4ceb-8fdf-d998e73553d0','allowed-protocol-mapper-types','oidc-full-name-mapper'),('9950c7be-4dc1-40cd-b5c8-9b705270f9eb','96362b25-95cf-46f7-8743-3345e3480b2f','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('9c2ff2f1-d6e5-4d79-a7c4-191bcd4d9e70','458b1eaf-e1e7-4ceb-8fdf-d998e73553d0','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('9fead6ef-4fac-48c9-9fb4-79c30f559b07','cb6327d5-2bf2-426c-8016-23096cf0f326','certificate','MIICmzCCAYMCBgGMdP1vxDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjE2MjMzNTE1WhcNMzMxMjE2MjMzNjU1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCUIOkdNwloduehfwPyNMey2X9YHjYJWbalmqvpL4QrVBrofYmjonqRcOisqqB1I8s2twrEDgPRH6NJFEPoH52Iolsa+HwugwPyuUVO5Nr0bjFEBxNEAnCy3AU6HtTvNhc73YEDYwI79K8Dzgi4/WL/q1AjWFK0JkDGpo0dMYV3/JQWzzUZ+9dBInIGOAnEPEciwiFbhZ91NKhNXuwdiRlqfO8XJxfhRys7DcpHC4XFFaRrwLl2MYtmTjA29rCYHRNXVaOUAdif4Ql+b+qQACyD+EOMdYsQ/Ko0SvNYyp9j+MrU+LNeDNwYLGPrRMm3f16/iNMzOo5LVsDCYromhCKdAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGMc/7iqGx2FnB84PZAHCKzxHHzmX0dxOTLDP0PLpqEgi36T85eG6VTJPHFvBxhaUQRHyNGd/rF1qxTGU+2Fp+fk1r+g9Nfz2FIn+qYD53fKcGjXVAvUl4cCTRdEg3npzOsVWanX/oeQ/a2fHbuRJvbnr4sJgX/FDjs3+s9GnBYcMwwsxXXh+DfCe4uJhGdElwmqxeJEZKsjpzikcHvSzDyNrirX1E0YuEq5JxoIy6tZM2FPjOs4ufzpYlMqfHKLhTT9zQMjy8bYpHkKNLkaxFGcjQ+c/OwcKMXP2RM9Q95dphiesy83i28XAaN+61AP+M7X63y9vy0uAhkyMpceACQ='),('a6cc7331-a712-4929-8fe3-e89b7adc8fb5','98a64dac-f807-4851-b055-b8c970189146','priority','100'),('abcbb7b7-0d0b-4f42-b6dd-94ad89404c8e','b8fd3abb-803d-43dc-8ac2-dc9032624c5a','allowed-protocol-mapper-types','saml-user-property-mapper'),('abdea2ee-056a-4e43-a44e-9a7b1c8a2a43','2d1dc624-7bf4-4d60-a9c4-8efe5d07dddf','host-sending-registration-request-must-match','true'),('ad578e58-4600-4fd4-8b3d-18972bb271f5','e1f2b46c-6719-45dc-ad9d-bfc256bc52fa','certificate','MIICmzCCAYMCBgGMdP1wezANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjMxMjE2MjMzNTE1WhcNMzMxMjE2MjMzNjU1WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC36ry5D0v2FPHRAyKv3BqubjyAzxYH0B5tFvpZcjdf027BhAIIpZh1fsJgmF0wfSULApxoEsiYwKD4NzqbbNzrEWshps8MXeDfyfGLlImHCV4mHDlCjLNNo8YoVzE2sInl2qtRSPRxxBTDfre1T2MVBBGAi8yAvqzpfb8Voa3Thr7dvrdezvjaXszVe6aKMZ12XfcLQb55FaG6V39rgCfLxGt0cdpgk17YhaXzJ8kRoTfCMq6axO4hoeeC4b3Z6XJeOwZXWZgantOXKjSGk76y4Eee4r/ioBtogZytbwfgrU9hzXnEUnXvbPYaKgg2X/8gOR/g+1ZumDKbxK8NtDiXAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAK5/A76lQVSi4uiAzP5u+9yRs6li1Y+MCuHKfEGfwKXhlCOZmyEjriaWoVhg6rKeAm0Bc3OHZNttLWi1RXyqcGT8P6qN2yhra0ClVkhzth+XYufcU7hJhYr4DVZXpBkrpdCXxYSRtLeZi4LUXOPkAR6GxKYtZERKiXjsZ41ZrDqYlfLJbD3BVPn4VtPKYcp9PPUmTJVdNR76EwCn+jclhMvFRwAjt5g94qwaAnJtKm66CLaPQxbFON8eFHoe06Iupa1dS9GE6R/NHZMcPb94Euuhe1WruEQDCnV3nYiLnhqzfpGLdKsDpk3ieuPsq4nYYRX+prqLzmrTYcrsscFhcn8='),('b69b0873-cea6-47f3-b3c2-77dcbf20321d','b1a5e6f0-719b-4185-88bc-4ae291f2dd95','client-uris-must-match','true'),('b7cfbb06-2646-4b1e-b35a-365ba923ba27','be05d18f-4618-4376-a4bc-d1720c5a7fec','allow-default-scopes','true'),('bba609a3-f77b-474f-bb6e-e9396a91176a','8f8a96d7-60f3-4935-a06d-e58ddc82c832','max-clients','200'),('be8922a0-df9f-421d-93b5-d14c3e825cd4','458b1eaf-e1e7-4ceb-8fdf-d998e73553d0','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('ca798641-43ff-4895-ab8a-eb4d704a7009','85aec1a7-bd1e-4d6a-aa8b-09f2ecdc99f2','secret','LfokSEBsynd_MNxWp4BwhA'),('caf22c36-eeae-4ab2-a754-2c27b613f189','79389f0a-3c4f-484d-aa82-40bf1a253fcf','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('cfbf14d1-ad41-460c-9679-285b1d59129b','96362b25-95cf-46f7-8743-3345e3480b2f','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('d0f929f9-2ee4-4855-8e9f-f6590653b681','458b1eaf-e1e7-4ceb-8fdf-d998e73553d0','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('d4e316e3-e5b0-4f8e-9254-7710fffc3b7b','79389f0a-3c4f-484d-aa82-40bf1a253fcf','allowed-protocol-mapper-types','oidc-full-name-mapper'),('de9cd4bd-b46d-4937-a989-ce09d7939bf5','cb6327d5-2bf2-426c-8016-23096cf0f326','privateKey','MIIEogIBAAKCAQEAlCDpHTcJaHbnoX8D8jTHstl/WB42CVm2pZqr6S+EK1Qa6H2Jo6J6kXDorKqgdSPLNrcKxA4D0R+jSRRD6B+diKJbGvh8LoMD8rlFTuTa9G4xRAcTRAJwstwFOh7U7zYXO92BA2MCO/SvA84IuP1i/6tQI1hStCZAxqaNHTGFd/yUFs81GfvXQSJyBjgJxDxHIsIhW4WfdTSoTV7sHYkZanzvFycX4UcrOw3KRwuFxRWka8C5djGLZk4wNvawmB0TV1WjlAHYn+EJfm/qkAAsg/hDjHWLEPyqNErzWMqfY/jK1PizXgzcGCxj60TJt39ev4jTMzqOS1bAwmK6JoQinQIDAQABAoIBABRCvB/m2z6SpPQN73g9h+MKpMRkvXdh8f2Mvl7SxP04L8YFBcKAAsvJ6clUPUZIcw800iAm2pbMAQWJ5A/n4yBBNLznp/SkrvGQLc6wttIgEFUBsrzmqIuOVJiyhuWBPIRPs8nGzRNuUFHw6HiFD/lwcTGkbwt8//cr6LlJgLv8dVQJGNVMJZvl9SbVI/uzR0zkBH+e+RqUyFQqsKJJYMu//MUAtbN394gcRTntcXtTPpngt1Xua7YBNckdLboMfndFsN0PK9AHAlSPdQ+uahnfK4tpxUyP4mlgo7/6kzAEHXg9tuyIEa1K7DzlW2jM2/8OSTwyXKdXVzCMSwDw5XECgYEA+M9fLz0UGMwW3N2FHM2zuQEC8v6Tc02XegSFHexF0Si1eeJ2ZnR2tgzWecLd09OyZGOzrvaUVi8ngfkg9rJd8OrsPwzDw1k/eBgUoP5IZYj4z9teABN3NMPDGd60ZXyBJtoYSLMFS4tig2JrF/QnoKlT0VWaUNQLY9lAfBcxAscCgYEAmGi5kLQ1ruuE3rQdMp9HeE7jlRIF6hUrF2kXz+DIvA8JWz8LFvmA+pq+pPy77yaZr2DUsEqsWqwZ5G/I9wj7UktktIc91GnZXIV92qwBwB5ClNw8MSKdIngY5Tm0zsrQeQR+4lJpg9S9RH7AjdTtXgSMuzKgyXgYHQ6A13Ecy3sCgYArbJXiOri9MzFyTr8ircwGJ+UJ3+CAKTScuRk6hbgRrxctNJcRfpYRY+Ay1A2/IJ1r4/LCQIrXF9e/WWmlZK/8kiO1RVcNSxBGt30yM+8SuXsjW9fmD3+ol9n/M90sMTShQUMnvQbZjnQdFho2zgf0hFj6mgQaw0dRn+MfRTTqlQKBgGl6MNLApVaFkNM/++UI7sGId2C3tHgoZkYxaVVo0AO2tFb97oLb8jN93Or6LmZ4ZGxHq2rGgznNWa4K3x54jNaLbwqxfkz/ZHrvuAYafKulRZcYRGANAIrWawRZR5TGMDlQry+asYOXO9Wnk0OVVSF4LJ1xkG1eO/IAE5MGqVL5AoGADotx3pOLI+XtBz74MLJkeKOp3iZNGQp6dzJGGIftyJOhbeG6YQBh8P25S6Mn8lOot7p2/z8xDKFcluSF0lWWUH/LClItuJNJBot2j98ZbHcPCWw9DxtCSxw1r3NM24bDR6SG+zaDrXzGimTyR4Ig9dqgblrS/JiG28DyCjMVRvU='),('e4946b18-ae4a-41f9-9563-54e5f9277826','cb4d4393-a656-4ced-bc78-f20111cea7fc','kid','65e9eaa6-dfe7-4d49-bdd1-47353731b3d1'),('e83640a1-e155-4894-a2e8-ade2e3326ce8','e1f2b46c-6719-45dc-ad9d-bfc256bc52fa','priority','100'),('ec3c612e-8240-4337-beba-2e525021e1a7','d0198308-010d-487e-912b-1070ce05ceb5','allow-default-scopes','true'),('f1e6a935-1b97-4115-832f-abb298d1a718','96362b25-95cf-46f7-8743-3345e3480b2f','allowed-protocol-mapper-types','saml-role-list-mapper'),('fc2070c6-831c-4917-8897-79a2e2ecb7e2','b8fd3abb-803d-43dc-8ac2-dc9032624c5a','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('fc7f69ad-ba07-4bee-888a-579950e95f6b','07d29315-8251-460a-89c6-f94852bb95d5','kid','151699b1-3d77-4422-820f-f7b2607b4df1'),('ff814944-d964-42e3-9fef-9fc82f4d1336','e1f2b46c-6719-45dc-ad9d-bfc256bc52fa','privateKey','MIIEowIBAAKCAQEAt+q8uQ9L9hTx0QMir9warm48gM8WB9AebRb6WXI3X9NuwYQCCKWYdX7CYJhdMH0lCwKcaBLImMCg+Dc6m2zc6xFrIabPDF3g38nxi5SJhwleJhw5QoyzTaPGKFcxNrCJ5dqrUUj0ccQUw363tU9jFQQRgIvMgL6s6X2/FaGt04a+3b63Xs742l7M1XumijGddl33C0G+eRWhuld/a4Any8RrdHHaYJNe2IWl8yfJEaE3wjKumsTuIaHnguG92elyXjsGV1mYGp7Tlyo0hpO+suBHnuK/4qAbaIGcrW8H4K1PYc15xFJ172z2GioINl//IDkf4PtWbpgym8SvDbQ4lwIDAQABAoIBAFi9tM3+aYKVXJCjWKtOIrmjiyIDyfd/Hg85FRbvm3RrSnepQGn3rPaUcSm2mtB4sdT8L4ev+IZr+7+ItoikIHxz7SNRn3myGn0graHRzAISLRFqcN6BkUqXCVgRqjdfO0pjFmKkNv5lxDcH/5BGe+J6Eg/aZJSCbGBFQlwnpP34pnG/jid2IPmH82UGftAiSVfe7l5DYIRP0nfVQYE7JyEh279SK8rnXZARAOP3gK8gHxYf1X/1c0PEWm9zie/vYCy1n3CR8Gpgwe+LcRzN60lmE1vShqQwBZDIz9l5Lf0xiF/XLVD/McPfo+XRE8lDWJiS8MhUo6JvqK1m+NyM5dECgYEA5zvFPm5FsNjGIPPTtYmd2huMMT80AmBT4Obup8E24ciM8kMxc7hO7LPgvZEEvfEXL3aHefwz4WwQGqa0fJ2G9tMwpqzfqesKtNYX+l8EVZeeXV7qnTLYdabglGNeFZ76Ooj2z0vuAlgVAzY/ce1OvXEdwxH1gQsJAzwGaeZmvD0CgYEAy52WMDuMTjXSZuYX45tjnVH6DffSGJVtQsu8s8wvdjIIqEiAvG4M5/SRV0keQwOlwAgxPWWQ0CTjNU+7558bvfmlCAmKSrM8hduQrPLVRm4pcaRbJCujPD9iLDtKm5TxUvpbqvA8Z4UiGTgq81V1838/0HPav7de+YNmNCgU8WMCgYBFbDB/2eOagLqbUhkRu8tknDiu4Gbg/8KvFyY3v06W4vtOENZcA83OSwMCZvOhgyyO12s9OHbrCuKa3cn6T+EhYa6NnAFapnKEcHKqfLR0bhzhs4mEwKs0R3HNmze4Dg7aXBydiBJhKcjFOhg6QCEPx1JEKrQmlgWSrwbN7JqTkQKBgD2707Nf+pQj4VztWkTZ8gPavPPLNVnaxDvCRb5FpAYz+Uf8Y3u96g/RqNdMBe7PhkuIsFUrHBLffDvHpvL83I5myFB9g/5OBYWYIm8tWNh3wf0AldmLmXxEw2EhwOcW62v7GBvlporEZKg8zVjlilN/OzvaRHJoCFWiLzSVCnR9AoGBAINRvfEoS+cc8i/kKjrWcE8bSCjh41rY2TIRcWWWGo4GRadcBf4pycD8YOywzB5VCZt1xxBC9bnCGN3a24NjA8+E8IFA8xAVgeZwwhR2m0sUByXaxou1eC40c5NL3aqQEcdu4u/3IQ2dHIs0goWyQv5qqA3yTcIRtANPpQl4IFEP');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('0ceaff2c-0343-4b5d-94b9-a79f7be8fc98','2cd903f5-36eb-4af5-b342-d70bd8c0ef0a'),('0dae941d-8b8a-4451-9398-46aa88781942','793bd6fe-a7a9-41c3-a404-57f8d0498570'),('1769d660-85b5-4b86-afe9-47b7d6d95029','13b6e9c7-f26f-4f7d-bb0c-332cea8407d3'),('1adb5e7f-956a-4cc1-99e9-1e3d05f37c84','31614152-c29d-4d49-a3ca-cceb4b2367d5'),('1adb5e7f-956a-4cc1-99e9-1e3d05f37c84','88fc8ada-449f-4af1-abbb-63058607beb9'),('1c514537-1850-4efb-9479-50afac363767','146bf024-745e-4a7b-85b9-8ca42e95b4db'),('1c514537-1850-4efb-9479-50afac363767','2d68015e-16e3-4900-bf50-e47375bff0e7'),('1c514537-1850-4efb-9479-50afac363767','3579622a-969b-4532-b256-23febb2193d9'),('1c514537-1850-4efb-9479-50afac363767','f0f2c817-4b09-492e-8386-59e8950c4714'),('2d68015e-16e3-4900-bf50-e47375bff0e7','bc55460d-7762-4cc1-8a2b-bd05d7c7068c'),('5c7e51f1-1c01-457c-8d0a-27e4985a9793','f474f5c7-ee20-441a-bdb7-d1d9c021f748'),('5c7e51f1-1c01-457c-8d0a-27e4985a9793','fd41e2d7-e7bb-49eb-8603-c67f9d186d90'),('643b3e09-9dde-4219-9a14-88fec4819378','a97a5760-9ee7-42c6-9a82-0da35f7dd171'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','0ceaff2c-0343-4b5d-94b9-a79f7be8fc98'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','25f991cc-97a8-44bc-9827-d1ca93d557fc'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','2cd903f5-36eb-4af5-b342-d70bd8c0ef0a'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','402d73d0-0cc1-4a6c-b092-d8655681f3cb'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','4621d6bd-fa78-41ab-b0bc-f1142149ef91'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','54482871-987d-4501-a0b9-c29f91429c92'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','59a575a3-5ac2-4eb6-bfef-8eaae418cedf'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','5c7e51f1-1c01-457c-8d0a-27e4985a9793'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','6a77fd09-8c60-4334-9b2f-0557978a0cae'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','8136c258-fcdb-4105-b2ae-7c3a22e10d9a'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','ac369839-0c3e-4646-9ad2-b6217d9017f6'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','d4cec6f4-eea9-4828-9684-ae5a4363fe5e'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','defa09f2-dfb3-419b-b7a5-8a34891ba14b'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','e17d2c3a-7cfc-4d16-a9eb-64308b8190fd'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','e663f146-cfbe-4221-94bf-fddd90597217'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','f474f5c7-ee20-441a-bdb7-d1d9c021f748'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','fd41e2d7-e7bb-49eb-8603-c67f9d186d90'),('8eb9cc51-dc9a-4544-a232-a8995379e84a','ff805e89-8b9d-482c-8870-c809846a3c32'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','03b941f7-64f1-4db7-a458-8f5b5f4ffdf5'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','11660410-cb3a-4c44-b1ee-934f0c14703b'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','13b6e9c7-f26f-4f7d-bb0c-332cea8407d3'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','1769d660-85b5-4b86-afe9-47b7d6d95029'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','17b01eb9-56d0-4577-b9f1-8ad6796e0a14'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','1adb5e7f-956a-4cc1-99e9-1e3d05f37c84'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','1db72516-f891-427c-b0cd-3c1e7529d684'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','303901ec-5d82-4037-962c-e25b30c61875'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','31614152-c29d-4d49-a3ca-cceb4b2367d5'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','3495822b-dbd5-4708-b028-5094e62cd130'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','36e8a8f6-5802-45b4-a770-e3930a3b1906'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','3de5f53c-d4c2-44ac-802d-0fd887472526'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','41e8347f-9a2d-445c-bdae-b1201216cb8d'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','42c81503-7a35-4797-92c6-1a54d42d38e6'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','62fbbea2-1066-4b72-8841-7c380fe92a43'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','68aa9658-c01f-4356-a39a-9073249e9d51'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','7ec0dfc8-60ce-4ff3-9cad-f85c6813d65b'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','7efb3134-9d03-449f-9261-a2af2bf8efd2'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','81589699-9cea-408c-bbe2-c7558bbc4cec'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','838b86fb-78f5-47f9-94ee-ac4d8f431500'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','83eefdb2-972b-4982-9c9b-ed7033e857c0'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','88fc8ada-449f-4af1-abbb-63058607beb9'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','9ffbcbc6-36fa-4dc2-9afb-af0e9b3a08dd'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','a9979796-a2cb-4e88-a841-fc11529f087e'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','acb01dbd-33bf-4676-9954-7f5f54046a0d'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','b8a6858a-d986-4b52-acd8-76defa4e6c9a'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','b9b8e979-6830-41de-91bf-8f58648f2e19'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','c94bc50a-df9a-485a-857d-0dc3e07aa5c3'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','c9def70a-ed6d-4b2b-8498-d24424b938e9'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','cde78ed9-4b05-481a-9618-802c4c58fa20'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','d36ebb37-7fde-4256-99a6-5048a64fe143'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','da92c072-d548-4857-b741-1efe02be8e84'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','e027d78b-08e4-45b0-a37b-a971fba43c31'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','e3d82f24-a13c-4abe-8b00-4836b84632ba'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','f6d4d4a7-6f2f-40bf-9015-5f7e3f1deab2'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','fa5935fb-5108-473b-a8e2-63ad5e641fb6'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','fbf181fa-b207-4b5d-8705-ad7a17133656'),('a1c4b637-b0f4-40e9-aad6-26244a7ddcbf','94698020-5f1c-41c2-b745-832c93651faa'),('d36ebb37-7fde-4256-99a6-5048a64fe143','62fbbea2-1066-4b72-8841-7c380fe92a43'),('d36ebb37-7fde-4256-99a6-5048a64fe143','f6d4d4a7-6f2f-40bf-9015-5f7e3f1deab2'),('d45dd1d9-c432-4786-8839-36e967190fd4','5cbb936d-fa4d-4dea-a85b-c86771916151'),('d45dd1d9-c432-4786-8839-36e967190fd4','643b3e09-9dde-4219-9a14-88fec4819378'),('d45dd1d9-c432-4786-8839-36e967190fd4','67a9eab2-6518-461f-94d2-6730e8d8d9aa'),('d45dd1d9-c432-4786-8839-36e967190fd4','9b07c509-b263-4b65-ad23-59fc9309fe74'),('fbf181fa-b207-4b5d-8705-ad7a17133656','41e8347f-9a2d-445c-bdae-b1201216cb8d');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('8095bc19-f241-4eb3-bedf-838d70fbdfbc',NULL,'password','c7a6b214-7c2c-49b0-a8a7-af9b4bcae909',1703773209064,NULL,'{\"value\":\"3OoMCY2sRQz1zDfnECdUuoAapeI10kb2T9ZiliguUF9lheU31VOnzip0zKITpBRX5tXYmjHdXYbOOG8NeVPGpQ==\",\"salt\":\"GDt4P6cuhyvFexFl0HaLBw==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('8c90ccce-7109-49bd-b08f-50786e7766fb',NULL,'password','7de3ba4c-f40c-481f-9623-cf4b684ff6c0',1703773666890,NULL,'{\"value\":\"TNPvwSAOiWWP3bOdU7Tfivs/J4JNEPZXB5YFlEAoL/fGWBzoJCFLsss3Hmpf48zJODYfCF21u5m/lKPZZq5RSQ==\",\"salt\":\"Spd4HDKFWo91V3QC3QOfWg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('96d7f5d9-89d3-4747-abaa-523c4a956073',NULL,'password','dc017b31-692b-4a6a-b4d4-32dbf99629f2',1703773637881,NULL,'{\"value\":\"FnE3jmtgv+Mh/4yzLL6AtRrSUGarXrpgzfvBt15/qsSkF6y+NXgrCW9oGmkNvq6xrza8/wJQLzPeMWVhOxfErQ==\",\"salt\":\"0LFyVtmXi6EPKEs3MBZm8g==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('a26d17f2-1225-4c66-83d6-83b68f9a3250',NULL,'password','018ac841-e62e-447a-b1ab-f4d2a0e4f0ad',1703009592996,NULL,'{\"value\":\"lZwCiS/lLMmkSDwcO2yQtuN8DFf3nUANuFCDEjtOlrip/ayEumDABs5ZxcN6u1AQFAUAV73EyvIy0imJZKgQ6A==\",\"salt\":\"mEfpvm8eZ2YMIhHOahtr7A==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('df7eeb63-476d-42f1-836b-0d9b375ad60f',NULL,'password','6cb28819-d8f5-45fb-bb8a-a99aa169365f',1702769815992,NULL,'{\"value\":\"AQhEkWCDghuxKnBF7szFwSkJ4TfozujaatMgpUhM+LK9N2mqgoUwLJhjwByjXyly+0v1BKix8txKGK5iidbYzQ==\",\"salt\":\"BBB5Bp0txDcp3dCLplDntA==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('dfa56f0d-5c9c-4e41-94f0-615da29fe1c8',NULL,'password','8a226a2d-fa2f-4311-b6df-96f3a57d30ea',1703866945990,NULL,'{\"value\":\"3sM9jb1a7HrNeSXQ3/pmzV3ZhjiUCIx5IPMr2rnrcquZG9T6IqQYDG5qGER1Zzrz+wCiIMprv/G21GN3w6bcUg==\",\"salt\":\"hBksCuWhGGkFk6qs5AYsMg==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10),('e51bd2a9-9b58-4997-8c95-a4493b7740bb',NULL,'password','f8e50905-2934-49c0-b0f8-84e586bb4fd1',1705237163563,NULL,'{\"value\":\"7e7Ch61X4ETAVXDlawWewDfGWiphMkksB6I2v+KEqcSEvkOPxqzB+N56FBRWcazka8Bzn1Pd3vsWUtiVdbRnEQ==\",\"salt\":\"g2/oVqcQMI99WrbUk/BmQQ==\",\"additionalParameters\":{}}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\",\"additionalParameters\":{}}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2023-12-16 23:36:13',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2023-12-16 23:36:13',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2023-12-16 23:36:14',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2023-12-16 23:36:14',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2023-12-16 23:36:17',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2023-12-16 23:36:17',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2023-12-16 23:36:20',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2023-12-16 23:36:20',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2023-12-16 23:36:20',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2023-12-16 23:36:22',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2023-12-16 23:36:23',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2023-12-16 23:36:23',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2023-12-16 23:36:24',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-16 23:36:24',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-16 23:36:24',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-16 23:36:24',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2023-12-16 23:36:24',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2023-12-16 23:36:26',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2023-12-16 23:36:27',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2023-12-16 23:36:27',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-16 23:36:27',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2023-12-16 23:36:27',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2023-12-16 23:36:27',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2023-12-16 23:36:28',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2023-12-16 23:36:28',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2769767893'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2023-12-16 23:36:28',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2023-12-16 23:36:30',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2023-12-16 23:36:30',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'2769767893'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2023-12-16 23:36:32',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2023-12-16 23:36:32',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2023-12-16 23:36:33',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2023-12-16 23:36:33',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'2769767893'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-16 23:36:33',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2769767893'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-16 23:36:33',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-16 23:36:35',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2023-12-16 23:36:35',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2769767893'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2023-12-16 23:36:35',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2769767893'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2023-12-16 23:36:35',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'2769767893'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2023-12-16 23:36:35',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'2769767893'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-16 23:36:35',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'2769767893'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-16 23:36:35',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'2769767893'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2023-12-16 23:36:35',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'2769767893'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2023-12-16 23:36:38',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2023-12-16 23:36:38',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'2769767893'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-16 23:36:38',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'2769767893'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-16 23:36:38',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'2769767893'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-16 23:36:38',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'2769767893'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-16 23:36:40',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2023-12-16 23:36:40',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2769767893'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2023-12-16 23:36:42',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2023-12-16 23:36:42',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2023-12-16 23:36:42',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2769767893'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2023-12-16 23:36:42',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2769767893'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2023-12-16 23:36:42',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2769767893'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-16 23:36:42',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'2769767893'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-16 23:36:42',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'2769767893'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-16 23:36:43',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2023-12-16 23:36:46',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2023-12-16 23:36:47',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2023-12-16 23:36:47',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'2769767893'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-16 23:36:47',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2023-12-16 23:36:47',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'2769767893'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2023-12-16 23:36:47',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'2769767893'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2023-12-16 23:36:47',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'2769767893'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-16 23:36:47',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'2769767893'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2023-12-16 23:36:48',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2023-12-16 23:36:48',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'2769767893'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2023-12-16 23:36:48',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2769767893'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2023-12-16 23:36:48',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2023-12-16 23:36:48',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'2769767893'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2023-12-16 23:36:48',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'2769767893'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-16 23:36:48',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2769767893'),('8.0.0-updating-credential-data-not-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-16 23:36:48',73,'EXECUTED','7:3979a0ae07ac465e920ca696532fc736','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2769767893'),('8.0.0-updating-credential-data-oracle-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-16 23:36:48',74,'MARK_RAN','7:5abfde4c259119d143bd2fbf49ac2bca','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'2769767893'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-16 23:36:49',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2023-12-16 23:36:49',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'2769767893'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-16 23:36:49',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2769767893'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-16 23:36:49',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-16 23:36:50',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2023-12-16 23:36:50',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-16 23:36:51',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'2769767893'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-16 23:36:51',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2769767893'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-16 23:36:51',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2769767893'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-16 23:36:51',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'2769767893'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2023-12-16 23:36:51',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'2769767893'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2023-12-16 23:36:51',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'2769767893'),('map-remove-ri','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-16 23:36:51',87,'EXECUTED','7:578d0b92077eaf2ab95ad0ec087aa903','dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('12.1.0-add-realm-localization-table','keycloak','META-INF/jpa-changelog-12.0.0.xml','2023-12-16 23:36:51',88,'EXECUTED','7:c95abe90d962c57a09ecaee57972835d','createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS','',NULL,'3.5.4',NULL,NULL,'2769767893'),('default-roles','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-16 23:36:51',89,'EXECUTED','7:f1313bcc2994a5c4dc1062ed6d8282d3','addColumn tableName=REALM; customChange','',NULL,'3.5.4',NULL,NULL,'2769767893'),('default-roles-cleanup','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-16 23:36:51',90,'EXECUTED','7:90d763b52eaffebefbcbde55f269508b','dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES','',NULL,'3.5.4',NULL,NULL,'2769767893'),('13.0.0-KEYCLOAK-16844','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-16 23:36:51',91,'EXECUTED','7:d554f0cb92b764470dccfa5e0014a7dd','createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2769767893'),('map-remove-ri-13.0.0','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-16 23:36:51',92,'EXECUTED','7:73193e3ab3c35cf0f37ccea3bf783764','dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('13.0.0-KEYCLOAK-17992-drop-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-16 23:36:51',93,'MARK_RAN','7:90a1e74f92e9cbaa0c5eab80b8a037f3','dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'2769767893'),('13.0.0-increase-column-size-federated','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-16 23:36:52',94,'EXECUTED','7:5b9248f29cd047c200083cc6d8388b16','modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT','',NULL,'3.5.4',NULL,NULL,'2769767893'),('13.0.0-KEYCLOAK-17992-recreate-constraints','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-16 23:36:52',95,'MARK_RAN','7:64db59e44c374f13955489e8990d17a1','addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...','',NULL,'3.5.4',NULL,NULL,'2769767893'),('json-string-accomodation-fixed','keycloak','META-INF/jpa-changelog-13.0.0.xml','2023-12-16 23:36:52',96,'EXECUTED','7:329a578cdb43262fff975f0a7f6cda60','addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'2769767893'),('14.0.0-KEYCLOAK-11019','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-16 23:36:52',97,'EXECUTED','7:fae0de241ac0fd0bbc2b380b85e4f567','createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'2769767893'),('14.0.0-KEYCLOAK-18286','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-16 23:36:52',98,'MARK_RAN','7:075d54e9180f49bb0c64ca4218936e81','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2769767893'),('14.0.0-KEYCLOAK-18286-revert','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-16 23:36:52',99,'MARK_RAN','7:06499836520f4f6b3d05e35a59324910','dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2769767893'),('14.0.0-KEYCLOAK-18286-supported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-16 23:36:52',100,'EXECUTED','7:b558ad47ea0e4d3c3514225a49cc0d65','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2769767893'),('14.0.0-KEYCLOAK-18286-unsupported-dbs','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-16 23:36:52',101,'MARK_RAN','7:3d2b23076e59c6f70bae703aa01be35b','createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'2769767893'),('KEYCLOAK-17267-add-index-to-user-attributes','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-16 23:36:52',102,'EXECUTED','7:1a7f28ff8d9e53aeb879d76ea3d9341a','createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE','',NULL,'3.5.4',NULL,NULL,'2769767893'),('KEYCLOAK-18146-add-saml-art-binding-identifier','keycloak','META-INF/jpa-changelog-14.0.0.xml','2023-12-16 23:36:52',103,'EXECUTED','7:2fd554456fed4a82c698c555c5b751b6','customChange','',NULL,'3.5.4',NULL,NULL,'2769767893'),('15.0.0-KEYCLOAK-18467','keycloak','META-INF/jpa-changelog-15.0.0.xml','2023-12-16 23:36:52',104,'EXECUTED','7:b06356d66c2790ecc2ae54ba0458397a','addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...','',NULL,'3.5.4',NULL,NULL,'2769767893');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('E-Shop','0b9ca758-ecdc-442f-b4b7-eb45447b551e',_binary ''),('E-Shop','29ef25af-6d88-467a-b174-c42a1bb11a6e',_binary ''),('E-Shop','477cbdd9-a00c-4005-b71a-3d2d1a66103e',_binary ''),('E-Shop','6ba8dfee-89ce-423a-898e-7f2666bd7d92',_binary ''),('E-Shop','91f8fbe7-e919-46f0-b6e2-32735fc57ab7',_binary ''),('E-Shop','b71c7127-277a-463e-9bc0-dfd20bca6294',_binary '\0'),('E-Shop','c1a84955-c770-4d26-920a-0c3a3479ba7f',_binary '\0'),('E-Shop','dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e',_binary '\0'),('E-Shop','e43ee7ee-2db9-4b2f-87ea-4fe3dfe84348',_binary '\0'),('master','1b4c37bd-0642-4d01-944e-35f67cafd6f4',_binary '\0'),('master','2187b1de-a95f-413f-8308-ea8294fec455',_binary '\0'),('master','433b2ccd-c94f-4b37-966d-bc98dd416bbf',_binary ''),('master','747f4dc5-1dc1-4cf5-a015-963d38f5216b',_binary '\0'),('master','b94aa4e2-c6a1-40fe-a9e5-b8889ac196cd',_binary ''),('master','b97e3d96-395c-4751-bdd4-be1139159dee',_binary ''),('master','c34ffec1-b1ad-40c3-b4cf-01697ccde3ac',_binary ''),('master','c73192ab-2ac8-461d-a33c-6e94621f5f22',_binary '\0'),('master','f500d521-831f-48c2-ba3b-7da49f4cc685',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` text,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` text,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `USER_LABEL` varchar(255) DEFAULT NULL,
  `SECRET_DATA` longtext,
  `CREDENTIAL_DATA` longtext,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `GROUP_ROLE_MAPPING` VALUES ('146bf024-745e-4a7b-85b9-8ca42e95b4db','34384369-5008-41c3-b9ec-f51a9da55039'),('2340cb09-1838-4adc-8f05-75397be0f31a','34384369-5008-41c3-b9ec-f51a9da55039'),('f0f2c817-4b09-492e-8386-59e8950c4714','34384369-5008-41c3-b9ec-f51a9da55039'),('146bf024-745e-4a7b-85b9-8ca42e95b4db','e6616395-39ef-45f3-a046-dbad58119248'),('56dc3f24-de97-422c-a277-6f41dd32c2f2','e6616395-39ef-45f3-a046-dbad58119248'),('f0f2c817-4b09-492e-8386-59e8950c4714','e6616395-39ef-45f3-a046-dbad58119248');
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_GROUP` VALUES ('34384369-5008-41c3-b9ec-f51a9da55039','Customers',' ','E-Shop'),('e6616395-39ef-45f3-a046-dbad58119248','Sellers',' ','E-Shop');
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('03b941f7-64f1-4db7-a458-8f5b5f4ffdf5','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_manage-realm}','manage-realm','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('0ceaff2c-0343-4b5d-94b9-a79f7be8fc98','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_view-clients}','view-clients','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('0dae941d-8b8a-4451-9398-46aa88781942','06ada848-0832-48aa-85c1-4edcd32466ef',_binary '','${role_manage-consent}','manage-consent','E-Shop','06ada848-0832-48aa-85c1-4edcd32466ef',NULL),('11660410-cb3a-4c44-b1ee-934f0c14703b','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_view-identity-providers}','view-identity-providers','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('13b6e9c7-f26f-4f7d-bb0c-332cea8407d3','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_query-clients}','query-clients','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('146bf024-745e-4a7b-85b9-8ca42e95b4db','E-Shop',_binary '\0','${role_offline-access}','offline_access','E-Shop',NULL,NULL),('1769d660-85b5-4b86-afe9-47b7d6d95029','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_view-clients}','view-clients','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('17b01eb9-56d0-4577-b9f1-8ad6796e0a14','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,NULL),('1adb5e7f-956a-4cc1-99e9-1e3d05f37c84','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_view-users}','view-users','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('1c514537-1850-4efb-9479-50afac363767','E-Shop',_binary '\0','${role_default-roles}','default-roles-e-shop','E-Shop',NULL,NULL),('1db72516-f891-427c-b0cd-3c1e7529d684','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_view-authorization}','view-authorization','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('22884b2d-5396-46b2-8b4e-100430a35add','06ada848-0832-48aa-85c1-4edcd32466ef',_binary '','${role_view-applications}','view-applications','E-Shop','06ada848-0832-48aa-85c1-4edcd32466ef',NULL),('2340cb09-1838-4adc-8f05-75397be0f31a','E-Shop',_binary '\0','Customer can buy products by placing orders','customer','E-Shop',NULL,NULL),('25f991cc-97a8-44bc-9827-d1ca93d557fc','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_manage-realm}','manage-realm','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('2cd903f5-36eb-4af5-b342-d70bd8c0ef0a','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_query-clients}','query-clients','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('2d68015e-16e3-4900-bf50-e47375bff0e7','06ada848-0832-48aa-85c1-4edcd32466ef',_binary '','${role_manage-account}','manage-account','E-Shop','06ada848-0832-48aa-85c1-4edcd32466ef',NULL),('2ee0c07e-91ab-49b3-82e1-c8196c74c179','d55de1f0-98c2-4e82-9f2d-3ccf0d3f59df',_binary '','${role_read-token}','read-token','master','d55de1f0-98c2-4e82-9f2d-3ccf0d3f59df',NULL),('303901ec-5d82-4037-962c-e25b30c61875','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_manage-events}','manage-events','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('31614152-c29d-4d49-a3ca-cceb4b2367d5','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_query-groups}','query-groups','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('3495822b-dbd5-4708-b028-5094e62cd130','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_manage-users}','manage-users','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('3579622a-969b-4532-b256-23febb2193d9','06ada848-0832-48aa-85c1-4edcd32466ef',_binary '','${role_view-profile}','view-profile','E-Shop','06ada848-0832-48aa-85c1-4edcd32466ef',NULL),('36e8a8f6-5802-45b4-a770-e3930a3b1906','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_query-realms}','query-realms','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('3de5f53c-d4c2-44ac-802d-0fd887472526','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_view-events}','view-events','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('402d73d0-0cc1-4a6c-b092-d8655681f3cb','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_view-events}','view-events','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('41e8347f-9a2d-445c-bdae-b1201216cb8d','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_query-clients}','query-clients','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('42c81503-7a35-4797-92c6-1a54d42d38e6','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_manage-clients}','manage-clients','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('4621d6bd-fa78-41ab-b0bc-f1142149ef91','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_view-authorization}','view-authorization','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('54482871-987d-4501-a0b9-c29f91429c92','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_impersonation}','impersonation','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('56dc3f24-de97-422c-a277-6f41dd32c2f2','E-Shop',_binary '\0','Seller can create, get, update and delte products.','seller','E-Shop',NULL,NULL),('59a575a3-5ac2-4eb6-bfef-8eaae418cedf','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_manage-identity-providers}','manage-identity-providers','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('5c7e51f1-1c01-457c-8d0a-27e4985a9793','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_view-users}','view-users','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('5cbb936d-fa4d-4dea-a85b-c86771916151','a7294a4e-28b6-4cdb-86d4-42af42972ce8',_binary '','${role_view-profile}','view-profile','master','a7294a4e-28b6-4cdb-86d4-42af42972ce8',NULL),('5e5273c2-1797-4455-b2cf-45a5bd01e18a','a7294a4e-28b6-4cdb-86d4-42af42972ce8',_binary '','${role_delete-account}','delete-account','master','a7294a4e-28b6-4cdb-86d4-42af42972ce8',NULL),('62fbbea2-1066-4b72-8841-7c380fe92a43','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_query-users}','query-users','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('643b3e09-9dde-4219-9a14-88fec4819378','a7294a4e-28b6-4cdb-86d4-42af42972ce8',_binary '','${role_manage-account}','manage-account','master','a7294a4e-28b6-4cdb-86d4-42af42972ce8',NULL),('67a9eab2-6518-461f-94d2-6730e8d8d9aa','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,NULL),('68aa9658-c01f-4356-a39a-9073249e9d51','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_query-realms}','query-realms','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('6a77fd09-8c60-4334-9b2f-0557978a0cae','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_manage-events}','manage-events','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('793bd6fe-a7a9-41c3-a404-57f8d0498570','06ada848-0832-48aa-85c1-4edcd32466ef',_binary '','${role_view-consent}','view-consent','E-Shop','06ada848-0832-48aa-85c1-4edcd32466ef',NULL),('7ec0dfc8-60ce-4ff3-9cad-f85c6813d65b','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_view-realm}','view-realm','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('7efb3134-9d03-449f-9261-a2af2bf8efd2','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_manage-users}','manage-users','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('8136c258-fcdb-4105-b2ae-7c3a22e10d9a','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_manage-clients}','manage-clients','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('81589699-9cea-408c-bbe2-c7558bbc4cec','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_manage-clients}','manage-clients','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('838b86fb-78f5-47f9-94ee-ac4d8f431500','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_impersonation}','impersonation','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('83eefdb2-972b-4982-9c9b-ed7033e857c0','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_impersonation}','impersonation','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('88fc8ada-449f-4af1-abbb-63058607beb9','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_query-users}','query-users','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('8eb9cc51-dc9a-4544-a232-a8995379e84a','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_realm-admin}','realm-admin','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('90f79802-be7a-4ff6-9227-14f612c0bf8b','master',_binary '\0','${role_admin}','admin','master',NULL,NULL),('94698020-5f1c-41c2-b745-832c93651faa','a7294a4e-28b6-4cdb-86d4-42af42972ce8',_binary '','${role_view-consent}','view-consent','master','a7294a4e-28b6-4cdb-86d4-42af42972ce8',NULL),('9b07c509-b263-4b65-ad23-59fc9309fe74','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,NULL),('9ffbcbc6-36fa-4dc2-9afb-af0e9b3a08dd','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_create-client}','create-client','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('a1c4b637-b0f4-40e9-aad6-26244a7ddcbf','a7294a4e-28b6-4cdb-86d4-42af42972ce8',_binary '','${role_manage-consent}','manage-consent','master','a7294a4e-28b6-4cdb-86d4-42af42972ce8',NULL),('a4e78c68-162a-446f-bfb2-fa9c4a44033e','a435858d-9d77-4e8d-8e78-884b5f356d67',_binary '','${role_read-token}','read-token','E-Shop','a435858d-9d77-4e8d-8e78-884b5f356d67',NULL),('a97a5760-9ee7-42c6-9a82-0da35f7dd171','a7294a4e-28b6-4cdb-86d4-42af42972ce8',_binary '','${role_manage-account-links}','manage-account-links','master','a7294a4e-28b6-4cdb-86d4-42af42972ce8',NULL),('a9979796-a2cb-4e88-a841-fc11529f087e','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_manage-authorization}','manage-authorization','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('ac369839-0c3e-4646-9ad2-b6217d9017f6','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_create-client}','create-client','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('acb01dbd-33bf-4676-9954-7f5f54046a0d','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_manage-authorization}','manage-authorization','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('b8a6858a-d986-4b52-acd8-76defa4e6c9a','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_view-events}','view-events','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('b9b8e979-6830-41de-91bf-8f58648f2e19','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_manage-realm}','manage-realm','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('bc55460d-7762-4cc1-8a2b-bd05d7c7068c','06ada848-0832-48aa-85c1-4edcd32466ef',_binary '','${role_manage-account-links}','manage-account-links','E-Shop','06ada848-0832-48aa-85c1-4edcd32466ef',NULL),('c94bc50a-df9a-485a-857d-0dc3e07aa5c3','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_view-realm}','view-realm','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('c9def70a-ed6d-4b2b-8498-d24424b938e9','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_view-authorization}','view-authorization','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('cd31ad11-abf8-493d-b2a5-b1312a7014e0','06ada848-0832-48aa-85c1-4edcd32466ef',_binary '','${role_delete-account}','delete-account','E-Shop','06ada848-0832-48aa-85c1-4edcd32466ef',NULL),('cde78ed9-4b05-481a-9618-802c4c58fa20','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('d36ebb37-7fde-4256-99a6-5048a64fe143','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_view-users}','view-users','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('d45dd1d9-c432-4786-8839-36e967190fd4','master',_binary '\0','${role_default-roles}','default-roles-master','master',NULL,NULL),('d4cec6f4-eea9-4828-9684-ae5a4363fe5e','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_manage-authorization}','manage-authorization','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('da92c072-d548-4857-b741-1efe02be8e84','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_manage-events}','manage-events','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('dd955dcf-0472-4b45-91cb-071cf2a147f0','a7294a4e-28b6-4cdb-86d4-42af42972ce8',_binary '','${role_view-applications}','view-applications','master','a7294a4e-28b6-4cdb-86d4-42af42972ce8',NULL),('defa09f2-dfb3-419b-b7a5-8a34891ba14b','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_manage-users}','manage-users','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('e027d78b-08e4-45b0-a37b-a971fba43c31','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_view-identity-providers}','view-identity-providers','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('e17d2c3a-7cfc-4d16-a9eb-64308b8190fd','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_query-realms}','query-realms','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('e3d82f24-a13c-4abe-8b00-4836b84632ba','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('e663f146-cfbe-4221-94bf-fddd90597217','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_view-realm}','view-realm','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('f0f2c817-4b09-492e-8386-59e8950c4714','E-Shop',_binary '\0','${role_uma_authorization}','uma_authorization','E-Shop',NULL,NULL),('f474f5c7-ee20-441a-bdb7-d1d9c021f748','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_query-users}','query-users','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('f6d4d4a7-6f2f-40bf-9015-5f7e3f1deab2','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_query-groups}','query-groups','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('fa5935fb-5108-473b-a8e2-63ad5e641fb6','0aa7022b-4395-459d-9e6d-df7a41accaa4',_binary '','${role_create-client}','create-client','master','0aa7022b-4395-459d-9e6d-df7a41accaa4',NULL),('fbf181fa-b207-4b5d-8705-ad7a17133656','30e611f0-0fea-40b3-816a-0989f9b30e0e',_binary '','${role_view-clients}','view-clients','master','30e611f0-0fea-40b3-816a-0989f9b30e0e',NULL),('fd41e2d7-e7bb-49eb-8603-c67f9d186d90','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_query-groups}','query-groups','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL),('ff805e89-8b9d-482c-8870-c809846a3c32','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',_binary '','${role_view-identity-providers}','view-identity-providers','E-Shop','9cbbcf06-5686-4ea7-9e7f-2f944d6e9afa',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('zo9t4','16.1.1',1702769814);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_CSS_PRELOAD` (`CLIENT_ID`,`OFFLINE_FLAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`),
  KEY `IDX_OFFLINE_USS_PRELOAD` (`OFFLINE_FLAG`,`CREATED_ON`,`USER_SESSION_ID`),
  KEY `IDX_OFFLINE_USS_BY_USER` (`USER_ID`,`REALM_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_BY_USERSESS` (`REALM_ID`,`OFFLINE_FLAG`,`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('0e987508-1883-4701-a13c-df00d862dd86','email','openid-connect','oidc-usermodel-property-mapper',NULL,'91f8fbe7-e919-46f0-b6e2-32735fc57ab7'),('1cfbedae-62e5-4653-8ad1-036fa7167309','Client ID','openid-connect','oidc-usersessionmodel-note-mapper','a5b2fcca-88c0-4087-840d-e5525002cf4d',NULL),('1e9a2493-7422-45ee-9991-ad5fa2252322','full name','openid-connect','oidc-full-name-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('25761c87-fae3-424a-94e6-42ee9721c4f4','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('262fc3ca-e164-4a52-bb0e-5e9d74843941','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('2a8da5e4-1ef8-4cd9-94ca-30bffe6b4091','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('2b733f68-7dcc-429d-8797-2933735c3ea8','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('2ba9ebbd-f037-4b8e-9280-cca7e185f200','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c73192ab-2ac8-461d-a33c-6e94621f5f22'),('31a54d12-ce56-465b-b704-8dca141a598d','address','openid-connect','oidc-address-mapper',NULL,'dc0fe97a-b2bd-45bc-95b5-3f2203dfda6e'),('33a3b3b9-ae91-43b6-a16b-f4d961107e58','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'0b9ca758-ecdc-442f-b4b7-eb45447b551e'),('33db0915-586e-4c74-bbdf-85251dd75229','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('348e6a05-f775-4c37-8afb-3ba10bd19019','role list','saml','saml-role-list-mapper',NULL,'29ef25af-6d88-467a-b174-c42a1bb11a6e'),('379a8eac-f33a-40ed-afe0-d8cafc69d5a2','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('37f09dfd-ff7a-4af7-96d9-406c98bfe16d','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'f500d521-831f-48c2-ba3b-7da49f4cc685'),('3c797ee5-7dcf-41ac-8bd4-6f8c79a95da7','address','openid-connect','oidc-address-mapper',NULL,'1b4c37bd-0642-4d01-944e-35f67cafd6f4'),('3ea840cc-226b-4b55-8813-a80851543579','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'c1a84955-c770-4d26-920a-0c3a3479ba7f'),('43533e1a-bf97-4dbc-bd8f-5355abcd4da3','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'2187b1de-a95f-413f-8308-ea8294fec455'),('44041679-5937-41bb-be0c-cad9556d86c4','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('488b1781-c71e-492a-bde0-e0a5fd93630f','email','openid-connect','oidc-usermodel-property-mapper',NULL,'f500d521-831f-48c2-ba3b-7da49f4cc685'),('49d8b4f2-636f-4f7e-940f-4eb62e3c2810','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('4be21e76-4e63-4501-b58b-26be972d84c6','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'c1a84955-c770-4d26-920a-0c3a3479ba7f'),('509d7876-0cbc-4238-ab73-5ed4ff9898a1','audience resolve','openid-connect','oidc-audience-resolve-mapper','ce7dc481-b365-47f8-919d-3676a3a64308',NULL),('58e4aab2-e78c-4579-86ee-07773ee3c7b6','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'b94aa4e2-c6a1-40fe-a9e5-b8889ac196cd'),('5c0393fa-5844-4f01-92fb-bcaa137eff97','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'0b9ca758-ecdc-442f-b4b7-eb45447b551e'),('606ecf54-5a93-420d-ac02-b0949a7f4c08','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('68160271-9147-465b-aec5-df68e78c7213','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('6b721f05-5014-4ace-ae28-ac814920159b','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'433b2ccd-c94f-4b37-966d-bc98dd416bbf'),('6bbce7aa-39d9-4e3a-9968-89adaabc9ba1','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b71c7127-277a-463e-9bc0-dfd20bca6294'),('74efc1d8-6f7e-472d-9c72-b7c0fa706d39','Client IP Address','openid-connect','oidc-usersessionmodel-note-mapper','a5b2fcca-88c0-4087-840d-e5525002cf4d',NULL),('765b0924-e735-41b8-bd2c-6b5a3575a69e','locale','openid-connect','oidc-usermodel-attribute-mapper','51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf',NULL),('79cdc879-1e3d-4f99-97c2-c579341edeb8','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('7cd317be-987e-4aa8-bcf7-e0e717fc14ec','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('7e57e512-491d-405b-9488-5a41ff221e0b','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('88de1ccd-8e95-4048-b529-2117554c48a9','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'b71c7127-277a-463e-9bc0-dfd20bca6294'),('8af91d24-d328-4ef3-aee1-b51e29cf9741','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'433b2ccd-c94f-4b37-966d-bc98dd416bbf'),('914b7b9c-f3a1-457e-ad52-6647f04dcd95','username','openid-connect','oidc-usermodel-property-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('9469cf4b-9111-427f-af2f-13c135b95604','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('a2bbe8e2-c83a-4608-a79a-4803d2bbc7b1','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('a893befc-76d8-4409-b08b-1c26a67731ef','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('ae134e17-b6e1-49d1-b359-c887cc941b2f','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('af2e378f-41d5-4b00-8f2a-16005bd8ef45','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'2187b1de-a95f-413f-8308-ea8294fec455'),('b21c006d-c88f-4341-886a-8d1a33951406','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('c1036dd9-ba51-4619-9429-e6fa9a0d4e5f','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'91f8fbe7-e919-46f0-b6e2-32735fc57ab7'),('c2e31b3d-c5d8-4f36-ad98-5d42a9ea841d','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'433b2ccd-c94f-4b37-966d-bc98dd416bbf'),('c4d5da39-4b37-4e18-b8a1-d0f6b0ffc4ec','full name','openid-connect','oidc-full-name-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('c9f05fe6-4fc2-452d-99d6-0edc17614642','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'0b9ca758-ecdc-442f-b4b7-eb45447b551e'),('d053131c-e718-4d9b-839a-0cd3aaa5fada','role list','saml','saml-role-list-mapper',NULL,'b97e3d96-395c-4751-bdd4-be1139159dee'),('d3008984-d54e-425a-ac74-63bae0272be0','audience resolve','openid-connect','oidc-audience-resolve-mapper','0014a2dd-faaa-4d6f-a780-65f741c420a1',NULL),('d4c215d4-fb30-40b7-8a43-e6ed637a4a66','locale','openid-connect','oidc-usermodel-attribute-mapper','efd1931c-a641-4f68-9a76-a847fad0b51c',NULL),('e3fb9795-d478-4f84-b8fa-2d61707e43d8','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c73192ab-2ac8-461d-a33c-6e94621f5f22'),('e49c2dd5-a2aa-4a88-85c6-e24d0f7f5a4d','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('e5909f7e-3ca9-41e6-9943-23d7796cb527','username','openid-connect','oidc-usermodel-property-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('eee46895-567e-4d82-8c70-a6854881903e','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('f284ea7d-bb43-4479-a07a-38df4d5b865c','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('f452f461-398a-4202-a4a9-66b514609419','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'477cbdd9-a00c-4005-b71a-3d2d1a66103e'),('fa4d88bf-18fc-45b8-9fff-1e78d5a1a768','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('fda781be-c4a3-43b4-a49a-b1618de8f873','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'6ba8dfee-89ce-423a-898e-7f2666bd7d92'),('fdc4f92b-2ebe-411b-ab1b-d45a6f2f8392','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c34ffec1-b1ad-40c3-b4cf-01697ccde3ac'),('fedb14ef-5cd2-4806-87bd-8c7a500c8fca','Client Host','openid-connect','oidc-usersessionmodel-note-mapper','a5b2fcca-88c0-4087-840d-e5525002cf4d',NULL);
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('0e987508-1883-4701-a13c-df00d862dd86','true','access.token.claim'),('0e987508-1883-4701-a13c-df00d862dd86','email','claim.name'),('0e987508-1883-4701-a13c-df00d862dd86','true','id.token.claim'),('0e987508-1883-4701-a13c-df00d862dd86','String','jsonType.label'),('0e987508-1883-4701-a13c-df00d862dd86','email','user.attribute'),('0e987508-1883-4701-a13c-df00d862dd86','true','userinfo.token.claim'),('1cfbedae-62e5-4653-8ad1-036fa7167309','true','access.token.claim'),('1cfbedae-62e5-4653-8ad1-036fa7167309','clientId','claim.name'),('1cfbedae-62e5-4653-8ad1-036fa7167309','true','id.token.claim'),('1cfbedae-62e5-4653-8ad1-036fa7167309','String','jsonType.label'),('1cfbedae-62e5-4653-8ad1-036fa7167309','clientId','user.session.note'),('1e9a2493-7422-45ee-9991-ad5fa2252322','true','access.token.claim'),('1e9a2493-7422-45ee-9991-ad5fa2252322','true','id.token.claim'),('1e9a2493-7422-45ee-9991-ad5fa2252322','true','userinfo.token.claim'),('25761c87-fae3-424a-94e6-42ee9721c4f4','true','access.token.claim'),('25761c87-fae3-424a-94e6-42ee9721c4f4','given_name','claim.name'),('25761c87-fae3-424a-94e6-42ee9721c4f4','true','id.token.claim'),('25761c87-fae3-424a-94e6-42ee9721c4f4','String','jsonType.label'),('25761c87-fae3-424a-94e6-42ee9721c4f4','firstName','user.attribute'),('25761c87-fae3-424a-94e6-42ee9721c4f4','true','userinfo.token.claim'),('262fc3ca-e164-4a52-bb0e-5e9d74843941','true','access.token.claim'),('262fc3ca-e164-4a52-bb0e-5e9d74843941','middle_name','claim.name'),('262fc3ca-e164-4a52-bb0e-5e9d74843941','true','id.token.claim'),('262fc3ca-e164-4a52-bb0e-5e9d74843941','String','jsonType.label'),('262fc3ca-e164-4a52-bb0e-5e9d74843941','middleName','user.attribute'),('262fc3ca-e164-4a52-bb0e-5e9d74843941','true','userinfo.token.claim'),('2a8da5e4-1ef8-4cd9-94ca-30bffe6b4091','true','access.token.claim'),('2a8da5e4-1ef8-4cd9-94ca-30bffe6b4091','profile','claim.name'),('2a8da5e4-1ef8-4cd9-94ca-30bffe6b4091','true','id.token.claim'),('2a8da5e4-1ef8-4cd9-94ca-30bffe6b4091','String','jsonType.label'),('2a8da5e4-1ef8-4cd9-94ca-30bffe6b4091','profile','user.attribute'),('2a8da5e4-1ef8-4cd9-94ca-30bffe6b4091','true','userinfo.token.claim'),('2b733f68-7dcc-429d-8797-2933735c3ea8','true','access.token.claim'),('2b733f68-7dcc-429d-8797-2933735c3ea8','profile','claim.name'),('2b733f68-7dcc-429d-8797-2933735c3ea8','true','id.token.claim'),('2b733f68-7dcc-429d-8797-2933735c3ea8','String','jsonType.label'),('2b733f68-7dcc-429d-8797-2933735c3ea8','profile','user.attribute'),('2b733f68-7dcc-429d-8797-2933735c3ea8','true','userinfo.token.claim'),('2ba9ebbd-f037-4b8e-9280-cca7e185f200','true','access.token.claim'),('2ba9ebbd-f037-4b8e-9280-cca7e185f200','phone_number','claim.name'),('2ba9ebbd-f037-4b8e-9280-cca7e185f200','true','id.token.claim'),('2ba9ebbd-f037-4b8e-9280-cca7e185f200','String','jsonType.label'),('2ba9ebbd-f037-4b8e-9280-cca7e185f200','phoneNumber','user.attribute'),('2ba9ebbd-f037-4b8e-9280-cca7e185f200','true','userinfo.token.claim'),('31a54d12-ce56-465b-b704-8dca141a598d','true','access.token.claim'),('31a54d12-ce56-465b-b704-8dca141a598d','true','id.token.claim'),('31a54d12-ce56-465b-b704-8dca141a598d','country','user.attribute.country'),('31a54d12-ce56-465b-b704-8dca141a598d','formatted','user.attribute.formatted'),('31a54d12-ce56-465b-b704-8dca141a598d','locality','user.attribute.locality'),('31a54d12-ce56-465b-b704-8dca141a598d','postal_code','user.attribute.postal_code'),('31a54d12-ce56-465b-b704-8dca141a598d','region','user.attribute.region'),('31a54d12-ce56-465b-b704-8dca141a598d','street','user.attribute.street'),('31a54d12-ce56-465b-b704-8dca141a598d','true','userinfo.token.claim'),('33a3b3b9-ae91-43b6-a16b-f4d961107e58','true','access.token.claim'),('33a3b3b9-ae91-43b6-a16b-f4d961107e58','realm_access.roles','claim.name'),('33a3b3b9-ae91-43b6-a16b-f4d961107e58','String','jsonType.label'),('33a3b3b9-ae91-43b6-a16b-f4d961107e58','true','multivalued'),('33a3b3b9-ae91-43b6-a16b-f4d961107e58','foo','user.attribute'),('33db0915-586e-4c74-bbdf-85251dd75229','true','access.token.claim'),('33db0915-586e-4c74-bbdf-85251dd75229','gender','claim.name'),('33db0915-586e-4c74-bbdf-85251dd75229','true','id.token.claim'),('33db0915-586e-4c74-bbdf-85251dd75229','String','jsonType.label'),('33db0915-586e-4c74-bbdf-85251dd75229','gender','user.attribute'),('33db0915-586e-4c74-bbdf-85251dd75229','true','userinfo.token.claim'),('348e6a05-f775-4c37-8afb-3ba10bd19019','Role','attribute.name'),('348e6a05-f775-4c37-8afb-3ba10bd19019','Basic','attribute.nameformat'),('348e6a05-f775-4c37-8afb-3ba10bd19019','false','single'),('379a8eac-f33a-40ed-afe0-d8cafc69d5a2','true','access.token.claim'),('379a8eac-f33a-40ed-afe0-d8cafc69d5a2','middle_name','claim.name'),('379a8eac-f33a-40ed-afe0-d8cafc69d5a2','true','id.token.claim'),('379a8eac-f33a-40ed-afe0-d8cafc69d5a2','String','jsonType.label'),('379a8eac-f33a-40ed-afe0-d8cafc69d5a2','middleName','user.attribute'),('379a8eac-f33a-40ed-afe0-d8cafc69d5a2','true','userinfo.token.claim'),('37f09dfd-ff7a-4af7-96d9-406c98bfe16d','true','access.token.claim'),('37f09dfd-ff7a-4af7-96d9-406c98bfe16d','email_verified','claim.name'),('37f09dfd-ff7a-4af7-96d9-406c98bfe16d','true','id.token.claim'),('37f09dfd-ff7a-4af7-96d9-406c98bfe16d','boolean','jsonType.label'),('37f09dfd-ff7a-4af7-96d9-406c98bfe16d','emailVerified','user.attribute'),('37f09dfd-ff7a-4af7-96d9-406c98bfe16d','true','userinfo.token.claim'),('3c797ee5-7dcf-41ac-8bd4-6f8c79a95da7','true','access.token.claim'),('3c797ee5-7dcf-41ac-8bd4-6f8c79a95da7','true','id.token.claim'),('3c797ee5-7dcf-41ac-8bd4-6f8c79a95da7','country','user.attribute.country'),('3c797ee5-7dcf-41ac-8bd4-6f8c79a95da7','formatted','user.attribute.formatted'),('3c797ee5-7dcf-41ac-8bd4-6f8c79a95da7','locality','user.attribute.locality'),('3c797ee5-7dcf-41ac-8bd4-6f8c79a95da7','postal_code','user.attribute.postal_code'),('3c797ee5-7dcf-41ac-8bd4-6f8c79a95da7','region','user.attribute.region'),('3c797ee5-7dcf-41ac-8bd4-6f8c79a95da7','street','user.attribute.street'),('3c797ee5-7dcf-41ac-8bd4-6f8c79a95da7','true','userinfo.token.claim'),('3ea840cc-226b-4b55-8813-a80851543579','true','access.token.claim'),('3ea840cc-226b-4b55-8813-a80851543579','upn','claim.name'),('3ea840cc-226b-4b55-8813-a80851543579','true','id.token.claim'),('3ea840cc-226b-4b55-8813-a80851543579','String','jsonType.label'),('3ea840cc-226b-4b55-8813-a80851543579','username','user.attribute'),('3ea840cc-226b-4b55-8813-a80851543579','true','userinfo.token.claim'),('43533e1a-bf97-4dbc-bd8f-5355abcd4da3','true','access.token.claim'),('43533e1a-bf97-4dbc-bd8f-5355abcd4da3','groups','claim.name'),('43533e1a-bf97-4dbc-bd8f-5355abcd4da3','true','id.token.claim'),('43533e1a-bf97-4dbc-bd8f-5355abcd4da3','String','jsonType.label'),('43533e1a-bf97-4dbc-bd8f-5355abcd4da3','true','multivalued'),('43533e1a-bf97-4dbc-bd8f-5355abcd4da3','foo','user.attribute'),('44041679-5937-41bb-be0c-cad9556d86c4','true','access.token.claim'),('44041679-5937-41bb-be0c-cad9556d86c4','locale','claim.name'),('44041679-5937-41bb-be0c-cad9556d86c4','true','id.token.claim'),('44041679-5937-41bb-be0c-cad9556d86c4','String','jsonType.label'),('44041679-5937-41bb-be0c-cad9556d86c4','locale','user.attribute'),('44041679-5937-41bb-be0c-cad9556d86c4','true','userinfo.token.claim'),('488b1781-c71e-492a-bde0-e0a5fd93630f','true','access.token.claim'),('488b1781-c71e-492a-bde0-e0a5fd93630f','email','claim.name'),('488b1781-c71e-492a-bde0-e0a5fd93630f','true','id.token.claim'),('488b1781-c71e-492a-bde0-e0a5fd93630f','String','jsonType.label'),('488b1781-c71e-492a-bde0-e0a5fd93630f','email','user.attribute'),('488b1781-c71e-492a-bde0-e0a5fd93630f','true','userinfo.token.claim'),('49d8b4f2-636f-4f7e-940f-4eb62e3c2810','true','access.token.claim'),('49d8b4f2-636f-4f7e-940f-4eb62e3c2810','birthdate','claim.name'),('49d8b4f2-636f-4f7e-940f-4eb62e3c2810','true','id.token.claim'),('49d8b4f2-636f-4f7e-940f-4eb62e3c2810','String','jsonType.label'),('49d8b4f2-636f-4f7e-940f-4eb62e3c2810','birthdate','user.attribute'),('49d8b4f2-636f-4f7e-940f-4eb62e3c2810','true','userinfo.token.claim'),('4be21e76-4e63-4501-b58b-26be972d84c6','true','access.token.claim'),('4be21e76-4e63-4501-b58b-26be972d84c6','groups','claim.name'),('4be21e76-4e63-4501-b58b-26be972d84c6','true','id.token.claim'),('4be21e76-4e63-4501-b58b-26be972d84c6','String','jsonType.label'),('4be21e76-4e63-4501-b58b-26be972d84c6','true','multivalued'),('4be21e76-4e63-4501-b58b-26be972d84c6','foo','user.attribute'),('5c0393fa-5844-4f01-92fb-bcaa137eff97','true','access.token.claim'),('5c0393fa-5844-4f01-92fb-bcaa137eff97','resource_access.${client_id}.roles','claim.name'),('5c0393fa-5844-4f01-92fb-bcaa137eff97','String','jsonType.label'),('5c0393fa-5844-4f01-92fb-bcaa137eff97','true','multivalued'),('5c0393fa-5844-4f01-92fb-bcaa137eff97','foo','user.attribute'),('606ecf54-5a93-420d-ac02-b0949a7f4c08','true','access.token.claim'),('606ecf54-5a93-420d-ac02-b0949a7f4c08','website','claim.name'),('606ecf54-5a93-420d-ac02-b0949a7f4c08','true','id.token.claim'),('606ecf54-5a93-420d-ac02-b0949a7f4c08','String','jsonType.label'),('606ecf54-5a93-420d-ac02-b0949a7f4c08','website','user.attribute'),('606ecf54-5a93-420d-ac02-b0949a7f4c08','true','userinfo.token.claim'),('68160271-9147-465b-aec5-df68e78c7213','true','access.token.claim'),('68160271-9147-465b-aec5-df68e78c7213','birthdate','claim.name'),('68160271-9147-465b-aec5-df68e78c7213','true','id.token.claim'),('68160271-9147-465b-aec5-df68e78c7213','String','jsonType.label'),('68160271-9147-465b-aec5-df68e78c7213','birthdate','user.attribute'),('68160271-9147-465b-aec5-df68e78c7213','true','userinfo.token.claim'),('6bbce7aa-39d9-4e3a-9968-89adaabc9ba1','true','access.token.claim'),('6bbce7aa-39d9-4e3a-9968-89adaabc9ba1','phone_number','claim.name'),('6bbce7aa-39d9-4e3a-9968-89adaabc9ba1','true','id.token.claim'),('6bbce7aa-39d9-4e3a-9968-89adaabc9ba1','String','jsonType.label'),('6bbce7aa-39d9-4e3a-9968-89adaabc9ba1','phoneNumber','user.attribute'),('6bbce7aa-39d9-4e3a-9968-89adaabc9ba1','true','userinfo.token.claim'),('74efc1d8-6f7e-472d-9c72-b7c0fa706d39','true','access.token.claim'),('74efc1d8-6f7e-472d-9c72-b7c0fa706d39','clientAddress','claim.name'),('74efc1d8-6f7e-472d-9c72-b7c0fa706d39','true','id.token.claim'),('74efc1d8-6f7e-472d-9c72-b7c0fa706d39','String','jsonType.label'),('74efc1d8-6f7e-472d-9c72-b7c0fa706d39','clientAddress','user.session.note'),('765b0924-e735-41b8-bd2c-6b5a3575a69e','true','access.token.claim'),('765b0924-e735-41b8-bd2c-6b5a3575a69e','locale','claim.name'),('765b0924-e735-41b8-bd2c-6b5a3575a69e','true','id.token.claim'),('765b0924-e735-41b8-bd2c-6b5a3575a69e','String','jsonType.label'),('765b0924-e735-41b8-bd2c-6b5a3575a69e','locale','user.attribute'),('765b0924-e735-41b8-bd2c-6b5a3575a69e','true','userinfo.token.claim'),('79cdc879-1e3d-4f99-97c2-c579341edeb8','true','access.token.claim'),('79cdc879-1e3d-4f99-97c2-c579341edeb8','given_name','claim.name'),('79cdc879-1e3d-4f99-97c2-c579341edeb8','true','id.token.claim'),('79cdc879-1e3d-4f99-97c2-c579341edeb8','String','jsonType.label'),('79cdc879-1e3d-4f99-97c2-c579341edeb8','firstName','user.attribute'),('79cdc879-1e3d-4f99-97c2-c579341edeb8','true','userinfo.token.claim'),('7cd317be-987e-4aa8-bcf7-e0e717fc14ec','true','access.token.claim'),('7cd317be-987e-4aa8-bcf7-e0e717fc14ec','locale','claim.name'),('7cd317be-987e-4aa8-bcf7-e0e717fc14ec','true','id.token.claim'),('7cd317be-987e-4aa8-bcf7-e0e717fc14ec','String','jsonType.label'),('7cd317be-987e-4aa8-bcf7-e0e717fc14ec','locale','user.attribute'),('7cd317be-987e-4aa8-bcf7-e0e717fc14ec','true','userinfo.token.claim'),('7e57e512-491d-405b-9488-5a41ff221e0b','true','access.token.claim'),('7e57e512-491d-405b-9488-5a41ff221e0b','gender','claim.name'),('7e57e512-491d-405b-9488-5a41ff221e0b','true','id.token.claim'),('7e57e512-491d-405b-9488-5a41ff221e0b','String','jsonType.label'),('7e57e512-491d-405b-9488-5a41ff221e0b','gender','user.attribute'),('7e57e512-491d-405b-9488-5a41ff221e0b','true','userinfo.token.claim'),('88de1ccd-8e95-4048-b529-2117554c48a9','true','access.token.claim'),('88de1ccd-8e95-4048-b529-2117554c48a9','phone_number_verified','claim.name'),('88de1ccd-8e95-4048-b529-2117554c48a9','true','id.token.claim'),('88de1ccd-8e95-4048-b529-2117554c48a9','boolean','jsonType.label'),('88de1ccd-8e95-4048-b529-2117554c48a9','phoneNumberVerified','user.attribute'),('88de1ccd-8e95-4048-b529-2117554c48a9','true','userinfo.token.claim'),('8af91d24-d328-4ef3-aee1-b51e29cf9741','true','access.token.claim'),('8af91d24-d328-4ef3-aee1-b51e29cf9741','realm_access.roles','claim.name'),('8af91d24-d328-4ef3-aee1-b51e29cf9741','String','jsonType.label'),('8af91d24-d328-4ef3-aee1-b51e29cf9741','true','multivalued'),('8af91d24-d328-4ef3-aee1-b51e29cf9741','foo','user.attribute'),('914b7b9c-f3a1-457e-ad52-6647f04dcd95','true','access.token.claim'),('914b7b9c-f3a1-457e-ad52-6647f04dcd95','preferred_username','claim.name'),('914b7b9c-f3a1-457e-ad52-6647f04dcd95','true','id.token.claim'),('914b7b9c-f3a1-457e-ad52-6647f04dcd95','String','jsonType.label'),('914b7b9c-f3a1-457e-ad52-6647f04dcd95','username','user.attribute'),('914b7b9c-f3a1-457e-ad52-6647f04dcd95','true','userinfo.token.claim'),('9469cf4b-9111-427f-af2f-13c135b95604','true','access.token.claim'),('9469cf4b-9111-427f-af2f-13c135b95604','family_name','claim.name'),('9469cf4b-9111-427f-af2f-13c135b95604','true','id.token.claim'),('9469cf4b-9111-427f-af2f-13c135b95604','String','jsonType.label'),('9469cf4b-9111-427f-af2f-13c135b95604','lastName','user.attribute'),('9469cf4b-9111-427f-af2f-13c135b95604','true','userinfo.token.claim'),('a2bbe8e2-c83a-4608-a79a-4803d2bbc7b1','true','access.token.claim'),('a2bbe8e2-c83a-4608-a79a-4803d2bbc7b1','family_name','claim.name'),('a2bbe8e2-c83a-4608-a79a-4803d2bbc7b1','true','id.token.claim'),('a2bbe8e2-c83a-4608-a79a-4803d2bbc7b1','String','jsonType.label'),('a2bbe8e2-c83a-4608-a79a-4803d2bbc7b1','lastName','user.attribute'),('a2bbe8e2-c83a-4608-a79a-4803d2bbc7b1','true','userinfo.token.claim'),('a893befc-76d8-4409-b08b-1c26a67731ef','true','access.token.claim'),('a893befc-76d8-4409-b08b-1c26a67731ef','picture','claim.name'),('a893befc-76d8-4409-b08b-1c26a67731ef','true','id.token.claim'),('a893befc-76d8-4409-b08b-1c26a67731ef','String','jsonType.label'),('a893befc-76d8-4409-b08b-1c26a67731ef','picture','user.attribute'),('a893befc-76d8-4409-b08b-1c26a67731ef','true','userinfo.token.claim'),('ae134e17-b6e1-49d1-b359-c887cc941b2f','true','access.token.claim'),('ae134e17-b6e1-49d1-b359-c887cc941b2f','updated_at','claim.name'),('ae134e17-b6e1-49d1-b359-c887cc941b2f','true','id.token.claim'),('ae134e17-b6e1-49d1-b359-c887cc941b2f','String','jsonType.label'),('ae134e17-b6e1-49d1-b359-c887cc941b2f','updatedAt','user.attribute'),('ae134e17-b6e1-49d1-b359-c887cc941b2f','true','userinfo.token.claim'),('af2e378f-41d5-4b00-8f2a-16005bd8ef45','true','access.token.claim'),('af2e378f-41d5-4b00-8f2a-16005bd8ef45','upn','claim.name'),('af2e378f-41d5-4b00-8f2a-16005bd8ef45','true','id.token.claim'),('af2e378f-41d5-4b00-8f2a-16005bd8ef45','String','jsonType.label'),('af2e378f-41d5-4b00-8f2a-16005bd8ef45','username','user.attribute'),('af2e378f-41d5-4b00-8f2a-16005bd8ef45','true','userinfo.token.claim'),('b21c006d-c88f-4341-886a-8d1a33951406','true','access.token.claim'),('b21c006d-c88f-4341-886a-8d1a33951406','website','claim.name'),('b21c006d-c88f-4341-886a-8d1a33951406','true','id.token.claim'),('b21c006d-c88f-4341-886a-8d1a33951406','String','jsonType.label'),('b21c006d-c88f-4341-886a-8d1a33951406','website','user.attribute'),('b21c006d-c88f-4341-886a-8d1a33951406','true','userinfo.token.claim'),('c1036dd9-ba51-4619-9429-e6fa9a0d4e5f','true','access.token.claim'),('c1036dd9-ba51-4619-9429-e6fa9a0d4e5f','email_verified','claim.name'),('c1036dd9-ba51-4619-9429-e6fa9a0d4e5f','true','id.token.claim'),('c1036dd9-ba51-4619-9429-e6fa9a0d4e5f','boolean','jsonType.label'),('c1036dd9-ba51-4619-9429-e6fa9a0d4e5f','emailVerified','user.attribute'),('c1036dd9-ba51-4619-9429-e6fa9a0d4e5f','true','userinfo.token.claim'),('c2e31b3d-c5d8-4f36-ad98-5d42a9ea841d','true','access.token.claim'),('c2e31b3d-c5d8-4f36-ad98-5d42a9ea841d','resource_access.${client_id}.roles','claim.name'),('c2e31b3d-c5d8-4f36-ad98-5d42a9ea841d','String','jsonType.label'),('c2e31b3d-c5d8-4f36-ad98-5d42a9ea841d','true','multivalued'),('c2e31b3d-c5d8-4f36-ad98-5d42a9ea841d','foo','user.attribute'),('c4d5da39-4b37-4e18-b8a1-d0f6b0ffc4ec','true','access.token.claim'),('c4d5da39-4b37-4e18-b8a1-d0f6b0ffc4ec','true','id.token.claim'),('c4d5da39-4b37-4e18-b8a1-d0f6b0ffc4ec','true','userinfo.token.claim'),('d053131c-e718-4d9b-839a-0cd3aaa5fada','Role','attribute.name'),('d053131c-e718-4d9b-839a-0cd3aaa5fada','Basic','attribute.nameformat'),('d053131c-e718-4d9b-839a-0cd3aaa5fada','false','single'),('d4c215d4-fb30-40b7-8a43-e6ed637a4a66','true','access.token.claim'),('d4c215d4-fb30-40b7-8a43-e6ed637a4a66','locale','claim.name'),('d4c215d4-fb30-40b7-8a43-e6ed637a4a66','true','id.token.claim'),('d4c215d4-fb30-40b7-8a43-e6ed637a4a66','String','jsonType.label'),('d4c215d4-fb30-40b7-8a43-e6ed637a4a66','locale','user.attribute'),('d4c215d4-fb30-40b7-8a43-e6ed637a4a66','true','userinfo.token.claim'),('e3fb9795-d478-4f84-b8fa-2d61707e43d8','true','access.token.claim'),('e3fb9795-d478-4f84-b8fa-2d61707e43d8','phone_number_verified','claim.name'),('e3fb9795-d478-4f84-b8fa-2d61707e43d8','true','id.token.claim'),('e3fb9795-d478-4f84-b8fa-2d61707e43d8','boolean','jsonType.label'),('e3fb9795-d478-4f84-b8fa-2d61707e43d8','phoneNumberVerified','user.attribute'),('e3fb9795-d478-4f84-b8fa-2d61707e43d8','true','userinfo.token.claim'),('e49c2dd5-a2aa-4a88-85c6-e24d0f7f5a4d','true','access.token.claim'),('e49c2dd5-a2aa-4a88-85c6-e24d0f7f5a4d','zoneinfo','claim.name'),('e49c2dd5-a2aa-4a88-85c6-e24d0f7f5a4d','true','id.token.claim'),('e49c2dd5-a2aa-4a88-85c6-e24d0f7f5a4d','String','jsonType.label'),('e49c2dd5-a2aa-4a88-85c6-e24d0f7f5a4d','zoneinfo','user.attribute'),('e49c2dd5-a2aa-4a88-85c6-e24d0f7f5a4d','true','userinfo.token.claim'),('e5909f7e-3ca9-41e6-9943-23d7796cb527','true','access.token.claim'),('e5909f7e-3ca9-41e6-9943-23d7796cb527','preferred_username','claim.name'),('e5909f7e-3ca9-41e6-9943-23d7796cb527','true','id.token.claim'),('e5909f7e-3ca9-41e6-9943-23d7796cb527','String','jsonType.label'),('e5909f7e-3ca9-41e6-9943-23d7796cb527','username','user.attribute'),('e5909f7e-3ca9-41e6-9943-23d7796cb527','true','userinfo.token.claim'),('eee46895-567e-4d82-8c70-a6854881903e','true','access.token.claim'),('eee46895-567e-4d82-8c70-a6854881903e','picture','claim.name'),('eee46895-567e-4d82-8c70-a6854881903e','true','id.token.claim'),('eee46895-567e-4d82-8c70-a6854881903e','String','jsonType.label'),('eee46895-567e-4d82-8c70-a6854881903e','picture','user.attribute'),('eee46895-567e-4d82-8c70-a6854881903e','true','userinfo.token.claim'),('f284ea7d-bb43-4479-a07a-38df4d5b865c','true','access.token.claim'),('f284ea7d-bb43-4479-a07a-38df4d5b865c','updated_at','claim.name'),('f284ea7d-bb43-4479-a07a-38df4d5b865c','true','id.token.claim'),('f284ea7d-bb43-4479-a07a-38df4d5b865c','String','jsonType.label'),('f284ea7d-bb43-4479-a07a-38df4d5b865c','updatedAt','user.attribute'),('f284ea7d-bb43-4479-a07a-38df4d5b865c','true','userinfo.token.claim'),('fa4d88bf-18fc-45b8-9fff-1e78d5a1a768','true','access.token.claim'),('fa4d88bf-18fc-45b8-9fff-1e78d5a1a768','nickname','claim.name'),('fa4d88bf-18fc-45b8-9fff-1e78d5a1a768','true','id.token.claim'),('fa4d88bf-18fc-45b8-9fff-1e78d5a1a768','String','jsonType.label'),('fa4d88bf-18fc-45b8-9fff-1e78d5a1a768','nickname','user.attribute'),('fa4d88bf-18fc-45b8-9fff-1e78d5a1a768','true','userinfo.token.claim'),('fda781be-c4a3-43b4-a49a-b1618de8f873','true','access.token.claim'),('fda781be-c4a3-43b4-a49a-b1618de8f873','nickname','claim.name'),('fda781be-c4a3-43b4-a49a-b1618de8f873','true','id.token.claim'),('fda781be-c4a3-43b4-a49a-b1618de8f873','String','jsonType.label'),('fda781be-c4a3-43b4-a49a-b1618de8f873','nickname','user.attribute'),('fda781be-c4a3-43b4-a49a-b1618de8f873','true','userinfo.token.claim'),('fdc4f92b-2ebe-411b-ab1b-d45a6f2f8392','true','access.token.claim'),('fdc4f92b-2ebe-411b-ab1b-d45a6f2f8392','zoneinfo','claim.name'),('fdc4f92b-2ebe-411b-ab1b-d45a6f2f8392','true','id.token.claim'),('fdc4f92b-2ebe-411b-ab1b-d45a6f2f8392','String','jsonType.label'),('fdc4f92b-2ebe-411b-ab1b-d45a6f2f8392','zoneinfo','user.attribute'),('fdc4f92b-2ebe-411b-ab1b-d45a6f2f8392','true','userinfo.token.claim'),('fedb14ef-5cd2-4806-87bd-8c7a500c8fca','true','access.token.claim'),('fedb14ef-5cd2-4806-87bd-8c7a500c8fca','clientHost','claim.name'),('fedb14ef-5cd2-4806-87bd-8c7a500c8fca','true','id.token.claim'),('fedb14ef-5cd2-4806-87bd-8c7a500c8fca','String','jsonType.label'),('fedb14ef-5cd2-4806-87bd-8c7a500c8fca','clientHost','user.session.note');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  `DEFAULT_ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('E-Shop',60,300,300,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'E-Shop',1705092491,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',311040000,311040000,_binary '\0',_binary '\0','30e611f0-0fea-40b3-816a-0989f9b30e0e',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','8494a0f1-0a66-42b8-b4c2-93a6a7e6f77c','055129f4-38cb-43b1-bb40-d11245206240','10336480-7665-4dcd-9a9c-29b20578150c','6999727d-3f7c-4f45-b7c4-1dbaaf426c0c','db270677-e384-4a04-b7b2-f12149e34065',2592000,_binary '\0',311040000,_binary '',_binary '\0','49dfe5a3-01af-493b-b3d0-e05c501f5c93',0,_binary '\0',0,0,'1c514537-1850-4efb-9479-50afac363767'),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','0aa7022b-4395-459d-9e6d-df7a41accaa4',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','567773b7-676f-493c-ad64-bf99bcb88f9d','3fa60aa7-103e-4490-bc06-a80e0d20d207','e740d4b7-0ea2-4915-a752-790ed80276c4','d71d8fe9-82bf-41ff-bcd7-90106cefefeb','139aa4e0-b91c-4db1-8df8-c07c3ea5ed16',2592000,_binary '\0',900,_binary '',_binary '\0','06ac6c6a-a0da-45da-8d61-85a1bfe1e420',0,_binary '\0',0,0,'d45dd1d9-c432-4786-8839-36e967190fd4');
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','E-Shop','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicy','master','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';'),('_browser_header.contentSecurityPolicyReportOnly','E-Shop',''),('_browser_header.contentSecurityPolicyReportOnly','master',''),('_browser_header.strictTransportSecurity','E-Shop','max-age=31536000; includeSubDomains'),('_browser_header.strictTransportSecurity','master','max-age=31536000; includeSubDomains'),('_browser_header.xContentTypeOptions','E-Shop','nosniff'),('_browser_header.xContentTypeOptions','master','nosniff'),('_browser_header.xFrameOptions','E-Shop','SAMEORIGIN'),('_browser_header.xFrameOptions','master','SAMEORIGIN'),('_browser_header.xRobotsTag','E-Shop','none'),('_browser_header.xRobotsTag','master','none'),('_browser_header.xXSSProtection','E-Shop','1; mode=block'),('_browser_header.xXSSProtection','master','1; mode=block'),('actionTokenGeneratedByAdminLifespan','E-Shop','43200'),('actionTokenGeneratedByUserLifespan','E-Shop','300'),('bruteForceProtected','E-Shop','false'),('bruteForceProtected','master','false'),('cibaAuthRequestedUserHint','E-Shop','login_hint'),('cibaBackchannelTokenDeliveryMode','E-Shop','poll'),('cibaExpiresIn','E-Shop','120'),('cibaInterval','E-Shop','5'),('client-policies.policies','E-Shop','{\"policies\":[]}'),('client-policies.profiles','E-Shop','{\"profiles\":[]}'),('clientOfflineSessionIdleTimeout','E-Shop','0'),('clientOfflineSessionMaxLifespan','E-Shop','0'),('clientSessionIdleTimeout','E-Shop','0'),('clientSessionMaxLifespan','E-Shop','0'),('defaultSignatureAlgorithm','E-Shop','RS256'),('defaultSignatureAlgorithm','master','RS256'),('displayName','master','Keycloak'),('displayNameHtml','master','<div class=\"kc-logo-text\"><span>Keycloak</span></div>'),('failureFactor','E-Shop','30'),('failureFactor','master','30'),('maxDeltaTimeSeconds','E-Shop','43200'),('maxDeltaTimeSeconds','master','43200'),('maxFailureWaitSeconds','E-Shop','900'),('maxFailureWaitSeconds','master','900'),('minimumQuickLoginWaitSeconds','E-Shop','60'),('minimumQuickLoginWaitSeconds','master','60'),('oauth2DeviceCodeLifespan','E-Shop','600'),('oauth2DevicePollingInterval','E-Shop','5'),('offlineSessionMaxLifespan','E-Shop','5184000'),('offlineSessionMaxLifespan','master','5184000'),('offlineSessionMaxLifespanEnabled','E-Shop','false'),('offlineSessionMaxLifespanEnabled','master','false'),('parRequestUriLifespan','E-Shop','60'),('permanentLockout','E-Shop','false'),('permanentLockout','master','false'),('quickLoginCheckMilliSeconds','E-Shop','1000'),('quickLoginCheckMilliSeconds','master','1000'),('waitIncrementSeconds','E-Shop','60'),('waitIncrementSeconds','master','60'),('webAuthnPolicyAttestationConveyancePreference','E-Shop','not specified'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','E-Shop','not specified'),('webAuthnPolicyAuthenticatorAttachment','E-Shop','not specified'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','E-Shop','not specified'),('webAuthnPolicyAvoidSameAuthenticatorRegister','E-Shop','false'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','E-Shop','false'),('webAuthnPolicyCreateTimeout','E-Shop','0'),('webAuthnPolicyCreateTimeoutPasswordless','E-Shop','0'),('webAuthnPolicyRequireResidentKey','E-Shop','not specified'),('webAuthnPolicyRequireResidentKeyPasswordless','E-Shop','not specified'),('webAuthnPolicyRpEntityName','E-Shop','keycloak'),('webAuthnPolicyRpEntityNamePasswordless','E-Shop','keycloak'),('webAuthnPolicyRpId','E-Shop',''),('webAuthnPolicyRpIdPasswordless','E-Shop',''),('webAuthnPolicySignatureAlgorithms','E-Shop','ES256'),('webAuthnPolicySignatureAlgorithmsPasswordless','E-Shop','ES256'),('webAuthnPolicyUserVerificationRequirement','E-Shop','not specified'),('webAuthnPolicyUserVerificationRequirementPasswordless','E-Shop','not specified');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('E-Shop','jboss-logging'),('master','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_LOCALIZATIONS`
--

DROP TABLE IF EXISTS `REALM_LOCALIZATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_LOCALIZATIONS` (
  `REALM_ID` varchar(255) NOT NULL,
  `LOCALE` varchar(255) NOT NULL,
  `TEXTS` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`LOCALE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_LOCALIZATIONS`
--

LOCK TABLES `REALM_LOCALIZATIONS` WRITE;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_LOCALIZATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','E-Shop'),('password','password',_binary '',_binary '','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('0014a2dd-faaa-4d6f-a780-65f741c420a1','/realms/master/account/*'),('06ada848-0832-48aa-85c1-4edcd32466ef','/realms/E-Shop/account/*'),('51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf','/admin/E-Shop/console/*'),('a7294a4e-28b6-4cdb-86d4-42af42972ce8','/realms/master/account/*'),('b40ebd44-a01e-4903-bd15-3895c66866da','http://localhost:3000/*'),('ce7dc481-b365-47f8-919d-3676a3a64308','/realms/E-Shop/account/*'),('efd1931c-a641-4f68-9a76-a847fad0b51c','/admin/master/console/*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('18125e64-0250-40a8-9558-2c92b1cb4d7d','UPDATE_PASSWORD','Update Password','E-Shop',_binary '',_binary '\0','UPDATE_PASSWORD',30),('2e107140-db2c-4498-9fd5-5d18ad41032c','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('3595df0a-08c7-48f7-8e16-7680cdb05208','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('44b803e7-b5e8-46c2-93fd-0270feeb17f4','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('493deca7-379f-45d2-bd36-37b40ae5a12e','UPDATE_PROFILE','Update Profile','E-Shop',_binary '',_binary '\0','UPDATE_PROFILE',40),('708d9d5f-14fe-4fb9-a7c4-ddc94f36d7c0','update_user_locale','Update User Locale','E-Shop',_binary '',_binary '\0','update_user_locale',1000),('71adaa83-4cfd-4601-a020-a7e9a68dfd4a','delete_account','Delete Account','master',_binary '\0',_binary '\0','delete_account',60),('72c88912-054c-4d13-9ec3-e4d0ad58901e','terms_and_conditions','Terms and Conditions','E-Shop',_binary '\0',_binary '\0','terms_and_conditions',20),('8e20f64d-ca46-4097-a363-567fde191b9c','VERIFY_EMAIL','Verify Email','E-Shop',_binary '',_binary '\0','VERIFY_EMAIL',50),('9218fc3b-3dc4-428b-89c8-1fc88979f190','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('a75f0d28-d049-4691-aff7-2f6be27cce11','delete_account','Delete Account','E-Shop',_binary '\0',_binary '\0','delete_account',60),('caff6fed-bf82-4ee4-ba6c-2e03798d1436','CONFIGURE_TOTP','Configure OTP','E-Shop',_binary '',_binary '\0','CONFIGURE_TOTP',10),('dc971aed-78b4-4a1b-bc9a-52f4b69349fe','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('e3b63f77-2e48-4efe-b105-84f15d5f6058','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `REQUESTER` varchar(255) DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('ce7dc481-b365-47f8-919d-3676a3a64308','2d68015e-16e3-4900-bf50-e47375bff0e7'),('0014a2dd-faaa-4d6f-a780-65f741c420a1','643b3e09-9dde-4219-9a14-88fec4819378');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  KEY `IDX_USER_ATTRIBUTE_NAME` (`NAME`,`VALUE`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES ('client_id','frontend-app','8a226a2d-fa2f-4311-b6df-96f3a57d30ea','01b70e94-c6a4-4ea8-b260-5f6ef5c8e3ee'),('client_id','frontend-app','7de3ba4c-f40c-481f-9623-cf4b684ff6c0','3f3eb33e-3a68-42ab-9969-5f1bed21eb40'),('client_id','frontend-app','c7a6b214-7c2c-49b0-a8a7-af9b4bcae909','46bf9475-07ed-4628-8a71-9953b6a18b7f'),('client_id','frontend-app','dc017b31-692b-4a6a-b4d4-32dbf99629f2','4b9be340-db56-410f-bd37-1505d80961b4'),('client_id','frontend-app','018ac841-e62e-447a-b1ab-f4d2a0e4f0ad','53e720dc-f02a-490b-9389-c380d5155e33'),('client_id','frontend-app','f8e50905-2934-49c0-b0f8-84e586bb4fd1','b448afee-6531-4f58-ba3a-67c1e75fe73d');
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('018ac841-e62e-447a-b1ab-f4d2a0e4f0ad','socsig2210@gmail.com','socsig2210@gmail.com',_binary '\0',_binary '',NULL,NULL,NULL,'E-Shop','socsig',1703009592969,NULL,0),('6cb28819-d8f5-45fb-bb8a-a99aa169365f',NULL,'84fd9ac3-c06d-4fa4-a20c-a95498571713',_binary '\0',_binary '',NULL,NULL,NULL,'master','admin',1702769815971,NULL,0),('7de3ba4c-f40c-481f-9623-cf4b684ff6c0','fdsaf@gmaill.cmo','fdsaf@gmaill.cmo',_binary '\0',_binary '',NULL,NULL,NULL,'E-Shop','asdfadf',1703773666870,NULL,0),('8a226a2d-fa2f-4311-b6df-96f3a57d30ea','papou@gmail.com','papou@gmail.com',_binary '\0',_binary '',NULL,NULL,NULL,'E-Shop','papou2',1703866945952,NULL,0),('bd86ac50-b447-4ccd-8512-7f3348e66edb',NULL,'3904f514-e749-402e-9f69-8465b013dada',_binary '\0',_binary '',NULL,NULL,NULL,'master','service-account-admin-cli',1702773889933,'a5b2fcca-88c0-4087-840d-e5525002cf4d',0),('c7a6b214-7c2c-49b0-a8a7-af9b4bcae909','asdjflk@gmail.com','asdjflk@gmail.com',_binary '\0',_binary '',NULL,NULL,NULL,'E-Shop','sfaljksd',1703773209034,NULL,0),('dc017b31-692b-4a6a-b4d4-32dbf99629f2','papou@gmai.com','papou@gmai.com',_binary '\0',_binary '',NULL,NULL,NULL,'E-Shop','papou',1703773637863,NULL,0),('f8e50905-2934-49c0-b0f8-84e586bb4fd1','testing@gmail.com','testing@gmail.com',_binary '\0',_binary '',NULL,NULL,NULL,'E-Shop','testing',1705237163512,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `USER_GROUP_MEMBERSHIP` VALUES ('e6616395-39ef-45f3-a046-dbad58119248','018ac841-e62e-447a-b1ab-f4d2a0e4f0ad'),('34384369-5008-41c3-b9ec-f51a9da55039','7de3ba4c-f40c-481f-9623-cf4b684ff6c0'),('34384369-5008-41c3-b9ec-f51a9da55039','8a226a2d-fa2f-4311-b6df-96f3a57d30ea'),('34384369-5008-41c3-b9ec-f51a9da55039','c7a6b214-7c2c-49b0-a8a7-af9b4bcae909'),('34384369-5008-41c3-b9ec-f51a9da55039','dc017b31-692b-4a6a-b4d4-32dbf99629f2'),('34384369-5008-41c3-b9ec-f51a9da55039','f8e50905-2934-49c0-b0f8-84e586bb4fd1');
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('1c514537-1850-4efb-9479-50afac363767','018ac841-e62e-447a-b1ab-f4d2a0e4f0ad'),('03b941f7-64f1-4db7-a458-8f5b5f4ffdf5','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('11660410-cb3a-4c44-b1ee-934f0c14703b','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('303901ec-5d82-4037-962c-e25b30c61875','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('41e8347f-9a2d-445c-bdae-b1201216cb8d','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('62fbbea2-1066-4b72-8841-7c380fe92a43','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('68aa9658-c01f-4356-a39a-9073249e9d51','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('7ec0dfc8-60ce-4ff3-9cad-f85c6813d65b','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('7efb3134-9d03-449f-9261-a2af2bf8efd2','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('81589699-9cea-408c-bbe2-c7558bbc4cec','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('9ffbcbc6-36fa-4dc2-9afb-af0e9b3a08dd','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('a9979796-a2cb-4e88-a841-fc11529f087e','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('b8a6858a-d986-4b52-acd8-76defa4e6c9a','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('c9def70a-ed6d-4b2b-8498-d24424b938e9','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('d36ebb37-7fde-4256-99a6-5048a64fe143','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('d45dd1d9-c432-4786-8839-36e967190fd4','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('e3d82f24-a13c-4abe-8b00-4836b84632ba','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('f6d4d4a7-6f2f-40bf-9015-5f7e3f1deab2','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('fbf181fa-b207-4b5d-8705-ad7a17133656','6cb28819-d8f5-45fb-bb8a-a99aa169365f'),('1c514537-1850-4efb-9479-50afac363767','7de3ba4c-f40c-481f-9623-cf4b684ff6c0'),('1c514537-1850-4efb-9479-50afac363767','8a226a2d-fa2f-4311-b6df-96f3a57d30ea'),('90f79802-be7a-4ff6-9227-14f612c0bf8b','bd86ac50-b447-4ccd-8512-7f3348e66edb'),('d45dd1d9-c432-4786-8839-36e967190fd4','bd86ac50-b447-4ccd-8512-7f3348e66edb'),('1c514537-1850-4efb-9479-50afac363767','c7a6b214-7c2c-49b0-a8a7-af9b4bcae909'),('1c514537-1850-4efb-9479-50afac363767','dc017b31-692b-4a6a-b4d4-32dbf99629f2'),('1c514537-1850-4efb-9479-50afac363767','f8e50905-2934-49c0-b0f8-84e586bb4fd1');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` text,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('51959d45-1d63-4aa8-9e17-7fe6bd2e7fcf','+'),('a5b2fcca-88c0-4087-840d-e5525002cf4d','*'),('b40ebd44-a01e-4903-bd15-3895c66866da','*'),('b40ebd44-a01e-4903-bd15-3895c66866da','http://localhost:3000'),('b40ebd44-a01e-4903-bd15-3895c66866da','http://localhost:5000'),('b40ebd44-a01e-4903-bd15-3895c66866da','http://localhost:5001'),('efd1931c-a641-4f68-9a76-a847fad0b51c','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-14 15:44:26

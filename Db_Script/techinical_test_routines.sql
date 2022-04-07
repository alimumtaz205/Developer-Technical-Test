-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: techinical_test
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping events for database 'techinical_test'
--

--
-- Dumping routines for database 'techinical_test'
--
/*!50003 DROP PROCEDURE IF EXISTS `PCR_USER_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PCR_USER_DELETE`(
						
                        IN 	P_EMAIL varchar(100),
						OUT PCODE varchar(200),
                        OUT PDESC varchar(1000),
						OUT PMSG  varchar(20)                                                  
)
BEGIN
	
	Declare v_user_exist int;
	SET PCODE = '00';
	SET PDESC = 'Failure';
	SET PMSG = 'N';

	SELECT COUNT(*) into v_user_exist from users where Email=P_EMAIL;
    
    If v_user_exist > 0 then

	Delete from users where Email=P_EMAIL;
						
	commit;
	SET PCODE = '00';
	SET PDESC = 'Deleted Successfully';
	SET PMSG = 'Y';
    
	SET PCODE = '00';
	SET PDESC = 'Success';
	SET PMSG = 'Y';
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PCR_USER_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PCR_USER_GET`(
						
						OUT PCODE varchar(200),
                        OUT PDESC varchar(1000),
						OUT PMSG  varchar(20)                                                  
)
BEGIN
	
	SET PCODE = '00';
	SET PDESC = 'Failure';
	SET PMSG = 'N';

	Select * from users;
						
	SET PCODE = '00';
	SET PDESC = 'Success';
	SET PMSG = 'Y';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PCR_USER_REGISTRATION` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PCR_USER_REGISTRATION`(
						IN P_FULLNAME varchar(100),
						IN P_MIDDLENAME varchar(1000),
						IN P_BIRTHDAY varchar(100),
						IN P_EMAIL varchar(200),
                        IN P_PHONE varchar(200),
                        IN P_ADDRESS1 varchar(200),
                        IN P_ADDRESS2 varchar(200),
                        IN P_NATIONALITY varchar(200),
                        IN P_OTHER_NATIONALITY varchar(200),
                        IN P_ID_IMAGE varchar(200),
                        IN P_UPPROFILE varchar(200),
                        IN P_UPSELFIE varchar(200),
                        IN P_UPUTILITYBILL varchar(200),
                        IN P_SOCIALMEDIA varchar(200),
						OUT PCODE varchar(20),
                        OUT PDESC varchar(1000),
						OUT PMSG  varchar(20)                                                  
)
BEGIN
	SET PCODE = '00';
	SET PDESC = 'Failure';
	SET PMSG = 'N';

	INSERT INTO users (
								Full_Name,
                                Middle_Name,
								Birthday,
								Email,
								Phone,
                                Address1,
                                Address2,
                                Nationality,
                                Other_Nationality,
                                Passport_ID_Image,
                                upload_Profile,
                                upload_Selfie,
                                last_UtilityBill,
                                Social_Media
								)
							VALUES 
									(
									 P_FULLNAME,
									 P_MIDDLENAME,
									 P_BIRTHDAY,
									 P_EMAIL,
									 P_PHONE,
									 P_ADDRESS1,
									 P_ADDRESS2,
									 P_NATIONALITY,
									 P_OTHER_NATIONALITY,
									 P_ID_IMAGE,
									 P_UPPROFILE,
									 P_UPSELFIE,
									 P_UPUTILITYBILL,
									 P_SOCIALMEDIA);					
	commit;
	SET PCODE = '00';
	SET PDESC = 'Added Successfully';
	SET PMSG = 'Y';

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `PCR_USER_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `PCR_USER_UPDATE`(
						IN P_FULLNAME varchar(100),
						IN P_MIDDLENAME varchar(1000),
						IN P_BIRTHDAY varchar(100),
						IN P_EMAIL varchar(200),
                        IN P_PHONE varchar(200),
                        IN P_ADDRESS1 varchar(200),
                        IN P_ADDRESS2 varchar(200),
                        IN P_NATIONALITY varchar(200),
                        IN P_OTHER_NATIONALITY varchar(200),
                        IN P_ID_IMAGE varchar(200),
                        IN P_UPPROFILE varchar(200),
                        IN P_UPSELFIE varchar(200),
                        IN P_UPUTILITYBILL varchar(200),
                        IN P_SOCIALMEDIA varchar(200),
						OUT PCODE varchar(20),
                        OUT PDESC varchar(1000),
						OUT PMSG  varchar(20)                                                  
)
BEGIN
	Declare v_user_exist int;
	SET PCODE = '00';
	SET PDESC = 'Failure';
	SET PMSG = 'N';

	SELECT COUNT(*) into v_user_exist from users where Email=P_EMAIL;
    
    If v_user_exist > 0 then

	UPDATE users 
	SET 
								Full_Name= IFNULL(NULLIF(P_FULLNAME, ''), Full_Name),
                                Middle_Name= IFNULL(NULLIF(P_MIDDLENAME, ''), Middle_Name),
								Birthday= IFNULL(NULLIF(P_BIRTHDAY, ''), Birthday),
								Email= IFNULL(NULLIF(P_EMAIL, ''), Email),
								Phone= IFNULL(NULLIF(P_PHONE, ''), Phone),
                                Address1= IFNULL(NULLIF(P_ADDRESS1, ''), Address1),
                                Address2= IFNULL(NULLIF(P_ADDRESS2, ''), Address2),
                                Nationality= IFNULL(NULLIF(P_NATIONALITY, ''), Nationality),
                                Other_Nationality= IFNULL(NULLIF(P_OTHER_NATIONALITY, ''), Other_Nationality),
                                Passport_ID_Image= IFNULL(NULLIF(P_ID_IMAGE, ''), Passport_ID_Image),
                                upload_Profile= IFNULL(NULLIF(P_UPPROFILE, ''), upload_Profile),
                                upload_Selfie= IFNULL(NULLIF(P_UPSELFIE, ''), upload_Selfie),
                                last_UtilityBill= IFNULL(NULLIF(P_UPUTILITYBILL, ''), last_UtilityBill),
                                Social_Media= IFNULL(NULLIF(P_SOCIALMEDIA, ''), Social_Media)

WHERE Email=P_EMAIL;				
	commit;
	SET PCODE = '00';
	SET PDESC = 'Updated Successfully';
	SET PMSG = 'Y';
	
    else SET PCODE = '02';
	SET PDESC = 'Failure';
	SET PMSG = 'N';
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-07 22:46:42

CREATE DATABASE  IF NOT EXISTS `nodedb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `nodedb`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: nodedb
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS people;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE people (
  actorId int NOT NULL AUTO_INCREMENT,
  actorUrl varchar(255) DEFAULT NULL,
  actorName varchar(255) DEFAULT NULL,
  nickname varchar(255) DEFAULT NULL,
  PRIMARY KEY (actorId)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

INSERT INTO people VALUES (1,'joaquin.jpeg','Joaquin Phoenix','aka joker'),(2,'johnny.jpeg','Johnny Depp','aka pirate'),(3,'tom.jpeg','Tom Hanks','aka forrest'),(4,'audrey.jpeg','Audrey Tautou','aka Amelie'),(5,'sacha.jpeg','Sacha Baron Cohen','aka Dictator'),(6,'brad.jpeg','Brad Garrett','aka Everybody Loves Raymond'),(7,'jean.jpeg','Jean Reno','aka Leon'),(8,'daveigh.jpeg','Daveigh Chase','aka Ring'),(9,'miyazaki.jpeg','Hayao Miyazaki','aka Manga'),(10,'emile.jpeg','Emile Hirsch','aka Alpha Dog'),(11,'emma.jpg','Emma Stone','aka Cruella'),(12,'paco.jpeg','Paco Leon','aka Francisco León Barrios');

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS products;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE products (
  id int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(45) DEFAULT NULL,
  rate decimal(10,1) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL,
  imageUrl varchar(255) DEFAULT NULL,
  `year` int DEFAULT NULL,
  videoUrl varchar(255) DEFAULT NULL,
  actor varchar(255) DEFAULT NULL,
  `time` time DEFAULT NULL,
  likes int DEFAULT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY id_UNIQUE (id)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

INSERT INTO products VALUES (1,'Joker','Crime',8.4,'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.','joker.jpg',2019,'joker2.mp4','Joaquin Phoenix,Robert De Niro','02:10:00',7),(2,'Edward Scissorhands','Drama',7.9,'The solitary life of an artificial man - who was incompletely constructed and has scissors for hands - is upended when he is taken in by a suburban family.','makas.jpg',1990,'edward2.mp4','Johnny Depp','02:00:00',4),(3,'The Green Mile','Drama',8.6,'A tale set on death row, where gentle giant John Coffey possesses the mysterious power to heal people\'s ailments. When the lead guard, Paul Edgecombe, recognizes John\'s gift, he tries to help stave off the condemned man\'s execution.','mile.jpg',1999,'mile2.mp4','Tom Hanks','01:10:00',5),(4,'Amelie','Comedy',8.3,'Despite being caught in her imaginative world, Amelie, a young waitress, decides to help people find happiness. Her quest to spread joy leads her on a journey where she finds true love.','amelie.jpg',2001,'amelie2.mp4','Audrey Tautou','01:40:00',2),(5,'The Dictator','Comedy',6.5,'The heroic story of a dictator who risked his life to ensure that democracy would never come to the country he so lovingly oppressed.','diktatör.jpg',2012,'dictator2.mp4','Sacha Baron Cohen','01:30:00',6),(6,'Ratatouille','Animation',8.1,'A rat who can cook makes an unusual alliance with a young kitchen worker at a famous Paris restaurant.','fare.jpg',2007,'fare2.mp4','Brad Garrett','01:10:00',3),(7,'Leon','Action',8.5,'12-year-old Mathilda is reluctantly taken in by Léon, a professional assassin, after her family is murdered. An unusual relationship forms as she becomes his protégée and learns the assassin\'s trade.','leon.jpg',1994,'leon2.mp4','Jean Reno','01:50:00',4),(8,'Spirited Away','Animation',8.6,'During her family\'s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches and spirits, and where humans are changed into beasts.','ruh.jpg',2001,'ruh2.mp4','Daveigh Chase','01:10:00',5),(9,'My Neighbor Totoro','Animation',8.1,'When two girls move to the country to be near their ailing mother, they have adventures with the wondrous forest spirits who live nearby.','totoro.jpg',1988,'totoro2.mp4','Hayao Miyazaki','01:30:00',3),(10,'Into The Wild','Adventure',8.1,'After graduating from Emory University, top student and athlete Christopher McCandless abandons his possessions, gives his entire $24,000 savings account to charity and hitchhikes to Alaska to live in the wilderness. Along the way, Christopher encounters a series of characters that shape his life.','wild.jpg',2007,'wild2.mp4','Emile Hirsch','01:30:00',7),(12,'Thanksgiving','Horror',6.3,'After a Black Friday riot ends in tragedy, a mysterious Thanksgiving-inspired killer terrorizes Plymouth, Massachusetts - the birthplace of the infamous holiday.','thanksgiving.jpeg',2023,'thanksgiving2.mp4','Patrick Dempsey','02:10:00',2),(13,'Cars','Animation',7.2,'On the way to the biggest race of his life, a hotshot rookie race car gets stranded in a rundown town and learns that winning isn\'t everything in life','cars.jpg',2006,'cars2.mp4','Owen Wilson,Bonnie Hunt','01:30:00',4),(14,'Dabbe','Horror',4.3,'A cruel suicide wave spreads from the United States to a small Turkish town, where a man kills himself after spending time on the computer','dabbe.jpg',2006,'dabbe2.mp4','Ümit Acar,Ebru Aykaç','01:50:00',1),(15,'Before Sunrise','Romantic',8.1,'A young man and woman meet on a train in Europe, and wind up spending one evening together in Vienna. Unfortunately, both know that this will probably be their only night together.','sunrise.jpg',1995,'sunrise2.mp4','Ethan Hawke,Julie Delpy','01:41:00',6),(16,'Avengers:End Game','Action',8.4,'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos\' actions and restore balance to the universe.','endgame.jpg',2019,'endgame2.mp4','Chris Evans,Robert Downey Jr.','03:01:00',7),(17,'Celal and  Ceren','Comedy',3.2,'Celal, who dreams of achieving happiness as a womanizer, soon gets into difficulties and suffers misfortune. Back when Celal was in a relationship, he was jealous of the life of a bachelor.','celalceren.jpg',2013,'celalceren2.mp4','Şahan Gökbakar,Ezgi Mola','01:54:00',5),(18,'The Magician','Comedy',7.4,'Failed magician Iskender decides to do a tour to save his career, but has to bring his grumpy and senile father along.','hokkabaz.jpg',2006,'hokkabaz2.mp4','Cem Yılmaz,Mazhar Alanson','02:02:00',7),(19,'Memento','Mystery',8.4,'A man with short-term memory loss attempts to track down his wife\'s murderer.','memento.jpg',2000,'memento2.mp4','Guy Pearce,Carrie-Anne Moss','01:54:00',8),(20,'La La Land','Comedy',8.0,'While navigating their careers in Los Angeles, a pianist and an actress fall in love while attempting to reconcile their aspirations for the future.','land.jpg',2016,'land2.mp4','Ryan Gosling,Emma Stone','02:08:00',9),(21,'Love Likes Coincidences','Romantic',7.2,'Year 1977, a September morning in Ankara... Yilmaz tries to rush his pregnant wife Neriman to the hospital and he crushes into Omer\'s car. This accident causes Omer\'s pregnant wife Inci, who was in the back seat, to have a pre-term labor. The babies are born on the same day. They see each other for the first time.','aşk.jpg',2011,'aşk2.mp4','Mehmet Günsur,Belçim Bilgin','01:58:00',6);

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS register;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE register (
  regId int NOT NULL AUTO_INCREMENT,
  regName varchar(255) DEFAULT NULL,
  regSurname varchar(255) DEFAULT NULL,
  regEmail varchar(255) NOT NULL,
  regPassword varchar(255) DEFAULT NULL,
  regCountry varchar(255) DEFAULT NULL,
  regCity varchar(255) DEFAULT NULL,
  PRIMARY KEY (regId,regEmail),
  UNIQUE KEY regEmail_UNIQUE (regEmail)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

INSERT INTO register VALUES (1,'Bilge','Şenavcu','bilgesenavcuuu@gmail.com','blgeeeee1!','Turkey','Izmir'),(3,'Kemal','Yıldız','kemal@gmail.com','kemallll2!','Turkey','Izmir'),(4,'Bilge','Şenavcu','20070001030@stu.yasar.edu.tr','senavcu3!','UK','Istanbul'),(5,'Ömer','Bulut','2007001030@stu.yasar.edu.tr','omerrrrrrr1!','UK','Istanbul'),(6,'senem','sena','senem@gmail.com','senemsena2!','Turkey','Istanbul'),(7,'sema','nur','semanur@gmail.com','semanurr7!','Turkey','Eskisehir'),(8,'ilayda','gürbüzerol','ilayda@gmail.com','ilaydaaaaaa1!','Turkey','Eskisehir'),(9,'vildan','bahar','bahar@gmail.com','baharvildan3!','Turkey','Ankara'),(10,'anıl','akdağ','anlakdag@gmail.com','anlakdag1!','Turkey','Izmir'),(11,'gülce','görüşük','gulce@gmail.com','gulceeeeee1!','Turkey','Eskisehir'),(12,'gamze','eren','gamze@gmail.com','gamzeeren1!','Turkey','Istanbul'),(14,'şener','kaya','kaya@gmail.com','senerkaya1!','Turkey','Ankara'),(15,'irem','özdemir','remmm@gmail.com','remmmmm1!','Turkey','Izmir'),(16,'Semiha','Yazgın','semha@gmail.com','semhayaz2!','USA','Istanbul');

--
-- Dumping routines for database 'nodedb'
--

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-10 18:21:34

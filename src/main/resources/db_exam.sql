/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.1.49-community : Database - db_exam
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_exam` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_exam`;

/*Table structure for table `t_exam` */

DROP TABLE IF EXISTS `t_exam`;

CREATE TABLE `t_exam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `examDate` datetime DEFAULT NULL,
  `score` int(11) NOT NULL,
  `paperId` int(11) DEFAULT NULL,
  `studentId` varchar(40) DEFAULT NULL,
  `moreScore` int(11) NOT NULL,
  `singleScore` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_l14kkd2w86mpy8v2snw37hskx` (`paperId`),
  KEY `FK_sl2v4qucyp0qe9yvnk6icka10` (`studentId`),
  CONSTRAINT `FK_l14kkd2w86mpy8v2snw37hskx` FOREIGN KEY (`paperId`) REFERENCES `t_paper` (`id`),
  CONSTRAINT `FK_sl2v4qucyp0qe9yvnk6icka10` FOREIGN KEY (`studentId`) REFERENCES `t_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `t_exam` */

insert  into `t_exam`(`id`,`examDate`,`score`,`paperId`,`studentId`,`moreScore`,`singleScore`) values (1,NULL,20,1,'JS123',0,0),(2,NULL,120,1,'JS123',0,0),(3,'2014-06-25 17:59:54',0,1,'JS123',0,0),(4,'2014-06-25 18:10:33',0,1,'JS123',0,0),(5,'2014-06-25 18:10:58',50,1,'JS123',30,20),(6,'2014-06-25 18:16:21',50,1,'JS123',30,20),(7,'2014-06-25 18:18:56',20,1,'JS123',0,20),(8,'2014-06-25 18:20:18',20,1,'JS123',0,20),(9,'2014-06-25 18:20:32',20,1,'JS123',0,20),(10,'2014-06-25 18:21:30',20,1,'JS123',0,20),(11,'2014-06-25 18:21:40',20,1,'JS123',0,20),(12,'2014-06-25 21:37:07',0,1,'JS124',0,0),(13,'2014-07-10 19:58:28',60,1,'JS123',0,60),(14,'2014-07-18 10:29:58',100,1,'JS123',60,40),(15,'2014-07-19 07:27:45',70,1,'JS123',30,40);

/*Table structure for table `t_manager` */

DROP TABLE IF EXISTS `t_manager`;

CREATE TABLE `t_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_manager` */

insert  into `t_manager`(`id`,`userName`,`password`,`name`) values (1,'java1234','123456','管理员');

/*Table structure for table `t_paper` */

DROP TABLE IF EXISTS `t_paper`;

CREATE TABLE `t_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `joinDate` datetime DEFAULT NULL,
  `paperName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `t_paper` */

insert  into `t_paper`(`id`,`joinDate`,`paperName`) values (1,'2014-01-01 00:00:00','Java试卷一'),(2,'2014-02-01 00:00:00','语文试卷二'),(3,'2014-01-01 00:00:00','数学试卷一'),(5,'2014-07-10 19:45:33','22');

/*Table structure for table `t_question` */

DROP TABLE IF EXISTS `t_question`;

CREATE TABLE `t_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `joinTime` datetime DEFAULT NULL,
  `optionA` varchar(255) DEFAULT NULL,
  `optionB` varchar(255) DEFAULT NULL,
  `optionC` varchar(255) DEFAULT NULL,
  `optionD` varchar(255) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `paperId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ebouwob97chiilpjmc6gtgwkw` (`paperId`),
  CONSTRAINT `FK_ebouwob97chiilpjmc6gtgwkw` FOREIGN KEY (`paperId`) REFERENCES `t_paper` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `t_question` */

insert  into `t_question`(`id`,`answer`,`joinTime`,`optionA`,`optionB`,`optionC`,`optionD`,`subject`,`type`,`paperId`) values (1,'D','2014-01-01 00:00:00','A. a1','B. $1','C. _1','D .11','下列不可作为java语言修饰符的是？','1',1),(2,'A','2014-01-01 00:00:00','A. a1.java','B. a.class','C. a1','D. 都可以','有一段java应用程序，它的主类名是a1，那么保存 它的源文件名可以是？','1',1),(3,'A,B','2014-01-01 00:00:00','A. String []a','B. String a[]','C. char a[][]','D. String a[10]','下面正确声明一个一维数组的是？','2',1),(4,'A,D','2014-01-01 00:00:00','A. 在java中只允许单继承。','B. 在java中一个类只能实现一个接口。','C. 在java中一个类不能同时继承一个类和实现一个接口。','D. java的单一继承使代码更可靠。','下面关于继承的叙述哪些是正确的？','2',1),(5,'C','2014-01-01 00:00:00','A. 一个子类可以有多个父类，一个父类也可以有多个子类','B. 一个子类可以有多个父类，但一个父类只可以有一个子类','C. 一个子类可以有一个父类，但一个父类可以有多个子类','D. 上述说法都不对','在Java中？','1',1),(6,'A,D','2014-01-01 00:00:00','A. 包的声明必须是源文件的第一句代码。','B. 包的声明必须紧跟在import语句的后面。','C. 只有公共类才能放在包中。','D. 可以将多个源文件中的类放在同一个包中。','可以将多个源文件中的类放在同一个包中？','2',1),(7,'C','2014-01-01 00:00:00','A. Java是跨平台的编程语言','B. Java支持分布式计算','C. Java是面向过程的编程语言','D. Java是面向对象的编程语言','下列关于Java语言的特点，描述错误的是？','1',1),(8,'A','2014-07-16 00:00:00','1','2','3','4','21321','1',NULL),(14,'A','2014-07-23 00:00:00','1','21','3','4','q','1',2),(16,'A,B','2014-07-09 00:00:00','1122','2223','3322','4422','测试题目2','2',2),(17,'A,D','2014-07-17 00:00:00','2321','321','321','321','测试题目','2',1),(18,'A,D','2014-07-18 00:00:00','1114','2224','3334','4444','测试题目2233','2',1);

/*Table structure for table `t_student` */

DROP TABLE IF EXISTS `t_student`;

CREATE TABLE `t_student` (
  `id` varchar(40) NOT NULL,
  `cardNo` varchar(50) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `prefession` varchar(40) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_student` */

insert  into `t_student`(`id`,`cardNo`,`name`,`password`,`prefession`,`sex`) values ('JS110',NULL,NULL,NULL,NULL,NULL),('JS123','21321321','张三','1234','计算机','男'),('JS124','221321','李四','1234','网络','女'),('JS125',NULL,NULL,NULL,NULL,NULL),('JS1251',NULL,NULL,NULL,NULL,NULL),('JS1252',NULL,NULL,NULL,NULL,NULL),('JS1253',NULL,NULL,NULL,NULL,NULL),('JS1254',NULL,NULL,NULL,NULL,NULL),('JS1255',NULL,NULL,NULL,NULL,NULL),('JS1256',NULL,NULL,NULL,NULL,NULL),('JS126',NULL,NULL,NULL,NULL,NULL),('JS127',NULL,NULL,NULL,NULL,NULL),('JS20140701094518','21','张三2','21','21','男'),('JS20140701094708','22','11','344','33','男'),('JS20140701094728','223','113','34433','3333','女'),('JS20140704052827','fa','fda2','fda','fda','男'),('JS20140710074259','12321321321','张三','123456','计算机','男');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `test`;

DROP TABLE IF EXISTS `parts`;

CREATE TABLE `parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `isNecessary` tinyint(1) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

INSERT INTO `parts` VALUES (1,'материнская плата',1,3),(2,'звуковая карта',0,2),(3,'процессор',1,5),(4,'подсветка корпуса',0,3),(5,'HDD диск',0,5),(6,'корпус',1,8),(7,'память',1,4),(8,'SSD диск',1,7),(9,'видеокарта',1,8),(10,'CD привод',0,3),(11,'блок питания',1,23),(12,'кулер',1,9),(13,'радиатор',1,14),(14,'картридер',0,3),(15,'ТВ тюнер',0,6),(16,'сетевой адаптер',0,9),(17,'DVD привод',0,0),(18,'Blu-Ray привод',0,1),(19,'спутниковая карта',0,3),(20,'клавиатура',1,11),(21,'мышь',0,14);

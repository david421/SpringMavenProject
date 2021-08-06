DROP SCHEMA IF EXISTS `cfj_users`;

CREATE SCHEMA `cfj_users`;

use `cfj_users`;

SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(80) DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `enabled` tinyint NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `user`
VALUES(5, 'kaka','{noop}test123', 'kaka','shi','kakashi@123.com','ROLE_EMPLOYEE',1),
	  (4, 'john','{noop}test456', 'john','powell','johnp@123.com','ROLE_EMPLOYEE',1),
      (2, 'mary','{noop}test123', 'mary','powell','maryp@123.com','ROLE_MANAGER',1),
      (3, 'susan','{noop}test123', 'susan','powell','susanp@123.com','ROLE_ADMIN',1),
      (6, 'cr7','{noop}test123', 'cr7','ronaldo','ronaldo7@123.com','ROLE_EMPLOYEE',1),
      (1,'zidane','{noop}test123', 'zidane','henry','zidaneh@123.com','ROLE_EMPLOYEE',1);

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `role`
VALUES(1, 'ROLE_EMPLOYEE'),
      (2, 'ROLE_ADMIN'),
      (3, 'ROLE_MANAGER');

DROP TABLE IF EXISTS `users_roles`;

CREATE TABLE `users_roles` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,

  KEY `FK_USER_ID_idx` (`user_id`),

  CONSTRAINT `FK_USER` 
  FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`), 
  
 KEY `FK_ROLE_ID_idx` (`role_id`),

  CONSTRAINT `FK_ROLE` 
  FOREIGN KEY (`role_id`) 
  REFERENCES `role` (`id`) 

  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `users_roles`
VALUES(1, 1),
      (2, 2),
      (3, 3),
      (4, 1),
      (5, 1),
      (6, 1),
	  (2, 1),
      (3, 1);

DROP TABLE IF EXISTS `post`;

CREATE TABLE `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) DEFAULT NULL,
  `content` varchar(32765) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL, 
  PRIMARY KEY (`id`),
  
  UNIQUE KEY `TITLE_UNIQUE` (`title`),
  
  KEY `FK_USER_ID_idx` (`user_id`),

  CONSTRAINT `FK_USER_POST` 
  FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`)
  
  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `review`;

CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` varchar(32765) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),

  KEY `FK_USER_ID_idx` (`user_id`),

  CONSTRAINT `FK_USER_REVIEW` 
  FOREIGN KEY (`user_id`) 
  REFERENCES `user` (`id`), 
  
 KEY `FK_POST_ID_idx` (`post_id`),

  CONSTRAINT `FK_POST` 
  FOREIGN KEY (`post_id`) 
  REFERENCES `post` (`id`) 

  ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;


SET FOREIGN_KEY_CHECKS = 1;

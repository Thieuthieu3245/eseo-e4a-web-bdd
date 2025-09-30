CREATE TABLE `post` (
  `idpost` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `content` text,
  `date_created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idpost`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

CREATE TABLE `comment` (
  `id_comment` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_comment`),
  KEY `fk_post_id` (`post_id`),
  CONSTRAINT `fk_post_id` FOREIGN KEY (`post_id`) REFERENCES `post` (`idpost`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;


INSERT INTO `post` VALUES (1,'Titre','Premier post','2021-08-30 15:50:01'),(2,'Meilleur Titre','Ceci est un texte ! ','2021-08-30 15:50:01');
INSERT INTO `comment` VALUES (2,'Test',1),(3,'Test2',1),(4,'Autre',2);


# Question 1
/*
Il y a 2 tables qui ont été créées
*/

# Question 2
/*
Oui, puisque certaines tables ont des relations avec d'autres tables. Pour créer ces relations, il faut que la table mère existe pour pouvoir créer la table fille
Dans notre exemple, la table comment est une table fille car elle a une relation avec la table post
*/

# Question 3
/*
Il y a 2 lignes dans la table post
Il y a 3 lignes dans la table comment
*/

# Question 4
/*
C'est la clef primaire. Une clef primaire est une colonne qui permet de distinguer les lignes de la table. Elle permet aussi de faire des jointures puisqu'elle est unique
*/

# Question 5
/*
Si on inverse l'ordre des INSERT dans la table, il y aura une erreur car la clef étrangère de la table comment qui relis la clef primaire de la table post n'existe pas encore
*/
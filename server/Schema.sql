CREATE DATABASE chatanalysis;

USE chatanalysis;

CREATE TABLE ORG (
	id int NOT NULL AUTO_INCREMENT primary key,
	name varchar(50) not null,
);

CREATE TABLE BOT (
	id int NOT NULL AUTO_INCREMENT primary key,
	ip varchar(39) not null,
	port int not null,
	org_id int,
	FOREIGN KEY (org_id) REFERENCES org(id)
);

CREATE TABLE USER (
	id int NOT NULL AUTO_INCREMENT primary key,
	username  varchar(30) not null,
	type varchar(30) DEFAULT 'customer',
	org_id int,
	FOREIGN KEY (org_id) REFERENCES org(id)
);

CREATE TABLE MESSAGE(
	id int NOT NULL AUTO_INCREMENT primary key,
	text_msg varchar(255) not null,
	bot_id int,
	org_id int,
	user_id int,
	created_at timestamp DEFAULT CURRENT_TIMESTAMP,
	changed_at timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (bot_id) REFERENCES bot(id)
	FOREIGN KEY (org_id) REFERENCES org(id)
	FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE EMOTIONS (
	id int NOT NULL AUTO_INCREMENT primary key,
	msg_id int not null,
	FOREIGN KEY (msg_id) REFERENCES message(id)
);

CREATE TABLE TAXONOMY (
	id int NOT NULL AUTO_INCREMENT primary key,
	msg_id int not null,
	FOREIGN KEY (msg_id) REFERENCES message(id)
);


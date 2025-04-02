CREATE TABLE mini_chat_table (
	ID int NOT NULL auto_increment,
	Pseudo varchar(255),
	message varchar(255),
	PRIMARY KEY (id)
);

INSERT INTO mini_chat_table (Id, Pseudo, message) VALUES 
(1, 'TRAORE' , 'mimi'),
(2, 'SOKPO', 'Peletia'),
(3, 'DOGBE' , 'jean-claude')
(4, 'ALEDJI', 'Mathias'),
(5, 'THABOBJO', 'jamil');
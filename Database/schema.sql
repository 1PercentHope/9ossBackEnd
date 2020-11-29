DROP DATABASE IF EXISTS koss;

CREATE DATABASE koss;

USE koss;

/* Users table */

CREATE TABLE users(
    id int NOT NULL AUTO_INCREMENT,
    firstName varchar(20) NOT NULL,
    lastName varchar(20) NOT NULL,
    email varchar(50),
    password varchar(220) NOT NULL,
    phoneNumber REAL NOT NULL,
    profileImage varchar(220) NOT NULL,
    PRIMARY KEY (ID)
);
 
/* admins table */

CREATE TABLE admins(
    id int NOT NULL AUTO_INCREMENT,
    firstName varchar(20) NOT NULL,
    lastName varchar(20) NOT NULL,
    email varchar(250),
    password varchar(220) NOT NULL,
    PRIMARY KEY (ID)
);

/* third Parties table */

CREATE TABLE thirdp(
    id int NOT NULL AUTO_INCREMENT,
    identifier varchar(50),
    password varchar(220) NOT NULL,
    PRIMARY KEY (ID)
);

/* events table */

CREATE TABLE events (
    id int NOT NULL AUTO_INCREMENT,
    homeTeam varchar(20) NOT NULL,
    awayTeam varchar(20) NOT NULL,
    place varchar(20) NOT NULL,
    category varchar(20) NOT NULL,
    date varchar(20) NOT NULL,
    description varchar(200) NOT NULL,
    price REAL NOT NULL,
    image varchar(200),
    PRIMARY KEY(ID)
);

/* purchases table */

CREATE TABLE purchases(
    id int NOT NULL AUTO_INCREMENT,
    code varchar(200) NOT NULL,
    date varchar(20) NOT NULL,
    ammount REAL NOT NULL,
    user_id int NOT NULL,
    PRIMARY KEY(ID),
    CONSTRAINT FK_IDuser FOREIGN KEY (user_id) References users(id)
);

/* seats table */

CREATE TABLE seats(
    id int NOT NULL AUTO_INCREMENT,
    Number REAL NOT NULL,
    type varchar(20) NOT NULL,
    availability varchar(20) NOT NULL,
    userid int,
    matchid int,
    PRIMARY KEY(ID),
    CONSTRAINT FK_useriD FOREIGN KEY (userid) References users(id),
    CONSTRAINT FK_event_id FOREIGN KEY (matchid) References events(id)

);

/* tickets table */

-- CREATE TABLE tickets(
--     id int NOT NULL AUTO_INCREMENT,
--     code REAL NOT NULL,
--     event_id int NOT NULL,
--     user_id int NOT NULL,
--     purchase_id int NOT NULL,
--     seat_id int NOT NULL,
--     PRIMARY KEY(ID),
--     CONSTRAINT FK_eventID FOREIGN KEY (event_id) References events(id),
--     CONSTRAINT FK_userID FOREIGN KEY (user_id) References users(id),
--     CONSTRAINT FK_purchaseID FOREIGN KEY (purchase_id) References purchases(id),
--     CONSTRAINT FK_seatID FOREIGN KEY (seat_id) References seats(id)
-- );

/* Refresh Tokens */

CREATE TABLE tokens(
    id int NOT NULL AUTO_INCREMENT,
    token varchar(220) NOT NULL,
    id_user  int NOT NULL,
    PRIMARY KEY(ID),
    CONSTRAINT FK_useID FOREIGN KEY (id_user) References users(id)

);

/* weekly qr Codes */

CREATE TABLE weekCodes(
    id int NOT NULL AUTO_INCREMENT,
    codes varchar(220) NOT NULL,
    PRIMARY KEY(ID)
    
);

CREATE TABLE messages(
    id int NOT NULL AUTO_INCREMENT,
    message varchar(220),
    PRIMARY KEY(ID)
);

CREATE TABLE slogans(
    id int NOT NULL AUTO_INCREMENT,
    picture varchar(200),
    PRIMARY KEY(ID)
);



INSERT INTO users(id,firstName,lastName,email,password,phoneNumber,profileImage) VALUES(1,'Elyes','Ferjani','elyes@rbk.com','$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u','11111','https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/1200px-Unknown_person.jpg');
INSERT INTO users(id,firstName,lastName,email,password,phoneNumber,profileImage) VALUES(2,'Ali','Smaoui','ali@rbk.com','$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u','22222','https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/1200px-Unknown_person.jpg');
INSERT INTO users(id,firstName,lastName,email,password,phoneNumber,profileImage) VALUES(3,'Omar','Chaouachi','omar@rbk.com','$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u','33333','https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/1200px-Unknown_person.jpg');
INSERT INTO users(id,firstName,lastName,email,password,phoneNumber,profileImage) VALUES(4,'Skander','Bromdhan','skander@rbk.com','$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u','44444','https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/1200px-Unknown_person.jpg');
INSERT INTO events(id,homeTeam,awayTeam,place,category,date,description,price,image) VALUES(1,'ca','est','tunis','championship','05/01/2021','League 1',17,'http://res.cloudinary.com/codexmaker/image/upload/v1606472774/testing_angular_cloudinary/tgeryp8qrbblaaxob4r2.png');
INSERT INTO events(id,homeTeam,awayTeam,place,category,date,description,price,image) VALUES(2,'ess','css','sousse','championship','05/01/2020','League 1',20,'http://res.cloudinary.com/codexmaker/image/upload/v1606472802/testing_angular_cloudinary/v9e8uaog727kizf8sqsy.png');
INSERT INTO events(id,homeTeam,awayTeam,place,category,date,description,price,image) VALUES(3,'ust','usm','tataouine','championship','11/01/2020','Cup',19,'http://res.cloudinary.com/codexmaker/image/upload/v1606472822/testing_angular_cloudinary/oxotnto9fzlihn1mf0h4.png');
INSERT INTO events(id,homeTeam,awayTeam,place,category,date,description,price,image) VALUES(4,'sg','usbg','gabes','championship','12/01/2020','Cup',15,'http://res.cloudinary.com/codexmaker/image/upload/v1606472870/testing_angular_cloudinary/vgaarywttfgnbadyavbj.png');
INSERT INTO events(id,homeTeam,awayTeam,place,category,date,description,price,image) VALUES(5,'st','cshl','tunis','championship','15/01/2020','Cup',25,'http://res.cloudinary.com/codexmaker/image/upload/v1606472850/testing_angular_cloudinary/ypdsjqqqrhdt2arfyonb.png');
INSERT INTO thirdp(id,identifier,password) VALUES(1,'00002','$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u');
INSERT INTO weekCodes(id,codes) VALUES(1,'Rbk6');
INSERT INTO admins(id,firstName,lastName,email,password) VALUES(1,'Elyes','Ferjani','elyes@rbk.com','$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u');
INSERT INTO admins(id,firstName,lastName,email,password) VALUES(2,'Omar','Chaouachi','omar@rbk.com','$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u');
INSERT INTO admins(id,firstName,lastName,email,password) VALUES(3,'Ali','Smaoui','ali@rbk.com','$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u');
INSERT INTO admins(id,firstName,lastName,email,password) VALUES(4,'Skander','Bromdhan','skander@rbk.com','$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u');
INSERT INTO messages(id,message) VALUES(1,'Welcome to admins platform');
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(1,101,'pelouse','green',null,1); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(2,102,'gradin','green',null,1); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(3,103,'pelouse','green',NULL,1); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(4,104,'pelouse','green',NULL,1); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(5,105,'pelouse','green',NULL,1); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(6,106,'gradin','green',NULL,1); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(7,107,'pelouse','green',Null,1); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(8,108,'gradin','green',NULL,1); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(9,109,'pelouse','green',NULL,1); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(10,110,'pelouse','green',NULL,1); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(12,107,'gradin','green',NULL,3); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(13,177,'pelouse','green',NULL,3); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(14,92,'gradin','green',NULL,3); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(15,157,'gradin','green',NULL,3); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(16,201,'gradin','green',NULL,3); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(17,202,'pelouse','green',NULL,3); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(18,203,'gradin','green',NULL,3); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(19,204,'pelouse','green',NULL,3); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(20,209,'gradin','green',NULL,3); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(21,75,'pelouse','green',NULL,3); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(22,107,'gradin','green',NULL,4); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(23,177,'pelouse','green',NULL,4); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(24,92,'gradin','green',NULL,4); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(25,157,'gradin','green',NULL,4); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(26,201,'gradin','green',NULL,4); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(27,202,'pelouse','green',NULL,4); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(28,203,'gradin','green',NULL,4); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(29,204,'pelouse','green',NULL,4); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(30,209,'gradin','green',NULL,4); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(31,75,'pelouse','green',NULL,4); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(32,107,'gradin','green',NULL,5); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(33,177,'pelouse','green',NULL,5); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(34,92,'gradin','green',NULL,5); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(35,157,'gradin','green',NULL,5); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(36,201,'gradin','green',NULL,5); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(37,202,'pelouse','green',NULL,5); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(38,203,'gradin','green',NULL,5); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(39,204,'pelouse','green',NULL,5); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(40,209,'gradin','green',NULL,5); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(41,75,'pelouse','green',NULL,5);
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(42,107,'gradin','green',NULL,2); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(43,177,'pelouse','green',NULL,2); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(44,92,'gradin','green',NULL,2); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(45,157,'gradin','green',NULL,2); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(46,201,'gradin','green',NULL,2); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(47,202,'pelouse','green',NULL,2); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(48,203,'gradin','green',NULL,2); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(49,204,'pelouse','green',NULL,2); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(50,209,'gradin','green',NULL,2); 
INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(51,75,'pelouse','green',NULL,2);  
INSERT INTO slogans(id,picture) VALUES(1,"https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iDt6V.rPqgC0/v1/1000x-1.jpg");
INSERT INTO slogans(id,picture) VALUES(2,"https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iDt6V.rPqgC0/v1/1000x-1.jpg");
INSERT INTO slogans(id,picture) VALUES(3,"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCb-40Y2ODLXUfQO7cpaBNxTxoJE2cqskZ6g&usqp=CAU");

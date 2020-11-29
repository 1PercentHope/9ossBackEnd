DROP DATABASE IF EXISTS koss;

CREATE DATABASE koss;

USE koss;

/* Users table */

CREATE TABLE users
(
    id int NOT NULL
    AUTO_INCREMENT,
    firstName varchar
    (20) NOT NULL,
    lastName varchar
    (20) NOT NULL,
    email varchar
    (50),
    password varchar
    (220) NOT NULL,
    phoneNumber REAL NOT NULL,
    profileImage varchar
    (220) NOT NULL,
    PRIMARY KEY
    (ID)
);

    /* admins table */

    CREATE TABLE admins
    (
        id int NOT NULL
        AUTO_INCREMENT,
    firstName varchar
        (20) NOT NULL,
    lastName varchar
        (20) NOT NULL,
    email varchar
        (250),
    password varchar
        (220) NOT NULL,
    PRIMARY KEY
        (ID)
);

        /* third Parties table */

        CREATE TABLE thirdp
        (
            id int NOT NULL
            AUTO_INCREMENT,
    identifier varchar
            (50),
    password varchar
            (220) NOT NULL,
    PRIMARY KEY
            (ID)
);

            /* events table */

            CREATE TABLE events
            (
                id int NOT NULL
                AUTO_INCREMENT,
    homeTeam varchar
                (20) NOT NULL,
    awayTeam varchar
                (20) NOT NULL,
    place varchar
                (20) NOT NULL,
    category varchar
                (20) NOT NULL,
    date varchar
                (20) NOT NULL,
    description varchar
                (200) NOT NULL,
    price REAL NOT NULL,
    image varchar
                (200),
    PRIMARY KEY
                (ID)
);

                /* purchases table */

                CREATE TABLE purchases
                (
                    id int NOT NULL
                    AUTO_INCREMENT,
    code varchar
                    (200) NOT NULL,
    date varchar
                    (20) NOT NULL,
    ammount REAL NOT NULL,
    user_id int NOT NULL,
    PRIMARY KEY
                    (ID),
    CONSTRAINT FK_IDuser FOREIGN KEY
                    (user_id) References users
                    (id)
);

                    /* seats table */

                    CREATE TABLE seats
                    (
                        id int NOT NULL
                        AUTO_INCREMENT,
    Number REAL NOT NULL,
    type varchar
                        (20) NOT NULL,
    availability varchar
                        (20) NOT NULL,
    userid int,
    matchid int,
    PRIMARY KEY
                        (ID),
    CONSTRAINT FK_useriD FOREIGN KEY
                        (userid) References users
                        (id),
    CONSTRAINT FK_event_id FOREIGN KEY
                        (matchid) References events
                        (id)

);
-- const killMe =(arr)=>{
  
-- var n = 30;
-- while(n<=200){
-- arr.push(`INSERT INTO seats(id,number,type,availability,userid,matchid) VALUES(${n},1${n},'gradin','green',NULL,3);${"\n"}`)
-- n++;
-- }
-- console.log(arr)
-- }

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

                        CREATE TABLE tokens
                        (
                            id int NOT NULL
                            AUTO_INCREMENT,
    token varchar
                            (220) NOT NULL,
    id_user  int NOT NULL,
    PRIMARY KEY
                            (ID),
    CONSTRAINT FK_useID FOREIGN KEY
                            (id_user) References users
                            (id)

);

                            /* weekly qr Codes */

                            CREATE TABLE weekCodes
                            (
                                id int NOT NULL
                                AUTO_INCREMENT,
    codes varchar
                                (220) NOT NULL,
    PRIMARY KEY
                                (ID)
    
);

                                CREATE TABLE messages
                                (
                                    id int NOT NULL
                                    AUTO_INCREMENT,
    message varchar
                                    (220),
    PRIMARY KEY
                                    (ID)
);

                                    CREATE TABLE slogans
                                    (
                                        id int NOT NULL
                                        AUTO_INCREMENT,
    picture varchar
                                        (200),
    PRIMARY KEY
                                        (ID)
);



                                        INSERT INTO users
                                            (id,firstName,lastName,email,password,phoneNumber,profileImage)
                                        VALUES(1, 'Elyes', 'Ferjani', 'elyes@rbk.com', '$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u', '11111', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/1200px-Unknown_person.jpg');
                                        INSERT INTO users
                                            (id,firstName,lastName,email,password,phoneNumber,profileImage)
                                        VALUES(2, 'Ali', 'Smaoui', 'ali@rbk.com', '$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u', '22222', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/1200px-Unknown_person.jpg');
                                        INSERT INTO users
                                            (id,firstName,lastName,email,password,phoneNumber,profileImage)
                                        VALUES(3, 'Omar', 'Chaouachi', 'omar@rbk.com', '$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u', '33333', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/1200px-Unknown_person.jpg');
                                        INSERT INTO users
                                            (id,firstName,lastName,email,password,phoneNumber,profileImage)
                                        VALUES(4, 'Skander', 'Bromdhan', 'skander@rbk.com', '$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u', '44444', 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/bc/Unknown_person.jpg/1200px-Unknown_person.jpg');
                                        INSERT INTO events
                                            (id,homeTeam,awayTeam,place,category,date,description,price,image)
                                        VALUES(1, 'ca', 'est', 'tunis', 'championship', '05/01/2021', 'League 1', 17, 'http://res.cloudinary.com/codexmaker/image/upload/v1606472774/testing_angular_cloudinary/tgeryp8qrbblaaxob4r2.png');
                                        INSERT INTO events
                                            (id,homeTeam,awayTeam,place,category,date,description,price,image)
                                        VALUES(2, 'ess', 'css', 'sousse', 'championship', '05/01/2020', 'League 1', 20, 'http://res.cloudinary.com/codexmaker/image/upload/v1606472802/testing_angular_cloudinary/v9e8uaog727kizf8sqsy.png');
                                        INSERT INTO events
                                            (id,homeTeam,awayTeam,place,category,date,description,price,image)
                                        VALUES(3, 'ust', 'usm', 'tataouine', 'championship', '11/01/2020', 'Cup', 19, 'http://res.cloudinary.com/codexmaker/image/upload/v1606472822/testing_angular_cloudinary/oxotnto9fzlihn1mf0h4.png');
                                        INSERT INTO events
                                            (id,homeTeam,awayTeam,place,category,date,description,price,image)
                                        VALUES(4, 'sg', 'usbg', 'gabes', 'championship', '12/01/2020', 'Cup', 15, 'http://res.cloudinary.com/codexmaker/image/upload/v1606472870/testing_angular_cloudinary/vgaarywttfgnbadyavbj.png');
                                        INSERT INTO events
                                            (id,homeTeam,awayTeam,place,category,date,description,price,image)
                                        VALUES(5, 'st', 'cshl', 'tunis', 'championship', '15/01/2020', 'Cup', 25, 'http://res.cloudinary.com/codexmaker/image/upload/v1606472850/testing_angular_cloudinary/ypdsjqqqrhdt2arfyonb.png');
                                        INSERT INTO thirdp
                                            (id,identifier,password)
                                        VALUES(1, '00002', '$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u');
                                        INSERT INTO weekCodes
                                            (id,codes)
                                        VALUES(1, 'Rbk6');
                                        INSERT INTO admins
                                            (id,firstName,lastName,email,password)
                                        VALUES(1, 'Elyes', 'Ferjani', 'elyes@rbk.com', '$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u');
                                        INSERT INTO admins
                                            (id,firstName,lastName,email,password)
                                        VALUES(2, 'Omar', 'Chaouachi', 'omar@rbk.com', '$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u');
                                        INSERT INTO admins
                                            (id,firstName,lastName,email,password)
                                        VALUES(3, 'Ali', 'Smaoui', 'ali@rbk.com', '$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u');
                                        INSERT INTO admins
                                            (id,firstName,lastName,email,password)
                                        VALUES(4, 'Skander', 'Bromdhan', 'skander@rbk.com', '$2b$10$beYHqloL2DWfegZfkBNazuzQJDHT1PX/l.y94Fa60mF4TcSR7CR1u');
                                        INSERT INTO messages
                                            (id,message)
                                        VALUES(1, 'Welcome to admins platform');




                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(1, 101, 'pelouse', 'green', null, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(2, 102, 'pelouse', 'red', 1, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(3, 103, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(4, 104, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(5, 105, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(6, 106, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(7, 107, 'pelouse', 'red', 2, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(8, 108, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(9, 109, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(10, 110, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(11, 111, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(12, 112, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(13, 113, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(14, 114, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(15, 115, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(16, 116, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(17, 117, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(18, 118, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(19, 119, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(20, 120, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(21, 121, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(22, 122, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(23, 123, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(24, 124, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(25, 125, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(26, 126, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(27, 127, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(28, 128, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(29, 129, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(30, 130, 'pelouse', 'green', NULL, 2);
                                        
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(31, 131, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(32, 132, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(33, 133, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(34, 134, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(35, 135, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(36, 136, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(37, 137, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(38, 138, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(39, 139, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(40, 140, 'pelouse', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(41, 141, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(42, 142, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(43, 143, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(44, 144, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(45, 145, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(46, 146, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(47, 147, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(48, 148, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(49, 149, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(50, 150, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(51, 151, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(52, 152, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(53, 153, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(54, 154, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(55, 155, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(56, 156, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(57, 157, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(58, 158, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(59, 159, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(60, 160, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(61, 161, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(62, 162, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(63, 163, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(64, 164, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(65, 165, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(66, 166, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(67, 167, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(68, 168, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(69, 169, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(70, 170, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(71, 171, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(72, 172, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(73, 173, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(74, 174, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(75, 175, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(76, 176, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(77, 177, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(78, 178, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(79, 179, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(80, 180, 'gradin', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(81, 181, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(82, 182, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(83, 183, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(84, 184, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(85, 185, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(86, 186, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(87, 187, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(88, 188, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(89, 189, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(90, 190, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(91, 191, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(92, 192, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(93, 193, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(94, 194, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(95, 195, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(96, 196, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(97, 197, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(98, 198, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(99, 199, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(100, 1100, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(101, 1101, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(102, 1102, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(103, 1103, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(104, 1104, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(105, 1105, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(106, 1106, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(107, 1107, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(108, 1108, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(109, 1109, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(110, 1110, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(111, 1111, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(112, 1112, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(113, 1113, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(114, 1114, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(115, 1115, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(116, 1116, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(117, 1117, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(118, 1118, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(119, 1119, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(120, 1120, 'pelouse', 'green', NULL, 1);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(121, 1121, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(122, 1122, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(123, 1123, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(124, 1124, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(125, 1125, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(126, 1126, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(127, 1127, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(128, 1128, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(129, 1129, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(130, 1130, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(131, 1131, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(132, 1132, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(133, 1133, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(134, 1134, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(135, 1135, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(136, 1136, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(137, 1137, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(138, 1138, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(139, 1139, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(140, 1140, 'gradin', 'green', NULL, 2);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(141, 1141, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(142, 1142, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(143, 1143, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(144, 1144, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(145, 1145, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(146, 1146, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(147, 1147, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(148, 1148, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(149, 1149, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(150, 1150, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(151, 1151, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(152, 1152, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(153, 1153, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(154, 1154, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(155, 1155, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(156, 1156, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(157, 1157, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(158, 1158, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(159, 1159, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(160, 1160, 'gradin', 'green', NULL, 3);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(161, 1161, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(162, 1162, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(163, 1163, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(164, 1164, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(165, 1165, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(166, 1166, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(167, 1167, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(168, 1168, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(169, 1169, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(170, 1170, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(171, 1171, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(172, 1172, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(173, 1173, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(174, 1174, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(175, 1175, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(176, 1176, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(177, 1177, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(178, 1178, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(179, 1179, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(180, 1180, 'pelouse', 'green', NULL, 4);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(181, 1181, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(182, 1182, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(183, 1183, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(184, 1184, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(185, 1185, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(186, 1186, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(187, 1187, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(188, 1188, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(189, 1189, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(190, 1190, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(191, 1191, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(192, 1192, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(193, 1193, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(194, 1194, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(195, 1195, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(196, 1196, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(197, 1197, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(198, 1198, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(199, 1199, 'pelouse', 'green', NULL, 5);
                                        INSERT INTO seats
                                            (id,number,type,availability,userid,matchid)
                                        VALUES(200, 1200, 'pelouse', 'green', NULL, 5);


                                        INSERT INTO slogans
                                            (id,picture)
                                        VALUES(1, "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iDt6V.rPqgC0/v1/1000x-1.jpg");
                                        INSERT INTO slogans
                                            (id,picture)
                                        VALUES(2, "https://assets.bwbx.io/images/users/iqjWHBFdfxIU/iDt6V.rPqgC0/v1/1000x-1.jpg");
                                        INSERT INTO slogans
                                            (id,picture)
                                        VALUES(3, "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCb-40Y2ODLXUfQO7cpaBNxTxoJE2cqskZ6g&usqp=CAU");

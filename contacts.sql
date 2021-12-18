/*
* Jake Sheehan
* Southern New Hampshire University
* DAD-220
* Final Project
*/

USE messaging;

-- Task 1 ---------------------------------------------------

INSERT INTO person (first_name, last_name)
VALUES
("Jake", "Sheehan");

-- Task 2 ---------------------------------------------------

ALTER TABLE person
ADD email VARCHAR(50) DEFAULT NULL;

-- Task 3 ---------------------------------------------------

UPDATE person
SET email = "jake.sheehan@snhu.edu"
WHERE person_id = 7;

-- Task 4 ---------------------------------------------------

DELETE FROM person
WHERE
first_name = "Diana" AND
last_name = "Taurasi";

-- Task 5 ---------------------------------------------------

ALTER TABLE contact_list
ADD favorite VARCHAR(10) DEFAULT NULL;

-- Task 6----------------------------------------------------

UPDATE contact_list
SET favorite = "y"
WHERE contact_id = 1;

-- Task 7 ---------------------------------------------------

UPDATE contact_list
SET favorite = "n"
WHERE contact_id != 1;

-- Task 8 ---------------------------------------------------

INSERT INTO contact_list (person_id, contact_id, favorite)
VALUES
(1, 7, "n"),
(2, 7, "n"),
(3, 7, "n");

-- Task 9 -----------------------------------------------------

CREATE TABLE image (
image_id INT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
image_name VARCHAR(50) NOT NULL,
image_location VARCHAR(250) NOT NULL,
PRIMARY KEY (image_id)
) AUTO_INCREMENT = 1;

-- Task 10 ----------------------------------------------------

CREATE TABLE message_image (
message_id INT(8) NOT NULL,
image_id INT(8) NOT NULL,
PRIMARY KEY (message_id, image_id)
);

-- Task 11 ----------------------------------------------------

INSERT INTO image (image_name, image_location)
VALUES
("smiling_emoji", "./smiling_emoji.png"),
("sunglasses_emoji", "./sunglasses_emoji.png"),
("nerd_emoji", "./nerd_emoji.png"),
("eye_roll_emoji", "./eye_roll_emoji.png"),
("tears_of_joy_emoji", "./tears_of_joy_emoji.png");

-- Task 12 ----------------------------------------------------

INSERT INTO message_image (message_id, image_id)
VALUES
(1, 2),
(2, 4),
(3, 5),
(5, 3),
(5, 1);

-- Task 13 ------------------------------------------------------

/*SELECT
s.first_name AS "Sender's first name",
s.last_name AS "Sender's last name",
r.first_name AS "Receiver's first name",
r.last_name AS "Receiver's last name",
m.message_id AS "Message ID",
m.message AS "Message",
m.send_datetime AS "Message Timestamp"
FROM
message m
JOIN person AS s ON s.person_id = m.sender_id
JOIN person AS r on r.person_id = m.receiver_id
WHERE
m.sender_id = 1;
*/
	
SELECT
s.first_name AS "Sender's first name",
s.last_name AS "Sender's last name",
r.first_name AS "Receiver's first name",
r.last_name AS "Receiver's last name",
m.message_id AS "Message ID",
m.message AS "Message",
m.send_datetime AS "Message Timestamp"
FROM
message AS m,
person AS s,
person AS r
WHERE
m.sender_id = 1 AND
s.person_id = m.sender_id AND
r.person_id = m.receiver_id;

-- Task 14 ------------------------------------------------------

SELECT
COUNT(m.message_id) AS "Count of messages",
p.person_id AS "Person ID",
p.first_name AS "First Name",
p.last_name AS "Last Name"
FROM
person AS p,
message AS m
WHERE
p.person_id = m.sender_id
GROUP BY p.person_id;

-- Task 15 ------------------------------------------------------

SELECT
m.message_id AS "Message ID",
m.message AS "Message",
m.send_datetime AS "Message Timestamp",
i.image_name AS "First Image Name",
i.image_location AS "First Image Location"
FROM
message m
INNER JOIN message_image AS mi ON m.message_id = mi.message_id
INNER JOIN image AS i ON i.image_id = mi.image_id
GROUP BY m.message_id;

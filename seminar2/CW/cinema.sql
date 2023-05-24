RENAME TABLE films TO cinema;

ALTER TABLE cinema
ADD COLUMN rating FLOAT NOT NULL AFTER duration;

SELECT * FROM producer;

ALTER TABLE cinema
DROP COLUMN Language;

CREATE TABLE producer
(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
producer_name VARCHAR(30) NOT NULL,
age INT NOT NULL
);

ALTER TABLE cinema
ADD COLUMN producer_id int NOT NULL;

ALTER TABLE cinema
ADD FOREIGN KEY(producer_id) REFERENCES producer(Id);

ALTER TABLE cinema
RENAME COLUMN rating TO grade;
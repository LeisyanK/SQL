use seminar2;

select * from films;

CREATE TABLE films
(
Id INT auto_increment primary key NOT NULL,
film_name varchar(100) NOT NULL,
film_year int not null,
duration int not null,
film_description varchar(200) not null
);

DROP TABLE films;
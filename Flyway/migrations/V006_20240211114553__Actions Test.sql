
USE FantasyTCStore
GO

CREATE TABLE PERSON (
ID int not null,
NAME varchar(100) not null
);

INSERT INTO PERSON (ID, NAME)
VALUES (1, 'John'),
       (2, 'Jane');
GO
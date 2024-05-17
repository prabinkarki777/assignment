CREATE TABLE "User" (
    userId VARCHAR2(20) PRIMARY KEY,
    name VARCHAR2(50),
    emailAddress VARCHAR(50)
);

CREATE TABLE Category (
    categoryCode VARCHAR2(10) PRIMARY KEY,
    title VARCHAR(100)
);

CREATE TABLE Music (
    musicId VARCHAR2(10) PRIMARY KEY,
    title VARCHAR2(100),
    categoryCode VARCHAR(10),
    costPerDownload NUMBER(6,2),
    FOREIGN KEY (categoryCode) REFERENCES Category(categoryCode)
);

CREATE TABLE DownloadMusic (
    userID VARCHAR2(20),
    musicID VARCHAR2(10),
    downloadDate DATE,
    FOREIGN KEY (userId) REFERENCES "User"(userId),
    FOREIGN KEY (musicId) REFERENCES Music(musicId)
);

INSERT INTO "User" (userId, name, emailAddress) VALUES ('wayne10', 'Wayne, R', 'wayne@hotmail.co.uk');
INSERT INTO "User" (userId, name, emailAddress) VALUES ('santos17', 'Santos, C', 'santos@ntl.co.uk');
INSERT INTO "User" (userId, name, emailAddress) VALUES ('hary05', 'Hary, M', 'hary@freeserve.co.uk');
INSERT INTO "User" (userId, name, emailAddress) VALUES ('margot9', 'Margot, C', 'margot9@msn.co.uk');
INSERT INTO "User" (userId, name, emailAddress) VALUES ('mount77', 'Mount, M', 'mount@hotmail.co.uk');
INSERT INTO "User" (userId, name, emailAddress) VALUES ('nancy91', 'Nancy, L', 'nancy91@tesco.co.uk');

INSERT INTO Category (categoryCode, title) VALUES ('MO11', 'Love');
INSERT INTO Category (categoryCode, title) VALUES ('MO12', 'Pop');
INSERT INTO Category (categoryCode, title) VALUES ('MO13', 'Rock');

INSERT INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M001', 'Born to run', 'MO13', 0.99);
INSERT INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M002', 'Crawling', 'MO13', 1.99);
INSERT INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M003', 'You’re Beautiful', 'MO11', 1.49);
INSERT INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M004', 'Summer of 69', 'MO11', 1.79);
INSERT INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M005', 'Crazy Train', 'MO13', 1.50);
INSERT INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M006', 'Yellow Submarine', 'MO12', 1.10);
INSERT INTO Music (musicId, title, categoryCode, costPerDownload) VALUES ('M007', 'Got to be there', 'MO12', 0.89);

INSERT INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('wayne10', 'M002', TO_DATE('03-May-2021', 'DD-Mon-YYYY'));
INSERT INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('margot9', 'M005', TO_DATE('01-May-2022', 'DD-Mon-YYYY'));
INSERT INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('santos17', 'M002', TO_DATE('06-May-2021', 'DD-Mon-YYYY'));
INSERT INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('margot9', 'M001', TO_DATE('06-May-2022', 'DD-Mon-YYYY'));
INSERT INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('wayne10', 'M003', TO_DATE('01-Aug-2022', 'DD-Mon-YYYY'));
INSERT INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('mount77', 'M004', TO_DATE('02-Aug-2022', 'DD-Mon-YYYY'));
INSERT INTO DownloadMusic (userId, musicId, downloadDate) VALUES ('nancy91', 'M007', TO_DATE('05-Sep-2021'));

commit;

--The music id, the title, and the categoryCode of all the music in the database, ordered by title.

SELECT musicId, title, categoryCode 
FROM music
ORDER BY title;

--The number of users who downloaded 'Pop-Rock' category of music.

SELECT COUNT(DISTINCT dm.userId) AS Total_Users_Downloaded_Pop_Rock
FROM DownloadMusic dm
JOIN Music m ON dm.musicId = m.musicId
JOIN Category c ON m.categoryCode = c.categoryCode
WHERE c.title IN ('Pop', 'Rock');

--The number of music downloads for each of the categories. The result listing should include the titles of the categories and the number of music downloads for each category title.

SELECT c.title AS Cateogry_Title, Count(*) AS Number_Of_Music_Downloads
FROM DownloadMusic dm
JOIN Music m ON dm.musicId = m.musicId
JOIN Category c ON c.categoryCode = m.categoryCode
GROUP BY c.title;

--The titles of the categories for which music was downloaded more than once.

SELECT c.title as category_title, Count(*) AS Number_Of_Music_downloads
FROM DownloadMusic dm
JOIN Music m ON dm.musicId = m.musicId
JOIN Category c ON c.categoryCode = m.categoryCode
GROUP BY c.title
HAVING COUNT(*) > 1;




 

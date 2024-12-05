INSERT INTO Region (region_name)
VALUES 
('Canada'),
('United States'),
('Japan'),
('Taiwan')

LOAD DATA LOCAL INFILE '/home/ruilin/Desktop/ECE9014/Rakuten/publisher_web_scraped.csv'
INTO TABLE Publisher
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(publisher_id, publisher_name);

LOAD DATA LOCAL INFILE '/home/ruilin/Desktop/ECE9014/Rakuten/author_web_scraped.csv'
INTO TABLE Author
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(author_id, author_name);



LOAD DATA LOCAL INFILE '/home/ruilin/Desktop/ECE9014/Rakuten/books_web_scraped.csv'
INTO TABLE Book
FIELDS TERMINATED BY ',' ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(book_id, title, rakuten_id, release_date, price, publisher_id, region_id, description, author_id);

CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(200) NOT NULL
);

ALTER TABLE Book
ADD COLUMN author_id INT,
ADD CONSTRAINT fk_author
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
    ON DELETE SET NULL;

SELECT b.*
FROM Book b
JOIN Region r ON b.region_id = r.region_id
WHERE r.region_name = 'Japan';

SELECT b.book_id, b.title, g.genre_name
FROM Book_Genre bg
JOIN Book b ON bg.book_id = b.book_id
JOIN Genre g ON bg.genre_id = g.genre_id
WHERE g.genre_name = 'Manga'; 


SELECT b.book_id, b.title
FROM Book_Genre bg1
JOIN Book_Genre bg2 ON bg1.book_id = bg2.book_id
JOIN Book b ON bg1.book_id = b.book_id
JOIN Genre g1 ON bg1.genre_id = g1.genre_id
JOIN Genre g2 ON bg2.genre_id = g2.genre_id
WHERE g1.genre_name = 'Manga' AND g2.genre_name = 'Romantic';

SELECT b.title, a.author_name 
FROM Book b
JOIN Author a ON b.author_id = a.author_id
WHERE a.author_name LIKE '赤坂アカ%';

SELECT b.title, p.publisher_name 
FROM Book b
JOIN Publisher p ON b.publisher_id  = p.publisher_id 
WHERE p.publisher_name LIKE '角川%';

SELECT b.title, u.user_id, u.fname, u.lname 
FROM User_Library ul
JOIN Book b ON ul.book_id = b.book_id
JOIN User u ON ul.user_id = u.user_id
WHERE u.email LIKE 'rpeng%';

SELECT t.transaction_id, t.amount,u.user_id, u.fname, u.lname  
FROM Transaction t
JOIN User u ON t.user_id = u.user_id  
WHERE u.email LIKE 'rpeng%';

SELECT t.transaction_id, b.title, ti.item_price  
FROM Transaction_Items ti  
JOIN Transaction t ON ti.transaction_id = t.transaction_id
JOIN Book b  ON ti.book_id  = b.book_id  
WHERE t.transaction_id = 1;

SELECT r.review_id, b.title, u.fname, r.rating, r.comment 
FROM Review r
JOIN User u ON r.user_id = u.user_id 
JOIN Book b ON r.book_id = b.book_id 
WHERE u.email LIKE 'rpeng%';

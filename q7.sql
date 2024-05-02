
DROP TABLE if EXISTS VideoPosting;
DROP TABLE if EXISTS Video;
DROP TABLE if EXISTS USER;
DROP TABLE if EXISTS `Date`;

CREATE TABLE Video (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    description VARCHAR(255),
    video_length INT,  -- Length in seconds
    video_music VARCHAR(255)
);

CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    gender ENUM('Male', 'Female', 'Non-binary'),
    DOB DATE,
    account_type ENUM('Personal', 'Creator', 'Business')
);

CREATE TABLE Date (
    date_id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE,
    weekday VARCHAR(10),
    month VARCHAR(10),
    year INT,
    quarter INT
);


CREATE TABLE VideoPosting (
    video_id INT,
    user_id INT,
    date_id INT,
    shares_count INT,
    likes_count INT,
    comments VARCHAR(255),
    PRIMARY KEY (video_id, user_id, date_id),
    FOREIGN KEY (video_id) REFERENCES Video(video_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (date_id) REFERENCES `Date`(date_id)
);


INSERT INTO Date (date, weekday, month, year, quarter)
VALUES
('2024-01-01', 'Monday', 'January', 2024, 1),
('2024-01-02', 'Tuesday', 'January', 2024, 1),
('2024-01-03', 'Wednesday', 'January', 2024, 1),
('2024-01-04', 'Thursday', 'January', 2024, 1),
('2024-01-05', 'Friday', 'January', 2024, 1),
('2024-01-06', 'Saturday', 'January', 2024, 1),
('2024-01-07', 'Sunday', 'January', 2024, 1);

INSERT INTO User (name, gender, DOB, account_type)
VALUES
('Alice Smith', 'Female', '1992-06-15', 'Personal'),
('Bob Johnson', 'Male', '1988-04-22', 'Creator'),
('Charlie Lee', 'Non-binary', '1990-12-30', 'Business'),
('Dana White', 'Female', '1995-08-09', 'Creator');

INSERT INTO Video (description, video_length, video_music)
VALUES
('Funny cats compilation', 180, 'Upbeat Mood'),
('How to make sushi', 300, 'Calm Zen'),
('Daily workout routine', 150, 'Energetic Beat'),
('Travel vlog: Paris', 240, 'French Accordion'),
('Gaming highlights', 200, 'Electronic Fast');

-- These entries assume some arbitrary distribution of videos, users, and dates
INSERT INTO VideoPosting (video_id, user_id, date_id, shares_count, likes_count, comments)
VALUES
(1, 1, 1, 10, 200, 'So cute!'),
(2, 2, 1, 15, 150, 'Very informative!'),
(3, 3, 1, 20, 100, 'Great tips!'),
(1, 4, 2, 30, 300, 'Hilarious 😂'),
(2, 1, 2, 25, 250, 'Love sushi!'),
(3, 2, 3, 5, 50, 'Need more like this'),
(4, 3, 3, 40, 400, 'Beautiful city!'),
(5, 4, 3, 35, 350, 'Epic gameplay'),
(1, 1, 4, 20, 400, 'Cats are the best'),
(2, 2, 4, 15, 150, 'Helpful for beginners'),
(3, 3, 5, 30, 500, 'Nice routine'),
(4, 4, 5, 5, 75, 'Makes me want to travel'),
(5, 1, 6, 50, 600, 'What a match!'),
(1, 2, 6, 25, 450, 'Always funny'),
(2, 3, 6, 35, 350, 'Gotta try this at home'),
(3, 4, 7, 20, 200, 'Awesome video'),
(4, 1, 7, 10, 100, 'Love Paris!'),
(5, 2, 7, 45, 550, 'Intense!'),
(1, 3, 7, 50, 500, 'My favorite'),
(2, 4, 7, 30, 400, 'So tasty!');



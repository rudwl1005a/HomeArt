USE homeart;

-- board테이블 만들기
CREATE TABLE Board(
	board_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
	content VARCHAR(2000) NOT NULL,
	writer VARCHAR(50) NOT NULL,
    viewCount INT DEFAULT 0 NOT NULL,
	inserted DATETIME DEFAULT NOW(),
	updated DATETIME DEFAULT NOW()
);
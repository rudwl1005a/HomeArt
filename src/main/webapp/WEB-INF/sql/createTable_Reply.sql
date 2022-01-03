USE homeart;

-- 댓글 테이블 만들기
CREATE TABLE Reply(
	id INT PRIMARY KEY AUTO_INCREMENT,
    reply_id INT NOT NULL,
    reply VARCHAR(500) NOT NULL,
    member_id VARCHAR(30) NOT NULL,
    inserted DATETIME NOT NULL DEFAULT NOW(),
    updated DATETIME NOT NULL DEFAULT NOW()
);
USE homeart;

-- 댓글 테이블 만들기
CREATE TABLE FreeBoardReply(
	id INT PRIMARY KEY AUTO_INCREMENT,
    board_id INT NOT NULL,
    member_id VARCHAR(30) NOT NULL,
    reply VARCHAR(500) NOT NULL,
    inserted DATETIME NOT NULL DEFAULT NOW(),
    updated DATETIME NOT NULL DEFAULT NOW()
);

DESC Member;
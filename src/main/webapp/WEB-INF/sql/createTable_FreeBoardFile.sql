USE homeart;

CREATE TABLE FreeBoardFile(
	id INT PRIMARY KEY AUTO_INCREMENT,
    fileId INT NOT NULL,
    fileName VARCHAR(255) NOT NULL,
    FOREIGN KEY (fileId) REFERENCES freeBoard(board_id)
);

DESC FreeBoardFile;
SELECT * FROM File ORDER BY fileId DESC, id ASC;

SELECT * FROM freeBoard ORDER BY inserted DESC;

SELECT
			b.board_id,
			b.title,
			b.writer,
			b.inserted,
			b.updated,
            b.viewCount,
            b.isPublic,
			m.nickName,
			m.isAdmin,
			COUNT(r.id) replyCount,
			(SELECT EXISTS(SELECT * FROM FreeBoardFile WHERE fileId = b.board_id)) hasFile
		FROM
			freeBoard b 
				JOIN 
			Member m ON b.writer = m.member_id
				LEFT JOIN
			FreeBoardReply r ON b.board_id = r.board_id
		WHERE
			m.isAdmin = 0
			AND (b.title LIKE CONCAT('%', "12" ,'%')
            OR m.nickName LIKE CONCAT('%', "12" ,'%'))
		GROUP BY b.board_id
		ORDER BY b.board_id DESC
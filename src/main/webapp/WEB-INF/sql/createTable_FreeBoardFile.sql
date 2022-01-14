USE homeart;

CREATE TABLE FreeBoardFile(
	id INT PRIMARY KEY AUTO_INCREMENT,
    fileId INT NOT NULL,
    fileName VARCHAR(255) NOT NULL,
    FOREIGN KEY (fileId) REFERENCES freeBoard(board_id)
);

DESC FreeBoardFile;
SELECT * FROM File ORDER BY fileId DESC, id ASC;
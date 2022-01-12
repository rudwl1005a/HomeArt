USE homeart;

CREATE TABLE File(
	id INT PRIMARY KEY AUTO_INCREMENT,
    boardId INT NOT NULL,
    fileName VARCHAR(255) NOT NULL,
    FOREIGN KEY (boardId) REFERENCES freeBoard(board_id)
);

DESC File;
SELECT * FROM File ORDER BY boardId DESC, id ASC;
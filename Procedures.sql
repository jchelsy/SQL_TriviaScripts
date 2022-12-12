-- Implementing DB Scripts In Your Database

use u937509157_jonahc;




/*********************
*** CREATING VIEWS ***
**********************/

-- A View of all Trivia content (question/answer/hint/etc.)
CREATE VIEW vwTriviaContent AS
SELECT
	table_trivia_questions.id_question,
    trivia_question,
    trivia_answer,
    question_hint,
    question_difficulty,
    point_value,
    id_trivia_game
FROM table_trivia_questions
INNER JOIN table_trivia_answers
ON table_trivia_questions.id_question = table_trivia_answers.id_question
INNER JOIN table_trivia_hints
ON table_trivia_questions.id_question = table_trivia_hints.id_question;


-- A View of all Player information
CREATE VIEW vwPlayerList AS
SELECT
	player_name,
    player_dob,
    player_gender,
    player_occupation,
    player_contact,
    id_trivia_game
FROM table_trivia_players;




/**************************
*** CREATING PROCEDURES ***
***************************/


-- A procedure that gets a View of the trivia content of one game (question/answer/hint/etc.), given the game's ID  (1-5)
DELIMITER //
CREATE PROCEDURE spGetTriviaContentByGameId(IN GameId int)
	BEGIN
		SELECT
			id_question,
            trivia_question,
            trivia_answer,
            question_hint,
            question_difficulty,
            point_value
        FROM vwTriviaContent
        WHERE id_trivia_game = GameId;
    END
//
DELIMITER ;


-- A procedure that gets a View of ALL trivia content
DELIMITER //
CREATE PROCEDURE spGetAllTriviaContent()
	BEGIN
		SELECT
			id_question,
            trivia_question,
            trivia_answer,
            question_hint,
            question_difficulty,
            point_value
		FROM vwTriviaContent;
	END
//
DELIMITER ;


-- A procedure that gets a View of player information for the given game's ID  (1-5)
DELIMITER //
CREATE PROCEDURE spGetPlayersByGameId(IN GameId int)
	BEGIN
		SELECT
			player_name,
            player_dob,
            player_gender,
            player_occupation,
            player_contact
        FROM vwPlayerList
        WHERE id_trivia_game = GameId;
    END
//
DELIMITER ;


-- A procedure that gets a View of ALL player information
DELIMITER //
CREATE PROCEDURE spGetAllPlayers()
	BEGIN
		SELECT
            player_name,
            player_dob,
            player_gender,
            player_occupation,
            player_contact,
            id_trivia_game
		FROM vwPlayerList;
    END
//
DELIMITER ;


-- A procedure that updates question details
DELIMITER //
CREATE PROCEDURE spUpdateQuestion(IN QuestionId int, Question varchar(1000), Difficulty varchar(100), Points int)
	BEGIN
		UPDATE table_trivia_questions
        SET
			trivia_question = Question,
            question_difficulty = Difficulty,
            point_value = Points
		WHERE id_question = QuestionId;
	END
//
DELIMITER ;




/**********************
*** PROCEDURE CALLS ***
***********************/

CALL spGetTriviaContentByGameId(1);
CALL spGetTriviaContentByGameId(2);
CALL spGetTriviaContentByGameId(3);
CALL spGetTriviaContentByGameId(4);
CALL spGetTriviaContentByGameId(5);

CALL spGetAllTriviaContent();

CALL spGetPlayersByGameId(1);
CALL spGetPlayersByGameId(2);
CALL spGetPlayersByGameId(3);
CALL spGetPlayersByGameId(4);
CALL spGetPlayersByGameId(5);

CALL spGetAllPlayers();


CALL spUpdateQuestion(1, "Where is Captain America from?", "Easy", 5);
CALL spUpdateQuestion(1, "Where is Captain America from?", "Easy", 10);


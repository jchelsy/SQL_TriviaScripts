/************************
*** Select Everything ***
*************************/



-- Games + Locations + Hosts
SELECT
	trivia_game_name,
    trivia_game_difficulty,
    location_name,
    location_address,
    location_city,
    location_state,
    location_zipcode,
    host_name,
    host_dob,
    host_contact
FROM table_trivia_games
INNER JOIN table_trivia_locations
ON table_trivia_games.id_location = table_trivia_locations.id_location
INNER JOIN table_trivia_hosts
ON table_trivia_games.id_trivia_game = table_trivia_hosts.id_trivia_game;

-- Players
SELECT * FROM u937509157_jonahc.table_trivia_players;

-- Game 1
SELECT
	table_trivia_questions.id_question,
	trivia_question,
    trivia_answer,
    question_hint,
    question_difficulty,
    point_value
FROM table_trivia_questions
INNER JOIN table_trivia_answers
ON table_trivia_questions.id_question = table_trivia_answers.id_question
INNER JOIN table_trivia_hints
ON table_trivia_questions.id_question = table_trivia_hints.id_question
WHERE table_trivia_questions.id_trivia_game = 1;  -- Which game ID?

-- Game 2
SELECT
	table_trivia_questions.id_question,
	trivia_question,
    trivia_answer,
    question_hint,
    question_difficulty,
    point_value
FROM table_trivia_questions
INNER JOIN table_trivia_answers
ON table_trivia_questions.id_question = table_trivia_answers.id_question
INNER JOIN table_trivia_hints
ON table_trivia_questions.id_question = table_trivia_hints.id_question
WHERE table_trivia_questions.id_trivia_game = 2;  -- Which game ID?

-- Game 3
SELECT
	table_trivia_questions.id_question,
	trivia_question,
    trivia_answer,
    question_hint,
    question_difficulty,
    point_value
FROM table_trivia_questions
INNER JOIN table_trivia_answers
ON table_trivia_questions.id_question = table_trivia_answers.id_question
INNER JOIN table_trivia_hints
ON table_trivia_questions.id_question = table_trivia_hints.id_question
WHERE table_trivia_questions.id_trivia_game = 3;  -- Which game ID?

-- Game 4
SELECT
	table_trivia_questions.id_question,
	trivia_question,
    trivia_answer,
    question_hint,
    question_difficulty,
    point_value
FROM table_trivia_questions
INNER JOIN table_trivia_answers
ON table_trivia_questions.id_question = table_trivia_answers.id_question
INNER JOIN table_trivia_hints
ON table_trivia_questions.id_question = table_trivia_hints.id_question
WHERE table_trivia_questions.id_trivia_game = 4;  -- Which game ID?

-- Game 5
SELECT
	table_trivia_questions.id_question,
	trivia_question,
    trivia_answer,
    question_hint,
    question_difficulty,
    point_value
FROM table_trivia_questions
INNER JOIN table_trivia_answers
ON table_trivia_questions.id_question = table_trivia_answers.id_question
INNER JOIN table_trivia_hints
ON table_trivia_questions.id_question = table_trivia_hints.id_question
WHERE table_trivia_questions.id_trivia_game = 5;  -- Which game ID?
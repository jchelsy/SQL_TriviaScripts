/* TODO:
XXX - Add 4 more games
XXX - Add questions for new games
- Add answers for new games
- Add hints for new games

XXX - Add more players (4 per game? So, 20 total?)

XXX - Edit all player's foreign key to their respective games
XXX - Edit each host's foreign key to their respective game

XXX - Attach a location to each game (location doesn't have a foreign key - game would have a foreign key of location?)

- Edit some of the tables with suggested changes in comments?
NO - Edit question table point values to equal the same number of total points in each game?
*/

-- Creating all tables & adding data
use u937509157_jonahc;


-- SELECT * FROM u937509157_jonahc.table_trivia_locations;
-- SELECT * FROM u937509157_jonahc.table_trivia_games;
-- SELECT * FROM u937509157_jonahc.table_trivia_questions;

-- SELECT * FROM u937509157_jonahc.table_trivia_hosts;
-- SELECT * FROM u937509157_jonahc.table_trivia_players;


-- Show questions for selected game
/*
SELECT
	table_trivia_questions.id_question,
    trivia_question,
    -- trivia_answer,
    -- question_hint,
    question_difficulty,
    point_value
FROM table_trivia_questions
WHERE table_trivia_questions.id_trivia_game = 5;  -- Which game ID?
*/

-- Show questions AND answers for selected game
/*
SELECT
	u937509157_jonahc.table_trivia_questions.id_question,
	u937509157_jonahc.table_trivia_questions.trivia_question,
    u937509157_jonahc.table_trivia_answers.trivia_answer,
    u937509157_jonahc.table_trivia_questions.question_difficulty,
    u937509157_jonahc.table_trivia_questions.point_value
FROM u937509157_jonahc.table_trivia_questions
INNER JOIN u937509157_jonahc.table_trivia_answers
ON u937509157_jonahc.table_trivia_questions.id_question = u937509157_jonahc.table_trivia_answers.id_question
AND u937509157_jonahc.table_trivia_questions.id_trivia_game = 5;  -- Which game ID?
*/

-- Show questions AND answers AND hints for selected game
/*
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
*/



/**********************
*** CREATING TABLES ***
***********************/


-- Trivia Game Locations
/*
CREATE TABLE table_trivia_locations (
	id_location int NOT NULL AUTO_INCREMENT,
    location_name VARCHAR(100) NOT NULL,
    location_address VARCHAR(200) NOT NULL,
    location_city VARCHAR(100) NOT NULL,
    location_state VARCHAR(2) NOT NULL,
    location_zipcode VARCHAR(5) NOT NULL,
    PRIMARY KEY (id_location)
);
*/

-- Trivia Games
/*
CREATE TABLE table_trivia_games (
	id_trivia_game int NOT NULL AUTO_INCREMENT,
    trivia_game_name VARCHAR(500) NOT NULL,
    trivia_game_difficulty VARCHAR(100) NOT NULL,
    id_location int,
    PRIMARY KEY (id_trivia_game),
    FOREIGN KEY(id_location) REFERENCES table_trivia_locations(id_location)
);
*/

-- Trivia Questions
/*
CREATE TABLE table_trivia_questions (
	id_question int NOT NULL AUTO_INCREMENT,
    trivia_question VARCHAR(1000) NOT NULL,
    question_difficulty VARCHAR(100) NOT NULL,
    point_value int NOT NULL,
    id_trivia_game int,
    PRIMARY KEY (id_question),
    FOREIGN KEY(id_trivia_game) REFERENCES table_trivia_games(id_trivia_game)
);
*/

-- Trivia Answers
/*
CREATE TABLE table_trivia_answers (
	id_answer int NOT NULL AUTO_INCREMENT,
    trivia_answer VARCHAR(500) NOT NULL,
    id_question int,
    PRIMARY KEY (id_answer),
    FOREIGN KEY(id_question) REFERENCES table_trivia_questions(id_question)
);
*/

-- Trivia Hints
/*
CREATE TABLE table_trivia_hints (
	id_hint int NOT NULL AUTO_INCREMENT,
    question_hint VARCHAR(1000) NOT NULL,
    id_question int,
    PRIMARY KEY (id_hint),
    FOREIGN KEY(id_question) REFERENCES table_trivia_questions(id_question)
);
*/

-- Trivia Game Players
/*
CREATE TABLE table_trivia_players (
	id_player int NOT NULL AUTO_INCREMENT,
    player_name VARCHAR(500) NOT NULL,
    player_contact VARCHAR(500) NOT NULL,
    player_dob VARCHAR(10) NOT NULL,  -- FORMAT: MM/DD/YYYY (10 characters)
    player_gender VARCHAR(50) NOT NULL,
    player_occupation VARCHAR(100) NOT NULL,
    player_trivia_points int NOT NULL,
    id_trivia_game int,
    PRIMARY KEY (id_player),
    FOREIGN KEY(id_trivia_game) REFERENCES table_trivia_games(id_trivia_game)
);
*/

-- Trivia Game Hosts
/*
CREATE TABLE table_trivia_hosts (
	id_host int NOT NULL AUTO_INCREMENT,
    host_name VARCHAR(500) NOT NULL,
    host_dob VARCHAR(10) NOT NULL,  -- FORMAT: MM/DD/YYYY (10 characters)
    host_contact VARCHAR(500) NOT NULL,  -- primary contact info (i.e. phone number/email)
    id_trivia_game int,
    PRIMARY KEY (id_host),
    FOREIGN KEY(id_trivia_game) REFERENCES table_trivia_games(id_trivia_game)
);
*/




/*******************
*** ADDING GAMES ***
********************/


-- GAME 1  -  Marvel Cinematic Universe Trivia
/*
INSERT INTO u937509157_jonahc.table_trivia_games (trivia_game_name, trivia_game_difficulty, id_location)
VALUES (
	"'Marvel'ous MCU Trivia",
    "Medium",  -- Easy/Medium/Hard?
    1
);
*/

-- GAME 2  -  Geography Trivia
/*
INSERT INTO u937509157_jonahc.table_trivia_games (trivia_game_name, trivia_game_difficulty, id_location)
VALUES (
	"Geo-Know-How Trivia",
    "Hard",  -- Easy/Medium/Hard?
    2
);
*/

-- GAME 3  -  Science Trivia
/*
INSERT INTO u937509157_jonahc.table_trivia_games (trivia_game_name, trivia_game_difficulty, id_location)
VALUES (
	"Scintillating Science Trivia",
    "Hard",  -- Easy/Medium/Hard?
    3
);
*/

-- GAME 4  -  Supernatural (TV show) Trivia
/*
INSERT INTO u937509157_jonahc.table_trivia_games (trivia_game_name, trivia_game_difficulty, id_location)
VALUES (
	"Supernatural TV Trivia",
    "Medium",  -- Easy/Medium/Hard?
    4
);
*/

-- GAME 5  -  " Harry Potter Trivia "
/*
INSERT INTO u937509157_jonahc.table_trivia_games (trivia_game_name, trivia_game_difficulty, id_location)
VALUES (
	"Magical Trivia of Harry Potter",
    "Medium",  -- Easy/Medium/Hard?
    5
);
*/




/***********************
*** ADDING QUESTIONS ***
************************/


-- QUESTIONS - Game 1
/*
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Where is Captain America from?",  -- Brooklyn
    "Easy", 10, 1
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What does S.H.I.E.L.D. stand for?",  -- Strategic Homeland Intervention, Enforcement and Logistics Division
    "Medium", 25, 1
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Sharon Carter is the biological niece of which character?",  -- Peggy Carter
    "Medium", 20, 1
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is Carol Danvers' nickname for Monica Rambeau",  -- Lieutenant Trouble
    "Hard", 40, 1
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Who was responsible for King T'Chaka's death?",  -- Zemo
    "Medium", 20, 1
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is Pepper Potts allergic to?",  -- Strawberries
    "Medium", 25, 1
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Nick Fury wears an eye patch over which eye?",  -- Left
    "Hard", 50, 1
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Bradley Cooper plays the voice for which MCU character?",  -- Rocket Raccoon
    "Hard", 40, 1
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What video game did Thor play in Avengers: Endgame?",  -- Fortnite
    "Medium", 20, 1
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"How many children does Hawkeye have?",  -- 3
    "Medium", 25, 1
);
*/


-- QUESTIONS - Game 2
/*
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What color is the sunset on Mars?",  -- Blue
    "Medium", 15, 2
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Which planet is closest to the Sun?",  -- Mercury
    "Easy", 10, 2
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Which planet has the largest ocean?",  -- Jupiter
    "Medium", 15, 2
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What are the storms produced by the Sun called?",  -- Solar Storms
    "Hard", 20, 2
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is the hottest planet in the Solar System?",  -- Venus
    "Medium", 15, 2
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is the only planet not named after a God?",  -- Earth
    "Easy", 10, 2
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Who was the first female commander of the International Space Station (ISS)?",  -- Peggy Whitson
    "Hard", 25, 2
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Which star is nearest to Earth?",  -- Alpha Centauri
    "Hard", 20, 2
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Which constellation contains the stars Castor and Pollux?",  -- Gemini
    "Hard", 20, 2
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is the densest planet in our Solar System?",  -- Earth
    "Medium", 15, 2
);
*/


-- QUESTIONS - Game 3
/*
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is the largest bone in the human body?",  -- Femur
    "Easy", 15, 3
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"How many sets of wings do bees have?",  -- 2
    "Medium", 15, 3
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What process do bats use to locate their prey?",  -- Echolocation
    "Medium", 15, 3
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"How many states of matter are there?",  -- 4
    "Easy", 10, 3
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"How do scientists measure the severity of an earthquake?",  -- Richter Scale
    "Medium", 20, 3
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"How many elements are listed in the periodic table?",  -- 118
    "Hard", 25, 3
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is the name of the tallest grass on Earth?",  -- Bamboo
    "Hard", 20, 3
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is the most abundant element in the universe?",  -- Hydrogen
    "Hard", 25, 3
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Does sound travel faster in the air or in water?",  -- Water
    "Hard", 25, 3
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"At what temperature are Celsius and Fahrenheit equal?",  -- -40
    "Medium", 20, 3
);
*/


-- QUESTIONS - Game 4
/*
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Which 80's rock star is possessed by Lucifer in Season 12 of Supernatural?",  -- Rick Springfield
    "Hard", 25, 4
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is the name of the angel that wrote the Word of God tablets?",  -- Metatron
    "Medium", 15, 4
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Who was chosen as a Prophet of the Lord to interpret the Word of God after Sam and Dean discovered the slab of stone?",  -- Kevin Tran
    "Medium", 15, 4
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Who kills Hitler in Season 12?",  -- Dean
    "Easy", 5, 4
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What book does Charlie read to her comatose mother?",  -- The Hobbit
    "Medium", 15, 4
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What has Sam been scared of since childhood?",  -- Clowns
    "Medium", 10, 4
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is the license plate # of Dean's Chevy Impala during all of Season 1 & most of Season 2?",  -- KAZ 2Y5
    "Hard", 25, 4
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Which angel used a human vessel named ""Alfie"" who worked at Weiner Hut?",  -- Samandriel
    "Medium", 15, 4
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is the name of the FBI agent that pursues the Winchesters, believing them to be serial killers?",  -- Victor Henriksen
    "Medium", 15, 4
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is Dean Winchester's favorite dessert?",  -- Pie
    "Easy", 10, 4
);
*/


-- QUESTIONS - Game 5
/*
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Who poses as Mad-Eye Moody, Harry's 4th Year Defense Against the Dark Arts Professor?",  -- Barty Crouch, Jr.
    "Medium", 15, 5
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Who is Grawp?",  -- Hagrid's Half-Brother
    "Hard", 25, 5
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is the identity of Ron's pet rat, Scabbers?",  -- Peter Pettigrew
    "Easy", 10, 5
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"How did Hermione take extra lessons during her third year?",  -- Time-Turner
    "Medium", 20, 5
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What does Lavender Brown call Ron?",  -- Won-Won
    "Medium", 15, 5
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What type of dragon did Harry face in his first Tri-Wizard Tournament task?",  -- Hungarian Horntail
    "Medium", 20, 5
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"When Dumbledore and Harry first visit Horace Slughorn, what is he disguised as?",  -- An Armchair
    "Medium", 15, 5
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Other than Harry, what other witch/wizard could have been the object of the prophecy regarding Voldemort's downfall?",  -- Neville Longbottom
    "Hard", 20, 5
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"Which character ended up becoming a professional Quidditch player?",  -- Ginny Weasley
    "Hard", 20, 5
);
INSERT INTO u937509157_jonahc.table_trivia_questions (trivia_question, question_difficulty, point_value, id_trivia_game)
VALUES (
	"What is the name of the North American School of Witchcraft and Wizardry?",  -- Ilvermorny
    "Hard", 25, 5
);
*/




/*********************
*** ADDING ANSWERS ***
**********************/


-- ANSWERS - Game 1
/*
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Brooklyn",  -- Where is Captain America from?
    1
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Strategic Homeland Intervention, Enforcement and Logistics Division",  -- What does S.H.I.E.L.D. stand for?
    2
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Peggy Carter",  -- Sharon Carter is the biological niece of which character?
    3
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Lieutenant Trouble",  -- What is Carol Danvers' nickname for Monica Rambeau
    4
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Zemo",  -- Who was responsible for King T'Chaka's Death?
    5
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Strawberries",  -- What is Pepper Potts allergic to?
    6
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Left",  -- Nick Fury wears an eye patch over which eye?
    7
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Rocket Raccoon",  -- Bradley Cooper plays the voice for which MCU character?
    8
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Fortnite",  -- What video game did Thor play in Avengers: Endgame?
    9
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"3",  -- How many children does Hawkeye have?
    10
);
*/


-- ANSWERS - Game 2
/*
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Blue",  -- What color is the sunset on Mars?
    11
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Mercury",  -- Which planet is closest to the Sun?
    12
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Jupiter",  -- Which planet has the largest ocean?
    13
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Solar Storms",  -- What are the storms produced by the Sun called?
    14
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Venus",  -- What is the hottest planet in the Solar System?
    15
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Earth",  -- What is the only planet not named after a God?
    16
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Peggy Whitson",  -- Who was the first female commander of the International Space Station (ISS)?
    17
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Alpha Centauri",  -- Which star is nearest to Earth?
    18
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Gemini",  -- Which constellation contains the stars Castor and Pollux?
    19
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Earth",  -- What is the densest planet in our Solar System?
    20
);
*/


-- ANSWERS - Game 3
/*
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Femur",  -- What is the largest bone in the human body?
    21
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"2",  -- How many sets of wings do bees have?
    22
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Echolocation",  -- What process do bats use to locate their prey?
    23
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"4",  -- How many states of matter are there?
    24
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Richter Scale",  -- How do scientists measure the severity of an earthquake?
    25
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"118",  -- How many elements are listed in the periodic table?
    26
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Bamboo",  -- What is the name of the tallest grass on Earth?
    27
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Hydrogen",  -- What is the most abundant element in the universe?
    28
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Water",  -- Does sound travel faster in the air or in water?
    29
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"-40 Degrees",  -- At what temperature are Celsius and Fahrenheit equal?
    30
);
*/


-- ANSWERS - Game 4
/*
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Rick Springfield",  -- Which 80's rock star is possessed by Lucifer in Season 12 of Supernatural?
    31
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Metatron",  -- What is the name of the angel that wrote the Word of God tablets?
    32
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Kevin Tran",  -- Who was chosen as a Prophet of the Lord to interpret the Word of God after Sam and Dean discovered the slab of stone?
    33
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Dean",  -- Who kills Hitler in Season 12?
    34
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"The Hobbit",  -- What book does Charlie read to her comatose mother?
    35
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Clowns",  -- What has Sam been scared of since childhood?
    36
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"KAZ 2Y5",  -- What is the license plate # of Dean's Chevy Impala during all of Season 1 & most of Season 2?
    37
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Samandriel",  -- Which angel used a human vessel named "Alfie" who worked at Weiner Hut?
    38
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Victor Henriksen",  -- What is the name of the FBI agent that pursues the Winchesters, believing them to be serial killers?
    39
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Pie",  -- What is Dean Winchester's favorite dessert?
    40
);
*/


-- ANSWERS - Game 5
/*
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Barty Crouch, Jr.",  -- Who poses as Mad-Eye Moody, Harry's 4th Year Defense Against the Dark Arts Professor?
    41
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Hagrid's Half-Brother",  -- Who is Grawp?
    42
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Peter Pettigrew",  -- What is the identity of Ron's pet rat, Scabbers?
    43
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Time-Turner",  -- How did Hermione take extra lessons during her third year?
    44
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Won-Won",  -- What does Lavender Brown call Ron?
    45
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Hungarian Horntail",  -- What type of dragon did Harry face in his first Tri-Wizard Tournament task?
    46
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"An Armchair",  -- When Dumbledore and Harry first visit Horace Slughorn, what is he disguised as?
    47
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Neville Longbottom",  -- Other than Harry, what other witch/wizard could have been the object of the prophecy regarding Voldemort's downfall?
    48
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Ginny Weasley",  -- Which character ended up becoming a professional Quidditch player?
    49
);
INSERT INTO u937509157_jonahc.table_trivia_answers (trivia_answer, id_question)
VALUES (
	"Ilvermorny",  -- What is the name of the North American School of Witchcraft and Wizardry?
    50
);
*/




/*******************
*** ADDING HINTS ***
********************/


-- HINTS - Game 1
/*
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"QUOTE: ""I'm just a kid from ____.""",  -- Where is Captain America from?  -  Brooklyn
    1
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"There is an ""and"" between the 'E' and 'L'.",  -- What does S.H.I.E.L.D. stand for?  -  Strategic Homeland Intervention, Enforcement and Logistics Division
    2
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"One of the founders of S.H.I.E.L.D.",  -- Sharon Carter is the biological niece of which character?  -  Peggy Carter
    3
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"Includes a military rank",  -- What is Carol Danvers' nickname for Monica Rambeau?  -  Lieutenant Trouble
    4
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"Baron [First Name] ____",  -- Who was responsible for King T'Chaka's death?  -  Zemo
    5
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"It is a fruit.",  -- What is Pepper Potts allergic to?  -  Strawberries
    6
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"You have a 50/50 chance of getting this correct - hehehe",  -- Nick Fury wears an eye patch over which eye?  -  Left
    7
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"A member of the Guardians of the Galaxy",  -- Bradley Cooper plays the voice for which MCU character?  -  Rocket Raccoon
    8
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"In this game, a player called ""NoobMaster69"" called Korg a dickhead.",  -- What video game did Thor play in Avengers: Endgame?  -  Fortnite
    9
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"Less than 10 & more than 0 - hehehe",  -- How many children does Hawkeye have?  -  3
    10
);
*/


-- HINTS - Game 2
/*
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"It is a primary color.",  -- What color is the sunset on Mars?  -  Blue
    11
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"It is also the smallest planet in the Solar System.",  -- Which planet is closest to the sun?  -  Mercury
    12
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"It is the 5th planet from the Sun.",  -- Which planet has the largest ocean?  -  Jupiter
    13
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"____ Storms.",  -- What are the storms produced by the Sun called?  -  Solar Storms
    14
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"It is the 2nd planet from the Sun.",  -- What is the hottest planet in the Solar System?  -  Venus
    15
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"Gaia = ____?",  -- What is the only planet not named after a God?  -  Earth
    16
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"The mission took place in 2002, as a member of Expedition 5.",  -- Who was the first female commander of the International Space Station (ISS)?  -  Peggy Whitson
    17
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"Located in the Centaurus constellation.",  -- Which star is nearest to Earth?  -  Alpha Centauri
    18
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"A constellation of the zodiac.",  -- Which constellation contains the stars Castor and Pollux?  -  Gemini
    19
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"It is a rocky planet.",  -- What is the densest planet in our Solar System?  -  Earth
    20
);
*/


-- HINTS - Game 3
/*
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"Located in the leg region.",  -- What is the largest bone in the human body?  -  Femur
    21
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"Set = 2",  -- How many sets of wings do bees have?  -  2
    22
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"Sound",  -- What process do bats use to locate their prey?  -  Echolocation
    23
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"Think of water ""transformations"".",  -- How many states of matter are there?  -  4
    24
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"This system depicts a quantitative measure of an earthquake's magnitude.",  -- How do scientists measure the severity of an earthquake?  -  Richter Scale
    25
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"Over 100",  -- How many elements are listed in the periodic table?  -  118
    26
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"Pandas eat this.",  -- What is the name of the tallest grass on Earth?  -  Bamboo
    27
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"This element has a low atomic number.",  -- What is the most abundant element in the universe?  -  Hydrogen
    28
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"50/50 chance - hehehe",  -- Does sound travel faster in the air or in water?  -  Water
    29
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"It is below zero.",  -- At what temperature are Celsius and Fahrenheit equal?  -  -40 Degrees
    30
);
*/


-- HINTS - Game 4
/*
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"He is actually an Australian-American musician/actor, and was a member of 'Zoot' from 1969-1971.",  -- Which 80's rock star is possessed by Lucifer in Season 12 of Supernatural?  -  Rick Springfield
    31
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"When first learning of him, Sam misunderstood his name to be that of a Transformers Decepticon.",  -- What is the name of the angel that wrote the Word of God tablets?  -  Metatron
    32
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"He is/was an Advanced Placement student in High School.",  -- Who was chosen as a Prophet of the Lord to interpret the Word of God after Sam and Dean discovered the slab of stone?  -  Kevin Tran
    33
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"He loves to brag about it!",  -- Who kills Hitler in Season 12?  -  Dean
    34
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"Her mother read it to her when she was young.",  -- What book does Charlie read to her comatose mother?  -  The Hobbit
    35
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"This fear likely came from Dean often leaving Sam at Plucky Pennywhistle's Magical Menagerie as children.",  -- What has Sam been scared of since childhood?  -  Clowns
    36
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"The plate was changed after having to lay low from the FBI starting in Season 2.",  -- What is the license plate # of Dean's Chevy Impala during all of Season 1 & most of Season 2?  -  KAZ 2Y5
    37
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"He first appeared in a supernatural auction that was selling the Word of God.",  -- Which angel used a human vessel named "Alfie" who worked at Weiner Hut?  -  Samandriel
    38
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"He first appears on the show when Sam and Dean are hunting a Shapeshifter in a bank ""heist"".",  -- What is the name of the FBI agent that pursues the Winchesters, believing them to be serial killers?  -  Victor Henriksen
    39
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"He always asks Sam to get some when Sam is leaving to get food.",  -- What is Dean Winchester's favorite dessert?  -  Pie
    40
);
*/


-- HINTS - Game 5
/*
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"In the movie, he had a tic of flicking his tongue.",  -- Who poses as Mad-Eye Moody, Harry's 4th Year Defense Against the Dark Arts Professor?  -  Barty Crouch, Jr.
    41
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"He resides in the Forbidden Forest (Book 5).",  -- Who is Grawp?  -  Hagrid's Half-Brother
    42
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"This person's actions framed Sirius Black to a sentence of Azkaban.",  -- What is the identity of Ron's pet rat, Scabbers?  -  Peter Pettigrew
    43
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"She was able to go back in time to attend classes that occur simultaneously.",  -- How did Hermione take extra lessons during her third year?  -  Time-Turner
    44
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"It is a pet name she gives to Ron (Book 6).",  -- What does Lavender Brown call Ron?  -  Won-Won
    45
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"The name includes a country located in Central Europe.",  -- What type of dragon did Harry face in his first Tri-Wizard Tournament task?  -  Hungarian Horntail
    46
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"It is a piece of furniture that one sits on.",  -- When Dumbledore and Harry first visit Horace Slughorn, what is he disguised as?  -  An Armchair
    47
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"This character inevitably ends up destroying the last horcrux, embedded within Nagini.",  -- Other than Harry, what other witch/wizard could have been the object of the prophecy regarding Voldemort's downfall?  -  Neville Longbottom
    48
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"This person joined the Griffindor Quidditch team as the Seeker in Book 5.",  -- Which character ended up becoming a professional Quidditch player?  -  Ginny Weasley
    49
);
INSERT INTO u937509157_jonahc.table_trivia_hints (question_hint, id_question)
VALUES (
	"First identified on J.K. Rowling's ""Pottermore"" website, and mentioned in the 'Fantastic Beasts and Where to Find Them' films.",  -- What is the name of the North American School of Witchcraft and Wizardry?  -  Ilvermorny
    50
);
*/




/***********************
*** ADDING LOCATIONS ***
************************/


/*
INSERT INTO u937509157_jonahc.table_trivia_locations (location_name, location_address, location_city, location_state, location_zipcode)
VALUES (
	"CBS Television City", "7800 Beverly Blvd", "Los Angeles", "CA", "90036"  -- CBS Television City  (where lots of game shows are filmed)
);
INSERT INTO u937509157_jonahc.table_trivia_locations (location_name, location_address, location_city, location_state, location_zipcode)
VALUES (
	"ABQ Studios", "5650 University Blvd SE", "Albuquerque", "NM", "87106"  -- ABQ Studios  (Where a few Netflix shows are filmed)
);
INSERT INTO u937509157_jonahc.table_trivia_locations (location_name, location_address, location_city, location_state, location_zipcode)
VALUES (
	"L.A. Castle Studios", "154 S Victory Blvd", "Burbank", "CA", "91502"  -- L.A. Castle Studios
);
INSERT INTO u937509157_jonahc.table_trivia_locations (location_name, location_address, location_city, location_state, location_zipcode)
VALUES (
	"Sony Pictures Studios", "10202 W Washington Blvd", "Culver City", "CA", "90232"  -- Sony Pictures Studios
);
INSERT INTO u937509157_jonahc.table_trivia_locations (location_name, location_address, location_city, location_state, location_zipcode)
VALUES (
	"Raleigh Studios Hollywood", "5300 Melrose Ave E", "Los Angeles", "CA", "90038"  -- Raleigh Studios Hollywood
);
*/




/*******************
*** ADDING HOSTS ***
********************/


/*
INSERT INTO u937509157_jonahc.table_trivia_hosts (host_name, host_dob, host_contact, id_trivia_game)
VALUES (
	"Jack Daniels", "08/30/1974", "jackdanielsismyactualname@gmail.com", 1
);
INSERT INTO u937509157_jonahc.table_trivia_hosts (host_name, host_dob, host_contact, id_trivia_game)
VALUES (
	"Ben Dover", "01/15/1970", "bendover@dontbendoveritsjustmyname.com", 2
);
INSERT INTO u937509157_jonahc.table_trivia_hosts (host_name, host_dob, host_contact, id_trivia_game)
VALUES (
	"Tess Tickle", "04/04/1986", "tesstickle@pleasedontcensormyemail.com", 3
);
INSERT INTO u937509157_jonahc.table_trivia_hosts (host_name, host_dob, host_contact, id_trivia_game)
VALUES (
	"Chris P. Bacon", "10/29/1986", "crispybacon@chrisbacon.com", 4
);
INSERT INTO u937509157_jonahc.table_trivia_hosts (host_name, host_dob, host_contact, id_trivia_game)
VALUES (
	"Jed I. Knight", "05/04/1988", "jediknight@coruscant.com", 5
);
*/




/*********************
*** ADDING PLAYERS ***
**********************/


/*
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Charles J. Bell", "charlesjbell@outlook.com", "10/05/1989", "Male", "Computer Systems Analyst", 0, 1
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Michael T. Fuller", "michael_fuller123@gmail.com", "05/30/1974", "Male", "High School Teacher", 0, 1
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Tina J. Thomas", "tinathomas1@gmail.com", "08/12/1990", "Female", "Software Developer", 0, 1
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"William O. Warren", "wow-william@hotmail.com", "09/08/1978", "Male", "Auto Mechanic", 0, 1
);

INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Julia J. Sullivan", "jjsullivan@gmail.com", "03/19/1982", "Female", "Social Worker", 0, 2
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Toni L. Goldner", "tgold@outlook.com", "04/14/1985", "Female", "Mechanical Engineer", 0, 2
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Jameson I. Pouros", "jjjameson_dailybugle@gmail.com", "08/18/1987", "Male", "Reporter", 0, 2
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Blake P. Renner", "bprenner@outlook.com", "10/16/1989", "Male", "Physical Therapist", 0, 2
);

INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Alden M. Gleichner", "aldencleichner@gmail.com", "01/11/1985", "Male", "Marketing Manager", 0, 3
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Lindsay R. Kuhlman", "lindsaykoolkuhlman@gmail.com", "03/08/1969", "Female", "Librarian", 0, 3
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Madie D. Christiansen", "madiechristiansen@gmail.com", "06/22/1971", "Female", "Radiologic Technologist", 0, 3
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Otilia O. Ruecker", "oooruecker@gmail.com", "09/11/1974", "Female", "Paramedic", 0, 3
);

INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Chandler K. Rath", "wrathfulchandler@gmail.com", "06/11/1994", "Male", "Software Engineer", 0, 4
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Blanca B. Breitenberg", "3b-blanca@hotmail.com", "01/16/1976", "Female", "Computer Scientist", 0, 4
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Ronny B. Cruickshank", "ronnybcruickshank@outlook.com", "11/26/1982", "Male", "Massage Therapist", 0, 4
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Tevin H. Jacobi", "tevinjacobi@yahoo.com", "01/15/1994", "Male", "Network Administrator", 0, 4
);

INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Emery G. Gutmann", "emerygutmann1@hotmail.com", "04/15/1988", "Male", "Executive Assistant", 0, 5
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Sierra F. Bernier", "sierrabernier@outlook.com", "08/01/1982", "Female", "College Professor", 0, 5
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Marion P. Feil", "marionfeil22@gmail.com", "12/14/1989", "Female", "Real Estate Agent", 0, 5
);
INSERT INTO u937509157_jonahc.table_trivia_players (player_name, player_contact, player_dob, player_gender, player_occupation, player_trivia_points, id_trivia_game)
VALUES (
	"Dorian E. Gleason", "degleason456@gmail.com", "07/23/1986", "Male", "Automotive Specialty Technician", 0, 5
);
*/

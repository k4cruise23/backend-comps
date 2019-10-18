CREATE TABLE favorite_foods (
food_id SERIAL PRIMARY KEY,
food_name TEXT,
user_id INT
);
create Table people (
people_id SERIAL PRIMARY KEY,
person_name TEXT,
person_id INT
);


SELECT * FROM favorite_foods f
JOIN people p ON P.person_id = f.user_id;
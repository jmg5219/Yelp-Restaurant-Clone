/*This is how to create a table inside a Database*/
CREATE TABLE restaurants (
id serial primary key,
name text,
distance integer,
stars integer,
category text,
favorite_dish text,
takeout text,
last_visit text
);


/*varchar accepts charecters and numbers*/
CREATE TABLE reviewer (
id serial primary key,
name text,
email varchar,
karma integer
);

/*This is how you add foreign keys to your table*/
CREATE TABLE reviews(
    id serial primary key, 
    title text,
    review text, 
    stars integer,
    reviewer_id integer,
    restaurant_id integer,
    FOREIGN KEY (reviewer_id) REFERENCES reviewer (id),
    FOREIGN KEY (restaurant_id) REFERENCES restaurants (id)
);



/*This is how you display the tables within a database*/
\dt


/*This is how you query a database*/

/*The names of all the restaurants in the table.*/
SELECT name FROM restaurants;
/*The names of all restaurants that offer take out.*/
SELECT name FROM restaurants WHERE takeout='Yes';
/*The names of all restaurants that are within 50 miles or less.*/
SELECT name FROM restaurants WHERE distance < 50;
/*The id of a restaurant by a specific restaurant name.*/
SELECT id,name FROM restaurants WHERE name='MCDS';
/*The favorite dishes of all 5-star restaurants.*/
SELECT name,favorite_dish FROM restaurants WHERE stars = 4;



/*displaying contents of the table*/
SELECT * FROM reviews;
SELECT * FROM reviewer;
SELECT name FROM restaurants;


/*This is how you ADD a column to the table*/
ALTER TABLE table_name ADD COLUMN id serial primary key;

/*This is how you update a table change an item*/
UPDATE restaurants SET distance = 10 WHERE id = 3;

UPDATE restaurants SET distance=5, stars=5 WHERE id = 3;

UPDATE restaurants SET category='fast food' WHERE id <=3;


/*Deleting a table*/
DROP TABLE table_name;

/*Deleting an entry in a table*/
DELETE FROM restaurants WHERE id=3;


/*List all the reviews for a given restaurant given a specific restaurant ID.*/
SELECT * FROM reviews WHERE restaurant_id=2;



-- List all the reviews for a given restaurant, given a specific restaurant name.

/*Join reviewer to reeview*/
SELECT * FROM reviews INNER JOIN reviewer on reviews.reviewer_id = reviewer.id;

/*List all the reviews for a given restaurant, given a specific restaurant name.*/
SELECT * FROM reviews INNER JOIN restaurants on reviews.restaurant_id = restaurants.id WHERE restaurants.name = 'MCDS';

/*List all the reviews for a given reviewer, given a specific author name.*/
SELECT * FROM reviews INNER JOIN reviewer on reviews.reviewer_id = reviewer.id WHERE reviewer.name = 'Jai1';

/*List all the reviews along with the restaurant they were written for. In the query result, select the restaurant name and the review text.*/
SELECT name,review FROM reviews INNER JOIN restaurants on reviews.restaurant_id = restaurants.id WHERE restaurants.id = 2;

/*Get the average stars by restaurant. The result should have the restaurant name and its average star rating.*/
SELECT name, AVG(stars) FROM restaurants GROUP BY restaurants.name; 

/*Get the number of reviews written for each restaurant. The result should have the restaurant name and its review count.*/
SELECT name,COUNT(restaurant_id) FROM reviews INNER JOIN restaurants on reviews.restaurant_id = restaurants.id GROUP BY restaurants.name;

/*List all the reviews along with the restaurant, and the reviewer's name. The result should have the restaurant name, the review text, and the reviewer name. Hint: you will need to do a three-way join - i.e. joining all three tables together.*/
SELECT restaurants.id,restaurants.name,review,reviewer.name FROM reviews INNER JOIN reviewer on reviews.reviewer_id = reviewer.id INNER JOIN restaurants on reviews.restaurant_id = restaurants.id ;

/*Get the average stars given by each reviewer. (reviewer name, average star rating)*/
SELECT reviewer.name,AVG(stars) FROM reviews INNER JOIN reviewer on reviews.reviewer_id = reviewer.id GROUP BY reviewer.name;

/*Get the lowest star rating given by each reviewer. (reviewer name, lowest star rating)*/
SELECT reviewer.name,MIN(stars) FROM reviews INNER JOIN reviewer on reviews.reviewer_id = reviewer.id GROUP BY reviewer.name;

/*Get the number of restaurants in each category. (category name, restaurant count)*/
SELECT category,COUNT(id) FROM restaurants GROUP BY category;

/*Get number of 5 star reviews given by restaurant. (restaurant name, 5-star count)*/
SELECT 


SELECT restaurants.name, COUNT(restaurants.stars) FROM restaurants, review WHERE review.restaurant_id = restaurants.id AND review.stars = 5 GROUP BY restaurants.name; 

/*This will clear the terminal*/
\! clear


-- //For pulling in reviews in the detailModel
SELECT * FROM reviews INNER JOIN reviewer on reviews.reviewer_id = reviewer.id INNER JOIN restaurants on reviews.restaurant_id = restaurants.id WHERE restaurant_id =$1 ;

SELECT * FROM reviews WHERE restaurant_id =$1;

-- for updating
SELECT restaurants.id,restaurants.name,review,reviewer.name FROM reviews INNER JOIN reviewer on reviews.reviewer_id = reviewer.id INNER JOIN restaurants on reviews.restaurant_id = restaurants.id ;
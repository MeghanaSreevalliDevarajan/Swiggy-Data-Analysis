CREATE TABLE swiggy(
id INT,
area VARCHAR(200),
city VARCHAR(200),
restaurant VARCHAR(250),
price DECIMAL(10,2),
avg_ratings DECIMAL(3,2),
total_ratings INT,
food_type TEXT,
address TEXT,
delivery_time INT
);

SELECT * FROM swiggy;


-- Total Number of Records

SELECT COUNT(*)
FROM swiggy;

-- Identifying Null Values


SELECT * FROM swiggy
WHERE id IS NULL
OR area IS NULL
OR city IS NULL
OR price IS NULL
OR avg_ratings IS NULL
OR total_ratings IS NULL
OR food_type IS NULL
OR address IS NULL
OR delivery_time IS NULL;

-- Identifying Duplicate Values

SELECT id,COUNT(*)
FROM swiggy
GROUP BY id
HAVING COUNT(*)>1;


-- List of Cities Where Swiggy is Accessible

SELECT DISTINCT city
FROM swiggy
GROUP BY city;


-- Finding the range of ratings

SELECT MIN(avg_ratings),MAX(avg_ratings)
FROM swiggy;


-- Total Restaurants in Each City

SELECT city,COUNT(*) AS total_restaurants
FROM swiggy
GROUP BY city
ORDER BY total_restaurants DESC;


--Top 10 Highest Rated Restuarants 

SELECT restaurant,city,avg_ratings
FROM swiggy
ORDER BY avg_ratings DESC
LIMIT 10;


-- Average rating by city

SELECT city,
ROUND(AVG(avg_ratings),2) AS average_rating
FROM swiggy
GROUP BY city
ORDER BY average_rating DESC;


-- Average Delivery Time by City

SELECT city,
ROUND(AVG(delivery_time),2) AS average_delivery_time
FROM swiggy
GROUP BY city
ORDER BY average_delivery_time;


-- Top 10 Expensive Restaurants

SELECT restaurant,city,price
FROM swiggy
ORDER BY price DESC
LIMIT 10;


-- Restaurants with Rating Above 4.5

SELECT restaurant,city,avg_ratingS
FROM swiggy
WHERE avg_ratingS>4.5
ORDER BY avg_ratingS DESC;

-- List Of Restaurants Delivering within 30min

SELECT restaurant,city,delivery_time
FROM swiggy
WHERE delivery_time<=30
ORDER BY delivery_time;


-- Top 10 Areas With more Restaurants

SELECT area,
COUNT(*) AS total_restaurants
FROM swiggy
GROUP BY area
ORDER BY total_restaurants DESC
LIMIT 10;


-- Average Dish Price bu city

SELECT city,
ROUND(AVG(price),2) AS average_price
FROM swiggy
GROUP BY city
ORDER BY average_price ASC;


-- Top 5 Restaurants in Each City

SELECT *
FROM(
SELECT city,
restaurant,
avg_ratings,
RANK() OVER(PARTITION BY city ORDER BY avg_ratings) AS rank
FROM swiggy
)
WHERE rank<=5;


-- Restaurants with Delivery Time less than City Average


SELECT restaurant,city,delivery_time
FROM swiggy
WHERE delivery_time<(SELECT AVG(delivery_time)
FROM swiggy);


-- Average Price By Food Type

SELECT food_type,
ROUND(AVG(price),2) AS average_price
FROM swiggy
GROUP BY food_type
ORDER BY average_price DESC;






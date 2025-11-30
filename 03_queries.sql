-- Top 10 movies by rating
SELECT m.title, AVG(r.rating) AS avg_rating
FROM movies m
JOIN ratings r ON m.movie_id = r.movie_id
GROUP BY m.title
ORDER BY avg_rating DESC
LIMIT 10;

-- Active users
SELECT u.name, COUNT(r.rating_id) AS total_ratings
FROM users u
JOIN ratings r ON u.user_id = r.user_id
GROUP BY u.name
ORDER BY total_ratings DESC;

-- User similarity
WITH user_similarity AS (
    SELECT r1.user_id AS user_a, r2.user_id AS user_b, COUNT(*) AS common_movies
    FROM ratings r1
    JOIN ratings r2 ON r1.movie_id = r2.movie_id
    WHERE r1.user_id != r2.user_id
    GROUP BY r1.user_id, r2.user_id
)
SELECT * FROM user_similarity
ORDER BY common_movies DESC;
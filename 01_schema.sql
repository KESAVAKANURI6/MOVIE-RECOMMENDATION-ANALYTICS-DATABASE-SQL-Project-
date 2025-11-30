CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(255),
    release_year INT,
    duration INT
);
CREATE TABLE genres (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50)
);
CREATE TABLE movie_genres (
    movie_id INT REFERENCES movies(movie_id),
    genre_id INT REFERENCES genres(genre_id),
    PRIMARY KEY (movie_id, genre_id)
);
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    name VARCHAR(100),
    country VARCHAR(100)
);
CREATE TABLE ratings (
    rating_id INT PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    movie_id INT REFERENCES movies(movie_id),
    rating DECIMAL(2,1),
    rated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

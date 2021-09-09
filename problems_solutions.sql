-- solution1
SELECT * FROM users 
ORDER BY created_at 
LIMIT 5;
-- solution 2
SELECT 
    DAYNAME(created_at) AS day,
    COUNT(*) AS total
FROM users
GROUP BY day
ORDER BY total DESC
LIMIT 2;
-- solution 3
SELECT username FROM users 
LEFT JOIN photos ON user_id=users.id 
WHERE image_url IS NULL;
-- solution 4
SELECT 
    username,
    photos.id,
    photos.image_url, 
    COUNT(*) AS total
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 1;
-- solution 5
-- avg no of photos per user_id
SELECT
(SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users)
AS Avg; 

-- solution 6
SELECT tag_name,COUNT(*) AS total FROM tags JOIN photo_tags ON tag_id=tags.id GROUP BY tags.id ORDER BY total DESC LIMIT 5;

-- SOLUTION 7
SELECT username, 
       Count(*) AS num_likes 
FROM   users 
       INNER JOIN likes 
               ON users.id = likes.user_id 
GROUP  BY likes.user_id 
HAVING num_likes = (SELECT Count(*) 
                    FROM   photos); 
                    
-- Solution 8
SELECT username,comment_text FROM users LEFT JOIN comments ON comments.user_id=users.id WHERE comment_text IS NULL;
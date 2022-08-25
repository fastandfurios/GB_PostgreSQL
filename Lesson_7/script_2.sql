WITH all_video_with_photo AS (
SELECT
    first_name,
    count(photo.id) OVER (PARTITION BY users.id) AS foto_count,
    count(video.id) OVER (PARTITION BY users.id) AS video_count
    FROM users
        LEFT JOIN video
        ON users.id = video.owner_id
        LEFT JOIN photo
        ON users.id = photo.owner_id
)
SELECT DISTINCT
    first_name,
    foto_count,
    video_count,
    dense_rank() OVER (ORDER BY foto_count DESC) AS foto_rank,
    dense_rank() OVER (ORDER BY video_count DESC) AS video_rank
    FROM all_video_with_photo
    ORDER BY foto_rank;
-- Find daily new users in the last 365 days
SELECT 
  registration_date,
  COUNT(*) AS user_count
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 365 DAY
GROUP BY registration_date
ORDER BY registration_date DESC;


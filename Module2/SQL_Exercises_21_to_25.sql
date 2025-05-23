
-- 21. Top Feedback Providers
-- List top 5 users who have submitted the most feedback entries.
SELECT 
  u.full_name,
  COUNT(f.feedback_id) AS feedback_count
FROM Users u
JOIN Feedback f ON u.user_id = f.user_id
GROUP BY u.user_id
ORDER BY feedback_count DESC
LIMIT 5;

-- 22. Duplicate Registrations Check
-- Detect if a user has been registered more than once for the same event.
SELECT 
  user_id,
  event_id,
  COUNT(*) AS registration_count
FROM Registrations
GROUP BY user_id, event_id
HAVING COUNT(*) > 1;

-- 23. Registration Trends
-- Show a month-wise registration count trend over the past 12 months.
SELECT 
  DATE_FORMAT(registration_date, '%Y-%m') AS month,
  COUNT(*) AS registration_count
FROM Registrations
WHERE registration_date >= CURDATE() - INTERVAL 12 MONTH
GROUP BY month
ORDER BY month;

-- 24. Average Session Duration per Event
-- Compute the average duration (in minutes) of sessions in each event.
SELECT 
  e.title AS event_title,
  AVG(TIMESTAMPDIFF(MINUTE, s.start_time, s.end_time)) AS avg_duration_minutes
FROM Events e
JOIN Sessions s ON e.event_id = s.event_id
GROUP BY e.event_id;

-- 25. Events Without Sessions
-- List all events that currently have no sessions scheduled under them.
SELECT 
  e.title AS event_title
FROM Events e
LEFT JOIN Sessions s ON e.event_id = s.event_id
WHERE s.session_id IS NULL;

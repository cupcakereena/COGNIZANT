
-- 16. Unregistered Active Users
-- Find users who created an account in the last 30 days but haven’t registered for any events.
SELECT 
  full_name, email, registration_date
FROM Users
WHERE registration_date >= CURDATE() - INTERVAL 30 DAY
AND user_id NOT IN (
    SELECT DISTINCT user_id FROM Registrations
);

-- 17. Multi-Session Speakers
-- Identify speakers who are handling more than one session across all events.
SELECT 
  speaker_name,
  COUNT(*) AS session_count
FROM Sessions
GROUP BY speaker_name
HAVING COUNT(*) > 1;

-- 18. Resource Availability Check
-- List all events that do not have any resources uploaded.
SELECT 
  e.title AS event_title
FROM Events e
LEFT JOIN Resources r ON e.event_id = r.event_id
WHERE r.event_id IS NULL;

-- 19. Completed Events with Feedback Summary
-- For completed events, show total registrations and average feedback rating.
SELECT 
  e.title AS event_title,
  COUNT(DISTINCT r.registration_id) AS total_registrations,
  AVG(f.rating) AS avg_rating
FROM Events e
LEFT JOIN Registrations r ON e.event_id = r.event_id
LEFT JOIN Feedback f ON e.event_id = f.event_id
WHERE e.status = 'completed'
GROUP BY e.event_id;

-- 20. User Engagement Index
-- For each user, calculate how many events they attended and how many feedbacks they submitted.
SELECT 
  u.full_name,
  COUNT(DISTINCT r.event_id) AS events_attended,
  COUNT(DISTINCT f.feedback_id) AS feedbacks_submitted
FROM Users u
LEFT JOIN Registrations r ON u.user_id = r.user_id
LEFT JOIN Feedback f ON u.user_id = f.user_id
GROUP BY u.user_id;

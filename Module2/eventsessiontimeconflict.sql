-- Insert overlapping sessions to test session time conflict detection
INSERT INTO Sessions (event_id, title, speaker_name, start_time, end_time)
VALUES 
(1, 'Conflicting Session A', 'Speaker A', '2025-06-10 10:30:00', '2025-06-10 11:30:00'),
(1, 'Conflicting Session B', 'Speaker B', '2025-06-10 11:00:00', '2025-06-10 12:00:00');

-- Query to detect overlapping sessions within the same event
SELECT 
  s1.event_id,
  s1.title AS session_1,
  s2.title AS session_2,
  s1.start_time, s1.end_time,
  s2.start_time, s2.end_time
FROM Sessions s1
JOIN Sessions s2 
  ON s1.event_id = s2.event_id 
  AND s1.session_id < s2.session_id
  AND s1.start_time < s2.end_time 
  AND s1.end_time > s2.start_time;


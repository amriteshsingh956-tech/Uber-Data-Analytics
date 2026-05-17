SELECT 
MIN(requested_at) AS start_date,
MAX(requested_at) AS end_date
FROM trips;

SELECT COUNT(*) AS total_trips
FROM trips;

SELECT COUNT(*) AS completed_trips
FROM trips
WHERE status = 'completed';

SELECT COUNT(*) AS cancelled_trips
FROM trips
WHERE status = 'cancelled';

SELECT ROUND(SUM(total_fare),2) AS total_revenue
FROM trips;

SELECT ROUND(AVG(total_fare),2) AS avg_fare
FROM trips;

SELECT ROUND(AVG(distance_km),2) AS avg_distance
FROM trips;

SELECT payment_method,
COUNT(*) AS total_transactions
FROM trips
GROUP BY payment_method
ORDER BY total_transactions DESC;
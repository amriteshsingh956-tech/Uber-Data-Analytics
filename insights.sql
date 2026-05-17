SELECT HOUR(requested_at) AS booking_hour,
COUNT(*) AS total_trips
FROM trips
GROUP BY booking_hour
ORDER BY total_trips DESC;

SELECT driver_id,
COUNT(*) AS total_trips
FROM trips
GROUP BY driver_id
ORDER BY total_trips DESC
LIMIT 10;

SELECT rider_id,
COUNT(*) AS total_rides
FROM trips
GROUP BY rider_id
ORDER BY total_rides DESC
LIMIT 10;

SELECT payment_method,
ROUND(SUM(total_fare),2) AS revenue
FROM trips
GROUP BY payment_method
ORDER BY revenue DESC;

SELECT ROUND(AVG(surge_multiplier),2)
AS avg_surge
FROM trips;

SELECT trip_id,
distance_km,
duration_mins
FROM trips
ORDER BY distance_km DESC
LIMIT 10;

SELECT ROUND(AVG(duration_mins),2)
AS avg_trip_duration
FROM trips;

SELECT status,
COUNT(*) AS total_trips
FROM trips
GROUP BY status;

SELECT DATE(requested_at) AS trip_date,
COUNT(*) AS total_trips
FROM trips
GROUP BY trip_date
ORDER BY trip_date;

SELECT DAYNAME(requested_at) AS day_name,
COUNT(*) AS total_trips
FROM trips
GROUP BY day_name
ORDER BY total_trips DESC;


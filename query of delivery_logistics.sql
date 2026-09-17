CREATE DATABASE delivery_logistics;
USE delivery_logistics;
SELECT * FROM delivery_logistics;

-- WHICE ARE THE TOP 5 DELIVERY PARTNERS BY NO. OF DELIVERIES?
SELECT 
    delivery_partner, COUNT(delivery_id) AS Total_deliveries
FROM
    delivery_logistics
GROUP BY delivery_partner
ORDER BY Total_deliveries DESC
LIMIT 5;

-- WHICH DELIVERY PARTNER HAS THE HIGHEST DELIVEY FAILURE RATE?
SELECT 
    delivery_partner,
    COUNT(*) AS total_deliveries,
    SUM(CASE
        WHEN delivery_status = 'failed' THEN 1
        ELSE 0
    END) AS failed_deliveries,
    ROUND(SUM(CASE
                WHEN delivery_status = 'failed' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS failure_rate
FROM
    delivery_logistics
GROUP BY delivery_partner
ORDER BY failure_rate DESC
LIMIT 1;

-- WHICH DELIVER PARTNER HAS THE HIGHEST ON TIME DELIVERY RATE?
SELECT 
    delivery_partner,
    COUNT(*) AS total_deliveries,
    SUM(CASE
        WHEN delivery_time_hours <= expected_time_hours THEN 1
        ELSE 0
    END) AS on_time_deliveries,
    ROUND(SUM(CASE
                WHEN delivery_time_hours <= expected_time_hours THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS on_time_deliveries
FROM
    delivery_logistics
GROUP BY delivery_partner
ORDER BY on_time_deliveries DESC
LIMIT 1;

-- WHICH DELIVER PARTNER HAS THE HIGHEST AVERAGE  DELIVERY COST?
SELECT 
    delivery_partner,
    ROUND(AVG(delivery_cost), 2) AS average_delivery_cost
FROM
    delivery_logistics
GROUP BY delivery_partner
ORDER BY average_delivery_cost DESC;

-- HOW MANY DELIVERIES WERE SUCCESSFUL AND HOW MANY FAILED?
SELECT 
    delivery_status, COUNT(*) AS total_deliveries
FROM
    delivery_logistics
GROUP BY delivery_status;

-- WHICH VEHICLE HAVE THE HIGHEST NO. OF DELIVERY FAILURES?
SELECT 
    vehicle_type, COUNT(*) AS delivery_failures
FROM
    delivery_logistics
WHERE delivery_status = 'failed'
GROUP BY vehicle_type
ORDER BY delivery_failures DESC;

-- WHICH DELIVERY MODE HAS THE HIGHEST AVERAGE DELIVERY COST?
SELECT 
    delivery_mode, ROUND(AVG(delivery_cost), 2) AS avg_delivery_cost
FROM
    delivery_logistics
GROUP BY delivery_mode
ORDER BY avg_delivery_cost DESC;

-- WHICH PACKAGE TYPE HAS THE HIGHEST AVERAGE DELIVERY RATING?
SELECT 
    package_type, ROUND(AVG(delivery_rating), 2) AS avg_delivery_rating
FROM
    delivery_logistics
GROUP BY package_type
ORDER BY avg_delivery_rating DESC;

-- HOW DOES WEATHER CONDITION AFFECT AVERAGE DELIVERY TIME?
SELECT 
    weather_condition,
    ROUND(AVG(delivery_time_hours), 2) AS avg_delivery_time
FROM
    delivery_logistics
GROUP BY weather_condition
ORDER BY avg_delivery_time DESC;

-- WHICH DELIVERY PARTNERS HAVE A HIGH FAILURE AND HIGH AVERAGE DELIVERY COST?
SELECT 
    delivery_partner,
    ROUND(SUM(CASE
                WHEN delivery_status = 'failed' THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),
            2) AS failure_rate,
    ROUND(AVG(delivery_cost), 2) AS avg_delivery_cost
FROM delivery_logistics
GROUP BY delivery_partner
ORDER BY failure_rate DESC;

-- WHICH PACKAGE TYPE TAKES THE LONGEST TO DELIVERY ON AVERAGE?
SELECT 
    package_type, ROUND(AVG(delivery_time_hours), 2) AS avg_delivery_time
FROM
    delivery_logistics
GROUP BY package_type
ORDER BY avg_delivery_time DESC;

-- WHICH DELIVERY PARTNERS PERFORM ABOVE THE OVERALL AVERAGE ON TIME DELIVERY RATE?
WITH partner_performance AS (SELECT delivery_partner, SUM(CASE WHEN delivery_time_hours <= expected_time_hours THEN 1 ELSE 0 END) * 100.00 / COUNT(*) AS on_time_rate FROM delivery_logistics GROUP BY delivery_partner) SELECT delivery_partner, ROUND(on_time_rate, 2) AS on_time_rate FROM partner_performance WHERE on_time_rate > (SELECT AVG(on_time_rate) FROM partner_performance) ORDER BY on_time_rate DESC;

-- WHICH DELIVERY PARTNER HAVE A FAILURE RATE HIGHER THAN THE OVERALL FAILURE RATE?
WITH failure_performance AS 
(SELECT delivery_partner, SUM(CASE 
WHEN delivery_status = 'failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS failure_rate 
FROM delivery_logistics GROUP BY delivery_partner) SELECT delivery_partner, ROUND(failure_rate, 2) AS
 failure_rate FROM failure_performance
 WHERE failure_rate > 
 (
 SELECT SUM(CASE WHEN delivery_status = 'failed' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)
 FROM delivery_logistics) ORDER BY failure_rate DESC;
 
-- DOES LONGER DELIVERY DISTANCE LEAD TO HIGHER DELIVERY COST?
SELECT 
    CASE
        WHEN distance_km <= 50 THEN '0-50 km'
        WHEN distance_km <= 100 THEN '51-100 km'
        WHEN distance_km <= 150 THEN '101-150 km'
        WHEN distance_km <= 200 THEN '151-250 km'
        ELSE '201-250 km'
    END AS distance_range,
    COUNT(*) AS total_deliveries,
    ROUND(AVG(delivery_cost), 2) AS avg_delivery_cost
    FROM delivery_logistics
    GROUP BY distance_range
    ORDER BY avg_delivery_cost DESC;
    
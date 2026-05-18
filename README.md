
# 🚖 UBER RideShare Analytics using MySQL and User Data Visualization Using Tableau

## 📌 Project Overview
This project focuses on analyzing ride-sharing operational data using MySQL to derive business insights related to trip demand, revenue generation, driver performance, rider activity, cancellations, and surge pricing.

The database simulates a real-world ride-sharing platform similar to Uber, Ola, or Rapido and contains multiple interconnected relational tables.

The project demonstrates SQL skills ranging from beginner to advanced level, including aggregations, filtering, grouping, ranking, KPI analysis, Common Table Expressions (CTEs), and Window Functions.

---

# 🛠️ Tools Used

- MySQL
- MySQL Workbench
- Tableau
- GitHub

---

# 🗂️ Database Tables

| Table | Description |
|---|---|
| `trips` | Stores ride transaction details |
| `drivers` | Driver information |
| `riders` | Rider/customer details |
| `payments` | Payment transaction records |
| `reviews` | Customer reviews and ratings |
| `locations` | Pickup and drop locations |
| `cancellations` | Cancelled trip records |
| `users` | User account information |

---

# 🧩 EER Diagram

The EER diagram represents relationships between all tables in the database.

<img width="933" height="766" alt="image" src="https://github.com/user-attachments/assets/e5015008-1cf5-40df-9058-fee0d51c6d77" />

---

# 📊 SQL Analysis Performed

## 🟢 Beginner Level Queries

### 1. Total Trips Analysis
Calculated the total number of rides available in the dataset.

```sql
SELECT COUNT(*) AS total_trips
FROM trips;
````

### Result

| total_trips |
| ----------- |
| 20000       |

---

### 2. Completed & Cancelled Trips

Compared completed and cancelled rides to evaluate operational efficiency.

```sql
SELECT status,
COUNT(*) AS total_trips
FROM trips
GROUP BY status;
```

### Result

| status      | total_trips |
| ----------- | ----------- |
| completed   | 16827       |
| cancelled   | 2966        |
| in_progress | 207         |

---

### 3. Revenue Analysis

Calculated total platform revenue using aggregate functions.

```sql
SELECT ROUND(SUM(total_fare),2) AS total_revenue
FROM trips;
```

### Result

| total_revenue |
| ------------- |
| 720166.90     |

---

### 4. Average Fare & Distance

Measured average trip fare and average trip distance.

```sql
SELECT 
ROUND(AVG(total_fare),2) AS avg_fare,
ROUND(AVG(distance_km),2) AS avg_distance
FROM trips;
```

### Result

| avg_fare | avg_distance |
| -------- | ------------ |
| 36.01    | 18.01 km     |

---

### 5. Payment Method Usage

Analyzed distribution of payment methods used by riders.

```sql
SELECT payment_method,
COUNT(*) AS total_transactions
FROM trips
GROUP BY payment_method
ORDER BY total_transactions DESC;
```

### Result

| payment_method | total_transactions |
| -------------- | ------------------ |
| card           | 6741               |
| wallet         | 6695               |
| cash           | 6564               |

---

### Concepts Used

* SELECT
* WHERE
* COUNT()
* SUM()
* AVG()
* GROUP BY
* ORDER BY

---

# 🟡 Intermediate Level Queries

### 6. Peak Booking Hours

Analyzed ride demand across different hours of the day.

```sql
SELECT HOUR(requested_at) AS booking_hour,
COUNT(*) AS total_trips
FROM trips
GROUP BY booking_hour
ORDER BY total_trips DESC;
```

### Result

| booking_hour | total_trips |
| ------------ | ----------- |
| 18           | 891         |
| 14           | 889         |
| 08           | 870         |
| 02           | 866         |
| 01           | 866         |

---

### 7. Top Drivers by Ride Count

Identified drivers completing the highest number of rides.

```sql
SELECT driver_id,
COUNT(*) AS total_trips
FROM trips
GROUP BY driver_id
ORDER BY total_trips DESC
LIMIT 10;
```

### Result

| driver_id | total_trips |
| --------- | ----------- |
| 234       | 90          |
| 208       | 90          |
| 337       | 89          |
| 98        | 87          |
| 57        | 86          |

---

### 8. Frequent Riders

Identified riders with high ride frequency.

```sql
SELECT rider_id,
COUNT(*) AS total_rides
FROM trips
GROUP BY rider_id
ORDER BY total_rides DESC
LIMIT 10;
```

### Result

| rider_id | total_rides |
| -------- | ----------- |
| 1136     | 104         |
| 646      | 104         |
| 600      | 104         |
| 67       | 104         |
| 269      | 103         |

---

### 9. Revenue by Payment Method

Compared revenue contribution across payment types.

```sql
SELECT payment_method,
ROUND(SUM(total_fare),2) AS revenue
FROM trips
GROUP BY payment_method
ORDER BY revenue DESC;
```

### Result

| payment_method | revenue   |
| -------------- | --------- |
| card           | 244521.62 |
| wallet         | 240139.29 |
| cash           | 235505.99 |

---

### 10. Surge Pricing Analysis

Measured average surge multiplier and its impact on fares.

```sql
SELECT ROUND(AVG(surge_multiplier),2)
AS avg_surge
FROM trips;
```

### Result

| avg_surge |
| --------- |
| 1.26      |

---

### 11. Long Distance Trips

Analyzed rides with highest trip distances.

```sql
SELECT trip_id,
distance_km,
duration_mins
FROM trips
ORDER BY distance_km DESC
LIMIT 10;
```

### Result

| trip_id | distance_km | duration_mins |
| ------- | ----------- | ------------- |
| 18776   | 60.18       | 47            |
| 16207   | 60.07       | 46            |
| 5912    | 60.00       | 60            |
| 4156    | 59.74       | 39            |
| 17985   | 59.67       | 57            |

---

### Concepts Used

* GROUP BY
* ORDER BY
* LIMIT
* HOUR()
* DATE()
* DAYNAME()

---

# 🔴 Advanced Level Queries

### 12. Driver Revenue Ranking

Ranked drivers based on total earnings using Window Functions.

```sql
SELECT driver_id,
ROUND(SUM(total_fare),2) AS total_revenue,
RANK() OVER(ORDER BY SUM(total_fare) DESC) AS driver_rank
FROM trips
GROUP BY driver_id;
```

---

### 13. Running Revenue Analysis

Calculated cumulative revenue growth over time.

```sql
SELECT DATE(requested_at) AS trip_date,
ROUND(SUM(total_fare),2) AS daily_revenue,
ROUND(SUM(SUM(total_fare)) OVER(ORDER BY DATE(requested_at)),2)
AS running_revenue
FROM trips
GROUP BY trip_date;
```

---

### 14. Trip Duration Segmentation

Classified trips into Short, Medium, and Long categories using CASE statements.

```sql
SELECT
CASE
WHEN duration_mins < 15 THEN 'Short Trip'
WHEN duration_mins BETWEEN 15 AND 40 THEN 'Medium Trip'
ELSE 'Long Trip'
END AS trip_category,
COUNT(*) AS total_trips
FROM trips
GROUP BY trip_category;
```

---

### 15. Cancellation Rate KPI

Calculated cancellation percentage for operational analysis.

```sql
SELECT 
ROUND(
SUM(CASE WHEN status='cancelled' THEN 1 ELSE 0 END)
*100.0/COUNT(*),2
) AS cancellation_rate
FROM trips;
```

### Result

| cancellation_rate |
| ----------------- |
| 14.83%            |

---

### 16. Revenue Contribution Analysis

Measured percentage revenue contribution of drivers.

```sql
SELECT driver_id,
ROUND(SUM(total_fare),2) AS revenue,
ROUND(
SUM(total_fare)*100/
(SUM(SUM(total_fare)) OVER()),2
) AS revenue_percentage
FROM trips
GROUP BY driver_id
ORDER BY revenue DESC;
```

---

### 17. Repeat Rider Analysis

Identified loyal riders using HAVING clause.

```sql
SELECT rider_id,
COUNT(*) AS total_rides
FROM trips
GROUP BY rider_id
HAVING COUNT(*) > 50
ORDER BY total_rides DESC;
```

---

### 18. Driver Efficiency Analysis

Evaluated average fare, duration, and distance for drivers.

```sql
SELECT driver_id,
ROUND(AVG(total_fare),2) AS avg_fare,
ROUND(AVG(duration_mins),2) AS avg_duration,
ROUND(AVG(distance_km),2) AS avg_distance
FROM trips
GROUP BY driver_id;
```

---

### Concepts Used

* Window Functions
* RANK()
* OVER()
* CASE WHEN
* HAVING
* Running Totals
* KPI Analytics
* CTEs

---

# 🧩 UBER USER DATA ANALYTICS USING TABLEAU

<img width="2338" height="1654" alt="image" src="https://github.com/user-attachments/assets/080ffd91-de7b-4b1e-90bc-a04e204cf437" />

---

# 📈 Tableau Dashboard Features

* Interactive KPI Cards
* Revenue Trend Analysis
* Trip Status Distribution
* Ride Demand Heatmaps
* Driver Performance Tracking
* Rider Activity Insights
* Payment Method Visualization
* Surge Pricing Impact Analysis
* Dynamic Filtering & Drilldowns

---

# 💡 Key Insights Derived

* Peak ride demand occurred during evening hours.
* Card payments generated the highest overall revenue.
* Digital payment methods were used more frequently than cash.
* A small percentage of drivers completed the majority of rides.
* Average trip fare was approximately ₹36.
* Average trip distance was approximately 18 km.
* Surge pricing significantly increased fare values during peak periods.
* Medium-duration trips formed the majority of ride activity.
* Repeat riders represented an important customer segment.
* Cancellation rate highlighted opportunities for operational improvement.

---

# 📁 Project Structure

```bash
rideshare-mysql-analytics/
│
├── schema/
│   └── schema.sql
│
├── sql_queries/
│   ├── beginner.sql
│   ├── intermediate.sql
│   └── advanced.sql
│
├── screenshots/
│   ├── eer_diagram.png
│   └── tableau_dashboard.png
│
├── insights.sql
├── rideshare.db
└── README.md
```

---

# 🚀 Skills Demonstrated

* SQL Query Writing
* Relational Database Analysis
* Data Aggregation
* Business KPI Analysis
* Window Functions
* Operational Analytics
* Tableau Dashboarding
* Data Visualization
* Database Design Understanding
* Business Intelligence Reporting

---

# 📌 Future Improvements

* Predictive demand forecasting using Python
* Driver churn prediction
* Rider segmentation analysis
* Real-time dashboard integration
* Geo-spatial trip analysis
* Power BI dashboard integration

---

```
```

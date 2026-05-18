# 🚖 UBER RideShare Analytics using MySQL

## 📌 Project Overview
This project focuses on analyzing ride-sharing operational data using MySQL to derive business insights related to trip demand, revenue generation, driver performance, rider activity, cancellations, and surge pricing.

The database simulates a real-world ride-sharing platform similar to Uber, Ola, or Rapido and contains multiple interconnected relational tables.

The project demonstrates SQL skills ranging from beginner to advanced level, including aggregations, filtering, grouping, ranking, KPI analysis, and Window Functions.

---

# 🛠️ Tools Used

- MySQL
- MySQL Workbench
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

### Total Trips Analysis
Calculated the total number of rides available in the dataset.

### Completed & Cancelled Trips
Compared completed and cancelled rides to evaluate operational efficiency.

### Revenue Analysis
Calculated total platform revenue using aggregate functions.

### Average Fare & Distance
Measured average trip fare and average trip distance.

### Payment Method Usage
Analyzed distribution of payment methods used by riders.

### Concepts Used
- SELECT
- WHERE
- COUNT()
- SUM()
- AVG()
- GROUP BY
- ORDER BY

---

# 🟡 Intermediate Level Queries

### Peak Booking Hours
Analyzed ride demand across different hours of the day.

### Top Drivers by Ride Count
Identified drivers completing the highest number of rides.

### Frequent Riders
Identified riders with high ride frequency.

### Revenue by Payment Method
Compared revenue contribution across payment types.

### Surge Pricing Analysis
Measured average surge multiplier and its impact on fares.

### Long Distance Trips
Analyzed rides with highest trip distances.

### Concepts Used
- GROUP BY
- ORDER BY
- LIMIT
- HOUR()
- DATE()
- DAYNAME()

---

# 🔴 Advanced Level Queries

### Driver Revenue Ranking
Ranked drivers based on total earnings using Window Functions.

### Running Revenue Analysis
Calculated cumulative revenue growth over time.

### Trip Duration Segmentation
Classified trips into Short, Medium, and Long categories using CASE statements.

### Cancellation Rate KPI
Calculated cancellation percentage for operational analysis.

### Revenue Contribution Analysis
Measured percentage revenue contribution of drivers.

### Repeat Rider Analysis
Identified loyal riders using HAVING clause.

### Driver Efficiency Analysis
Evaluated average fare, duration, and distance for drivers.

### Concepts Used
- Window Functions
- RANK()
- OVER()
- CASE WHEN
- HAVING
- Running Totals
- KPI Analytics

---

# 💡 Key Insights Derived

- Peak ride demand occurred during evening hours.
- Digital payment methods were used more frequently than cash.
- A small percentage of drivers completed most rides.
- Surge pricing significantly increased fare values during peak periods.
- Medium-duration trips formed the majority of ride activity.
- Repeat riders represented an important customer segment.
- Cancellation rate highlighted opportunities for operational improvement.

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
│   └── EER Diagram.png
│
├── insights.sql
└── README.md
```

---

# 🚀 Skills Demonstrated

- SQL Query Writing
- Relational Database Analysis
- Business KPI Analysis
- Data Aggregation
- Window Functions
- Operational Analytics
- Database Design Understanding

---

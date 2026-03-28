# Oracle SQL Drone Mission Analysis

This repository contains an Oracle SQL project based on a Drone Mission Tracker database. It demonstrates table creation, sample data loading, and analytical SQL queries using Oracle window functions.

## Project Background

This project was originally completed as part of an MSc class assignment on relational databases and SQL analytic functions. The project scope involved building a relational database for drones and their missions, where one drone can complete many missions and each mission is fulfilled by a single drone.

## Database Structure

The project contains two main tables:

### 1. Drone
Stores drone-level information such as:
- drone ID
- drone name
- manufacturer
- purchase date
- material type
- max speed
- range
- camera type
- primary use
- autonomy level
- GPS availability
- battery type
- owner name
- cost price

### 2. Mission
Stores mission-level information such as:
- mission ID
- drone ID
- mission date
- duration
- start and end location
- distance
- average speed
- max altitude
- payload weight
- mission type
- weather conditions
- data collected
- mission purpose
- mission cost

## Files in this Repository

- **DMT.sql**  
  Contains the Oracle SQL schema creation statements, constraints, inserts, and commit statements for the Drone and Mission tables.

- **analytical_queries.sql**  
  Contains analytical SQL queries written on the Drone and Mission tables using Oracle analytic functions.

## SQL Skills Demonstrated

This project demonstrates:

- Oracle SQL
- DDL and DML
- primary key and foreign key relationships
- filtering and sorting
- analytical / window functions
- ranking functions:
  - `RANK()`
  - `DENSE_RANK()`
  - `ROW_NUMBER()`
- distribution functions:
  - `NTILE()`
  - `PERCENT_RANK()`
  - `CUME_DIST()`
  - `RATIO_TO_REPORT()`
- navigation functions:
  - `LAG()`
  - `LEAD()`
  - `FIRST_VALUE()`
  - `LAST_VALUE()`
  - `NTH_VALUE()`
- rolling totals and rolling averages
- mission-level cost, distance, and data analysis
- joins between relational tables

## Example Analyses Included

Some of the analyses in this project include:

- ranking the earliest missions within each mission type
- identifying the top costliest missions
- splitting data collected into quantiles
- calculating cumulative mission cost
- comparing current missions with previous and next missions
- detecting time gaps between missions
- calculating rolling averages and rolling totals
- measuring range utilisation against drone capacity
- evaluating data collected per kilometre
- ranking drones by mission data contribution

## Why This Project Matters

I added this project to my portfolio to demonstrate practical SQL skills beyond basic querying. It shows how Oracle analytical functions can be used to explore operational data and answer business-style analytical questions.

## Tool Used

- Oracle SQL

## Sample Query Outputs

### ERD: Drone Mission Tracker
![ERD](screenshots/00_erd_drone_mission_tracker.png)

### Rank the earliest missions under each mission type
![Earliest missions by type](screenshots/01_rank_earliest_missions_by_type.png)

### Show the top 10 most expensive missions
![Top 10 costliest missions](screenshots/02_top_10_costliest_missions.png)

### Divide data collected into 5 quantiles by mission type
![Data quantiles by mission type](screenshots/03_data_quantiles_by_mission_type.png)

### Show cumulative mission cost for 2023
![Running cost 2023](screenshots/04_running_cost_2023.png)

### Show the cost difference compared to the previous mission
![Cost difference vs previous mission](screenshots/05_cost_difference_vs_previous_mission.png)

### Show percentage contribution to total data collected
![Data contribution percentage](screenshots/06_data_contribution_percentage.png)

### Show rolling average duration for missions in 2022
![Rolling average duration](screenshots/07_rolling_average_duration_2022.png)

### Analyse how efficiently each mission uses the drone's range
![Range utilisation vs drone capacity](screenshots/08_range_utilisation_vs_drone_capacity.png)

### Rank drones by total data collected from 2024 onwards
![Drone rank by total data](screenshots/09_drone_rank_by_total_data_2024_onwards.png)

## Note

This project was originally completed as part of a class assignment and has been organised here in a cleaner format for portfolio purposes.

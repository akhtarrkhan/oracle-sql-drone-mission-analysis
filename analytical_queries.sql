-- =========================================
-- Oracle SQL Drone Mission Analysis
-- Analytical Queries
-- Project: Drone Mission Tracker (DMT)
-- =========================================

-- Query 1: Rank the earliest three missions under each mission type
SELECT Mission_Id, Mission_Type, Mission_Date, Mission_Rank
FROM (
    SELECT Mission_Id,
           Mission_Type,
           Mission_Date,
           RANK() OVER (
               PARTITION BY Mission_Type
               ORDER BY Mission_Date
           ) AS Mission_Rank,
           MIN(Mission_Date) OVER (
               PARTITION BY Mission_Type
           ) AS First_Mission_Date
    FROM Mission
)
WHERE Mission_Rank <= 3
ORDER BY First_Mission_Date, Mission_Type, Mission_Rank, Mission_Date;


-- Query 2: Rank the first 10 missions by date
SELECT Mission_Id, Mission_Type, Mission_Date, Mission_Rank
FROM (
    SELECT Mission_Id,
           Mission_Type,
           Mission_Date,
           ROW_NUMBER() OVER (
               ORDER BY Mission_Date
           ) AS Mission_Rank
    FROM Mission
)
WHERE Mission_Rank <= 10
ORDER BY Mission_Rank, Mission_Date;


-- Query 3: Show the top 10 most expensive missions
SELECT Mission_Id, Mission_Type, Cost, Costliest_Missions
FROM (
    SELECT Mission_Id,
           Mission_Type,
           Cost,
           DENSE_RANK() OVER (
               ORDER BY Cost DESC
           ) AS Costliest_Missions
    FROM Mission
)
WHERE Costliest_Missions <= 10
ORDER BY Costliest_Missions, Cost DESC;


-- Query 4: Divide data collected into 5 quantiles and show average data by mission type
SELECT Mission_Type, Data_Quantile, AVG(Data_Collected) AS Avg_Data
FROM (
    SELECT Mission_Type,
           Data_Collected,
           NTILE(5) OVER (ORDER BY Data_Collected) AS Data_Quantile
    FROM Mission
)
GROUP BY Mission_Type, Data_Quantile
ORDER BY Mission_Type, Data_Quantile;


-- Query 5: Show missions with more than 850 MB collected for selected weather conditions
SELECT Mission_Id,
       Weather_Conditions,
       Data_Collected,
       ROW_NUMBER() OVER (ORDER BY Data_Collected DESC) AS Data_Rank
FROM Mission
WHERE Weather_Conditions IN ('Windy', 'Hailstones', 'Snow', 'Clear')
  AND Data_Collected > 850;


-- Query 6: Show missions before 2021 and rank them by date within each mission type
SELECT Mission_Type,
       Mission_Id,
       Drone_Id,
       Mission_Date,
       DENSE_RANK() OVER (
           PARTITION BY Mission_Type
           ORDER BY Mission_Date ASC
       ) AS MissionRank
FROM Mission
WHERE Mission_Date < '01-Jan-21'
ORDER BY Mission_Date ASC, Mission_Type, MissionRank;


-- Query 7: Show missions where data collected is 40 percent above the mission type average
SELECT Mission_Id, Mission_Type, Data_Collected, AvgDataByType
FROM (
    SELECT Mission_Id,
           Mission_Type,
           Data_Collected,
           AVG(Data_Collected) OVER (
               PARTITION BY Mission_Type
           ) AS AvgDataByType
    FROM Mission
)
WHERE Data_Collected > AvgDataByType * 1.4
ORDER BY Mission_Type, Data_Collected DESC;


-- Query 8: For missions in 2023, show cumulative cost ordered by mission date
SELECT Mission_Id,
       Drone_Id,
       Mission_Date,
       Cost,
       SUM(Cost) OVER (
           ORDER BY Mission_Date, Mission_Id
           ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
       ) AS RunningCost
FROM Mission
WHERE Mission_Date >= '01-Jan-23'
  AND Mission_Date < '01-Jan-24'
ORDER BY Mission_Date, Mission_Id;


-- Query 9: Show missions whose distance is more than 1.5 times average distance for their purpose
SELECT Mission_Purpose, Mission_Id, Drone_Id, Distance, AvgDistance
FROM (
    SELECT Mission_Purpose,
           Mission_Id,
           Drone_Id,
           Distance,
           AVG(Distance) OVER (
               PARTITION BY Mission_Purpose
           ) AS AvgDistance
    FROM Mission
)
WHERE Distance > AvgDistance * 1.5
ORDER BY Mission_Purpose, Distance DESC;


-- Query 10: For missions in 2023, show difference in cost compared to previous mission
SELECT Mission_Id,
       Mission_Date,
       Cost,
       LAG(Cost) OVER (ORDER BY Mission_Date) AS PreviousCost,
       Cost - LAG(Cost) OVER (ORDER BY Mission_Date) AS CostDifference
FROM Mission
WHERE Mission_Date BETWEEN '01-Jan-23' AND '31-Dec-23'
ORDER BY Mission_Date;


-- Query 11: Show missions where the gap since the previous mission is greater than 30 days
SELECT Mission_Id, Drone_Id, Mission_Date, DaysGap
FROM (
    SELECT Mission_Id,
           Drone_Id,
           Mission_Date,
           Mission_Date - LAG(Mission_Date) OVER (
               ORDER BY Mission_Date, Mission_Id
           ) AS DaysGap
    FROM Mission
)
WHERE DaysGap > 30
ORDER BY Mission_Date;


-- Query 12: For missions with more than 750 MB collected, show percentage contribution to total data
SELECT Mission_Id,
       Mission_Purpose,
       Data_Collected,
       RATIO_TO_REPORT(Data_Collected) OVER() * 100 AS DataContributionPct,
       SUM(Data_Collected) OVER() AS TotalData
FROM Mission
WHERE Data_Collected > 750
ORDER BY DataContributionPct DESC;


-- Query 13: For missions in 2022, show rolling average duration using current and previous two missions
SELECT Mission_Id,
       Mission_Date,
       Duration,
       AVG(Duration) OVER (
           ORDER BY Mission_Date
           ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS RollingAvgDuration
FROM Mission
WHERE Mission_Date BETWEEN '01-Jan-22' AND '31-Dec-22'
ORDER BY Mission_Date;


-- Query 14: Display missions ranking in top two by data collected for each mission type
SELECT Mission_Type, Mission_Id, Drone_Id, Data_Collected, DataRank
FROM (
    SELECT Mission_Type,
           Mission_Id,
           Drone_Id,
           Data_Collected,
           DENSE_RANK() OVER (
               PARTITION BY Mission_Type
               ORDER BY Data_Collected DESC
           ) AS DataRank
    FROM Mission
)
WHERE DataRank <= 2
ORDER BY Mission_Type, DataRank;


-- Query 15: Show missions where average speed is within 10 km/h of drone max speed
SELECT Manufacturer,
       Drone_Id,
       Drone_Name,
       Mission_Id,
       Mission_Date,
       Average_Speed,
       Max_Speed,
       SpeedGap,
       AvgSpeedGapByMfr,
       Dense_Rank
FROM (
    SELECT D.Manufacturer AS Manufacturer,
           D.Drone_Id AS Drone_Id,
           D.Drone_Name AS Drone_Name,
           M.Mission_Id AS Mission_Id,
           M.Mission_Date AS Mission_Date,
           M.Average_Speed AS Average_Speed,
           D.Max_Speed AS Max_Speed,
           ABS(D.Max_Speed - M.Average_Speed) AS SpeedGap,
           AVG(ABS(D.Max_Speed - M.Average_Speed)) OVER (
               PARTITION BY D.Manufacturer
           ) AS AvgSpeedGapByMfr,
           DENSE_RANK() OVER (
               PARTITION BY D.Manufacturer
               ORDER BY ABS(D.Max_Speed - M.Average_Speed) ASC, M.Mission_Date, M.Mission_Id
           ) AS Dense_Rank
    FROM Drone D
    JOIN Mission M
      ON D.Drone_Id = M.Drone_Id
    WHERE M.Average_Speed IS NOT NULL
)
WHERE SpeedGap <= 10
ORDER BY Manufacturer, Dense_Rank, SpeedGap, Mission_Date;


-- Query 16: Rank missions by cost within each mission type and show top two ranks
SELECT Mission_Type, Mission_Id, Drone_Id, Mission_Date, Cost, Dense_Rank
FROM (
    SELECT Mission_Type,
           Mission_Id,
           Drone_Id,
           Mission_Date,
           Cost,
           DENSE_RANK() OVER (
               PARTITION BY Mission_Type
               ORDER BY Cost DESC, Mission_Date DESC
           ) AS Dense_Rank
    FROM Mission
)
WHERE Dense_Rank <= 2
ORDER BY Mission_Type, Dense_Rank, Cost DESC, Mission_Date DESC;


-- Query 17: Show missions where cost is at least 30 percent above average cost for mission type
SELECT Mission_Type, Mission_Id, Drone_Id, Cost, AvgCostByType
FROM (
    SELECT Mission_Type,
           Mission_Id,
           Drone_Id,
           Cost,
           AVG(Cost) OVER (
               PARTITION BY Mission_Type
           ) AS AvgCostByType
    FROM Mission
)
WHERE Cost >= 1.3 * AvgCostByType
ORDER BY Mission_Type, Cost DESC;


-- Query 18: For missions costing 160 or more, show percentage contribution within mission purpose
SELECT Mission_Purpose, Mission_Id, Drone_Id, Cost, CostPctPurpose
FROM (
    SELECT Mission_Purpose,
           Mission_Id,
           Drone_Id,
           Cost,
           RATIO_TO_REPORT(Cost) OVER (
               PARTITION BY Mission_Purpose
           ) * 100 AS CostPctPurpose
    FROM Mission
    WHERE Cost >= 160
)
ORDER BY Mission_Purpose, CostPctPurpose DESC;


-- Query 19: For missions in 2022, show rolling total of data collected using current and previous two missions
SELECT Mission_Id, Drone_Id, Mission_Date, Data_Collected, RollingData
FROM (
    SELECT Mission_Id,
           Drone_Id,
           Mission_Date,
           Data_Collected,
           SUM(Data_Collected) OVER (
               ORDER BY Mission_Date
               ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
           ) AS RollingData
    FROM Mission
    WHERE Mission_Date BETWEEN '01-Jan-22' AND '31-Dec-22'
)
ORDER BY Mission_Date;


-- Query 20: For missions in 2023, show missions where duration increased versus previous mission
SELECT Mission_Id, Mission_Date, Duration, PrevDuration, DurationIncrease
FROM (
    SELECT Mission_Id,
           Mission_Date,
           Duration,
           LAG(Duration) OVER (
               ORDER BY Mission_Date, Mission_Id
           ) AS PrevDuration,
           Duration - LAG(Duration) OVER (
               ORDER BY Mission_Date, Mission_Id
           ) AS DurationIncrease
    FROM Mission
    WHERE Mission_Date BETWEEN '01-Jan-23' AND '31-Dec-23'
)
WHERE DurationIncrease > 0
ORDER BY Mission_Date, Mission_Id;


-- Query 21: For missions in 2022, show current and next mission type when the type changes
SELECT Mission_Id, Mission_Date, Mission_Type, NextType
FROM (
    SELECT Mission_Id,
           Mission_Date,
           Mission_Type,
           LEAD(Mission_Type, 1, 'N/A') OVER (
               ORDER BY Mission_Date, Mission_Id
           ) AS NextType
    FROM Mission
    WHERE Mission_Date BETWEEN '01-Jan-22' AND '31-Dec-22'
)
WHERE Mission_Type <> NextType
ORDER BY Mission_Date, Mission_Id;


-- Query 22: For missions in 2022, show each mission cost with first and last mission cost in the period
SELECT Mission_Id, Mission_Date, Cost, FirstCost, LastCost
FROM (
    SELECT Mission_Id,
           Mission_Date,
           Cost,
           FIRST_VALUE(Cost) OVER (
               ORDER BY Mission_Date, Mission_Id
           ) AS FirstCost,
           LAST_VALUE(Cost) OVER (
               ORDER BY Mission_Date, Mission_Id
               ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
           ) AS LastCost
    FROM Mission
    WHERE Mission_Date BETWEEN '01-Jan-2022' AND '31-Dec-2022'
)
ORDER BY Mission_Date, Mission_Id;


-- Query 23: For drones with at least 3 missions in 2023, show mission data and data collected on the 3rd mission
SELECT Drone_Id, Mission_Id, Mission_Date, Data_Collected, ThirdMissionData
FROM (
    SELECT Drone_Id,
           Mission_Id,
           Mission_Date,
           Data_Collected,
           COUNT(*) OVER (
               PARTITION BY Drone_Id
           ) AS MissionCount,
           NTH_VALUE(Data_Collected, 3) OVER (
               PARTITION BY Drone_Id
               ORDER BY Mission_Date, Mission_Id
               ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
           ) AS ThirdMissionData
    FROM Mission
)
WHERE MissionCount >= 3
  AND Mission_Date BETWEEN '01-Jan-23' AND '31-Dec-23'
ORDER BY Drone_Id, Mission_Date, Mission_Id;


-- Query 24: For Survey missions, place missions into five bands and show only the highest 3 bands
SELECT Mission_Id, Drone_Id, Mission_Date, Data_Collected, Ntile
FROM (
    SELECT Mission_Id,
           Drone_Id,
           Mission_Date,
           Data_Collected,
           NTILE(5) OVER (
               ORDER BY Data_Collected
           ) AS Ntile
    FROM Mission
    WHERE Mission_Type = 'Survey'
)
WHERE Ntile IN (3, 4, 5)
ORDER BY Data_Collected ASC, Mission_Id;


-- Query 25: For Inspection missions, show top 20 percent of cost values using CUME_DIST
SELECT Mission_Id, Drone_Id, Mission_Date, Cost, Cume_Dist
FROM (
    SELECT Mission_Id,
           Drone_Id,
           Mission_Date,
           Cost,
           CUME_DIST() OVER (
               ORDER BY Cost
           ) AS Cume_Dist
    FROM Mission
    WHERE Mission_Type = 'Inspection'
)
WHERE Cume_Dist >= 0.80
ORDER BY Cost DESC, Mission_Id;


-- Query 26: For Photography missions, show records with percent_rank at least 0.70 based on data collected
SELECT Mission_Id, Drone_Id, Mission_Date, Data_Collected, Percent_Rank
FROM (
    SELECT Mission_Id,
           Drone_Id,
           Mission_Date,
           Data_Collected,
           PERCENT_RANK() OVER (
               ORDER BY Data_Collected
           ) AS Percent_Rank
    FROM Mission
    WHERE Mission_Type = 'Photography'
)
WHERE Percent_Rank >= 0.70
ORDER BY Data_Collected DESC, Mission_Id;


-- Query 27: For drones with at least 4 missions, show compact mission type history
SELECT Drone_Id, MissionTypeHistory, MissionCount
FROM (
    SELECT DISTINCT
           Drone_Id,
           LISTAGG(Mission_Type, ' | ')
             WITHIN GROUP (ORDER BY Mission_Date, Mission_Id)
             OVER (PARTITION BY Drone_Id) AS MissionTypeHistory,
           COUNT(*) OVER (
               PARTITION BY Drone_Id
           ) AS MissionCount
    FROM Mission
)
WHERE MissionCount >= 4
ORDER BY MissionCount DESC, Drone_Id;


-- Query 28: For drones with missions from 2021 onwards, show final mission date, cost, and data
SELECT Drone_Id, FinalDate, FinalCost, FinalData
FROM (
    SELECT DISTINCT
           Drone_Id,
           MAX(Mission_Date) OVER (
               PARTITION BY Drone_Id
           ) AS FinalDate,
           MAX(Cost)
             KEEP (DENSE_RANK LAST ORDER BY Mission_Date, Mission_Id)
             OVER (PARTITION BY Drone_Id) AS FinalCost,
           MAX(Data_Collected)
             KEEP (DENSE_RANK LAST ORDER BY Mission_Date, Mission_Id)
             OVER (PARTITION BY Drone_Id) AS FinalData
    FROM Mission
    WHERE Mission_Date >= '01-Jan-21'
)
ORDER BY FinalDate DESC, Drone_Id;


-- Query 29: Show missions where mission distance is at least 80 percent of drone range
SELECT Manufacturer,
       Drone_Id,
       Drone_Name,
       Mission_Id,
       Mission_Date,
       Distance,
       Range,
       RangeUtilisationPct,
       AvgRangeUtilPctByMfr,
       Dense_Rank
FROM (
    SELECT D.Manufacturer AS Manufacturer,
           D.Drone_Id AS Drone_Id,
           D.Drone_Name AS Drone_Name,
           M.Mission_Id AS Mission_Id,
           M.Mission_Date AS Mission_Date,
           M.Distance AS Distance,
           D.Range AS Range,
           (M.Distance / NULLIF(D.Range, 0)) * 100 AS RangeUtilisationPct,
           AVG((M.Distance / NULLIF(D.Range, 0)) * 100) OVER (
               PARTITION BY D.Manufacturer
           ) AS AvgRangeUtilPctByMfr,
           DENSE_RANK() OVER (
               PARTITION BY D.Manufacturer
               ORDER BY (M.Distance / NULLIF(D.Range, 0)) DESC, M.Mission_Id
           ) AS Dense_Rank
    FROM Drone D
    JOIN Mission M
      ON D.Drone_Id = M.Drone_Id
    WHERE D.Range IS NOT NULL
      AND M.Distance IS NOT NULL
)
WHERE RangeUtilisationPct >= 80
ORDER BY Manufacturer, Dense_Rank, RangeUtilisationPct DESC, Mission_Date;


-- Query 30: Calculate data collected per kilometre and show top two missions per mission type
SELECT Mission_Type,
       Mission_Id,
       Drone_Id,
       Drone_Name,
       DataPerKm,
       Dense_Rank
FROM (
    SELECT M.Mission_Type AS Mission_Type,
           M.Mission_Id AS Mission_Id,
           M.Drone_Id AS Drone_Id,
           D.Drone_Name AS Drone_Name,
           (M.Data_Collected / M.Distance) AS DataPerKm,
           DENSE_RANK() OVER (
               PARTITION BY M.Mission_Type
               ORDER BY (M.Data_Collected / M.Distance) DESC, M.Mission_Id
           ) AS Dense_Rank
    FROM Mission M
    JOIN Drone D
      ON D.Drone_Id = M.Drone_Id
    WHERE M.Distance > 0
)
WHERE Dense_Rank <= 2
ORDER BY Mission_Type, Dense_Rank, DataPerKm DESC;


-- Query 31: For Drone 10 and Drone 20 since 2021, show mission timeline with running and rolling metrics
SELECT Drone_Id,
       Mission_Id,
       Mission_Date,
       Mission_Type,
       Cost,
       RunningCost,
       RollingAvgCost3,
       PrevMissionType,
       NextMissionType,
       DaysSincePrev
FROM (
    SELECT Drone_Id AS Drone_Id,
           Mission_Id AS Mission_Id,
           Mission_Date AS Mission_Date,
           Mission_Type AS Mission_Type,
           Cost AS Cost,
           SUM(Cost) OVER (
               PARTITION BY Drone_Id
               ORDER BY Mission_Date, Mission_Id
               ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
           ) AS RunningCost,
           ROUND(
               AVG(Cost) OVER (
                   PARTITION BY Drone_Id
                   ORDER BY Mission_Date, Mission_Id
                   ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
               ), 2
           ) AS RollingAvgCost3,
           LAG(Mission_Type, 1, 'N/A') OVER (
               PARTITION BY Drone_Id
               ORDER BY Mission_Date, Mission_Id
           ) AS PrevMissionType,
           LEAD(Mission_Type, 1, 'N/A') OVER (
               PARTITION BY Drone_Id
               ORDER BY Mission_Date, Mission_Id
           ) AS NextMissionType,
           Mission_Date - LAG(Mission_Date, 1) OVER (
               PARTITION BY Drone_Id
               ORDER BY Mission_Date, Mission_Id
           ) AS DaysSincePrev
    FROM Mission
    WHERE Mission_Date >= '01-Jan-21'
      AND Drone_Id IN (10, 20)
)
ORDER BY Drone_Id, Mission_Date, Mission_Id;


-- Query 32: For drones with missions from 2024 onwards, show final mission, total data, percentage contribution, and rank
SELECT Drone_Id,
       FinalDate,
       FinalCost,
       FinalData,
       TotalDataByDrone,
       RATIO_TO_REPORT(TotalDataByDrone) OVER() * 100 AS DataPctOfAllDrones,
       DENSE_RANK() OVER (
           ORDER BY TotalDataByDrone DESC
       ) AS DroneRankByData
FROM (
    SELECT DISTINCT
           Drone_Id AS Drone_Id,
           MAX(Mission_Date) OVER (
               PARTITION BY Drone_Id
           ) AS FinalDate,
           MAX(Cost)
             KEEP (DENSE_RANK LAST ORDER BY Mission_Date, Mission_Id)
             OVER (PARTITION BY Drone_Id) AS FinalCost,
           MAX(Data_Collected)
             KEEP (DENSE_RANK LAST ORDER BY Mission_Date, Mission_Id)
             OVER (PARTITION BY Drone_Id) AS FinalData,
           SUM(Data_Collected) OVER (
               PARTITION BY Drone_Id
           ) AS TotalDataByDrone
    FROM Mission
    WHERE Mission_Date >= '01-Jan-24'
)
ORDER BY DroneRankByData, Drone_Id;

USE maps;

CREATE TABLE temp_traffic
SELECT pollutionStation, DATE_FORMAT(DATE_ADD(measureDate, INTERVAL -1 HOUR), "%y-%m-%d %h:00:00") as hour, MINUTE(measureDate) as minute, green, orange, red, darkRed from traffic;

SELECT
p.measureDate AS date,
NULLIF(p.pm25, 0) AS pm25, NULLIF(p.pm10, 0) AS pm10,  NULLIF(p.o3, 0) AS o3, 
t1.green AS g1, t1.orange AS o1, t1.red AS r1, t1.darkRed AS d1,
t2.green AS g2, t2.orange AS o2, t2.red AS r2, t2.darkRed AS d2,
t3.green AS g3, t3.orange AS o3, t3.red AS r3, t3.darkRed AS d3,
t4.green AS g4, t4.orange AS o4, t4.red AS r4, t4.darkRed AS d4,
t5.green AS g5, t5.orange AS o5, t5.red AS r5, t5.darkRed AS d5,
t6.green AS g6, t6.orange AS o6, t6.red AS r6, t6.darkRed AS d6

FROM pollution p

INNER JOIN temp_traffic t1
ON t1.pollutionStation = p.station
AND t1.hour = p.measureDate
AND t1.minute < 10 

INNER JOIN temp_traffic t2
ON t2.pollutionStation = p.station
AND t2.hour = p.measureDate
AND t2.minute >= 10 AND t2.minute < 20 

INNER JOIN temp_traffic t3
on t3.pollutionStation = p.station
AND t3.hour = p.measureDate
AND t3.minute >= 20 AND t3.minute < 30 

INNER JOIN temp_traffic t4
ON t4.pollutionStation = p.station
AND t4.hour = p.measureDate
AND t4.minute >= 30 AND t4.minute < 40 

INNER JOIN temp_traffic t5
ON t5.pollutionStation = p.station
AND t5.hour = p.measureDate
AND t5.minute >= 40 AND t5.minute < 50 

INNER JOIN temp_traffic t6
ON t6.pollutionStation = p.station
AND t6.hour = p.measureDate
AND t6.minute >= 50;

DROP TABLE temp_traffic;
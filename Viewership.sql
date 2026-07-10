-- Databricks notebook source
-- TELLING DATA BRICKS WHICH CATALOG(brighttv) AND SCHEMA(data) TO USE
USE brighttv.data;

-- select all columns to see the structure of the dataset
SELECT *
FROM brighttv.data.viewership_details;

--DATE FUNCTIONS--
--TO_DATE(name of the column you're converting)
SELECT RecordDate2, TO_DATE(RecordDate2) AS Watch_Date -- TO_DATE() Extracts date from a Time Stamp
FROM brighttv.data.viewership_details;

SELECT UserID0,
        RecordDate2,
        TO_DATE(RecordDate2) AS watch_date,
        DAYNAME(TO_DATE(RecordDate2)) AS Day_name,
        MONTHNAME(TO_DATE(RecordDate2)) AS Month_name,
        YEAR(TO_DATE(RecordDate2)) AS Event_year,
        DAY(TO_DATE(RecordDate2)) AS Event_day
FROM brighttv.data.viewership_details;      

-- Databricks notebook source
-- CLEANING THE USER_PROFILE DATASET
--Telling Databricks to use The BrightTV Catalog and the data Schema-------------------------------
USE brighttv.data;

---------------------------------------------------------------------------------------------------
-- Extract all columns to get the structure and picture of the dataset
---------------------------------------------------------------------------------------------------
SELECT *
FROM brighttv.data.user_profiles;-- You dont have to start the table name with brighttv.data if you are using the 'USE brighttv.data;'  as indicated at the beginning

-----------------------------------------------------------------------------------------------------
-- Gender Checks --
---------------------------------------------------------------------------------------------------
SELECT DISTINCT Gender
FROM brighttv.data.user_profiles; -- Results showing None and Null which we need to clean

-- Cleaning Gender
SELECT DISTINCT
    CASE
        WHEN Gender = 'None' THEN 'Unknown' --Replaces the None values with Unknown
        WHEN Gender = ' ' THEN 'Unknown'--Replaces the blanks values with Unknown
        WHEN Gender IS NULL THEN 'Unknown'--Replaces the Null values with Unknown
     ELSE Gender
     END AS Gender_Clean
FROM brighttv.data.user_profiles;     

-----------------------------------------------------------------------------------------------------
--Race Checks-----
-----------------------------------------------------------------------------------------------------

SELECT DISTINCT Race --has Other, None that must be cleaned
FROM user_profiles;

SELECT DISTINCT 
    CASE 
        WHEN Race = 'other' THEN 'Unknown'
        WHEN Race = 'None'  THEN 'Unknown'
        WHEN Race = ' ' THEN 'Unknown'
    ELSE Race
    END AS Race_Clean
FROM user_profiles;        

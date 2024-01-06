SELECT 
    MIN(JULIANDAY(Year)) AS Min_Year, MAX(JULIANDAY(Year)),
    MIN(NA_Sales) AS Min_NA_Sales, MAX(NA_Sales) AS Max_NA_Sales,
    MIN(EU_Sales) AS Min_EU_Sales, MAX(EU_Sales) AS Max_EU_Sales,
    MIN(JP_Sales) AS Min_JP_Sales, MAX(JP_Sales) AS Max_JP_Sales,
    MIN(Other_Sales) AS Min_Other_Sales, MAX(Other_Sales) AS Max_Other_Sales
FROM vgsales;

SELECT 
    SUM(NA_Sales) AS Total_NA_Sales,
    SUM(EU_Sales) AS Total_EU_Sales,
    SUM(JP_Sales) AS Total_JP_Sales,
    SUM(Other_Sales) AS Total_Other_Sales
FROM vgsales;

SELECT 
    ROUND((sum(NA_Sales) / sum(Global_Sales)),2) * 100 AS Percentage_NA_Sales,
    ROUND((SUM( EU_Sales) / SUM(Global_Sales)),2) * 100 AS Percentage_EU_Sales,
    ROUND((SUM(JP_Sales) / SUM(Global_Sales)),2) * 100 AS Percentage_JP_Sales,
    ROUND((SUM(Other_Sales) / SUM(Global_Sales)),2) * 100 AS Percentage_Other_Sales
FROM vgsales;

SELECT 
    Year,
    COUNT(Name) AS Nombre_de_jeux_publies
FROM vgsales
WHERE Year IS NOT NULL
GROUP BY Year
ORDER BY Year;

SELECT 
    Name AS Game_Name,
    Platform AS Best_Selling_Platform,
    Global_Sales AS Total_Sales
FROM vgsales
ORDER BY Global_Sales DESC
LIMIT 1;

SELECT 
    Platform,
    SUM(Global_Sales) AS Total_Global_Sales
FROM vgsales
GROUP BY Platform
ORDER BY Total_Global_Sales DESC
LIMIT 1;

SELECT 
    Genre,
    AVG(Global_Sales) AS Average_Sales
FROM vgsales
GROUP BY Genre
ORDER BY Average_Sales DESC
LIMIT 1;

SELECT 
    Year,
    SUM(NA_Sales) AS Total_NA_Sales,
    SUM(EU_Sales) AS Total_EU_Sales,
    SUM(JP_Sales) AS Total_JP_Sales,
    SUM(Other_Sales) AS Total_Other_Sales,
    SUM(Global_Sales) AS Total_Global_Sales
FROM vgsales
GROUP BY JULIANDAY(Year)
ORDER BY JULIANDAY(Year);

SELECT 
    Publisher,
    SUM(Global_Sales) AS Total_Global_Sales,
    ROUND((SUM(Global_Sales) / (SELECT SUM(Global_Sales) FROM vgsales)) * 100,2) AS Market_Share_Percentage
FROM vgsales
GROUP BY Publisher
ORDER BY Total_Global_Sales DESC;

SELECT 
    Publisher,
    SUM(NA_Sales) AS Total_NA_Sales,
    SUM(EU_Sales) AS Total_EU_Sales,
    SUM(JP_Sales) AS Total_JP_Sales,
    SUM(Other_Sales) AS Total_Other_Sales,
    SUM(Global_Sales) AS Total_Global_Sales
FROM vgsales
GROUP BY Publisher
ORDER BY Total_Global_Sales DESC;

WITH RankedGames AS (
    SELECT 
        Name,
        Genre,
        Global_Sales,
        RANK() OVER (PARTITION BY Genre ORDER BY Global_Sales DESC) AS SalesRank
    FROM vgsales
)
SELECT 
    Name,
    Genre,
    Global_Sales
FROM RankedGames
WHERE SalesRank = 1;

SELECT Rank, Platform ,Genre , AVG(Global_Sales) AS Average_Global_Sales
FROM vgsales
GROUP BY Rank
ORDER BY Rank;

SELECT 
    Year,
    Genre,
    SUM(Global_Sales) AS Total_Sales
FROM vgsales
GROUP BY Year, Genre
ORDER BY Year, Total_Sales DESC;

SELECT 
    Year,
    Platform,
    SUM(Global_Sales) AS Total_Sales
FROM vgsales
GROUP BY Year, Platform
ORDER BY Year, Total_Sales DESC;

SELECT 
    Publisher,
    COUNT(Name) AS Nombre_de_jeux_publies
FROM vgsales
WHERE Publisher IS NOT NULL
GROUP BY Publisher
ORDER BY Nombre_de_jeux_publies DESC
LIMIT 10;

WITH RankedGenres AS (
    SELECT 
        Year,
        Genre,
        SUM(Global_Sales) AS Total_Sales,
        RANK() OVER (PARTITION BY Year ORDER BY SUM(Global_Sales) DESC) AS SalesRank
    FROM vgsales
    GROUP BY Year, Genre
)
SELECT 
    Year,
    Genre,
    Total_Sales
FROM RankedGenres
WHERE SalesRank <= 10
ORDER BY Year, SalesRank;













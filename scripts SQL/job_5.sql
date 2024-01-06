 SELECT Country, population
 FROM world
 WHERE population > (SELECT population FROM world WHERE Country = 'Russia');

SELECT Region, Country, "GDP ($ per capita)"
FROM world
WHERE "GDP ($ per capita)" > (SELECT "GDP ($ per capita)" FROM world WHERE Country = 'Italy')
AND Region = "WESTERN EUROPE" OR Region = "EASTERN EUROPE";

SELECT Country, Population
FROM world
WHERE population > (SELECT population FROM world WHERE Country = 'United Kingdom')
AND population > (SELECT population FROM world WHERE Country = 'Germany');

SELECT Country,
CONCAT(ROUND((population * 100 / (SELECT Population FROM world WHERE Country ='Germany'))), '%') AS Pourcentage,Population
FROM world
WHERE Region ='WESTERN EUROPE' OR Region ='ESTERN EUROPE';

SELECT Region, Country,MAX("Area (sq. mi.)") AS Superficie
FROM world
GROUP BY Region
ORDER BY "Area (sq. mi.)" DESC;

SELECT Region, Population 
FROM world
GROUP BY Region
HAVING MAX(Population) <= 25000000;


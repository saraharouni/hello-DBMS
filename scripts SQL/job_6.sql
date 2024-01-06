SELECT SUM(Population) AS 'Population totale'
FROM world;

SELECT Region, Population
FROM world
GROUP BY Region;

SELECT Region, SUM("GDP ($ per capita)")AS PIB
FROM world
GROUP BY Region;

SELECT ROUND(AVG("GDP ($ per capita)"),2) AS 'PIB total'
FROM world
WHERE region IN ('SUB-SAHARAN AFRICA', 'NORTHERN AFRICA');

SELECT COUNT(Country) AS 'Nombre de pays'
FROM world
WHERE "Area (sq. mi.)" >1000000;

SELECT SUM(Population)AS 'Total Population'
FROM world
WHERE Country IN ('Estonia', 'Latvia', 'Lithuania');

SELECT Region, COUNT(Country) AS 'Nombre de pays'
FROM world
GROUP BY Region;

SELECT Region, SUM(Population) AS 'Population totale'
FROM world
GROUP BY Region
HAVING SUM(Population) >= 100000000;







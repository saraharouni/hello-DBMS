SELECT Region ,Country ,Deathrate FROM world GROUP by Region ORDER BY ROUND(Deathrate,1) DESC;

SELECT Region ,Country ,Deathrate,Birthrate
FROM world
WHERE ROUND(Deathrate,1) > ROUND(Birthrate,1);

SELECT Region ,Country ,MAX("Literacy (%)") AS "Max. Alphabétisation" ,"GDP ($ per capita)" AS "PIB" 
FROM world
GROUP by Region ;

SELECT Region ,Country ,MIN("Literacy (%)")AS "Min. Alphabétisation" ,"GDP ($ per capita)" AS"PIB" 
FROM world
WHERE COALESCE("Literacy (%)", '') <> '' AND COALESCE("GDP ($ per capita)", '') <> ''
GROUP BY Region;

SELECT Region ,Country ,MAX("Net migration") AS 'Max. Migration'  ,"GDP ($ per capita)" AS 'PIB' 
FROM world
GROUP BY Region;

SELECT Region ,Country ,MIN("Net migration") AS 'Max. Migration'  ,"GDP ($ per capita)" AS 'PIB' 
FROM world
GROUP BY Region;

SELECT Region ,Country ,ROUND(Max("Phones (per 1000)"),2) AS 'Téléphone'  ,ROUND("Literacy (%)",2) AS "Alphabétisation" 
FROM world
WHERE COALESCE("Phones (per 1000)", '') <> '' AND COALESCE("Literacy (%)" , '') <> ''
GROUP BY Region;

SELECT Region ,Country ,ROUND(MIN("Phones (per 1000)"),2) AS 'Téléphone'  ,ROUND("Literacy (%)",2) AS "Alphabétisation" 
FROM world
WHERE COALESCE("Phones (per 1000)", '') <> '' AND COALESCE("Literacy (%)" , '') <> ''
GROUP BY Region;




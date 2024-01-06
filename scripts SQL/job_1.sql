SELECT Population
FROM world
WHERE Country = 'Germany';

SELECT Country ,Population
FROM world
WHERE Country = 'Germany' OR Country = 'Norway' OR Country = 'Denmark';

SELECT Country, "Area (sq. mi.)"
FROM world
WHERE "Area (sq. mi.)" > 200000 AND "Area (sq. mi.)" < 300000;

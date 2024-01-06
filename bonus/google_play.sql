SELECT 
    MAX(CAST(Rating AS DECIMAL(3, 2))) AS Max_Rating,
    MIN(CAST(Rating AS DECIMAL(3, 2))) AS Min_Rating
FROM googleplaystore
WHERE Rating IS NOT NULL AND Rating != 'NaN';

SELECT
    Type AS Application_Type,
    COUNT(*) AS Number_of_Applications,
    ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM googleplaystore)), 2) AS Proportion_Percentage
FROM
    googleplaystore
WHERE Type IS NOT NULL AND Type != '0' AND Type != 'NaN'
GROUP BY
    Type;
   
SELECT
    Type,
    ROUND(AVG(CAST(Reviews AS FLOAT)), 2) AS Moyenne_Avis
FROM
    googleplaystore
WHERE
    Type IN ('Free', 'Paid')
GROUP BY
    Type;

SELECT
    Category,
    COUNT(*) AS Nombre_d_applications
FROM
    googleplaystore
GROUP BY
    Category
ORDER BY
    Nombre_d_applications DESC;

   SELECT
    Category,
    AVG(CAST(Rating AS FLOAT)) AS Average_Rating
FROM
    googleplaystore
WHERE
    Rating IS NOT NULL
GROUP BY
    Category
ORDER BY
    Average_Rating DESC;

   SELECT
    Category,
    ROUND(AVG(Rating),2) AS Average_Rating
FROM
    googleplaystore
WHERE
    Rating IS NOT NULL AND Category != "1.9"
GROUP BY
    Category
ORDER BY
    Average_Rating DESC;
   
SELECT
    Category,
    ROUND(AVG(Reviews),2) AS Average_Reviews
FROM
    googleplaystore
WHERE
    Reviews IS NOT NULL
GROUP BY
    Category
ORDER BY
    Average_Reviews DESC
LIMIT 1;

SELECT
    Category,
    AVG(
        CASE
            WHEN Size = 'Varies with device' THEN NULL  -- Ignorer les valeurs spéciales
            ELSE CAST(REPLACE(REPLACE(Size, 'M', ''), 'k', '') AS DECIMAL)
        END
    ) AS Average_Size
FROM
    googleplaystore
WHERE
    Size IS NOT NULL AND Category != "1.9"
GROUP BY
    Category;
   
 SELECT
    Category,
    AVG(
        CASE
            WHEN Size = 'Varies with device' THEN NULL  -- Ignorer les valeurs spéciales
            ELSE CAST(REPLACE(REPLACE(Size, 'M', ''), 'k', '') AS DECIMAL)
        END
    ) AS Average_Size
FROM
    googleplaystore
WHERE
    Size IS NOT NULL and Category != "1.9"
GROUP BY
    Category;

   
SELECT
    CleanedSize,
    CleanedInstalls
FROM (
    SELECT
        CASE
            WHEN Size = "Varies with device" THEN NULL 
            ELSE CAST(REPLACE(Size, 'M', '') AS FLOAT) 
        END AS CleanedSize,
        
        CASE
            WHEN Installs = "Free" THEN NULL 
            ELSE CAST(REPLACE(REPLACE(Installs, ',', ''), '+', '') AS INT)
        END AS CleanedInstalls
    FROM googleplaystore
) AS CleanedData
WHERE CleanedSize IS NOT NULL AND CleanedInstalls IS NOT NULL; 

SELECT
    "Content Rating" AS Content_Rating,
    COUNT(App) AS Number_of_Applications
FROM
    googleplaystore
WHERE "Content Rating" !=""
GROUP BY
    "Content Rating";

SELECT
    "Content Rating",
    round(AVG(Rating),2) AS Moyenne_Note
FROM
    googleplaystore
WHERE
    Rating IS NOT NULL and "Content Rating" !=""
GROUP BY
    "Content Rating";

SELECT "Content Rating",
    MAX(Installs) AS Max_Installations
FROM googleplaystore
WHERE Installs IS NOT NULL and "Content Rating" != ""
GROUP BY "Content Rating" 
ORDER BY Max_Installations DESC
LIMIT 1;

SELECT
    Genres,
    COUNT(*) AS Nombre_d_applications
FROM
    googleplaystore
GROUP BY
    Genres
ORDER BY
    Nombre_d_applications DESC;

SELECT COUNT(*) AS Nombre
FROM (
    SELECT App
    FROM googleplaystore
    GROUP BY App
    HAVING COUNT(DISTINCT Genres) > 1
) AS Applications;

SELECT
    App,
    Rating,
    (SELECT COUNT(DISTINCT Genres) FROM googleplaystore g2 WHERE g2.App = g1.App) AS NumberOfGenres
FROM
    googleplaystore g1
WHERE
    Genres  IS NOT NULL
ORDER BY
    NumberOfGenres DESC, Rating DESC;

SELECT
    Category,
    AVG(CAST(SUBSTR(Price, 2) AS FLOAT)) AS Average_Price
FROM
    googleplaystore
WHERE
    Type = 'Paid' AND Price <> '0'
GROUP BY
    Category
ORDER BY
    Average_Price DESC;

SELECT
    Category,
    COUNT(*) AS Nombre_Applications_Gratuites
FROM
    googleplaystore
WHERE
    Price = '0'
GROUP BY
    Category
ORDER BY
    Nombre_Applications_Gratuites DESC;

SELECT
    App,
    Installs
FROM
    googleplaystore
ORDER BY
    CAST(REPLACE(Installs, ',', '') AS INTEGER) DESC
LIMIT 5;

SELECT
    App,
    Category,
    Rating,
    Installs
FROM
    googleplaystore
WHERE
    Type = 'Free' 
ORDER BY
    Rating IS NOT NULL DESC  
LIMIT 5; 

SELECT
    Size,
    Rating
FROM
    googleplaystore
WHERE
    Size != 'Varies with device' AND Rating IS NOT NULL
ORDER BY
    Rating IS NOT NULL DESC;
--pas de corrélation--
   
SELECT max("Size"),min("Size"),
    AVG(CAST(REPLACE(Size, 'M', '') AS FLOAT)) AS 'Taille (mb)',
    AVG(CAST(REPLACE(REPLACE(Price, '$', ''), 'Free', '0') AS FLOAT)) AS 'Prix (moy.)'
FROM googleplaystore
WHERE "Size" IS NOT NULL and "Size" != 'Varies with device'
    AND Price IS NOT NULL
    AND Price != 'Everyone';
-- non --

SELECT
    Price,
    Rating
FROM
    googleplaystore
WHERE "Type" != 'Free' AND Rating != 'NaN'
ORDER BY Rating DESC;

-- oui les jeux les mieux notés sont parmis les moins chers--






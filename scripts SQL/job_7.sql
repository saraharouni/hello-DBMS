SELECT matchid, player
FROM Goal
WHERE teamid = 'GER';

SELECT id, stadium,team1,team2
FROM Game
WHERE id = 1012;

SELECT player, teamid,stadium,mdate
FROM Game
JOIN Goal ON Goal.matchid = Game.id
WHERE teamid = 'GER';

SELECT team1, team2,player
FROM Game
JOIN Goal ON Goal.matchid = Game.id
WHERE player LIKE '% Mario%';

SELECT *
FROM Goal
JOIN Eteam ON Goal.teamid = Eteam.id;

SELECT player, teamid, coach, gtime
FROM Goal
JOIN Eteam ON Goal.teamid = Eteam.id
WHERE gtime <= 10;

SELECT mdate,teamname
FROM Game
JOIN Eteam ON Game.team1 = Eteam.id 
WHERE coach = 'Fernando Santos';

SELECT player
FROM Goal
JOIN Game ON Game.id = Goal.matchid
WHERE stadium = 'National Stadium, Warsaw';


SELECT COUNT(gtime) AS 'nombre de buts'
FROM Goal
GROUP BY teamid;

SELECT stadium, COUNT(gtime)
 FROM Goal
JOIN Game ON Game.id = Goal.matchid
GROUP BY stadium;
 
SELECT matchid, mdate, COUNT(gtime)
FROM Goal
JOIN Game ON Game.id = Goal.matchid
WHERE teamid = 'FRA'
GROUP BY matchid, mdate;
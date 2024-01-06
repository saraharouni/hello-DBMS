CREATE DATABASE IF NOT EXISTS 'SomeCompany';

CREATE TABLE Employees (
  			employee_id INTEGER PRIMARY KEY,
   			first_name VARCHAR,
   			last_name VARCHAR,
   			birthdate DATE,
   			position VARCHAR,
   			department_id INTEGER);

CREATE TABLE Departments (
  			 department_id INTEGER PRIMARY KEY,
   			 department_name VARCHAR,
   			 department_head INTEGER,
   			 location VARCHAR);
			
INSERT INTO Departments (department_id, department_name, department_head, location)
VALUES
(1,'IT',11,'Headquarters'),
(2,'Project Management',2,'Branch Office West'),
(3,'Human Resources',6,'Branch Office East');

INSERT INTO Employees(employee_id, first_name, last_name, birthdate, position, department_id)
VALUES
(1,'John','Doe','1990-05-15','Software Engineer',1),
(2, 'Jane', 'Smith', '1985-08-20', 'Project Manager',2),
(3,'Mike','Johnson','1992-03-10', 'Data Analyst', 1),
(4, 'Emily','Brown','1988-12-03','UX Designer', 1),
(5,'Alex','Williams','1995-06-28','Software Developer',1),
(6,'Sarah','Miller','1987-09-18','HR Specialist',3),
(7, 'Ethan','Clark','1991-02-14','Database Administrator',1),
(8,'Olivia','Garcia','1984-07-22','Marketing Manager',2),
(9, 'Emilia','Clark','1986-01-12','HR Manager',3)
(12,’Sophia’,’Baker’,’1990-06-25’,’IT Manager’,2);


SELECT last_name, Employees."position" 
FROM Employees;

UPDATE Employees
SET "position"  = 'Head of Data'
WHERE last_name = 'Doe'
7. Supprimez un employé de la table Employees. 
DELETE FROM Employees
WHERE first_name = 'John';

SELECT last_name,department_name,location
FROM Employees
JOIN Departments ON Employees.department_id = Departments.department_id;

SELECT CONCAT(last_name,' ',first_name) AS 'nom', department_name
FROM Employees
JOIN Departments ON Employees.department_id = Departments.department_id
ORDER BY
 			CASE department_name
 			WHEN 'IT' THEN 0
   			WHEN 'Project Management' THEN 1
   			WHEN 'Human Resources' THEN 2
 			END;
 		
SELECT department_name, position
FROM Departments
JOIN Employees ON Employees.department_id = Departments.department_id
WHERE Employees.position LIKE '% Manager' AND Employees.position != 'Marketing Manager'
ORDER BY department_name;

 
INSERT INTO Departments (department_id, department_name, department_head, location)
VALUES
(4,'Marketing',8,'Headquarters');


UPDATE Employees
SET department_id  = 4
WHERE "position" = 'Marketing Manager';


CREATE TABLE Project (project_id INTEGER PRIMARY KEY,
  			 project_name VARCHAR,
  			 start_date DATE,
  			 end_date DATE,
  			 department_id INTEGER);


INSERT INTO Project (project_id,project_name,start_date,
 			 end_date, department_id)
VALUES
(1,'Déploiement_nouveaux_serveurs','24-01-2023','22-12-2023',1),
(2,'Image_de_marque','24-01-2023','22-12-2023',4);


INSERT INTO Employees(employee_id, first_name, last_name, birthdate, position, department_id)
VALUES
(1,'John','Doe','1990-05-15','Software Engineer',1);



SELECT COUNT(employee_id),department_name,department_head 
FROM Employees
JOIN Departments ON Employees.department_id =Departments.department_id
JOIN Project ON Departments.department_id = Project.department_id
GROUP BY department_name
INSERT INTO Project (project_id, project_name, start_date, end_date, department_id)
VALUES
(3, 'Gestion_Base_de_Données_IT', '15-07-2023', '28-12-2023', 1),
(4, 'Campagne_Publicitaire', '02-08-2023', '15-01-2024', 4),
(5, 'Développement_Applications_IT', '20-09-2023', '02-04-2024', 1),
(6, 'Stratégie_Marketing_Online', '07-10-2023', '20-05-2024', 4),
(7, 'Sécurité_Informatique_IT', '25-11-2023', '08-07-2024', 1),
(8, 'Analyse_Marché', '12-12-2023', '25-08-2024', 4),
(9, 'Maintenance_Serveurs_IT', '28-01-2024', '10-10-2024', 1),
(10, 'Optimisation_Logiciels_Marketing', '14-02-2024', '27-11-2024', 4),
(11, 'Projet_Pilote_IT', '03-03-2024', '15-01-2025', 1),
(12, 'Développement_Mobile_Marketing', '20-04-2024', '04-03-2025', 4),
(13, 'Déploiement_Réseaux_IT', '15-05-2023', '28-10-2023', 1),
(14, 'Événement_Lancement_Produit', '02-06-2023', '15-11-2023', 4),
(15, 'Développement_Web_IT', '20-07-2023', '02-01-2024', 1),
(16, 'Publicité_Réseaux_Sociaux', '07-08-2023', '20-02-2024', 4),
(17, 'Analyse_Concurrentielle', '12-10-2023', '25-05-2024', 4),
(18, 'Mise_à_jour_Serveurs_IT', '28-11-2023', '10-07-2024', 1),
(19, 'Optimisation_Campagnes_Publicitaires', '14-12-2023', '27-08-2024', 4),
(20, 'Projet_Pilote_Marketing', '03-01-2024', '15-09-2024', 1),
(21, 'Développement_Mobile_IT', '20-02-2024', '04-11-2024', 4),
(22, 'Migration_Base_de_Données_Marketing', '09-03-2024', '22-12-2024', 1),
(23, 'Maintenance_Logiciels_IT', '13-05-2024', '26-02-2025', 1),
(24, 'Promotion_Ligne_Produits', '30-06-2024', '13-04-2025', 4),
(25, 'Développement_Applications_Marketing', '17-07-2024', '30-05-2025', 1),
(26, 'Stratégie_Digital_Marketing', '03-08-2024', '15-06-2025', 4),
(27, 'Gestion_Projets_IT', '20-09-2024', '04-08-2025', 1),
(28, 'Analyse_Données_Marketing', '07-10-2024', '20-09-2025', 4),
(29, 'Infrastructure_Réseaux_IT', '24-11-2024', '07-11-2025', 1),
(30, 'Campagne_Email_Marketing', '11-12-2024', '24-12-2025', 4);



SELECT department_name, COUNT(Project.project_name)AS 'Nombre de projets'
FROM Employees
JOIN Departments ON Employees.department_id = Departments.department_id
JOIN Project ON Departments.department_id = Project.department_id
GROUP BY Departments.department_id



SELECT department_name ,Project.project_name, COUNT(Employees.employee_id) AS "Nombre d'employés"
FROM Employees
JOIN Departments ON Employees.department_id = Departments.department_id
JOIN Project ON Departments.department_id = Project.department_id
GROUP BY project_name
ORDER BY employee_count DESC;

SELECT department_head,project_id ,project_name, MAX(JULIANDAY(end_date) - JULIANDAY(start_date))AS 'durée_projet', start_date,end_date
FROM Project
JOIN Departments ON Project.department_id = Departments.department_id
ORDER BY "durée_projet";

SELECT department_head,project_id ,project_name, MIN(JULIANDAY(end_date) - JULIANDAY(start_date))AS 'durée_projet', start_date,end_date
FROM Project
JOIN Departments ON Project.department_id = Departments.department_id
ORDER BY "durée_projet";

SELECT AVG(JULIANDAY(end_date) - JULIANDAY(start_date))AS 'durée_projet'
FROM Project
JOIN Departments ON Project.department_id = Departments.department_id;

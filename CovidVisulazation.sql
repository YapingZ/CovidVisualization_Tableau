-- This project is to collect some usful data about covid-19 for the later visualization
-- By Yaping 09/09/2022

-- 1. Give a genal information of covid-19 by sum up the total cases and total deaths

SELECT TOP 10 *
FROM Covid..CovidDeath


SELECT SUM(new_cases) AS TatalCases
, SUM(new_deaths) AS TotalDeath
, SUM(new_deaths)/SUM(CONVERT(float, new_cases))*100 AS DeathRate

FROM Covid..CovidDeath
WHERE continent IS NOT  NULL

-- 2. Give a more detailed overall information about covid-19 about the deaths
SELECT continent, SUM(total_deaths) AS TotalDeathContinent
FROM Covid..CovidDeath
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY TotalDeathContinent DESC

-- Looking at the continent is null data
SELECT location, SUM(total_cases) AS TotalCases, SUM(total_deaths) AS TotalDeaths
FROM Covid..CovidDeath
WHERE continent IS NULL
GROUP BY location
ORDER BY 1


-- 3. Find the location has the max cases or the highest infection rate
SELECT location, population, MAX(total_cases) AS HighestInfectionCount
, MAX(total_cases/CAST(population AS float))*100 AS HighestInfectionRate
FROM Covid..CovidDeath
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY 4 DESC


-- 4. Add date information
SELECT Location, Population, date, Max(total_cases) AS HighestInfectionCount
, MAX(total_cases/CAST(population AS float))*100 AS HighestInfectionRate
FROM Covid..CovidDeath
WHERE continent IS NOT NULL
GROUP BY location, population, date
ORDER BY 5 DESC
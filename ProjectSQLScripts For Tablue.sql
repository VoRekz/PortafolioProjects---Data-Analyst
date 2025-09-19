/*     */

/* use PortafolioProject
Select * from CovidDeaths$ */


/* use PortafolioProject
Select location, date , total_cases, new_cases, total_deaths, population
from CovidDeaths$
order by 1,2 */



--Looking at Total Cases vs Total Deaths, shows what % of the population got Covid

/*
use PortafolioProject
select location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
from CovidDeaths$
where location like '%states%'
order by 1,2 
*/




--Looking at countries with the highest infection rates compared to total population infection rates compared to total population

/*
use PortafolioProject
select location, population, MAX(total_cases) as HighestInfectionCount, MAX((total_cases/population))*100 as PercentofPopInfected
from CovidDeaths$
group by location, population
order by PercentofPopInfected Desc
*/


/*
use PortafolioProject
select location, MAX(total_cases) as Total_cases
from CovidDeaths$
group by location
order by total_cases desc
*/



-- Showing countries with highest death 
/*

use PortafolioProject
select location,  MAX(CAST(total_deaths AS BIGINT)) AS total_deaths
from CovidDeaths$
group by location
order by total_deaths desc
*/

/*
use PortafolioProject
select location,  MAX(CAST(total_deaths AS BIGINT)) AS total_deaths
from CovidDeaths$
where continent is not null
group by location
order by total_deaths desc;

use PortafolioProject
select location,  MAX(CAST(total_deaths AS BIGINT)) AS total_deaths
from CovidDeaths$
where continent is null
group by location
order by total_deaths desc;
*/

/* use PortafolioProject
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date)
from CovidDeaths$ dea
join CovidVaccinations$ vac
	on dea.location = vac.location 
	and dea.date = vac.date
where dea.continent is not null
order by 2,3 */


--Creating a view to store data for later vizualization

/*
Create view PercentpopulationVaccinated as

select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, sum(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location, dea.date) as RollingPeopleVaccinated
from CovidDeaths$ dea
join CovidVaccinations$ vac
	on dea.location = vac.location 
	and dea.date = vac.date
where dea.continent is not null
*/
Select * from percentpopulationvaccinated
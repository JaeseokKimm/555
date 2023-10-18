use cars;
-- Read data
select * from car_dekho;

--  count of total records --
select count(*) from car_dekho; #7927

-- how many cars available in 2023?
select count(*) from car_dekho where year = 2023; #6

-- And 2020, 2021, 2022?
select count(*) from car_dekho where year = 2020; #74
select count(*) from car_dekho where year = 2021; #7
select count(*) from car_dekho where year = 2022; #7

-- print the total of all cars by year
select year, count(*) from car_dekho group by year;

-- how many diesel cars in 2020?
select count(*) from car_dekho where year = 2020 and fuel = 'Diesel'; #20
-- And Petrol car?
select count(*) from car_dekho where year = 2020 and fuel = 'Petrol'; #51

-- print Diesel cars come by all year
select year, count(*) from car_dekho where fuel = 'Diesel' group by year;

-- which year have more than 100 cars?
select year, count(*) from car_dekho group by year having count(*) >100;

-- all cars count details between 2015 and 2023
select year, count(*) from car_dekho where year between 2015 and 2023 group by year;


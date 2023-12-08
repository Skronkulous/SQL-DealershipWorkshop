-- 01)Get all dealerships
SELECT *
FROM dealerships;

-- 02) Find all vehicles for a specific dealership
SELECT v.VIN, Make, Model, Sold, DealershipID
FROM vehicles AS v
INNER JOIN inventory AS i
ON v.VIN = i.VIN
WHERE DealershipID = 2; 

-- 03) Find a car by VIN
SELECT *
FROM vehicles AS v
WHERE v.VIN = '14FMCK8C4DH000014';

-- 04) Find the dealership where a certain car is located, by VIN
SELECT i.DealershipID, Name, Address, Phone, VIN
FROM dealerships AS d 
INNER JOIN inventory AS i 
ON d.DealershipID = i.DealershipID 
WHERE VIN = '14FMCK8C4DH000014';

-- 05) Find all dealerships that have a certain car type (i.e. Ford Mustang)
SELECT d.DealershipID, Name, Address, Phone, v.VIN, v.Make, v.Model, v.Sold
FROM dealerships AS d
INNER JOIN inventory AS i
ON d.DealershipID = i.DealershipID
INNER JOIN vehicles AS v
ON i.VIN = v.VIN
WHERE v.make = 'Ford' AND v.model = 'Mustang'; 

-- 06) Get all sales information for a specific dealer for a specific date range
SELECT sc.SaleID, sc.VIN, sc.TotalPrice, sc.DateSigned
FROM Sales_Contracts AS sc
INNER JOIN Inventory AS i
ON sc.VIN = i.VIN
WHERE i.DealershipID = 1
AND sc.DateSigned >= '1990-01-12'
AND sc.DateSigned <= '2000-04-22';
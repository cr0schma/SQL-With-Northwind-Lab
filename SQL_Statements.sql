-- 1. Select all the rows from the "Customers" table.
SELECT * FROM Customers

-- 2. Get distinct countries from the Customers table.
Select Distinct Country FROM Customers

-- 3. Get all the rows from the table Customers where the Customer’s ID starts with “BL”.
Select * From Customers Where CustomerID Like 'BL%'

-- 4. Get the first 100 records of the orders table. DISCUSS: Why would you do this? What else would you likely need to include in this query? 
-- You may do this to see the status of your most recent orders (say if they have shipped) if you know that you submit about 100 orders a month, you would want to likely include an order by OrderDate so you can see your most recent orders first
Select Top (100) * From Orders

-- 5. Get all customers that live in the postal codes 1010, 3012, 12209, and 05023.
Select * From Customers Where (PostalCode like '1010' OR PostalCode like '3012' OR PostalCode like '12209' OR PostalCode like '05023')

-- 6. Get all orders where the ShipRegion is not equal to NULL.
Select * From Orders Where ShipRegion is not null

-- 7. Get all customers ordered by the country, then by the city.
Select * From Customers ORDER BY Country,City

-- 8. Add a new customer to the customers table. You can use whatever values.
INSERT INTO Customers Values ('CHRIS', 'Chris Codes', 'Chris Schmalz', 'CEO', '123 GrandCircus Lane', 'Detroit', 'NA', '48371', 'United States', '248-867-3509', null)

-- 9. Update all ShipRegion to the value ‘EuroZone’ in the Orders table, where the ShipCountry is equal to France.
Update Orders
Set ShipRegion = 'EuroZone'
Where ShipCountry = 'France'

-- 10. Delete all orders from OrderDetails that have quantity of 1
Delete From [Order Details] Where Quantity = 1

-- 11. Find the CustomerID that placed order 10290 (orders table).
Select CustomerID From Orders Where OrderID = 10290

-- 12. Join the orders table to the customers table.
Select *
From Orders
Join Customers On Orders.CustomerID=Customers.CustomerID

-- 13. Get employees’ firstname for all employees who report to no one.
Select FirstName From Employees Where ReportsTo IS NULL

-- 14. Get employees’ firstname for all employees who report to Andrew.
Declare @EmployeeID int
Set @EmployeeID = (Select EmployeeID From Employees Where FirstName = 'Andrew')
-- Select @EmployeeID
Select FirstName From Employees Where ReportsTo = @EmployeeID
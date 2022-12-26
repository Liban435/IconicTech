/*
1st Query: What is the Total Sales? 

Desired Output:
Total Sales
-----------
880    
*/
SELECT SUM(Price) AS 'Total Sales'
FROM Offer;


/*
2nd Query: Which Employee Fixed the Most Devices?

Desired Output:
EmployeeName  num_occurrences
------------  ---------------
Michael Bray  3   
*/
SELECT CONCAT(Employee.FirstName, ' ', Employee.LastName) AS EmployeeName,  
COUNT(EmployeeDoesService.EmployeeId) AS DevicesFixed  
FROM EmployeeDoesService   
JOIN Employee ON EmployeeDoesService.EmployeeId = Employee.Id  
GROUP BY EmployeeDoesService.EmployeeId  
ORDER BY DevicesFixed DESC  
LIMIT 1 OFFSET 0;


/*
3rd Query: Show Employee’s Total Profit 

Desired Output:
EmployeeName   TotalProfit
-------------  -----------
Stephen Diaz   71         
William Tanka  125 
*/
SELECT CONCAT(Employee.FirstName, ' ', Employee.LastName) AS EmployeeName, SUM(Offer.Price - Offer.Cost) AS TotalProfit
FROM Offer
JOIN StoreTransaction ON Offer.Id = StoreTransaction.OfferId
JOIN Employee ON Employee.Id = StoreTransaction.EmployeeId
GROUP BY EmployeeName;


/*
4th Query: Find The Customer that shops the most

Desired Output:
CustomerId  FullName  NumReciepts
----------  --------  -----------
1           Shan Su   2          
*/
SELECT CONCAT(Customer.FirstName, ' ', Customer.LastName) as FullName, COUNT(*) as TimesShopped
FROM StoreTransaction 
JOIN Customer ON Customer.Id = StoreTransaction.CustomerId
GROUP BY StoreTransaction.CustomerId
ORDER BY TimesShopped DESC
LIMIT 1 OFFSET 0;




/*
5th Query: What is the Total Profit on the day October 1, 2022? 

Desired Output:
Total Profit
------------
121      
*/
SELECT SUM(o.Price - o.Cost) AS 'Total Profit'
FROM Offer o
JOIN StoreTransaction t ON t.OfferId = o.Id
WHERE t.Day = 1 AND t.Month = 10 AND t.Year = 2022;

/*
6th Query: What is the Total Customers that shopped in October? 

Desired Output:
Total Customers This Month
--------------------------
9             
*/
SELECT COUNT(DISTINCT CustomerId) AS 'Total Customers This Month'
FROM StoreTransaction
WHERE Month = 10;

/*
7th Query: What is the Most Expensive Product?

Desired Output:
Name             Price
---------------  -----
Bose Headphones  300         
*/
SELECT Name, Price
FROM Offer
ORDER BY Price DESC
LIMIT 1;


/*
8th Query: Which Employees Don't Do Service

Desired Output:
Employees That Never Did a Service Task
---------------------------------------
William Tanka                          
Stephen Diaz                           
Liban Guled                            
John Doe                               
Max Jane         
*/
SELECT CONCAT(e.FirstName, ' ', e.LastName) AS 'Employees That Never Did a Service Task'
FROM Employee e
LEFT JOIN EmployeeDoesService eds ON eds.EmployeeId = e.Id
WHERE eds.EmployeeId IS NULL;



/*
9th Query: Show Customers With an Email

Desired Output:
Full Name       Email           
--------------  ----------------
James Price     james@gmail.com 
Robert Branco   Robert@gmail.com
Margie Montano  Margie@gmail.com
Tom Norman      Tom@gmail.com   
Samuel Lowe     Samuel@gmail.com      
*/
SELECT CONCAT(FirstName, ' ', LastName) AS 'Full Name', Email
FROM Customer
WHERE Email IS NOT NULL;


/*
10th Query: Show all the iPhone Products and Services

Desired Output:
Id  Name                  Price  Cost
--  --------------------  -----  ----
1   iPhone 11 Pro Screen  100    80  
3   iPhone Adapter        10     7   
4   iPhone 13 Case        15     12  
10  iPhone 8+ Screen      80     60            
*/
SELECT * FROM Offer WHERE Name LIKE '%iphone%';

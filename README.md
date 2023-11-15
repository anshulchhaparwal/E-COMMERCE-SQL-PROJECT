#E-COMMERCE-SQL-PROJECT

DATA_BASE_TABLE

customers

? CustomerID INT
• Customer Name VARCHAR (50)
• ContractName VARCHAR (20)
• Address VARCHAR (80)|
• City VARCHAR (20)|
• Postal Code VARCHAR (10)
• Country VARCHAR(20)



employees

? EmployeeID INT
• LastName VARCHAR (40)
• FirstName VARCHAR(20)
• BirthDate DATE
• Photo VARCHAR(100)
• Notes VARCHAR (500)



shippers

? ShipperID INT
• ShipperName VARCHAR (30)
• Phone VARCHAR(14)



categories

? CategoryID INT 
• CategoryName VARCHAR(20)
• DescriptionText VARCHAR (100)


suppliers

? SupplierID INT
• SuppliersName VARCHAR(80)
• ContactName VARCHAR(30)
• Address VARCHAR(80)
• City VARCHAR(20)
• Postal Code VARCH AR (10)
• Country VARCHAR(20)
• Phone VARCHAR(16)

products

? Productio INT
• ProductName VARCHAR(80) 
• SuppliersiD INT
• CategoryiD INT
• UnitVARCHAR（50）
• Price FLOAT

orders

? OrderID INT
• Custom erID INT
• EmployeeID INT 
• OrderDate DATE
• ShipperID INT

ordersdetails

? OrderDetailID INT
• OrderID INT
• ProductiD INT
• Quantity SMALLINT

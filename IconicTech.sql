SET foreign_key_checks = 0;
START TRANSACTION;

CREATE TABLE Offer (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(255) NOT NULL,
  Price INT NOT NULL,
  Cost INT NOT NULL
);

INSERT INTO Offer VALUES(1,'iPhone 11 Pro Screen',100,80);
INSERT INTO Offer VALUES(2,'Note 10+ Screen',200,170);
INSERT INTO Offer VALUES(3,'iPhone Adapter',10,7);
INSERT INTO Offer VALUES(4,'iPhone 13 Case',15,12);
INSERT INTO Offer VALUES(5,'Voucher',30,0);
INSERT INTO Offer VALUES(6,'Laptop Hinges',35,0);
INSERT INTO Offer VALUES(7,'Bose Headphones',300,270);
INSERT INTO Offer VALUES(8,'Asus Laptop Battery',90,70);
INSERT INTO Offer VALUES(9,'Mouse',20,15);
INSERT INTO Offer VALUES(10,'iPhone 8+ Screen',80,60);

CREATE TABLE Service (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  ServiceNumber INT NOT NULL,
  Status VARCHAR(255) NOT NULL,
  OfferId INT NOT NULL,
  UNIQUE(ServiceNumber),
  FOREIGN KEY (OfferId) REFERENCES Offer(Id)
);

INSERT INTO Service VALUES(2,4039,'Fixed',1);
INSERT INTO Service VALUES(3,4040,'Fixed',2);
INSERT INTO Service VALUES(4,4041,'Fixed',6);
INSERT INTO Service VALUES(5,4042,'Fixed',8);
INSERT INTO Service VALUES(6,4043,'Fixed',10);

CREATE TABLE Product (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  SerialNumber VARCHAR(255) NOT NULL,
  Availability VARCHAR(255) NOT NULL,
  OfferId INT NOT NULL,
  UNIQUE(SerialNumber),
  FOREIGN KEY (OfferId) REFERENCES Offer(Id)
);

INSERT INTO Product VALUES(1,'nnzv9SU8','Yes',3);
INSERT INTO Product VALUES(5,'uX35ravv','Yes',4);
INSERT INTO Product VALUES(6,'kgratr6a','Yes',7);
INSERT INTO Product VALUES(7,'Ghn7GRoH','Yes',5);
INSERT INTO Product VALUES(8,'E3LmzLvx','Yes',9);

CREATE TABLE Employee (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  PhoneNumber INT NOT NULL,
  UNIQUE(FirstName, LastName)
);

INSERT INTO Employee VALUES(1,'William','Tanka',6474801129);
INSERT INTO Employee VALUES(2,'Stephen','Diaz',2453105149);
INSERT INTO Employee VALUES(3,'Michael','Bray',2263425724);
INSERT INTO Employee VALUES(4,'Doug','Loyd',4412537243);
INSERT INTO Employee VALUES(5,'Jason','Court',7065455352);
INSERT INTO Employee VALUES(6,'Liban','Guled',5199821745);
INSERT INTO Employee VALUES(7,'John','Doe',5191231234);
INSERT INTO Employee VALUES(8,'Max','Jane',2263214321);

CREATE TABLE Customer (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  FirstName VARCHAR(255) NOT NULL,
  LastName VARCHAR(255) NOT NULL,
  PhoneNumber INT NOT NULL,
  Email VARCHAR(255),
  UNIQUE(FirstName, PhoneNumber)
);

INSERT INTO Customer VALUES(1,'Shan','Su',5192251290,NULL);
INSERT INTO Customer VALUES(2,'Alem','Iggi',8224899942,NULL);
INSERT INTO Customer VALUES(3,'Igor','Doe',5191231234,NULL);
INSERT INTO Customer VALUES(4,'John','Doe',5191231234,NULL);
INSERT INTO Customer VALUES(5,'Max','Jane',2263214321,NULL);
INSERT INTO Customer VALUES(6,'James','Price',6112491234,'james@gmail.com');
INSERT INTO Customer VALUES(7,'Robert','Branco',5839287289,'Robert@gmail.com');
INSERT INTO Customer VALUES(8,'Margie','Montano',1523973258,'Margie@gmail.com');
INSERT INTO Customer VALUES(9,'Tom','Norman',4985239717,'Tom@gmail.com');
INSERT INTO Customer VALUES(10,'Samuel','Lowe',8905328753,'Samuel@gmail.com');

CREATE TABLE StoreTransaction(
Id INTEGER PRIMARY KEY AUTO_INCREMENT,
RecieptNumber INTEGER NOT NULL,
PaymentMethod VARCHAR(255) NOT NULL,
Day INTEGER NOT NULL,
Month INTEGER NOT NULL,
Year INTEGER NOT NULL,
CustomerId INTEGER NULL,
EmployeeId INTEGER NOT NULL,
OfferId INTEGER UNIQUE NOT NULL,
CONSTRAINT UK_RecieptNumber UNIQUE(RecieptNumber),
CONSTRAINT FK_CustomerId FOREIGN KEY(CustomerId) REFERENCES Customer(Id),
CONSTRAINT FK_EmployeeId FOREIGN KEY(EmployeeId) REFERENCES Employee(Id),
CONSTRAINT FK_OfferId FOREIGN KEY(OfferId) REFERENCES Offer(Id)
);

INSERT INTO StoreTransaction VALUES(1,447206524,'Debit',1,10,2022,1,1,1);
INSERT INTO StoreTransaction VALUES(2,3675200791,'Cash',1,10,2022,1,1,2);
INSERT INTO StoreTransaction VALUES(3,7986318455,'Cash',1,10,2022,2,2,3);
INSERT INTO StoreTransaction VALUES(4,62308610,'Cash',1,10,2022,3,2,4);
INSERT INTO StoreTransaction VALUES(5,7322549116,'Cash',1,10,2022,4,2,5);
INSERT INTO StoreTransaction VALUES(6,3373452602,'Cash',1,10,2022,5,2,6);
INSERT INTO StoreTransaction VALUES(7,9110557437,'Cash',2,10,2022,6,1,7);
INSERT INTO StoreTransaction VALUES(8,3069239620,'Cash',2,10,2022,7,1,8);
INSERT INTO StoreTransaction VALUES(9,513367041,'Cash',2,10,2022,8,1,9);
INSERT INTO StoreTransaction VALUES(10,798266927,'Cash',2,10,2022,9,1,10);

CREATE TABLE EmployeeDoesService (
  Id INT PRIMARY KEY AUTO_INCREMENT,
  EmployeeId INT NOT NULL,
  ServiceId INT UNIQUE NOT NULL,
  Day INT NOT NULL,
  Month INT NOT NULL,
  Year INT NOT NULL,
  Notes VARCHAR(255),
  FOREIGN KEY (EmployeeId) REFERENCES Employee(Id),
  FOREIGN KEY (ServiceId) REFERENCES Service(Id)
);

INSERT INTO EmployeeDoesService VALUES(1,3,2,1,10,2022,NULL);
INSERT INTO EmployeeDoesService VALUES(2,4,3,10,10,2022,NULL);
INSERT INTO EmployeeDoesService VALUES(3,3,4,1,10,2022,NULL);
INSERT INTO EmployeeDoesService VALUES(4,5,5,12,10,2022,NULL);
INSERT INTO EmployeeDoesService VALUES(5,3,6,2,10,2022,NULL);

TRUNCATE TABLE sqlite_sequence;
INSERT INTO sqlite_sequence VALUES('Offer',10);
INSERT INTO sqlite_sequence VALUES('Product',8);
INSERT INTO sqlite_sequence VALUES('Service',6);
INSERT INTO sqlite_sequence VALUES('Employee',8);
INSERT INTO sqlite_sequence VALUES('Customer',10);
INSERT INTO sqlite_sequence VALUES('StoreTransaction',10);
INSERT INTO sqlite_sequence VALUES('EmployeeDoesService',5);

COMMIT;
SET foreign_key_checks = 1;



INSERT INTO BLJOHN0313.Customer 
VALUES('Thomas', 'Johns', '6784125123', 'thomas.johns@gmail.com','123 st', '4-10-1985');
DECLARE @CUSTOMERID AS INT
SET @CUSTOMERID = @@IDENTITY

INSERT INTO BLJOHN0313.Customer 
VALUES('Kelly', 'Brooks', '4045125478', 'kelly123@gmail.com','451 Crop st', '8-31-1975');
DECLARE @CUSTOMERID1 AS INT
SET @CUSTOMERID1 = @@IDENTITY

INSERT INTO BLJOHN0313.Customer 
VALUES('Travis', 'Smalls', '4782131286', 'travs@hotmail.com','9875 Dymo rd', '7-12-1955');
DECLARE @CUSTOMERID2 AS INT
SET @CUSTOMERID2 = @@IDENTITY

INSERT INTO BLJOHN0313.Customer 
VALUES('Nick', 'Sampson', '5412589874', 'fireflames456@yahoo.com','9292 CrossTrains rd', '1-21-1988');
DECLARE @CUSTOMERID3 AS INT
SET @CUSTOMERID3 = @@IDENTITY

INSERT INTO BLJOHN0313.Customer 
VALUES('Lesley', 'Peters', '7701235478', 'les.pets@hotmail.com','215 Cremper st', '5-4-1995');
DECLARE @CUSTOMERID4 AS INT
SET @CUSTOMERID4 = @@IDENTITY


----------------------------------------------------------------------------------------------------------------
INSERT INTO BLJOHN0313.Car
VALUES(@CUSTOMERID, 'Fiat', '500', '2012', '43251', 'Green', 'Broken front-left axel');
DECLARE @CARID AS INT
SET @CARID = SCOPE_IDENTITY () 

INSERT INTO BLJOHN0313.Car
VALUES(@CUSTOMERID1, 'BMW', '325i', '2012', '21000', 'Sliver', 'Car turns itself off without warning');
DECLARE @CARID1 AS INT
SET @CARID1 = SCOPE_IDENTITY () 

INSERT INTO BLJOHN0313.Car
VALUES(@CUSTOMERID2, 'Lexus', 'LFA', '2014', '1574', 'Black', 'Brake pads are bad');
DECLARE @CARID2 AS INT
SET @CARID2 = SCOPE_IDENTITY () 

INSERT INTO BLJOHN0313.Car
VALUES(@CUSTOMERID3, 'Audi', 'A7', '2018', '62814', 'Blue', 'Keyless entry no longer works');
DECLARE @CARID3 AS INT
SET @CARID3 = SCOPE_IDENTITY () 

INSERT INTO BLJOHN0313.Car
VALUES(@CUSTOMERID4, 'Honda', 'Civic', '2002', '243589', 'Sliver', 'Airbag recall');
DECLARE @CARID4 AS INT
SET @CARID4 = SCOPE_IDENTITY ()   
----------------------------------------------------------------------------------------------------------------
INSERT INTO BLJOHN0313.RepairShop
VALUES('Parts shop', 'Replacing car parts and various materials', '1278 Fixit st. Building #1', '4.2', 'This shop has 17 reviews', 1 );
DECLARE @REPAIRSHOPID AS INT
SET @REPAIRSHOPID = SCOPE_IDENTITY ()   

INSERT INTO BLJOHN0313.RepairShop
VALUES('Diagnostic shop', 'Running test on cars to find a solution to the problem', '1278 Fixit st. Building #2', '4.1', 'This shop has 12 reviews', 1 );
DECLARE @REPAIRSHOPID1 AS INT
SET @REPAIRSHOPID1 = SCOPE_IDENTITY ()  
 
INSERT INTO BLJOHN0313.RepairShop
VALUES('Brakes and Rotors shop', 'Deals with all brakes and rotors problems ', '1278 Fixit st. Building #3', '4.7', 'This shop has 210 reviews', 1 );
DECLARE @REPAIRSHOPID2 AS INT
SET @REPAIRSHOPID2 = SCOPE_IDENTITY ()   

INSERT INTO BLJOHN0313.RepairShop
VALUES('Tech Shop', 'Deals with all issues reguarding technology in a car', '1278 Fixit st. Building #4', '3.5', 'This shop has 10 reviews', 1 );
DECLARE @REPAIRSHOPID3 AS INT
SET @REPAIRSHOPID3 = SCOPE_IDENTITY ()  
 
INSERT INTO BLJOHN0313.RepairShop
VALUES('Recall shop', 'Deals with all recalls a car may have', '1278 Fixit st. Building #5', '4.2', 'This shop has 158 reviews', 1 );
DECLARE @REPAIRSHOPID4 AS INT
SET @REPAIRSHOPID4 = SCOPE_IDENTITY ()   

----------------------------------------------------------------------------------------------------------------
INSERT INTO BLJOHN0313.Technician
VALUES(@REPAIRSHOPID, 'FRANCESCO', 'MANAGER', 'ITALIAN CARS', 1, 'A1 Engine Repair, A2 Automatic Transmission/Transaxle, A3 Manual Drive Train and Axles, A4 Suspension and Steering, A5 Brakes, A6 Electrical/Electronic Systems, A7 Heating and Air Conditioning, A8 Engine Performance');
DECLARE @TECHID AS INT
SET @TECHID = SCOPE_IDENTITY ()  

INSERT INTO BLJOHN0313.Technician
VALUES(@REPAIRSHOPID1, 'JOSH', 'ASSISTANT MANAGER', 'ALL CARS', 1, 'A1 Engine Repair, A2 Automatic Transmission/Transaxle, A4 Suspension and Steering, A5 Brakes, A6 Electrical/Electronic Systems, A8 Engine Performance');
DECLARE @TECHID1 AS INT
SET @TECHID1 = SCOPE_IDENTITY ()  

INSERT INTO BLJOHN0313.Technician
VALUES(@REPAIRSHOPID2, 'LAUREN', 'MANAGER', 'ALL CARS', 1, 'A4 Suspension and Steering, A5 Brakes, A8 Engine Performance');
DECLARE @TECHID2 AS INT
SET @TECHID2 = SCOPE_IDENTITY ()  

INSERT INTO BLJOHN0313.Technician
VALUES(@REPAIRSHOPID3, 'RYAN', 'EMPLOYEE', 'ALL CARS', 1, 'A6 Electrical/Electronic Systems');
DECLARE @TECHID3 AS INT
SET @TECHID3 = SCOPE_IDENTITY ()  

INSERT INTO BLJOHN0313.Technician
VALUES(@REPAIRSHOPID4, 'LIN', 'OWNER', 'ALL CARS', 1, 'A1 Engine Repair, A2 Automatic Transmission/Transaxle, A3 Manual Drive Train and Axles, A4 Suspension and Steering, A5 Brakes, A6 Electrical/Electronic Systems, A7 Heating and Air Conditioning, A8 Engine Performance');
DECLARE @TECHID4 AS INT
SET @TECHID4 = SCOPE_IDENTITY ()  
 
----------------------------------------------------------------------------------------------------------------
INSERT INTO BLJOHN0313.CarRepairHistory
VALUES(@CARID, @TECHID, @CUSTOMERID, getdate(), 'FRONT LEFT AXEL WAS REPLACED', 'FRANCESCO', 'RL105679AA', '1.5');
DECLARE @CRHID AS INT
SET @CRHID = SCOPE_IDENTITY ()   

INSERT INTO BLJOHN0313.CarRepairHistory
VALUES(@CARID1, @TECHID1, @CUSTOMERID1, getdate(), 'RAN DIAGNOSTIC TEST ON CAR', 'JOSH', 'BGS9159973', '2.0');
DECLARE @CRHID1 AS INT
SET @CRHID1 = SCOPE_IDENTITY ()   

INSERT INTO BLJOHN0313.CarRepairHistory
VALUES(@CARID2, @TECHID2, @CUSTOMERID2, getdate(), 'BRAKE PADS WERE REPLACED', 'LAUREN', 'LBP838JP838', '2.5');
DECLARE @CRHID2 AS INT
SET @CRHID2 = SCOPE_IDENTITY ()   

INSERT INTO BLJOHN0313.CarRepairHistory
VALUES(@CARID3, @TECHID3, @CUSTOMERID3, getdate(), 'REPLACED BATTERIES AND REPROGRAMMED KEY', 'RYAN', 'NO PARTS FITTED', '0.5');
DECLARE @CRHID3 AS INT
SET @CRHID3 = SCOPE_IDENTITY ()   

INSERT INTO BLJOHN0313.CarRepairHistory
VALUES(@CARID4, @TECHID4, @CUSTOMERID4, getdate(), 'REPLACED AIRBAGS ON CAR', 'LIN', 'HN45781AR', '1.5');
DECLARE @CRHID4 AS INT
SET @CRHID4 = SCOPE_IDENTITY ()   

----------------------------------------------------------------------------------------------------------------
INSERT INTO BLJOHN0313.CarRepairInvoice
VALUES(@CRHID, '350', 'FRONT LEFT AXEL WAS REPLACED', 'FRANCESCO', getdate(), 'Visa-Debit', 'Try to avoid pot holes');
DECLARE @INVOICEID AS INT
SET @INVOICEID = SCOPE_IDENTITY ()  

INSERT INTO BLJOHN0313.CarRepairInvoice
VALUES(@CRHID1, '150', 'RAM TEST ON CAR TO FIND THE ISSUE', 'JOSH', getdate(), 'Visa-Credit', 'OZONE SENSORS NEED TO BE REPLACED');
DECLARE @INVOICEID1 AS INT
SET @INVOICEID1 = SCOPE_IDENTITY ()  

INSERT INTO BLJOHN0313.CarRepairInvoice
VALUES(@CRHID2, '1550', 'BRAKES WERE REPLACED', 'LAUREN', getdate(), 'Cash', 'Try not to speed so much Labor for this car is high');
DECLARE @INVOICEID2 AS INT
SET @INVOICEID2 = SCOPE_IDENTITY ()  

INSERT INTO BLJOHN0313.CarRepairInvoice
VALUES(@CRHID3, '500', 'KEY FOB REPLACED AND REPROGRAMMED', 'RYAN', getdate(), 'Check', 'NO FEEDBACK GIVEN');
DECLARE @INVOICEID3 AS INT
SET @INVOICEID3 = SCOPE_IDENTITY ()  

INSERT INTO BLJOHN0313.CarRepairInvoice
VALUES(@CRHID4, '0', 'AIRBAG REPLACED', 'LIN', getdate(), 'Discover', 'AIRBIG REPLACED');
DECLARE @INVOICEID4 AS INT
SET @INVOICEID4 = SCOPE_IDENTITY ()  

----------------------------------------------------------------------------------------------------------------
INSERT INTO BLJOHN0313.CarPart
VALUES(@CARID, '175', 'AXLE FOR FIAT 500',0,'20', '3.8', 'CARBON FIBER MATERIAL');

INSERT INTO BLJOHN0313.CarPart
VALUES(@CARID1, '0', 'NO PARTS USED',0,'0', '0.0', 'NO FEATURES LISTED');

INSERT INTO BLJOHN0313.CarPart
VALUES(@CARID2, '50', 'BRAKES FOR LFA',0,'1', '4.8', 'TOP OF THE LINE PADS FOR YOUR CAR');

INSERT INTO BLJOHN0313.CarPart
VALUES(@CARID3, '450', 'SMART KEY AND BATTERY FOR AUDI A7',0,'10', '3.9', 'KEY ALLOWS USER TO CONTROL CAR FROM KEY');

INSERT INTO BLJOHN0313.CarPart
VALUES(@CARID4, '0', 'AIRBAG FOR HONDA CIVIC',0,'100', '4.2', 'FIXES ISSUE OF AIRBAG NOT DEPOLYING');
----------------------------------------------------------------------------------------------------------------








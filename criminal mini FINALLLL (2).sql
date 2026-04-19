-- ============================================================
-- CRIMINAL RECORDS MANAGEMENT SYSTEM
-- Database: SQL Server Management Studio 2022 (SSMS 22)
-- Author: DBMS Mini Project
-- Description: Full backend SQL script with 7 tables,
--              each populated with 100 entries.
-- ============================================================
create database  dbmsmini3;
USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = N'CriminalRecordsDB')
    DROP DATABASE CriminalRecordsDB;

-- ============================================================
-- TABLE 1: PoliceOfficer
-- ============================================================
CREATE TABLE PoliceOfficer (
    OfficerID       INT PRIMARY KEY IDENTITY(1,1),
    FirstName       NVARCHAR(50)  NOT NULL,
    LastName        NVARCHAR(50)  NOT NULL,
    BadgeNumber     NVARCHAR(20)  UNIQUE NOT NULL,
    Rank            NVARCHAR(50)  NOT NULL,
    Department      NVARCHAR(100) NOT NULL,
    PhoneNumber     NVARCHAR(15)  NOT NULL,
    Email           NVARCHAR(100),
    DateJoined      DATE          NOT NULL,
    IsActive        BIT           NOT NULL DEFAULT 1
);
GO
select * from PoliceOfficer;
-- ============================================================
-- TABLE 2: Court
-- ============================================================
CREATE TABLE Court3 (
    CourtID         INT PRIMARY KEY IDENTITY(1,1),
    CourtName       NVARCHAR(150) NOT NULL,
    CourtType       NVARCHAR(50)  NOT NULL,   -- e.g. District, High, Sessions
    City            NVARCHAR(100) NOT NULL,
    State           NVARCHAR(100) NOT NULL,
    Address         NVARCHAR(255),
    PhoneNumber     NVARCHAR(15),
    JudgeName       NVARCHAR(100) NOT NULL,
    EstablishedYear INT
);
GO
select * from Court3;
-- ============================================================
-- TABLE 3: Lawyer
-- ============================================================
CREATE TABLE Lawyer2 (
    LawyerID        INT PRIMARY KEY IDENTITY(1,1),
    FirstName       NVARCHAR(50)  NOT NULL,
    LastName        NVARCHAR(50)  NOT NULL,
    LicenseNumber   NVARCHAR(30)  UNIQUE NOT NULL,
    Specialization  NVARCHAR(100) NOT NULL,
    PhoneNumber     NVARCHAR(15)  NOT NULL,
    Email           NVARCHAR(100),
    BarAssociation  NVARCHAR(100),
    YearsExperience INT,
    IsDefenseAttorney BIT         NOT NULL DEFAULT 1  -- 1=Defense, 0=Prosecution
);
GO
select * from Lawyer2;
-- ============================================================
-- TABLE 4: Criminal
-- ============================================================
CREATE TABLE Criminal6 (
    CriminalID      INT PRIMARY KEY IDENTITY(1,1),
    FirstName       NVARCHAR(50)  NOT NULL,
    LastName        NVARCHAR(50)  NOT NULL,
    DateOfBirth     DATE          NOT NULL,
    Gender          CHAR(1)       NOT NULL CHECK (Gender IN ('M','F','O')),
    Nationality     NVARCHAR(50)  NOT NULL,
    NationalID      NVARCHAR(30)  UNIQUE NOT NULL,
    Address         NVARCHAR(255),
    PhoneNumber     NVARCHAR(15),
    CriminalStatus  NVARCHAR(30)  NOT NULL DEFAULT 'Arrested'
        CHECK (CriminalStatus IN ('Arrested','Convicted','Released','Fugitive','Deceased'))
);
GO
select * from Criminal6;


-- ============================================================
-- TABLE 5: Crime
-- ============================================================
CREATE TABLE Crime5 (
    CrimeID         INT PRIMARY KEY IDENTITY(1,1),
    CrimeType       NVARCHAR(100) NOT NULL,
    Description     NVARCHAR(500),
    Severity        NVARCHAR(20)  NOT NULL CHECK (Severity IN ('Minor','Moderate','Serious','Heinous')),
    DateOccurred    DATE          NOT NULL,
    Location        NVARCHAR(255) NOT NULL,
    CriminalID      INT           NOT NULL,
    OfficerID       INT           NOT NULL,
    IsResolved      BIT           NOT NULL DEFAULT 0,
    CONSTRAINT FK_Crime_Criminal FOREIGN KEY (CriminalID) REFERENCES Criminal6(CriminalID),
    CONSTRAINT FK_Crime_Officer  FOREIGN KEY (OfficerID)  REFERENCES PoliceOfficer(OfficerID)
);
GO
select * from crime5;
-- ============================================================
-- TABLE 6: CaseRecord
-- ============================================================
CREATE TABLE CaseRecord (
    CaseID          INT PRIMARY KEY IDENTITY(1,1),
    CaseNumber      NVARCHAR(30)  UNIQUE NOT NULL,
    CaseTitle       NVARCHAR(200) NOT NULL,
    CrimeID         INT           NOT NULL,
    CourtID         INT           NOT NULL,
    LawyerID        INT           NOT NULL,   -- Defense Lawyer
    OfficerID       INT           NOT NULL,   -- Investigating Officer
    FilingDate      DATE          NOT NULL,
    HearingDate     DATE,
    Verdict         NVARCHAR(50)  CHECK (Verdict IN ('Guilty','Not Guilty','Dismissed','Pending','Acquitted')),
    CaseStatus      NVARCHAR(30)  NOT NULL DEFAULT 'Open'
        CHECK (CaseStatus IN ('Open','Closed','Under Investigation','Appealed')),
    SentenceYears   INT,
    FineAmount      DECIMAL(12,2),
    CONSTRAINT FK_Case_Crime   FOREIGN KEY (CrimeID)   REFERENCES Crime5(CrimeID),
    CONSTRAINT FK_Case_Court   FOREIGN KEY (CourtID)   REFERENCES Court3(CourtID),
    CONSTRAINT FK_Case_Lawyer  FOREIGN KEY (LawyerID)  REFERENCES Lawyer2(LawyerID),
    CONSTRAINT FK_Case_Officer FOREIGN KEY (OfficerID) REFERENCES PoliceOfficer(OfficerID)
);
GO
select * from CaseRecord;
-- ============================================================
-- TABLE 7: FamilyMember
-- ============================================================
CREATE TABLE FamilyMember (
    FamilyMemberID  INT PRIMARY KEY IDENTITY(1,1),
    CriminalID      INT           NOT NULL,
    FirstName       NVARCHAR(50)  NOT NULL,
    LastName        NVARCHAR(50)  NOT NULL,
    Relationship    NVARCHAR(50)  NOT NULL,  -- e.g. Spouse, Parent, Sibling, Child
    DateOfBirth     DATE,
    PhoneNumber     NVARCHAR(15),
    Address         NVARCHAR(255),
    IsCooperating   BIT           NOT NULL DEFAULT 0,
    CONSTRAINT FK_Family_Criminal FOREIGN KEY (CriminalID) REFERENCES Criminal6(CriminalID)
);
select * from FamilyMember;
GO

-- ============================================================
-- DATA INSERT: TABLE 1 - PoliceOfficer (100 rows)
-- ============================================================
SET IDENTITY_INSERT PoliceOfficer ON;
INSERT INTO PoliceOfficer (OfficerID,FirstName,LastName,BadgeNumber,Rank,Department,PhoneNumber,Email,DateJoined,IsActive) VALUES
(1,'James','Anderson','B1001','Inspector','Homicide','555-1001','j.anderson@police.gov','2005-03-15',1),
(2,'Maria','Garcia','B1002','Sergeant','Narcotics','555-1002','m.garcia@police.gov','2008-06-20',1),
(3,'Robert','Johnson','B1003','Constable','Patrol','555-1003','r.johnson@police.gov','2015-09-10',1),
(4,'Linda','Martinez','B1004','Detective','Cybercrime','555-1004','l.martinez@police.gov','2012-11-01',1),
(5,'William','Wilson','B1005','Inspector','Fraud','555-1005','w.wilson@police.gov','2003-01-22',1),
(6,'Patricia','Moore','B1006','Sergeant','Robbery','555-1006','p.moore@police.gov','2010-07-14',1),
(7,'David','Taylor','B1007','Constable','Patrol','555-1007','d.taylor@police.gov','2018-04-05',1),
(8,'Barbara','Thomas','B1008','Detective','Homicide','555-1008','b.thomas@police.gov','2009-12-30',1),
(9,'Richard','Jackson','B1009','Inspector','Narcotics','555-1009','r.jackson@police.gov','2006-08-18',1),
(10,'Susan','White','B1010','Sergeant','Cybercrime','555-1010','s.white@police.gov','2011-02-25',1),
(11,'Joseph','Harris','B1011','Constable','Traffic','555-1011','j.harris@police.gov','2019-05-16',1),
(12,'Jessica','Martin','B1012','Detective','Fraud','555-1012','j.martin@police.gov','2007-10-09',1),
(13,'Thomas','Thompson','B1013','Inspector','Robbery','555-1013','t.thompson@police.gov','2004-03-28',1),
(14,'Sarah','Garcia','B1014','Sergeant','Narcotics','555-1014','s.garciax@police.gov','2013-09-03',1),
(15,'Charles','Martinez','B1015','Constable','Patrol','555-1015','c.martinez@police.gov','2017-06-11',1),
(16,'Karen','Robinson','B1016','Detective','Homicide','555-1016','k.robinson@police.gov','2008-01-19',1),
(17,'Christopher','Clark','B1017','Inspector','Cybercrime','555-1017','c.clark@police.gov','2002-12-07',1),
(18,'Nancy','Rodriguez','B1018','Sergeant','Fraud','555-1018','n.rodriguez@police.gov','2014-04-23',1),
(19,'Daniel','Lewis','B1019','Constable','Patrol','555-1019','d.lewis@police.gov','2020-08-30',1),
(20,'Lisa','Lee','B1020','Detective','Robbery','555-1020','l.lee@police.gov','2010-11-14',1),
(21,'Matthew','Walker','B1021','Inspector','Narcotics','555-1021','m.walker@police.gov','2005-07-02',1),
(22,'Betty','Hall','B1022','Sergeant','Homicide','555-1022','b.hall@police.gov','2009-03-17',1),
(23,'Anthony','Allen','B1023','Constable','Traffic','555-1023','a.allen@police.gov','2016-10-25',1),
(24,'Margaret','Young','B1024','Detective','Cybercrime','555-1024','m.young@police.gov','2011-06-08',1),
(25,'Mark','Hernandez','B1025','Inspector','Fraud','555-1025','m.hernandez@police.gov','2003-09-20',1),
(26,'Sandra','King','B1026','Sergeant','Robbery','555-1026','s.king@police.gov','2012-02-14',1),
(27,'Donald','Wright','B1027','Constable','Patrol','555-1027','d.wright@police.gov','2018-07-06',1),
(28,'Ashley','Scott','B1028','Detective','Narcotics','555-1028','a.scott@police.gov','2007-04-29',1),
(29,'Paul','Torres','B1029','Inspector','Homicide','555-1029','p.torres@police.gov','2001-11-11',1),
(30,'Kimberly','Nguyen','B1030','Sergeant','Cybercrime','555-1030','k.nguyen@police.gov','2015-01-03',1),
(31,'Steven','Hill','B1031','Constable','Patrol','555-1031','s.hill@police.gov','2019-08-22',1),
(32,'Emily','Flores','B1032','Detective','Fraud','555-1032','e.flores@police.gov','2006-05-15',1),
(33,'Andrew','Green','B1033','Inspector','Robbery','555-1033','a.green@police.gov','2004-12-01',1),
(34,'Donna','Adams','B1034','Sergeant','Narcotics','555-1034','d.adams@police.gov','2013-06-27',1),
(35,'Joshua','Nelson','B1035','Constable','Traffic','555-1035','j.nelson@police.gov','2017-03-09',1),
(36,'Carol','Baker','B1036','Detective','Homicide','555-1036','c.baker@police.gov','2008-09-14',1),
(37,'Kevin','Carter','B1037','Inspector','Cybercrime','555-1037','k.carter@police.gov','2002-04-18',1),
(38,'Michelle','Mitchell','B1038','Sergeant','Fraud','555-1038','m.mitchell@police.gov','2014-10-05',1),
(39,'Brian','Perez','B1039','Constable','Patrol','555-1039','b.perez@police.gov','2021-02-12',1),
(40,'Amanda','Roberts','B1040','Detective','Robbery','555-1040','a.roberts@police.gov','2010-07-31',1),
(41,'George','Turner','B1041','Inspector','Narcotics','555-1041','g.turner@police.gov','2005-11-24',1),
(42,'Melissa','Phillips','B1042','Sergeant','Homicide','555-1042','m.phillips@police.gov','2009-08-07',1),
(43,'Edward','Campbell','B1043','Constable','Traffic','555-1043','e.campbell@police.gov','2016-05-19',1),
(44,'Deborah','Parker','B1044','Detective','Cybercrime','555-1044','d.parker@police.gov','2011-12-26',1),
(45,'Ronald','Evans','B1045','Inspector','Fraud','555-1045','r.evans@police.gov','2003-06-13',1),
(46,'Stephanie','Edwards','B1046','Sergeant','Robbery','555-1046','s.edwards@police.gov','2012-09-02',1),
(47,'Timothy','Collins','B1047','Constable','Patrol','555-1047','t.collins@police.gov','2018-01-28',1),
(48,'Rebecca','Stewart','B1048','Detective','Narcotics','555-1048','r.stewart@police.gov','2007-07-21',1),
(49,'Larry','Sanchez','B1049','Inspector','Homicide','555-1049','l.sanchez@police.gov','2001-03-04',1),
(50,'Sharon','Morris','B1050','Sergeant','Cybercrime','555-1050','s.morris@police.gov','2015-10-16',1),
(51,'Jeffrey','Rogers','B1051','Constable','Patrol','555-1051','j.rogers@police.gov','2020-04-08',1),
(52,'Cynthia','Reed','B1052','Detective','Fraud','555-1052','c.reed@police.gov','2006-01-31',1),
(53,'Frank','Cook','B1053','Inspector','Robbery','555-1053','f.cook@police.gov','2004-08-17',1),
(54,'Angela','Morgan','B1054','Sergeant','Narcotics','555-1054','a.morgan@police.gov','2013-03-10',1),
(55,'Scott','Bell','B1055','Constable','Traffic','555-1055','s.bell@police.gov','2017-10-29',1),
(56,'Kathleen','Murphy','B1056','Detective','Homicide','555-1056','k.murphy@police.gov','2008-06-05',1),
(57,'Eric','Bailey','B1057','Inspector','Cybercrime','555-1057','e.bailey@police.gov','2002-01-23',1),
(58,'Shirley','Rivera','B1058','Sergeant','Fraud','555-1058','s.rivera@police.gov','2014-07-18',1),
(59,'Stephen','Cooper','B1059','Constable','Patrol','555-1059','s.cooper@police.gov','2021-09-06',1),
(60,'Janet','Richardson','B1060','Detective','Robbery','555-1060','j.richardson@police.gov','2010-04-14',1),
(61,'Raymond','Cox','B1061','Inspector','Narcotics','555-1061','r.cox@police.gov','2005-08-27',1),
(62,'Pamela','Howard','B1062','Sergeant','Homicide','555-1062','p.howard@police.gov','2009-05-20',1),
(63,'Gregory','Ward','B1063','Constable','Traffic','555-1063','g.ward@police.gov','2016-02-03',1),
(64,'Virginia','Torres','B1064','Detective','Cybercrime','555-1064','v.torres@police.gov','2011-09-11',1),
(65,'Harold','Peterson','B1065','Inspector','Fraud','555-1065','h.peterson@police.gov','2003-03-30',1),
(66,'Catherine','Gray','B1066','Sergeant','Robbery','555-1066','c.gray@police.gov','2012-12-19',1),
(67,'Patrick','Ramirez','B1067','Constable','Patrol','555-1067','p.ramirez@police.gov','2018-10-15',1),
(68,'Christine','James','B1068','Detective','Narcotics','555-1068','c.james@police.gov','2007-01-08',1),
(69,'Jack','Watson','B1069','Inspector','Homicide','555-1069','j.watson@police.gov','2001-06-21',1),
(70,'Samantha','Brooks','B1070','Sergeant','Cybercrime','555-1070','s.brooks@police.gov','2015-07-04',1),
(71,'Dennis','Kelly','B1071','Constable','Patrol','555-1071','d.kelly@police.gov','2020-11-23',1),
(72,'Rachel','Sanders','B1072','Detective','Fraud','555-1072','r.sanders@police.gov','2006-08-26',1),
(73,'Jerry','Price','B1073','Inspector','Robbery','555-1073','j.price@police.gov','2004-05-09',1),
(74,'Carolyn','Bennett','B1074','Sergeant','Narcotics','555-1074','c.bennett@police.gov','2013-12-22',1),
(75,'Walter','Wood','B1075','Constable','Traffic','555-1075','w.wood@police.gov','2017-07-17',1),
(76,'Maria','Barnes','B1076','Detective','Homicide','555-1076','m.barnes@police.gov','2008-03-01',1),
(77,'Alan','Ross','B1077','Inspector','Cybercrime','555-1077','a.ross@police.gov','2002-08-14',1),
(78,'Heather','Henderson','B1078','Sergeant','Fraud','555-1078','h.henderson@police.gov','2014-01-07',1),
(79,'Arthur','Coleman','B1079','Constable','Patrol','555-1079','a.coleman@police.gov','2021-06-18',1),
(80,'Julie','Jenkins','B1080','Detective','Robbery','555-1080','j.jenkins@police.gov','2010-01-31',1),
(81,'Roger','Perry','B1081','Inspector','Narcotics','555-1081','r.perry@police.gov','2005-05-14',1),
(82,'Joyce','Powell','B1082','Sergeant','Homicide','555-1082','j.powell@police.gov','2009-02-06',1),
(83,'Bruce','Long','B1083','Constable','Traffic','555-1083','b.long@police.gov','2016-11-28',1),
(84,'Victoria','Patterson','B1084','Detective','Cybercrime','555-1084','v.patterson@police.gov','2011-07-21',1),
(85,'Terry','Hughes','B1085','Inspector','Fraud','555-1085','t.hughes@police.gov','2003-12-10',1),
(86,'Frances','Flores','B1086','Sergeant','Robbery','555-1086','f.floresx@police.gov','2012-06-29',1),
(87,'Willie','Washington','B1087','Constable','Patrol','555-1087','w.washington@police.gov','2018-04-12',1),
(88,'Evelyn','Butler','B1088','Detective','Narcotics','555-1088','e.butler@police.gov','2007-10-25',1),
(89,'Wayne','Simmons','B1089','Inspector','Homicide','555-1089','w.simmons@police.gov','2001-09-08',1),
(90,'Theresa','Foster','B1090','Sergeant','Cybercrime','555-1090','t.foster@police.gov','2015-04-21',1),
(91,'Ralph','Gonzalez','B1091','Constable','Patrol','555-1091','r.gonzalez@police.gov','2020-08-14',1),
(92,'Janice','Bryant','B1092','Detective','Fraud','555-1092','j.bryant@police.gov','2006-04-07',1),
(93,'Roy','Alexander','B1093','Inspector','Robbery','555-1093','r.alexander@police.gov','2004-11-20',1),
(94,'Alice','Russell','B1094','Sergeant','Narcotics','555-1094','a.russell@police.gov','2013-07-03',1),
(95,'Billy','Griffin','B1095','Constable','Traffic','555-1095','b.griffin@police.gov','2017-01-16',1),
(96,'Jean','Diaz','B1096','Detective','Homicide','555-1096','j.diaz@police.gov','2008-09-29',1),
(97,'Joe','Hayes','B1097','Inspector','Cybercrime','555-1097','j.hayes@police.gov','2002-06-12',1),
(98,'Diane','Myers','B1098','Sergeant','Fraud','555-1098','d.myers@police.gov','2014-11-25',1),
(99,'Henry','Ford','B1099','Constable','Patrol','555-1099','h.ford@police.gov','2021-03-09',1),
(100,'Gloria','Hamilton','B1100','Detective','Robbery','555-1100','g.hamilton@police.gov','2010-10-18',1);
SET IDENTITY_INSERT PoliceOfficer OFF;
GO

-- ============================================================
-- DATA INSERT: TABLE 2 - Court (100 rows)
-- ============================================================
SET IDENTITY_INSERT Court3 ON;
INSERT INTO Court3 (CourtID,CourtName,CourtType,City,State,Address,PhoneNumber,JudgeName,EstablishedYear) VALUES
(1,'Central District Court','District','New York','New York','100 Centre St, NY 10013','212-555-0001','Hon. Robert Stevens',1950),
(2,'Northern High Court','High','Chicago','Illinois','69 W Washington St','312-555-0002','Hon. Linda Chang',1945),
(3,'Southern Sessions Court','Sessions','Houston','Texas','1201 Franklin St','713-555-0003','Hon. Michael Torres',1960),
(4,'Eastern District Court','District','Philadelphia','Pennsylvania','601 Market St','215-555-0004','Hon. Sarah Brooks',1955),
(5,'Western High Court','High','Phoenix','Arizona','175 W Madison St','602-555-0005','Hon. David Nguyen',1948),
(6,'Metro Sessions Court','Sessions','San Antonio','Texas','300 Dolorosa St','210-555-0006','Hon. Jennifer Reed',1962),
(7,'Bay Area District Court','District','San Diego','California','220 W Broadway','619-555-0007','Hon. James Carter',1952),
(8,'North High Court','High','Dallas','Texas','600 Commerce St','214-555-0008','Hon. Patricia Evans',1947),
(9,'City Sessions Court','Sessions','San Jose','California','191 N 1st St','408-555-0009','Hon. William Morgan',1965),
(10,'Central High Court','High','Austin','Texas','1000 Guadalupe St','512-555-0010','Hon. Elizabeth Bell',1943),
(11,'Riverside District Court','District','Jacksonville','Florida','330 E Bay St','904-555-0011','Hon. Charles Murphy',1958),
(12,'Lakeside Sessions Court','Sessions','Columbus','Ohio','369 S High St','614-555-0012','Hon. Karen Bailey',1963),
(13,'Westside High Court','High','Charlotte','North Carolina','832 E 4th St','704-555-0013','Hon. Daniel Rivera',1950),
(14,'Eastside District Court','District','Indianapolis','Indiana','200 E Washington St','317-555-0014','Hon. Michelle Cooper',1955),
(15,'Harbor Sessions Court','Sessions','San Francisco','California','400 McAllister St','415-555-0015','Hon. Joseph Richardson',1940),
(16,'Hillside High Court','High','Seattle','Washington','516 3rd Ave','206-555-0016','Hon. Mary Cox',1946),
(17,'Valley District Court','District','Denver','Colorado','1437 Bannock St','303-555-0017','Hon. Steven Ward',1957),
(18,'Summit Sessions Court','Sessions','Nashville','Tennessee','1 Public Sq','615-555-0018','Hon. Donna Torres',1961),
(19,'Central Sessions Court','Sessions','Oklahoma City','Oklahoma','321 Robert S Kerr Ave','405-555-0019','Hon. Thomas Peterson',1966),
(20,'Main District Court','District','El Paso','Texas','500 E San Antonio Ave','915-555-0020','Hon. Sandra Gray',1953),
(21,'Grand High Court','High','Louisville','Kentucky','700 W Jefferson St','502-555-0021','Hon. Edward Ramirez',1944),
(22,'Crown Sessions Court','Sessions','Baltimore','Maryland','100 N Calvert St','410-555-0022','Hon. Lisa James',1960),
(23,'North District Court','District','Milwaukee','Wisconsin','901 N 9th St','414-555-0023','Hon. Ronald Watson',1956),
(24,'South High Court','High','Albuquerque','New Mexico','400 Lomas Blvd NW','505-555-0024','Hon. Dorothy Brooks',1949),
(25,'City District Court','District','Tucson','Arizona','110 W Congress St','520-555-0025','Hon. Kenneth Kelly',1954),
(26,'Regional Sessions Court','Sessions','Fresno','California','1100 Van Ness Ave','559-555-0026','Hon. Sharon Sanders',1967),
(27,'Municipal High Court','High','Sacramento','California','813 6th St','916-555-0027','Hon. George Price',1948),
(28,'Township District Court','District','Long Beach','California','415 W Ocean Blvd','562-555-0028','Hon. Betty Bennett',1952),
(29,'County Sessions Court','Sessions','Kansas City','Missouri','415 E 12th St','816-555-0029','Hon. Carl Wood',1963),
(30,'State High Court','High','Mesa','Arizona','555 N Center St','480-555-0030','Hon. Helen Barnes',1951),
(31,'Federal District Court','District','Atlanta','Georgia','75 Ted Turner Dr SW','404-555-0031','Hon. Frank Ross',1958),
(32,'Justice Sessions Court','Sessions','Virginia Beach','Virginia','2425 Nimmo Pkwy','757-555-0032','Hon. Ruth Henderson',1964),
(33,'Supreme High Court','High','Raleigh','North Carolina','100 E Morgan St','919-555-0033','Hon. Harold Coleman',1946),
(34,'Lincoln District Court','District','Colorado Springs','Colorado','270 S Tejon St','719-555-0034','Hon. Beverly Jenkins',1955),
(35,'Adams Sessions Court','Sessions','Miami','Florida','175 NW 1st Ave','305-555-0035','Hon. Keith Perry',1962),
(36,'Jefferson High Court','High','Omaha','Nebraska','1701 Farnam St','402-555-0036','Hon. Judy Long',1947),
(37,'Madison District Court','District','Oakland','California','1225 Fallon St','510-555-0037','Hon. Billy Patterson',1953),
(38,'Monroe Sessions Court','Sessions','Minneapolis','Minnesota','300 S 6th St','612-555-0038','Hon. Joan Hughes',1961),
(39,'Jackson High Court','High','Tulsa','Oklahoma','500 S Denver Ave','918-555-0039','Hon. Peter Flores',1944),
(40,'Harrison District Court','District','Tampa','Florida','800 E Twiggs St','813-555-0040','Hon. Frances Washington',1957),
(41,'Tyler Sessions Court','Sessions','Arlington','Texas','101 W Abram St','817-555-0041','Hon. Roger Butler',1965),
(42,'Polk High Court','High','New Orleans','Louisiana','421 Loyola Ave','504-555-0042','Hon. Ann Simmons',1943),
(43,'Taylor District Court','District','Wichita','Kansas','525 N Main St','316-555-0043','Hon. Johnny Foster',1956),
(44,'Fillmore Sessions Court','Sessions','Bakersfield','California','1415 Truxtun Ave','661-555-0044','Hon. Virginia Gonzalez',1968),
(45,'Pierce High Court','High','Aurora','Colorado','15151 E Alameda Pkwy','303-555-0045','Hon. Walter Bryant',1950),
(46,'Buchanan District Court','District','Anaheim','California','425 S Harbor Blvd','714-555-0046','Hon. Catherine Alexander',1954),
(47,'Johnson Sessions Court','Sessions','Santa Ana','California','700 Civic Center Dr W','714-555-0047','Hon. Larry Russell',1963),
(48,'Grant High Court','High','Corpus Christi','Texas','901 Leopard St','361-555-0048','Hon. Mary Griffin',1948),
(49,'Hayes District Court','District','Riverside','California','4100 Main St','951-555-0049','Hon. Edward Diaz',1952),
(50,'Garfield Sessions Court','Sessions','Lexington','Kentucky','100 E Vine St','859-555-0050','Hon. Donna Hayes',1966),
(51,'Arthur High Court','High','Pittsburgh','Pennsylvania','414 Grant St','412-555-0051','Hon. Samuel Myers',1945),
(52,'Cleveland District Court','District','Stockton','California','222 E Weber Ave','209-555-0052','Hon. Gloria Ford',1957),
(53,'McKinley Sessions Court','Sessions','Anchorage','Alaska','825 W 4th Ave','907-555-0053','Hon. Earl Hamilton',1960),
(54,'Roosevelt High Court','High','Cincinnati','Ohio','1000 Main St','513-555-0054','Hon. Evelyn Graham',1942),
(55,'Taft District Court','District','St. Paul','Minnesota','15 W Kellogg Blvd','651-555-0055','Hon. Fred Sullivan',1958),
(56,'Wilson Sessions Court','Sessions','Toledo','Ohio','555 N Erie St','419-555-0056','Hon. Alice Jordan',1964),
(57,'Harding High Court','High','Greensboro','North Carolina','201 S Eugene St','336-555-0057','Hon. Arthur Patterson',1947),
(58,'Coolidge District Court','District','Newark','New Jersey','50 W Market St','973-555-0058','Hon. Doris Perry',1953),
(59,'Hoover Sessions Court','Sessions','Plano','Texas','900 E Park Blvd','469-555-0059','Hon. Raymond Long',1967),
(60,'Truman High Court','High','Henderson','Nevada','240 S Water St','702-555-0060','Hon. Lois Price',1950),
(61,'Eisenhower District Court','District','Lincoln','Nebraska','575 S 10th St','402-555-0061','Hon. Jerome Bennett',1955),
(62,'Kennedy Sessions Court','Sessions','Buffalo','New York','50 Delaware Ave','716-555-0062','Hon. Phyllis Wood',1961),
(63,'Nixon High Court','High','Fort Wayne','Indiana','715 S Calhoun St','260-555-0063','Hon. Dale Barnes',1944),
(64,'Ford District Court','District','Jersey City','New Jersey','283 Newark Ave','201-555-0064','Hon. Norma Ross',1956),
(65,'Carter Sessions Court','Sessions','Chula Vista','California','276 4th Ave','619-555-0065','Hon. Howard Henderson',1962),
(66,'Reagan High Court','High','Orlando','Florida','301 N Rosalind Ave','407-555-0066','Hon. Marjorie Coleman',1948),
(67,'Bush District Court','District','St. Louis','Missouri','1114 Market St','314-555-0067','Hon. Vernon Jenkins',1952),
(68,'Clinton Sessions Court','Sessions','Madison','Wisconsin','210 MLK Jr Blvd','608-555-0068','Hon. Leroy Perry',1964),
(69,'Obama High Court','High','Laredo','Texas','1110 Victoria St','956-555-0069','Hon. Mildred Powell',1946),
(70,'Central Magistrate Court','Magistrate','Chandler','Arizona','250 E Chicago St','480-555-0070','Hon. Leonard Long',1958),
(71,'District Magistrate Court','Magistrate','Lubbock','Texas','904 Broadway Ave','806-555-0071','Hon. Irene Patterson',1963),
(72,'County Magistrate Court','Magistrate','Norfolk','Virginia','811 E City Hall Ave','757-555-0072','Hon. Curtis Hughes',1965),
(73,'City Magistrate Court','Magistrate','Madison','Alabama','100 Hughes Rd','256-555-0073','Hon. Agnes Flores',1951),
(74,'Town Magistrate Court','Magistrate','Durham','North Carolina','201 E Main St','919-555-0074','Hon. Stanley Washington',1957),
(75,'Metro Magistrate Court','Magistrate','Garland','Texas','200 N 5th St','972-555-0075','Hon. Violet Butler',1960),
(76,'West High Court','High','Glendale','Arizona','5850 W Glendale Ave','623-555-0076','Hon. Ralph Simmons',1949),
(77,'East High Court','High','Hialeah','Florida','501 Palm Ave','305-555-0077','Hon. Gertrude Foster',1954),
(78,'South Sessions Court','Sessions','Reno','Nevada','1 S Sierra St','775-555-0078','Hon. Herman Gonzalez',1966),
(79,'North Sessions Court','Sessions','Baton Rouge','Louisiana','222 St Louis St','225-555-0079','Hon. Beatrice Bryant',1943),
(80,'Apex District Court','District','Irvine','California','14400 Myford Rd','949-555-0080','Hon. Wallace Alexander',1955),
(81,'Prime High Court','High','Birmingham','Alabama','801 Richard Arrington Blvd','205-555-0081','Hon. Esther Russell',1947),
(82,'Royal Sessions Court','Sessions','Rochester','New York','99 Exchange Blvd','585-555-0082','Hon. Eugene Griffin',1961),
(83,'Imperial District Court','District','North Las Vegas','Nevada','2200 Civic Center Dr','702-555-0083','Hon. Marcia Diaz',1959),
(84,'Capitol High Court','High','Irving','Texas','825 W Irving Blvd','972-555-0084','Hon. Clarence Hayes',1945),
(85,'Liberty Sessions Court','Sessions','Scottsdale','Arizona','7447 E Indian School Rd','480-555-0085','Hon. Rosemary Myers',1964),
(86,'Union District Court','District','North Hempstead','New York','220 Plandome Rd','516-555-0086','Hon. Marcus Ford',1956),
(87,'Freedom High Court','High','Winston-Salem','North Carolina','101 N Main St','336-555-0087','Hon. Josephine Hamilton',1948),
(88,'Justice District Court','District','Chesapeake','Virginia','306 Cedar Rd','757-555-0088','Hon. Theodore Graham',1953),
(89,'Heritage Sessions Court','Sessions','Gilbert','Arizona','50 E Civic Center Dr','480-555-0089','Hon. Edna Sullivan',1967),
(90,'Colonial High Court','High','Henderson','Nevada','240 S Water St','702-555-0090','Hon. Cecil Jordan',1951),
(91,'Pioneer District Court','District','Fremont','California','39550 Liberty St','510-555-0091','Hon. Hattie Patterson',1957),
(92,'Frontier Sessions Court','Sessions','Port Arthur','Texas','444 4th St','409-555-0092','Hon. Elmer Perry',1962),
(93,'Great Plains High Court','High','Montgomery','Alabama','251 S Lawrence St','334-555-0093','Hon. Mabel Long',1944),
(94,'Mountain District Court','District','Little Rock','Arkansas','101 W Markham St','501-555-0094','Hon. Alvin Price',1958),
(95,'Pacific Sessions Court','Sessions','Salt Lake City','Utah','450 S State St','801-555-0095','Hon. Effie Bennett',1963),
(96,'Atlantic High Court','High','Tallahassee','Florida','301 S Monroe St','850-555-0096','Hon. Albert Wood',1946),
(97,'Gulf District Court','District','Providence','Rhode Island','250 Benefit St','401-555-0097','Hon. Ella Barnes',1954),
(98,'Prairie Sessions Court','Sessions','Richmond','Virginia','400 N 9th St','804-555-0098','Hon. Amos Ross',1961),
(99,'Coastal High Court','High','Des Moines','Iowa','215 E 7th St','515-555-0099','Hon. Della Henderson',1949),
(100,'Valley Sessions Court','Sessions','Spokane','Washington','1116 W Broadway Ave','509-555-0100','Hon. Owen Coleman',1965);
SET IDENTITY_INSERT Court3 OFF;
GO
select *from Court3;
-- ============================================================
-- DATA INSERT: TABLE 3 - Lawyer (100 rows)
-- ============================================================
SET IDENTITY_INSERT Lawyer2 ON;
INSERT INTO Lawyer2 (LawyerID,FirstName,LastName,LicenseNumber,Specialization,PhoneNumber,Email,BarAssociation,YearsExperience,IsDefenseAttorney) VALUES
(1,'Alexander','Mitchell','LIC-001','Criminal Defense','555-2001','a.mitchell@lawfirm.com','New York Bar',20,1),
(2,'Samantha','Brown','LIC-002','Prosecution','555-2002','s.brown@lawfirm.com','Illinois Bar',15,0),
(3,'Benjamin','Davis','LIC-003','Criminal Defense','555-2003','b.davis@lawfirm.com','Texas Bar',25,1),
(4,'Natalie','Wilson','LIC-004','Corporate Crime','555-2004','n.wilson@lawfirm.com','California Bar',10,1),
(5,'Ethan','Anderson','LIC-005','Prosecution','555-2005','e.anderson@lawfirm.com','Florida Bar',18,0),
(6,'Olivia','Taylor','LIC-006','Criminal Defense','555-2006','o.taylor@lawfirm.com','Pennsylvania Bar',12,1),
(7,'Noah','Thomas','LIC-007','Drug Offenses','555-2007','n.thomas@lawfirm.com','Ohio Bar',22,1),
(8,'Emma','Jackson','LIC-008','Prosecution','555-2008','e.jackson@lawfirm.com','Georgia Bar',8,0),
(9,'William','White','LIC-009','Criminal Defense','555-2009','w.white@lawfirm.com','Michigan Bar',30,1),
(10,'Ava','Harris','LIC-010','Cyber Crime','555-2010','a.harris@lawfirm.com','New Jersey Bar',5,1),
(11,'James','Martin','LIC-011','Prosecution','555-2011','j.martin@lawfirm.com','Washington Bar',16,0),
(12,'Isabella','Garcia','LIC-012','Criminal Defense','555-2012','i.garcia@lawfirm.com','Arizona Bar',14,1),
(13,'Oliver','Martinez','LIC-013','Homicide','555-2013','o.martinez@lawfirm.com','Tennessee Bar',28,1),
(14,'Mia','Robinson','LIC-014','Prosecution','555-2014','m.robinson@lawfirm.com','Virginia Bar',11,0),
(15,'Lucas','Clark','LIC-015','Criminal Defense','555-2015','l.clark@lawfirm.com','Massachusetts Bar',19,1),
(16,'Charlotte','Rodriguez','LIC-016','Financial Crime','555-2016','c.rodriguez@lawfirm.com','Indiana Bar',7,1),
(17,'Liam','Lewis','LIC-017','Prosecution','555-2017','l.lewis@lawfirm.com','Missouri Bar',23,0),
(18,'Amelia','Lee','LIC-018','Criminal Defense','555-2018','a.lee@lawfirm.com','Maryland Bar',17,1),
(19,'Mason','Walker','LIC-019','Juvenile Crime','555-2019','m.walker@lawfirm.com','Minnesota Bar',9,1),
(20,'Harper','Hall','LIC-020','Prosecution','555-2020','h.hall@lawfirm.com','Wisconsin Bar',13,0),
(21,'Elijah','Allen','LIC-021','Criminal Defense','555-2021','e.allen@lawfirm.com','Colorado Bar',26,1),
(22,'Evelyn','Young','LIC-022','White-Collar Crime','555-2022','e.young@lawfirm.com','Oregon Bar',6,1),
(23,'James','Hernandez','LIC-023','Prosecution','555-2023','j.hernandez@lawfirm.com','Oklahoma Bar',21,0),
(24,'Abigail','King','LIC-024','Criminal Defense','555-2024','a.king@lawfirm.com','Connecticut Bar',15,1),
(25,'Logan','Wright','LIC-025','Drug Offenses','555-2025','l.wright@lawfirm.com','Iowa Bar',10,1),
(26,'Emily','Scott','LIC-026','Prosecution','555-2026','e.scott@lawfirm.com','Kansas Bar',18,0),
(27,'Jackson','Torres','LIC-027','Criminal Defense','555-2027','j.torres@lawfirm.com','Arkansas Bar',27,1),
(28,'Elizabeth','Nguyen','LIC-028','Cyber Crime','555-2028','e.nguyen@lawfirm.com','Mississippi Bar',4,1),
(29,'Sebastian','Hill','LIC-029','Prosecution','555-2029','s.hill@lawfirm.com','Nevada Bar',20,0),
(30,'Avery','Flores','LIC-030','Criminal Defense','555-2030','a.flores@lawfirm.com','New Mexico Bar',12,1),
(31,'Aiden','Green','LIC-031','Financial Crime','555-2031','a.green@lawfirm.com','Utah Bar',8,1),
(32,'Sofia','Adams','LIC-032','Prosecution','555-2032','s.adams@lawfirm.com','Nebraska Bar',14,0),
(33,'Matthew','Nelson','LIC-033','Criminal Defense','555-2033','m.nelson@lawfirm.com','Idaho Bar',22,1),
(34,'Ella','Baker','LIC-034','Homicide','555-2034','e.baker@lawfirm.com','Hawaii Bar',31,1),
(35,'Carter','Carter','LIC-035','Prosecution','555-2035','c.carter@lawfirm.com','Maine Bar',9,0),
(36,'Scarlett','Mitchell','LIC-036','Criminal Defense','555-2036','s.mitchell@lawfirm.com','New Hampshire Bar',16,1),
(37,'Owen','Perez','LIC-037','Juvenile Crime','555-2037','o.perez@lawfirm.com','Rhode Island Bar',6,1),
(38,'Victoria','Roberts','LIC-038','Prosecution','555-2038','v.roberts@lawfirm.com','Montana Bar',19,0),
(39,'Wyatt','Turner','LIC-039','Criminal Defense','555-2039','w.turner@lawfirm.com','South Dakota Bar',24,1),
(40,'Grace','Phillips','LIC-040','White-Collar Crime','555-2040','g.phillips@lawfirm.com','North Dakota Bar',11,1),
(41,'Elias','Campbell','LIC-041','Prosecution','555-2041','e.campbell@lawfirm.com','Wyoming Bar',17,0),
(42,'Chloe','Parker','LIC-042','Criminal Defense','555-2042','c.parker@lawfirm.com','Vermont Bar',13,1),
(43,'Julian','Evans','LIC-043','Drug Offenses','555-2043','j.evans@lawfirm.com','Delaware Bar',29,1),
(44,'Penelope','Edwards','LIC-044','Prosecution','555-2044','p.edwards@lawfirm.com','West Virginia Bar',7,0),
(45,'Levi','Collins','LIC-045','Criminal Defense','555-2045','l.collins@lawfirm.com','Alaska Bar',21,1),
(46,'Riley','Stewart','LIC-046','Cyber Crime','555-2046','r.stewart@lawfirm.com','North Carolina Bar',5,1),
(47,'Isaac','Sanchez','LIC-047','Prosecution','555-2047','i.sanchez@lawfirm.com','South Carolina Bar',23,0),
(48,'Layla','Morris','LIC-048','Criminal Defense','555-2048','l.morris@lawfirm.com','Kentucky Bar',16,1),
(49,'Gabriel','Rogers','LIC-049','Financial Crime','555-2049','g.rogers@lawfirm.com','Louisiana Bar',10,1),
(50,'Zoey','Reed','LIC-050','Prosecution','555-2050','z.reed@lawfirm.com','Alabama Bar',14,0),
(51,'Anthony','Cook','LIC-051','Criminal Defense','555-2051','a.cook@lawfirm.com','New York Bar',18,1),
(52,'Lillian','Morgan','LIC-052','Homicide','555-2052','l.morgan@lawfirm.com','Illinois Bar',25,1),
(53,'Dylan','Bell','LIC-053','Prosecution','555-2053','d.bell@lawfirm.com','Texas Bar',12,0),
(54,'Nora','Murphy','LIC-054','Criminal Defense','555-2054','n.murphy@lawfirm.com','California Bar',20,1),
(55,'Leo','Bailey','LIC-055','Drug Offenses','555-2055','l.bailey@lawfirm.com','Florida Bar',8,1),
(56,'Addison','Rivera','LIC-056','Prosecution','555-2056','a.rivera@lawfirm.com','Pennsylvania Bar',16,0),
(57,'Josiah','Cooper','LIC-057','Criminal Defense','555-2057','j.cooper@lawfirm.com','Ohio Bar',27,1),
(58,'Hannah','Richardson','LIC-058','White-Collar Crime','555-2058','h.richardson@lawfirm.com','Georgia Bar',6,1),
(59,'Andrew','Cox','LIC-059','Prosecution','555-2059','a.cox@lawfirm.com','Michigan Bar',19,0),
(60,'Eleanor','Howard','LIC-060','Criminal Defense','555-2060','e.howard@lawfirm.com','New Jersey Bar',14,1),
(61,'Jaxon','Ward','LIC-061','Juvenile Crime','555-2061','j.ward@lawfirm.com','Washington Bar',9,1),
(62,'Aurora','Torres','LIC-062','Prosecution','555-2062','a.torresx@lawfirm.com','Arizona Bar',22,0),
(63,'Christopher','Peterson','LIC-063','Criminal Defense','555-2063','c.peterson@lawfirm.com','Tennessee Bar',17,1),
(64,'Bella','Gray','LIC-064','Cyber Crime','555-2064','b.gray@lawfirm.com','Virginia Bar',5,1),
(65,'Ezra','Ramirez','LIC-065','Prosecution','555-2065','e.ramirez@lawfirm.com','Massachusetts Bar',21,0),
(66,'Skylar','James','LIC-066','Criminal Defense','555-2066','s.james@lawfirm.com','Indiana Bar',13,1),
(67,'Henry','Watson','LIC-067','Financial Crime','555-2067','h.watson@lawfirm.com','Missouri Bar',7,1),
(68,'Paisley','Brooks','LIC-068','Prosecution','555-2068','p.brooks@lawfirm.com','Maryland Bar',24,0),
(69,'Nicholas','Kelly','LIC-069','Criminal Defense','555-2069','n.kelly@lawfirm.com','Minnesota Bar',30,1),
(70,'Savannah','Sanders','LIC-070','Homicide','555-2070','s.sanders@lawfirm.com','Wisconsin Bar',11,1),
(71,'Hunter','Price','LIC-071','Prosecution','555-2071','h.price@lawfirm.com','Colorado Bar',18,0),
(72,'Claire','Bennett','LIC-072','Criminal Defense','555-2072','c.bennett@lawfirm.com','Oregon Bar',15,1),
(73,'Eli','Wood','LIC-073','Drug Offenses','555-2073','e.wood@lawfirm.com','Oklahoma Bar',10,1),
(74,'Kennedy','Barnes','LIC-074','Prosecution','555-2074','k.barnes@lawfirm.com','Connecticut Bar',20,0),
(75,'Grayson','Ross','LIC-075','Criminal Defense','555-2075','g.ross@lawfirm.com','Iowa Bar',26,1),
(76,'Violet','Henderson','LIC-076','White-Collar Crime','555-2076','v.henderson@lawfirm.com','Kansas Bar',8,1),
(77,'Landon','Coleman','LIC-077','Prosecution','555-2077','l.coleman@lawfirm.com','Arkansas Bar',14,0),
(78,'Stella','Jenkins','LIC-078','Criminal Defense','555-2078','s.jenkins@lawfirm.com','Mississippi Bar',19,1),
(79,'Dominic','Perry','LIC-079','Cyber Crime','555-2079','d.perry@lawfirm.com','Nevada Bar',6,1),
(80,'Autumn','Powell','LIC-080','Prosecution','555-2080','a.powell@lawfirm.com','New Mexico Bar',23,0),
(81,'Cooper','Long','LIC-081','Criminal Defense','555-2081','c.long@lawfirm.com','Utah Bar',16,1),
(82,'Naomi','Patterson','LIC-082','Financial Crime','555-2082','n.patterson@lawfirm.com','Nebraska Bar',12,1),
(83,'Greyson','Hughes','LIC-083','Prosecution','555-2083','g.hughes@lawfirm.com','Idaho Bar',27,0),
(84,'Leah','Flores','LIC-084','Criminal Defense','555-2084','l.floresx@lawfirm.com','Hawaii Bar',9,1),
(85,'Jace','Washington','LIC-085','Juvenile Crime','555-2085','j.washington@lawfirm.com','Maine Bar',17,1),
(86,'Audrey','Butler','LIC-086','Prosecution','555-2086','a.butler@lawfirm.com','New Hampshire Bar',21,0),
(87,'Micah','Simmons','LIC-087','Criminal Defense','555-2087','m.simmons@lawfirm.com','Rhode Island Bar',14,1),
(88,'Anna','Foster','LIC-088','Homicide','555-2088','a.foster@lawfirm.com','Montana Bar',32,1),
(89,'Cole','Gonzalez','LIC-089','Prosecution','555-2089','c.gonzalez@lawfirm.com','South Dakota Bar',7,0),
(90,'Natalia','Bryant','LIC-090','Criminal Defense','555-2090','n.bryant@lawfirm.com','North Dakota Bar',22,1),
(91,'Roman','Alexander','LIC-091','Drug Offenses','555-2091','r.alexander@lawfirm.com','Wyoming Bar',11,1),
(92,'Madeline','Russell','LIC-092','Prosecution','555-2092','m.russell@lawfirm.com','Vermont Bar',18,0),
(93,'Cameron','Griffin','LIC-093','Criminal Defense','555-2093','c.griffin@lawfirm.com','Delaware Bar',25,1),
(94,'Alice','Diaz','LIC-094','White-Collar Crime','555-2094','a.diazx@lawfirm.com','West Virginia Bar',5,1),
(95,'Tristan','Hayes','LIC-095','Prosecution','555-2095','t.hayes@lawfirm.com','Alaska Bar',20,0),
(96,'Sadie','Myers','LIC-096','Criminal Defense','555-2096','s.myers@lawfirm.com','North Carolina Bar',13,1),
(97,'Miles','Ford','LIC-097','Cyber Crime','555-2097','m.ford@lawfirm.com','South Carolina Bar',8,1),
(98,'Clara','Hamilton','LIC-098','Prosecution','555-2098','c.hamilton@lawfirm.com','Kentucky Bar',16,0),
(99,'Preston','Graham','LIC-099','Criminal Defense','555-2099','p.graham@lawfirm.com','Louisiana Bar',28,1),
(100,'Violet','Sullivan','LIC-100','Financial Crime','555-2100','v.sullivan@lawfirm.com','Alabama Bar',10,1);
SET IDENTITY_INSERT Lawyer2 OFF;
GO

-- ============================================================
-- DATA INSERT: TABLE 4 - Criminal (100 rows)
-- ============================================================
SET IDENTITY_INSERT Criminal6 ON;
INSERT INTO Criminal6 (CriminalID,FirstName,LastName,DateOfBirth,Gender,Nationality,NationalID,Address,PhoneNumber,CriminalStatus) VALUES
(1,'Marcus','Stone','1985-04-12','M','American','NID-CR001','12 Elm St, New York, NY','555-3001','Convicted'),
(2,'Angela','Price','1990-07-22','F','American','NID-CR002','45 Oak Ave, Chicago, IL','555-3002','Arrested'),
(3,'Dwayne','Brooks','1978-11-03','M','American','NID-CR003','78 Pine Rd, Houston, TX','555-3003','Convicted'),
(4,'Tiffany','Reed','1995-02-17','F','American','NID-CR004','23 Maple Dr, Philadelphia, PA','555-3004','Released'),
(5,'Jerome','Coleman','1982-09-29','M','American','NID-CR005','56 Cedar Ln, Phoenix, AZ','555-3005','Convicted'),
(6,'Vanessa','Hughes','1988-05-14','F','American','NID-CR006','89 Birch St, San Antonio, TX','555-3006','Arrested'),
(7,'Terrence','Foster','1975-12-08','M','American','NID-CR007','32 Walnut Ave, San Diego, CA','555-3007','Fugitive'),
(8,'Crystal','Simmons','1993-03-25','F','American','NID-CR008','67 Spruce Rd, Dallas, TX','555-3008','Convicted'),
(9,'Derrick','Butler','1980-08-16','M','American','NID-CR009','14 Poplar Dr, San Jose, CA','555-3009','Convicted'),
(10,'Latoya','Gonzalez','1992-01-07','F','American','NID-CR010','48 Ash Ln, Austin, TX','555-3010','Arrested'),
(11,'Xavier','Bryant','1987-06-19','M','American','NID-CR011','81 Hickory St, Jacksonville, FL','555-3011','Convicted'),
(12,'Monique','Alexander','1997-10-30','F','American','NID-CR012','25 Magnolia Ave, Columbus, OH','555-3012','Released'),
(13,'Tyrone','Russell','1983-04-04','M','American','NID-CR013','59 Chestnut Rd, Charlotte, NC','555-3013','Convicted'),
(14,'Keisha','Griffin','1991-09-11','F','American','NID-CR014','92 Dogwood Dr, Indianapolis, IN','555-3014','Arrested'),
(15,'Lamont','Diaz','1977-02-28','M','American','NID-CR015','37 Cypress Ln, San Francisco, CA','555-3015','Fugitive'),
(16,'Brianna','Hayes','1994-07-15','F','American','NID-CR016','70 Redwood St, Seattle, WA','555-3016','Convicted'),
(17,'Darnell','Myers','1986-12-22','M','American','NID-CR017','13 Sequoia Ave, Denver, CO','555-3017','Convicted'),
(18,'Shaniqua','Ford','1989-05-09','F','American','NID-CR018','47 Willow Rd, Nashville, TN','555-3018','Released'),
(19,'Antoine','Hamilton','1981-10-26','M','American','NID-CR019','80 Sycamore Dr, Oklahoma City, OK','555-3019','Arrested'),
(20,'Precious','Graham','1996-03-13','F','American','NID-CR020','24 Aspen Ln, El Paso, TX','555-3020','Convicted'),
(21,'Rasheed','Sullivan','1984-08-07','M','American','NID-CR021','58 Juniper St, Louisville, KY','555-3021','Convicted'),
(22,'Tamika','Jordan','1990-01-24','F','American','NID-CR022','91 Larch Ave, Baltimore, MD','555-3022','Arrested'),
(23,'Deon','Patterson','1979-06-11','M','American','NID-CR023','35 Alder Rd, Milwaukee, WI','555-3023','Convicted'),
(24,'Yolanda','Perry','1993-11-28','F','American','NID-CR024','68 Beech Dr, Albuquerque, NM','555-3024','Released'),
(25,'Jamal','Long','1985-04-15','M','American','NID-CR025','11 Elm Ct, Tucson, AZ','555-3025','Convicted'),
(26,'Renee','Price','1988-09-02','F','American','NID-CR026','44 Oak Ct, Fresno, CA','555-3026','Arrested'),
(27,'Terrell','Bennett','1976-02-19','M','American','NID-CR027','77 Pine Ct, Sacramento, CA','555-3027','Fugitive'),
(28,'Shanice','Wood','1995-07-06','F','American','NID-CR028','22 Maple Ct, Long Beach, CA','555-3028','Convicted'),
(29,'Dominique','Barnes','1983-12-23','M','American','NID-CR029','55 Cedar Ct, Kansas City, MO','555-3029','Convicted'),
(30,'Jasmine','Ross','1991-05-10','F','American','NID-CR030','88 Birch Ct, Mesa, AZ','555-3030','Arrested'),
(31,'Cedric','Henderson','1987-10-27','M','American','NID-CR031','33 Walnut Ct, Atlanta, GA','555-3031','Convicted'),
(32,'Aisha','Coleman','1994-03-14','F','American','NID-CR032','66 Spruce Ct, Virginia Beach, VA','555-3032','Released'),
(33,'Darius','Jenkins','1980-08-01','M','American','NID-CR033','99 Poplar Ct, Raleigh, NC','555-3033','Convicted'),
(34,'Shalonda','Perry','1989-01-18','F','American','NID-CR034','43 Ash Ct, Colorado Springs, CO','555-3034','Arrested'),
(35,'Maurice','Powell','1982-06-05','M','American','NID-CR035','76 Hickory Ct, Miami, FL','555-3035','Convicted'),
(36,'Tonya','Long','1996-11-22','F','American','NID-CR036','20 Magnolia Ct, Omaha, NE','555-3036','Convicted'),
(37,'Kendrick','Patterson','1978-04-09','M','American','NID-CR037','53 Chestnut Ct, Oakland, CA','555-3037','Fugitive'),
(38,'Felicia','Hughes','1992-09-26','F','American','NID-CR038','86 Dogwood Ct, Minneapolis, MN','555-3038','Arrested'),
(39,'Deshawn','Foster','1984-02-13','M','American','NID-CR039','30 Cypress Ct, Tulsa, OK','555-3039','Convicted'),
(40,'Niesha','Simmons','1990-07-30','F','American','NID-CR040','63 Redwood Ct, Tampa, FL','555-3040','Released'),
(41,'Elroy','Butler','1977-12-17','M','American','NID-CR041','96 Sequoia Ct, Arlington, TX','555-3041','Convicted'),
(42,'Antoinette','Gonzalez','1993-05-04','F','American','NID-CR042','40 Willow Ct, New Orleans, LA','555-3042','Arrested'),
(43,'Leroy','Bryant','1986-10-21','M','American','NID-CR043','73 Sycamore Ct, Wichita, KS','555-3043','Convicted'),
(44,'Rochelle','Alexander','1991-03-08','F','American','NID-CR044','17 Aspen Ct, Bakersfield, CA','555-3044','Convicted'),
(45,'Marvin','Russell','1983-08-25','M','American','NID-CR045','50 Juniper Ct, Aurora, CO','555-3045','Released'),
(46,'Simone','Griffin','1988-01-12','F','American','NID-CR046','83 Larch Ct, Anaheim, CA','555-3046','Arrested'),
(47,'Otis','Diaz','1975-06-29','M','American','NID-CR047','27 Alder Ct, Santa Ana, CA','555-3047','Fugitive'),
(48,'Alicia','Hayes','1994-11-16','F','American','NID-CR048','60 Beech Ct, Corpus Christi, TX','555-3048','Convicted'),
(49,'Quinton','Myers','1981-04-03','M','American','NID-CR049','93 Elm Pl, Riverside, CA','555-3049','Convicted'),
(50,'Loretta','Ford','1997-09-20','F','American','NID-CR050','37 Oak Pl, Lexington, KY','555-3050','Arrested'),
(51,'Byron','Hamilton','1985-02-07','M','American','NID-CR051','70 Pine Pl, Pittsburgh, PA','555-3051','Convicted'),
(52,'Wanda','Graham','1989-07-24','F','American','NID-CR052','14 Maple Pl, Stockton, CA','555-3052','Released'),
(53,'Reginald','Sullivan','1980-12-11','M','American','NID-CR053','47 Cedar Pl, Anchorage, AK','555-3053','Convicted'),
(54,'Debra','Jordan','1993-05-28','F','American','NID-CR054','80 Birch Pl, Cincinnati, OH','555-3054','Arrested'),
(55,'Clyde','Patterson','1978-10-15','M','American','NID-CR055','24 Walnut Pl, St. Paul, MN','555-3055','Convicted'),
(56,'Rhonda','Perry','1991-03-02','F','American','NID-CR056','57 Spruce Pl, Toledo, OH','555-3056','Convicted'),
(57,'Curtis','Long','1987-08-19','M','American','NID-CR057','90 Poplar Pl, Greensboro, NC','555-3057','Released'),
(58,'Tamara','Price','1994-01-06','F','American','NID-CR058','34 Ash Pl, Newark, NJ','555-3058','Arrested'),
(59,'Wendell','Bennett','1982-06-23','M','American','NID-CR059','67 Hickory Pl, Plano, TX','555-3059','Convicted'),
(60,'Carolyn','Wood','1990-11-10','F','American','NID-CR060','11 Magnolia Pl, Henderson, NV','555-3060','Convicted'),
(61,'Freddie','Barnes','1976-04-27','M','American','NID-CR061','44 Chestnut Pl, Lincoln, NE','555-3061','Fugitive'),
(62,'Annette','Ross','1995-09-14','F','American','NID-CR062','77 Dogwood Pl, Buffalo, NY','555-3062','Arrested'),
(63,'Eugene','Henderson','1984-02-01','M','American','NID-CR063','21 Cypress Pl, Fort Wayne, IN','555-3063','Convicted'),
(64,'Ruthie','Coleman','1988-07-18','F','American','NID-CR064','54 Redwood Pl, Jersey City, NJ','555-3064','Released'),
(65,'Clarence','Jenkins','1981-12-05','M','American','NID-CR065','87 Sequoia Pl, Chula Vista, CA','555-3065','Convicted'),
(66,'Mabel','Perry','1992-05-22','F','American','NID-CR066','31 Willow Pl, Orlando, FL','555-3066','Arrested'),
(67,'Floyd','Powell','1979-10-09','M','American','NID-CR067','64 Sycamore Pl, St. Louis, MO','555-3067','Convicted'),
(68,'Bertha','Long','1996-03-26','F','American','NID-CR068','97 Aspen Pl, Madison, WI','555-3068','Convicted'),
(69,'Willie','Patterson','1986-08-13','M','American','NID-CR069','42 Juniper Pl, Laredo, TX','555-3069','Released'),
(70,'Hattie','Hughes','1990-01-30','F','American','NID-CR070','75 Larch Pl, Chandler, AZ','555-3070','Arrested'),
(71,'Nathaniel','Foster','1983-06-17','M','American','NID-CR071','19 Alder Pl, Lubbock, TX','555-3071','Convicted'),
(72,'Gladys','Simmons','1988-11-04','F','American','NID-CR072','52 Beech Pl, Norfolk, VA','555-3072','Convicted'),
(73,'Virgil','Butler','1977-04-21','M','American','NID-CR073','85 Elm Way, Madison, AL','555-3073','Fugitive'),
(74,'Eunice','Gonzalez','1993-09-08','F','American','NID-CR074','29 Oak Way, Durham, NC','555-3074','Arrested'),
(75,'Herbert','Bryant','1985-02-25','M','American','NID-CR075','62 Pine Way, Garland, TX','555-3075','Convicted'),
(76,'Ernestine','Alexander','1991-07-12','F','American','NID-CR076','95 Maple Way, Glendale, AZ','555-3076','Released'),
(77,'Clifton','Russell','1980-12-29','M','American','NID-CR077','39 Cedar Way, Hialeah, FL','555-3077','Convicted'),
(78,'Beulah','Griffin','1994-05-16','F','American','NID-CR078','72 Birch Way, Reno, NV','555-3078','Arrested'),
(79,'Harvey','Diaz','1976-10-03','M','American','NID-CR079','16 Walnut Way, Baton Rouge, LA','555-3079','Convicted'),
(80,'Pearl','Hayes','1989-03-20','F','American','NID-CR080','49 Spruce Way, Irvine, CA','555-3080','Convicted'),
(81,'Chester','Myers','1984-08-07','M','American','NID-CR081','82 Poplar Way, Birmingham, AL','555-3081','Released'),
(82,'Leola','Ford','1992-01-24','F','American','NID-CR082','26 Ash Way, Rochester, NY','555-3082','Arrested'),
(83,'Roscoe','Hamilton','1981-06-11','M','American','NID-CR083','59 Hickory Way, Las Vegas, NV','555-3083','Convicted'),
(84,'Verna','Graham','1987-11-28','F','American','NID-CR084','92 Magnolia Way, Irving, TX','555-3084','Convicted'),
(85,'Luther','Sullivan','1979-04-15','M','American','NID-CR085','36 Chestnut Way, Scottsdale, AZ','555-3085','Fugitive'),
(86,'Lela','Jordan','1993-09-02','F','American','NID-CR086','69 Dogwood Way, North Hempstead, NY','555-3086','Arrested'),
(87,'Nolan','Patterson','1986-02-19','M','American','NID-CR087','13 Cypress Way, Winston-Salem, NC','555-3087','Convicted'),
(88,'Alma','Perry','1991-07-06','F','American','NID-CR088','46 Redwood Way, Chesapeake, VA','555-3088','Released'),
(89,'Leroy','Long','1978-12-23','M','American','NID-CR089','79 Sequoia Way, Gilbert, AZ','555-3089','Convicted'),
(90,'Ida','Price','1995-05-10','F','American','NID-CR090','23 Willow Way, Henderson, NV','555-3090','Arrested'),
(91,'Sherman','Bennett','1983-10-27','M','American','NID-CR091','56 Sycamore Way, Fremont, CA','555-3091','Convicted'),
(92,'Lula','Wood','1988-03-14','F','American','NID-CR092','89 Aspen Way, Port Arthur, TX','555-3092','Convicted'),
(93,'Randolph','Barnes','1980-08-01','M','American','NID-CR093','33 Juniper Way, Montgomery, AL','555-3093','Released'),
(94,'Opal','Ross','1994-01-18','F','American','NID-CR094','66 Larch Way, Little Rock, AR','555-3094','Arrested'),
(95,'Wilbur','Henderson','1977-06-05','M','American','NID-CR095','99 Alder Way, Salt Lake City, UT','555-3095','Convicted'),
(96,'Sadie','Coleman','1990-11-22','F','American','NID-CR096','43 Beech Way, Tallahassee, FL','555-3096','Convicted'),
(97,'Cornelius','Jenkins','1985-04-09','M','American','NID-CR097','76 Elm Blvd, Providence, RI','555-3097','Fugitive'),
(98,'Minnie','Perry','1989-09-26','F','American','NID-CR098','20 Oak Blvd, Richmond, VA','555-3098','Released'),
(99,'Odell','Powell','1982-02-13','M','American','NID-CR099','53 Pine Blvd, Des Moines, IA','555-3099','Arrested'),
(100,'Bessie','Long','1996-07-30','F','American','NID-CR100','86 Maple Blvd, Spokane, WA','555-3100','Convicted');
SET IDENTITY_INSERT Criminal6 OFF;
GO

-- ============================================================
-- DATA INSERT: TABLE 5 - Crime (100 rows)
-- ============================================================
SET IDENTITY_INSERT Crime5 ON;
INSERT INTO Crime5 (CrimeID,CrimeType,Description,Severity,DateOccurred,Location,CriminalID,OfficerID,IsResolved) VALUES
(1,'Armed Robbery','Suspect robbed a convenience store at gunpoint','Serious','2022-01-15','12 Main St, New York, NY',1,1,1),
(2,'Drug Trafficking','Large quantity of narcotics seized during transport','Heinous','2022-02-20','45 Harbor Blvd, Chicago, IL',2,2,1),
(3,'Homicide','Victim found at scene with multiple stab wounds','Heinous','2022-03-10','78 Park Ave, Houston, TX',3,8,1),
(4,'Cybercrime','Unauthorized access to banking systems','Serious','2022-04-05','Online - Philadelphia, PA',4,4,1),
(5,'Fraud','Identity theft affecting 200 victims','Serious','2022-05-18','23 Commerce St, Phoenix, AZ',5,5,1),
(6,'Assault','Victim attacked outside nightclub','Moderate','2022-06-22','89 Club Row, San Antonio, TX',6,6,0),
(7,'Drug Possession','Methamphetamine found during vehicle search','Moderate','2022-07-14','32 Highway 10, San Diego, CA',7,9,1),
(8,'Kidnapping','Child abducted from school premises','Heinous','2022-08-03','67 School Rd, Dallas, TX',8,12,1),
(9,'Burglary','Residential break-in, valuables stolen','Moderate','2022-09-17','14 Suburban Dr, San Jose, CA',9,3,1),
(10,'Money Laundering','Funds funneled through shell corporations','Heinous','2022-10-29','48 Financial Blvd, Austin, TX',10,17,1),
(11,'Arson','Warehouse deliberately set on fire','Serious','2022-11-08','81 Industrial Rd, Jacksonville, FL',11,41,1),
(12,'Sexual Assault','Victim attacked in parking garage','Heinous','2022-12-15','25 Parking Ave, Columbus, OH',12,22,1),
(13,'Vehicle Theft','Luxury car stolen from driveway','Minor','2023-01-20','59 Suburban Ln, Charlotte, NC',13,7,1),
(14,'Extortion','Business owner threatened for monthly payments','Serious','2023-02-11','92 Commerce Dr, Indianapolis, IN',14,29,0),
(15,'Human Trafficking','Three victims recovered from warehouse','Heinous','2023-03-25','37 Industrial Ct, San Francisco, CA',15,49,1),
(16,'Vandalism','Public property extensively damaged','Minor','2023-04-07','70 Park Rd, Seattle, WA',16,11,1),
(17,'Embezzlement','$500,000 stolen from employer accounts','Serious','2023-05-19','13 Office Park, Denver, CO',17,32,1),
(18,'Domestic Violence','Victim hospitalized with serious injuries','Serious','2023-06-30','47 Residential Rd, Nashville, TN',18,56,1),
(19,'Carjacking','Vehicle stolen at gunpoint on highway','Serious','2023-07-12','80 Highway 40, Oklahoma City, OK',19,40,0),
(20,'Drug Manufacturing','Meth lab discovered in residential basement','Heinous','2023-08-24','24 Maple Dr, El Paso, TX',20,34,1),
(21,'Murder','Victim shot during dispute','Heinous','2023-09-05','58 Alley Rd, Louisville, KY',21,16,1),
(22,'Theft','Shoplifting of electronic goods','Minor','2023-10-17','91 Mall Ave, Baltimore, MD',22,23,1),
(23,'Assault with Weapon','Victim stabbed during robbery attempt','Serious','2023-11-28','35 Market St, Milwaukee, WI',23,13,1),
(24,'Credit Card Fraud','Cards cloned at multiple ATMs','Moderate','2023-12-09','68 Bank Row, Albuquerque, NM',24,44,1),
(25,'Drug Trafficking','Cocaine shipment intercepted at border','Heinous','2022-01-25','11 Border Rd, Tucson, AZ',25,54,1),
(26,'Blackmail','Private information used for extortion','Serious','2022-02-28','44 Office Blvd, Fresno, CA',26,65,0),
(27,'Gang Violence','Drive-by shooting in residential area','Heinous','2022-03-15','77 Residential Ave, Sacramento, CA',27,73,1),
(28,'Forgery','Counterfeit documents used for fraud','Moderate','2022-04-20','22 Document St, Long Beach, CA',28,37,1),
(29,'Bribery','Official bribed to overlook violations','Serious','2022-05-31','55 Government Blvd, Kansas City, MO',29,53,1),
(30,'Attempted Murder','Victim survived multiple gunshot wounds','Heinous','2022-07-01','88 Crime Alley, Mesa, AZ',30,69,1),
(31,'Robbery','Bank robbed during business hours','Serious','2022-08-12','33 Bank St, Atlanta, GA',31,81,1),
(32,'Stalking','Victim followed and harassed over 6 months','Moderate','2022-09-23','66 Residential Ct, Virginia Beach, VA',32,62,0),
(33,'Child Abuse','Minors found malnourished and abused','Heinous','2022-10-04','99 Home Rd, Raleigh, NC',33,36,1),
(34,'Fraud','Insurance fraud totaling $1 million','Serious','2022-11-15','43 Insurance Blvd, Colorado Springs, CO',34,92,1),
(35,'Drug Possession','Heroin found on suspect','Moderate','2022-12-26','76 Street Corner, Miami, FL',35,28,1),
(36,'Manslaughter','Victim killed in road rage incident','Serious','2023-01-06','20 Highway 95, Omaha, NE',36,48,1),
(37,'Kidnapping','Victim held for ransom for 5 days','Heinous','2023-02-17','53 Remote Area, Oakland, CA',37,57,1),
(38,'Cybercrime','Ransomware attack on hospital systems','Heinous','2023-03-28','Online - Minneapolis, MN',38,77,1),
(39,'Arson','Residential home set ablaze','Serious','2023-04-08','30 Suburban St, Tulsa, OK',39,89,1),
(40,'Assault','Unprovoked attack in restaurant','Moderate','2023-05-20','63 Dining Ave, Tampa, FL',40,3,0),
(41,'Armed Robbery','Jewelry store heist','Serious','2023-06-30','96 Jewelry Row, Arlington, TX',41,19,1),
(42,'Drug Trafficking','Fentanyl distribution ring dismantled','Heinous','2023-08-11','40 Warehouse St, New Orleans, LA',42,61,1),
(43,'Homicide','Execution-style killing','Heinous','2023-09-22','73 Dark Alley, Wichita, KS',43,96,1),
(44,'Vehicle Theft','Multiple cars stolen from dealership','Minor','2023-10-03','17 Auto Row, Bakersfield, CA',44,35,1),
(45,'Embezzlement','Bank employee stole $200,000','Serious','2023-11-14','50 Bank Ave, Aurora, CO',45,98,1),
(46,'Sexual Assault','Attack in public park','Heinous','2023-12-25','83 City Park, Anaheim, CA',46,42,1),
(47,'Fraud','Ponzi scheme affecting 500 investors','Heinous','2022-01-10','27 Investment Blvd, Santa Ana, CA',47,21,1),
(48,'Drug Manufacturing','Carfentanil lab found','Heinous','2022-02-21','60 Industrial Park, Corpus Christi, TX',48,61,1),
(49,'Burglary','Museum artifact theft','Serious','2022-03-04','93 Museum Dr, Riverside, CA',49,80,1),
(50,'Money Laundering','Casino used to launder millions','Heinous','2022-04-15','37 Casino Blvd, Lexington, KY',50,88,1),
(51,'Murder','Premeditated killing of business rival','Heinous','2022-05-26','70 Office Park, Pittsburgh, PA',51,29,1),
(52,'Theft','Retail theft exceeding $50,000','Moderate','2022-07-06','14 Shopping Center, Stockton, CA',52,7,1),
(53,'Assault with Weapon','Machete attack on pedestrian','Serious','2022-08-17','47 Downtown Rd, Anchorage, AK',53,93,1),
(54,'Credit Card Fraud','Skimming devices installed at gas stations','Moderate','2022-09-28','80 Gas Station Row, Cincinnati, OH',54,44,1),
(55,'Drug Trafficking','Cannabis distribution network','Moderate','2022-11-08','24 Suburban Blvd, St. Paul, MN',55,14,1),
(56,'Blackmail','Celebrity blackmailed with private photos','Serious','2022-12-19','57 Media Blvd, Toledo, OH',56,18,0),
(57,'Gang Violence','Turf war results in 3 casualties','Heinous','2023-01-30','90 Gang Territory, Greensboro, NC',57,89,1),
(58,'Forgery','$50,000 in counterfeit bills circulated','Serious','2023-03-12','34 Commerce St, Newark, NJ',58,53,1),
(59,'Bribery','Judge bribed in high-profile case','Serious','2023-04-23','67 Courthouse Ln, Plano, TX',59,37,1),
(60,'Attempted Murder','Poison administered to spouse','Heinous','2023-05-04','11 Home Ave, Henderson, NV',60,69,1),
(61,'Robbery','Armored car heist','Heinous','2023-07-16','44 Transport Route, Lincoln, NE',61,33,1),
(62,'Stalking','Online and physical stalking','Moderate','2023-08-27','77 Residential Blvd, Buffalo, NY',62,50,0),
(63,'Child Abuse','Institutionalized abuse case','Heinous','2023-09-07','21 Institution Rd, Fort Wayne, IN',63,70,1),
(64,'Fraud','Healthcare fraud - $3 million','Serious','2023-10-18','54 Medical Blvd, Jersey City, NJ',64,5,1),
(65,'Drug Possession','Multiple controlled substances','Moderate','2023-11-29','87 Street Ave, Chula Vista, CA',65,9,1),
(66,'Manslaughter','Negligent homicide in accident','Serious','2023-12-10','31 Highway 5, Orlando, FL',66,25,1),
(67,'Kidnapping','International abduction case','Heinous','2022-01-20','64 Airport Area, St. Louis, MO',67,41,1),
(68,'Cybercrime','State-level election interference','Heinous','2022-03-02','Online - Madison, WI',68,24,0),
(69,'Arson','Forest fire deliberately started','Heinous','2022-04-13','97 Wilderness Area, Laredo, TX',69,76,1),
(70,'Assault','Gang initiation beating','Serious','2022-05-24','42 Gang Area, Chandler, AZ',70,82,1),
(71,'Armed Robbery','Restaurant held up during dinner service','Serious','2022-07-04','75 Restaurant Row, Lubbock, TX',71,6,1),
(72,'Drug Trafficking','Opium importation network','Heinous','2022-08-15','19 Port Area, Norfolk, VA',72,2,1),
(73,'Homicide','Witness eliminated before trial','Heinous','2022-09-26','52 Witness St, Madison, AL','73',16,1),
(74,'Vehicle Theft','Car theft ring - 20 vehicles stolen','Moderate','2022-11-06','85 Auto Park, Durham, NC',74,20,1),
(75,'Embezzlement','Charity fraud - $750,000','Serious','2022-12-17','29 Charity Blvd, Garland, TX',75,52,1),
(76,'Sexual Assault','Attack during college campus event','Heinous','2023-01-28','62 Campus Rd, Glendale, AZ',76,96,1),
(77,'Fraud','Social media investment scam','Moderate','2023-03-10','Online - Hialeah, FL',77,60,1),
(78,'Drug Manufacturing','PCP lab dismantled','Serious','2023-04-21','95 Industrial Area, Reno, NV',78,34,1),
(79,'Burglary','Art gallery robbery','Serious','2023-05-01','39 Art District, Baton Rouge, LA',79,86,1),
(80,'Money Laundering','Real estate used for money laundering','Heinous','2023-06-12','72 Property Row, Irvine, CA',80,58,1),
(81,'Murder','Assassination of local politician','Heinous','2023-07-23','16 Political Blvd, Birmingham, AL',81,49,1),
(82,'Theft','Cargo theft from shipping yard','Moderate','2023-09-03','49 Port Rd, Rochester, NY',82,40,0),
(83,'Assault with Weapon','Baseball bat attack','Moderate','2023-10-14','82 Sports Park, Las Vegas, NV',83,30,1),
(84,'Credit Card Fraud','Online shopping fraud network','Moderate','2023-11-25','Online - Irving, TX',84,10,1),
(85,'Drug Trafficking','Heroin pipeline from Mexico','Heinous','2023-12-06','26 Border Area, Scottsdale, AZ',85,54,1),
(86,'Blackmail','Politician blackmailed','Serious','2022-02-10','59 Political Ave, N. Hempstead, NY',86,26,0),
(87,'Gang Violence','Gang-related arson','Serious','2022-03-22','92 Gang Zone, Winston-Salem, NC',87,38,1),
(88,'Forgery','Fake property documents','Moderate','2022-05-02','36 Property Lane, Chesapeake, VA',88,66,1),
(89,'Bribery','Customs officer bribed','Serious','2022-06-13','69 Customs Rd, Gilbert, AZ',89,74,1),
(90,'Attempted Murder','Hit and run attempt','Serious','2022-07-24','13 Quiet Street, Henderson, NV',90,48,1),
(91,'Robbery','Pharmacy robbed for prescriptions','Moderate','2022-09-04','46 Pharmacy Row, Fremont, CA',91,84,1),
(92,'Stalking','Ex-partner stalking campaign','Moderate','2022-10-15','79 Residential Area, Port Arthur, TX',92,64,0),
(93,'Child Abuse','Online exploitation network','Heinous','2022-11-26','Online - Montgomery, AL',93,17,1),
(94,'Fraud','Stock market manipulation','Heinous','2022-12-07','23 Stock Exchange, Little Rock, AR',94,45,1),
(95,'Drug Possession','Ecstasy at music festival','Minor','2023-01-18','56 Festival Grounds, Salt Lake City, UT',95,47,1),
(96,'Manslaughter','Drunk driving fatality','Serious','2023-02-28','89 Highway 15, Tallahassee, FL',96,75,1),
(97,'Kidnapping','Child custody violation','Serious','2023-04-10','33 Family Rd, Providence, RI',97,63,1),
(98,'Cybercrime','Dark web marketplace operator','Heinous','2023-05-21','Online - Richmond, VA',98,97,1),
(99,'Arson','Business competitor sabotage','Serious','2023-06-01','66 Commerce Way, Des Moines, IA',99,87,1),
(100,'Assault','Road rage physical altercation','Moderate','2023-07-13','99 Highway 90, Spokane, WA',100,55,1);
SET IDENTITY_INSERT Crime5 OFF;
GO

-- ============================================================
-- DATA INSERT: TABLE 6 - CaseRecord (100 rows)
-- ============================================================
SET IDENTITY_INSERT CaseRecord ON;
INSERT INTO CaseRecord (CaseID,CaseNumber,CaseTitle,CrimeID,CourtID,LawyerID,OfficerID,FilingDate,HearingDate,Verdict,CaseStatus,SentenceYears,FineAmount) VALUES
(1,'CASE-2022-001','State v. Stone - Armed Robbery',1,1,1,1,'2022-02-01','2022-06-15','Guilty','Closed',8,5000.00),
(2,'CASE-2022-002','State v. Price - Drug Trafficking',2,2,2,2,'2022-03-10','2022-08-20','Guilty','Closed',15,25000.00),
(3,'CASE-2022-003','State v. Brooks - Homicide',3,3,3,8,'2022-04-15','2022-10-10','Guilty','Closed',25,NULL),
(4,'CASE-2022-004','State v. Reed - Cybercrime',4,4,4,4,'2022-05-20','2022-11-05','Not Guilty','Closed',NULL,NULL),
(5,'CASE-2022-005','State v. Coleman - Fraud',5,5,5,5,'2022-06-25','2023-01-18','Guilty','Closed',5,100000.00),
(6,'CASE-2022-006','State v. Hughes - Assault',6,6,6,6,'2022-07-30','2023-02-22','Pending','Open',NULL,NULL),
(7,'CASE-2022-007','State v. Foster - Drug Possession',7,7,7,9,'2022-09-04','2023-03-14','Guilty','Closed',3,2000.00),
(8,'CASE-2022-008','State v. Simmons - Kidnapping',8,8,8,12,'2022-10-09','2023-04-03','Guilty','Closed',20,NULL),
(9,'CASE-2022-009','State v. Butler - Burglary',9,9,9,3,'2022-11-14','2023-05-17','Guilty','Closed',4,10000.00),
(10,'CASE-2022-010','State v. Gonzalez - Money Laundering',10,10,10,17,'2022-12-19','2023-06-29','Guilty','Closed',12,500000.00),
(11,'CASE-2022-011','State v. Bryant - Arson',11,11,11,41,'2023-01-23','2023-07-08','Guilty','Closed',7,50000.00),
(12,'CASE-2022-012','State v. Alexander - Sexual Assault',12,12,12,22,'2023-02-28','2023-09-15','Guilty','Closed',10,NULL),
(13,'CASE-2022-013','State v. Russell - Vehicle Theft',13,13,13,7,'2023-03-05','2023-10-20','Guilty','Closed',2,5000.00),
(14,'CASE-2022-014','State v. Griffin - Extortion',14,14,14,29,'2023-04-10','2023-11-11','Pending','Open',NULL,NULL),
(15,'CASE-2022-015','State v. Diaz - Human Trafficking',15,15,15,49,'2023-05-15','2023-12-25','Guilty','Closed',30,NULL),
(16,'CASE-2022-016','State v. Hayes - Vandalism',16,16,16,11,'2023-06-20','2024-01-07','Guilty','Closed',NULL,1500.00),
(17,'CASE-2022-017','State v. Myers - Embezzlement',17,17,17,32,'2023-07-25','2024-02-19','Guilty','Closed',8,500000.00),
(18,'CASE-2022-018','State v. Ford - Domestic Violence',18,18,18,56,'2023-08-30','2024-03-30','Guilty','Closed',3,NULL),
(19,'CASE-2022-019','State v. Hamilton - Carjacking',19,19,19,40,'2023-10-04','2024-04-12','Pending','Open',NULL,NULL),
(20,'CASE-2022-020','State v. Graham - Drug Manufacturing',20,20,20,34,'2023-11-09','2024-05-24','Guilty','Closed',18,NULL),
(21,'CASE-2022-021','State v. Sullivan - Murder',21,21,21,16,'2023-12-14','2024-06-04','Guilty','Closed',NULL,NULL),
(22,'CASE-2022-022','State v. Jordan - Theft',22,22,22,23,'2024-01-18','2024-07-17','Guilty','Closed',NULL,3000.00),
(23,'CASE-2022-023','State v. Patterson - Assault',23,23,23,13,'2024-02-23','2024-08-28','Guilty','Closed',2,NULL),
(24,'CASE-2022-024','State v. Perry - Credit Card Fraud',24,24,24,44,'2024-03-28','2024-09-10','Guilty','Closed',4,50000.00),
(25,'CASE-2022-025','State v. Long - Drug Trafficking',25,25,25,54,'2024-04-02','2024-10-22','Guilty','Closed',20,NULL),
(26,'CASE-2022-026','State v. Price - Blackmail',26,26,26,65,'2024-05-07','2024-11-04','Pending','Open',NULL,NULL),
(27,'CASE-2022-027','State v. Bennett - Gang Violence',27,27,27,73,'2024-06-12','2024-12-16','Guilty','Closed',15,NULL),
(28,'CASE-2022-028','State v. Wood - Forgery',28,28,28,37,'2024-07-17','2025-01-28','Guilty','Closed',3,20000.00),
(29,'CASE-2022-029','State v. Barnes - Bribery',29,29,29,53,'2024-08-22','2025-02-09','Guilty','Closed',6,75000.00),
(30,'CASE-2022-030','State v. Ross - Attempted Murder',30,30,30,69,'2024-09-27','2025-03-24','Guilty','Closed',15,NULL),
(31,'CASE-2022-031','State v. Henderson - Robbery',31,31,31,81,'2024-10-01','2025-04-03','Guilty','Closed',7,NULL),
(32,'CASE-2022-032','State v. Coleman - Stalking',32,32,32,62,'2024-11-06','2025-05-16','Pending','Open',NULL,NULL),
(33,'CASE-2022-033','State v. Jenkins - Child Abuse',33,33,33,36,'2024-12-11','2025-06-27','Guilty','Closed',12,NULL),
(34,'CASE-2022-034','State v. Perry - Fraud',34,34,34,92,'2022-03-16','2022-09-28','Guilty','Closed',6,1000000.00),
(35,'CASE-2022-035','State v. Powell - Drug Possession',35,35,35,28,'2022-04-21','2022-11-10','Guilty','Closed',2,1000.00),
(36,'CASE-2022-036','State v. Long - Manslaughter',36,36,36,48,'2022-05-26','2022-12-22','Guilty','Closed',8,NULL),
(37,'CASE-2022-037','State v. Patterson - Kidnapping',37,37,37,57,'2022-07-01','2023-01-04','Guilty','Closed',22,NULL),
(38,'CASE-2022-038','State v. Hughes - Cybercrime',38,38,38,77,'2022-08-05','2023-02-17','Guilty','Closed',10,200000.00),
(39,'CASE-2022-039','State v. Foster - Arson',39,39,39,89,'2022-09-10','2023-03-29','Guilty','Closed',9,NULL),
(40,'CASE-2022-040','State v. Simmons - Assault',40,40,40,3,'2022-10-15','2023-05-11','Pending','Open',NULL,NULL),
(41,'CASE-2022-041','State v. Butler - Armed Robbery',41,41,41,19,'2022-11-20','2023-06-23','Guilty','Closed',10,NULL),
(42,'CASE-2022-042','State v. Gonzalez - Drug Trafficking',42,42,42,61,'2022-12-25','2023-08-04','Guilty','Closed',18,NULL),
(43,'CASE-2022-043','State v. Bryant - Homicide',43,43,43,96,'2023-01-29','2023-09-16','Guilty','Closed',NULL,NULL),
(44,'CASE-2022-044','State v. Alexander - Vehicle Theft',44,44,44,35,'2023-03-05','2023-10-28','Guilty','Closed',1,3000.00),
(45,'CASE-2022-045','State v. Russell - Embezzlement',45,45,45,98,'2023-04-10','2023-12-09','Guilty','Closed',5,200000.00),
(46,'CASE-2022-046','State v. Griffin - Sexual Assault',46,46,46,42,'2023-05-15','2024-01-21','Guilty','Closed',12,NULL),
(47,'CASE-2022-047','State v. Diaz - Fraud',47,47,47,21,'2023-06-20','2024-03-04','Guilty','Closed',7,500000.00),
(48,'CASE-2022-048','State v. Hayes - Drug Manufacturing',48,48,48,61,'2023-07-25','2024-04-16','Guilty','Closed',14,NULL),
(49,'CASE-2022-049','State v. Myers - Burglary',49,49,49,80,'2023-09-29','2024-05-28','Guilty','Closed',4,30000.00),
(50,'CASE-2022-050','State v. Ford - Money Laundering',50,50,50,88,'2023-11-03','2024-07-09','Guilty','Closed',11,2000000.00),
(51,'CASE-2022-051','State v. Hamilton - Murder',51,51,51,29,'2023-12-08','2024-08-21','Guilty','Closed',NULL,NULL),
(52,'CASE-2022-052','State v. Graham - Theft',52,52,52,7,'2024-01-13','2024-10-02','Guilty','Closed',NULL,50000.00),
(53,'CASE-2022-053','State v. Sullivan - Assault',53,53,53,93,'2024-02-17','2024-11-14','Guilty','Closed',3,NULL),
(54,'CASE-2022-054','State v. Jordan - Credit Card Fraud',54,54,54,44,'2024-03-23','2024-12-26','Guilty','Closed',3,40000.00),
(55,'CASE-2022-055','State v. Patterson - Drug Trafficking',55,55,55,14,'2024-04-28','2025-02-07','Guilty','Closed',10,NULL),
(56,'CASE-2022-056','State v. Perry - Blackmail',56,56,56,18,'2024-06-02','2025-03-21','Pending','Open',NULL,NULL),
(57,'CASE-2022-057','State v. Long - Gang Violence',57,57,57,89,'2024-07-07','2025-05-02','Guilty','Closed',20,NULL),
(58,'CASE-2022-058','State v. Price - Forgery',58,58,58,53,'2024-08-12','2025-06-14','Guilty','Closed',4,50000.00),
(59,'CASE-2022-059','State v. Bennett - Bribery',59,59,59,37,'2024-09-17','2025-07-28','Guilty','Closed',7,150000.00),
(60,'CASE-2022-060','State v. Wood - Attempted Murder',60,60,60,69,'2024-10-22','2025-08-08','Guilty','Closed',18,NULL),
(61,'CASE-2022-061','State v. Barnes - Robbery',61,61,61,33,'2024-11-27','2025-09-22','Guilty','Closed',9,NULL),
(62,'CASE-2022-062','State v. Ross - Stalking',62,62,62,50,'2022-02-05','2022-08-17','Pending','Open',NULL,NULL),
(63,'CASE-2022-063','State v. Henderson - Child Abuse',63,63,63,70,'2022-03-11','2022-09-29','Guilty','Closed',15,NULL),
(64,'CASE-2022-064','State v. Coleman - Fraud',64,64,64,5,'2022-04-16','2022-11-10','Guilty','Closed',6,3000000.00),
(65,'CASE-2022-065','State v. Jenkins - Drug Possession',65,65,65,9,'2022-05-21','2023-01-22','Guilty','Closed',1,500.00),
(66,'CASE-2022-066','State v. Perry - Manslaughter',66,66,66,25,'2022-06-26','2023-03-06','Guilty','Closed',7,NULL),
(67,'CASE-2022-067','State v. Powell - Kidnapping',67,67,67,41,'2022-07-31','2023-04-17','Guilty','Closed',25,NULL),
(68,'CASE-2022-068','State v. Long - Cybercrime',68,68,68,24,'2022-09-05','2023-05-30','Not Guilty','Closed',NULL,NULL),
(69,'CASE-2022-069','State v. Patterson - Arson',69,69,69,76,'2022-10-10','2023-07-11','Guilty','Closed',11,NULL),
(70,'CASE-2022-070','State v. Hughes - Assault',70,70,70,82,'2022-11-15','2023-08-23','Guilty','Closed',2,NULL),
(71,'CASE-2022-071','State v. Foster - Armed Robbery',71,71,71,6,'2022-12-20','2023-10-04','Guilty','Closed',8,NULL),
(72,'CASE-2022-072','State v. Simmons - Drug Trafficking',72,72,72,2,'2023-01-24','2023-11-16','Guilty','Closed',16,NULL),
(73,'CASE-2022-073','State v. Butler - Homicide',73,73,73,16,'2023-02-28','2024-01-28','Guilty','Closed',NULL,NULL),
(74,'CASE-2022-074','State v. Gonzalez - Vehicle Theft',74,74,74,20,'2023-04-04','2024-03-11','Guilty','Closed',2,5000.00),
(75,'CASE-2022-075','State v. Bryant - Embezzlement',75,75,75,52,'2023-05-09','2024-04-22','Guilty','Closed',6,750000.00),
(76,'CASE-2022-076','State v. Alexander - Sexual Assault',76,76,76,96,'2023-06-14','2024-06-04','Guilty','Closed',15,NULL),
(77,'CASE-2022-077','State v. Russell - Fraud',77,77,77,60,'2023-07-19','2024-07-16','Guilty','Closed',3,200000.00),
(78,'CASE-2022-078','State v. Griffin - Drug Manufacturing',78,78,78,34,'2023-08-24','2024-08-27','Guilty','Closed',12,NULL),
(79,'CASE-2022-079','State v. Diaz - Burglary',79,79,79,86,'2023-09-28','2024-10-09','Guilty','Closed',3,25000.00),
(80,'CASE-2022-080','State v. Hayes - Money Laundering',80,80,80,58,'2023-11-02','2024-11-20','Guilty','Closed',14,1500000.00),
(81,'CASE-2022-081','State v. Myers - Murder',81,81,81,49,'2023-12-07','2025-01-01','Guilty','Closed',NULL,NULL),
(82,'CASE-2022-082','State v. Ford - Theft',82,82,82,40,'2024-01-12','2025-02-13','Pending','Open',NULL,NULL),
(83,'CASE-2022-083','State v. Hamilton - Assault',83,83,83,30,'2024-02-16','2025-03-27','Guilty','Closed',1,NULL),
(84,'CASE-2022-084','State v. Graham - Credit Card Fraud',84,84,84,10,'2024-03-22','2025-05-08','Guilty','Closed',2,30000.00),
(85,'CASE-2022-085','State v. Sullivan - Drug Trafficking',85,85,85,54,'2024-04-27','2025-06-20','Guilty','Closed',22,NULL),
(86,'CASE-2022-086','State v. Jordan - Blackmail',86,86,86,26,'2024-06-01','2025-08-01','Pending','Open',NULL,NULL),
(87,'CASE-2022-087','State v. Patterson - Gang Violence',87,87,87,38,'2024-07-06','2025-09-12','Guilty','Closed',12,NULL),
(88,'CASE-2022-088','State v. Perry - Forgery',88,88,88,66,'2024-08-11','2025-10-24','Guilty','Closed',2,15000.00),
(89,'CASE-2022-089','State v. Long - Bribery',89,89,89,74,'2024-09-16','2025-11-05','Guilty','Closed',5,100000.00),
(90,'CASE-2022-090','State v. Price - Attempted Murder',90,90,90,48,'2024-10-21','2025-12-18','Guilty','Closed',12,NULL),
(91,'CASE-2022-091','State v. Bennett - Robbery',91,91,91,84,'2024-11-25','2026-01-29','Guilty','Closed',6,NULL),
(92,'CASE-2022-092','State v. Wood - Stalking',92,92,92,64,'2022-01-06','2022-07-18','Pending','Open',NULL,NULL),
(93,'CASE-2022-093','State v. Barnes - Child Abuse',93,93,93,17,'2022-02-10','2022-08-30','Guilty','Closed',20,NULL),
(94,'CASE-2022-094','State v. Ross - Fraud',94,94,94,45,'2022-03-17','2022-10-12','Guilty','Closed',8,3000000.00),
(95,'CASE-2022-095','State v. Henderson - Drug Possession',95,95,95,47,'2022-04-22','2022-11-24','Guilty','Closed',NULL,200.00),
(96,'CASE-2022-096','State v. Coleman - Manslaughter',96,96,96,75,'2022-05-27','2023-01-05','Guilty','Closed',6,NULL),
(97,'CASE-2022-097','State v. Jenkins - Kidnapping',97,97,97,63,'2022-06-01','2023-02-17','Guilty','Closed',10,NULL),
(98,'CASE-2022-098','State v. Perry - Cybercrime',98,98,98,97,'2022-08-06','2023-03-31','Guilty','Closed',8,500000.00),
(99,'CASE-2022-099','State v. Powell - Arson',99,99,99,87,'2022-09-11','2023-05-12','Guilty','Closed',7,NULL),
(100,'CASE-2022-100','State v. Long - Assault',100,100,100,55,'2022-10-16','2023-06-25','Acquitted','Closed',NULL,NULL);
SET IDENTITY_INSERT CaseRecord OFF;
GO

-- ============================================================
-- DATA INSERT: TABLE 7 - FamilyMember (100 rows)
-- ============================================================
SET IDENTITY_INSERT FamilyMember ON;
INSERT INTO FamilyMember (FamilyMemberID,CriminalID,FirstName,LastName,Relationship,DateOfBirth,PhoneNumber,Address,IsCooperating) VALUES
(1,1,'Diana','Stone','Spouse','1987-06-18','555-4001','12 Elm St, New York, NY',1),
(2,1,'George','Stone','Father','1958-03-22','555-4002','88 Senior Rd, New York, NY',0),
(3,2,'Carlos','Price','Brother','1992-11-09','555-4003','45 Oak Ave, Chicago, IL',1),
(4,3,'Helen','Brooks','Mother','1950-08-14','555-4004','78 Pine Rd, Houston, TX',1),
(5,4,'Kevin','Reed','Spouse','1993-04-27','555-4005','23 Maple Dr, Philadelphia, PA',0),
(6,5,'Dorothy','Coleman','Spouse','1984-01-10','555-4006','56 Cedar Ln, Phoenix, AZ',1),
(7,6,'Henry','Hughes','Father','1960-07-23','555-4007','89 Birch St, San Antonio, TX',0),
(8,7,'Grace','Foster','Spouse','1977-10-06','555-4008','32 Walnut Ave, San Diego, CA',1),
(9,8,'Aaron','Simmons','Brother','1990-03-19','555-4009','67 Spruce Rd, Dallas, TX',0),
(10,9,'Ruth','Butler','Mother','1952-12-02','555-4010','14 Poplar Dr, San Jose, CA',1),
(11,10,'Marcus','Gonzalez','Spouse','1989-05-15','555-4011','48 Ash Ln, Austin, TX',1),
(12,11,'Tara','Bryant','Spouse','1989-09-28','555-4012','81 Hickory St, Jacksonville, FL',0),
(13,12,'Victor','Alexander','Father','1965-02-11','555-4013','25 Magnolia Ave, Columbus, OH',1),
(14,13,'Iris','Russell','Spouse','1985-07-24','555-4014','59 Chestnut Rd, Charlotte, NC',0),
(15,14,'Owen','Griffin','Brother','1988-12-07','555-4015','92 Dogwood Dr, Indianapolis, IN',1),
(16,15,'Nina','Diaz','Mother','1949-05-20','555-4016','37 Cypress Ln, San Francisco, CA',0),
(17,16,'Felix','Hayes','Father','1966-10-03','555-4017','70 Redwood St, Seattle, WA',1),
(18,17,'Lena','Myers','Spouse','1988-03-16','555-4018','13 Sequoia Ave, Denver, CO',0),
(19,18,'Troy','Ford','Brother','1984-08-29','555-4019','47 Willow Rd, Nashville, TN',1),
(20,19,'Vera','Hamilton','Spouse','1983-02-12','555-4020','80 Sycamore Dr, Oklahoma City, OK',1),
(21,20,'Ross','Graham','Father','1968-07-25','555-4021','24 Aspen Ln, El Paso, TX',0),
(22,21,'Faye','Sullivan','Spouse','1986-01-08','555-4022','58 Juniper St, Louisville, KY',1),
(23,22,'Noel','Jordan','Brother','1987-06-21','555-4023','91 Larch Ave, Baltimore, MD',0),
(24,23,'Maud','Patterson','Mother','1951-11-04','555-4024','35 Alder Rd, Milwaukee, WI',1),
(25,24,'Leon','Perry','Spouse','1991-04-17','555-4025','68 Beech Dr, Albuquerque, NM',1),
(26,25,'Cora','Long','Spouse','1987-09-30','555-4026','11 Elm Ct, Tucson, AZ',0),
(27,26,'Seth','Price','Father','1960-02-13','555-4027','44 Oak Ct, Fresno, CA',1),
(28,27,'Ivy','Bennett','Spouse','1978-07-26','555-4028','77 Pine Ct, Sacramento, CA',0),
(29,28,'Ray','Wood','Brother','1992-01-09','555-4029','22 Maple Ct, Long Beach, CA',1),
(30,29,'Ada','Barnes','Mother','1955-06-22','555-4030','55 Cedar Ct, Kansas City, MO',1),
(31,30,'Zane','Ross','Spouse','1993-11-05','555-4031','88 Birch Ct, Mesa, AZ',0),
(32,31,'Bess','Henderson','Spouse','1989-04-18','555-4032','33 Walnut Ct, Atlanta, GA',1),
(33,32,'Clive','Coleman','Father','1966-09-01','555-4033','66 Spruce Ct, Virginia Beach, VA',0),
(34,33,'Nell','Jenkins','Spouse','1982-02-14','555-4034','99 Poplar Ct, Raleigh, NC',1),
(35,34,'Wade','Perry','Brother','1986-07-27','555-4035','43 Ash Ct, Colorado Springs, CO',0),
(36,35,'Ida','Powell','Mother','1954-01-10','555-4036','76 Hickory Ct, Miami, FL',1),
(37,36,'Clay','Long','Spouse','1998-06-23','555-4037','20 Magnolia Ct, Omaha, NE',1),
(38,37,'Ola','Patterson','Spouse','1980-11-06','555-4038','53 Chestnut Ct, Oakland, CA',0),
(39,38,'Brad','Hughes','Father','1964-04-19','555-4039','86 Dogwood Ct, Minneapolis, MN',1),
(40,39,'Lois','Foster','Spouse','1986-09-02','555-4040','30 Cypress Ct, Tulsa, OK',0),
(41,40,'Dean','Simmons','Brother','1988-02-15','555-4041','63 Redwood Ct, Tampa, FL',1),
(42,41,'Ina','Butler','Mother','1949-07-28','555-4042','96 Sequoia Ct, Arlington, TX',1),
(43,42,'Kirk','Gonzalez','Spouse','1995-01-11','555-4043','40 Willow Ct, New Orleans, LA',0),
(44,43,'Alma','Bryant','Spouse','1988-06-24','555-4044','73 Sycamore Ct, Wichita, KS',1),
(45,44,'Ross','Alexander','Father','1963-11-07','555-4045','17 Aspen Ct, Bakersfield, CA',0),
(46,45,'Bea','Russell','Spouse','1985-04-20','555-4046','50 Juniper Ct, Aurora, CO',1),
(47,46,'Carl','Griffin','Brother','1985-09-03','555-4047','83 Larch Ct, Anaheim, CA',0),
(48,47,'Eda','Diaz','Mother','1947-02-16','555-4048','27 Alder Ct, Santa Ana, CA',1),
(49,48,'Luis','Hayes','Spouse','1996-07-29','555-4049','60 Beech Ct, Corpus Christi, TX',1),
(50,49,'Fern','Myers','Spouse','1983-01-12','555-4050','93 Elm Pl, Riverside, CA',0),
(51,50,'Glen','Ford','Father','1969-06-25','555-4051','37 Oak Pl, Lexington, KY',1),
(52,51,'Mona','Hamilton','Spouse','1987-11-08','555-4052','70 Pine Pl, Pittsburgh, PA',0),
(53,52,'Rex','Graham','Brother','1986-04-21','555-4053','14 Maple Pl, Stockton, CA',1),
(54,53,'Una','Sullivan','Spouse','1982-09-04','555-4054','47 Cedar Pl, Anchorage, AK',1),
(55,54,'Ned','Jordan','Father','1965-02-17','555-4055','80 Birch Pl, Cincinnati, OH',0),
(56,55,'Ora','Patterson','Spouse','1979-07-30','555-4056','24 Walnut Pl, St. Paul, MN',1),
(57,56,'Stan','Perry','Brother','1988-01-13','555-4057','57 Spruce Pl, Toledo, OH',0),
(58,57,'Pia','Long','Spouse','1989-06-26','555-4058','90 Poplar Pl, Greensboro, NC',1),
(59,58,'Otto','Price','Father','1966-11-09','555-4059','34 Ash Pl, Newark, NJ',0),
(60,59,'May','Bennett','Spouse','1984-04-22','555-4060','67 Hickory Pl, Plano, TX',1),
(61,60,'Evan','Wood','Brother','1988-09-05','555-4061','11 Magnolia Pl, Henderson, NV',1),
(62,61,'Rae','Barnes','Spouse','1978-02-18','555-4062','44 Chestnut Pl, Lincoln, NE',0),
(63,62,'Guy','Ross','Father','1967-07-31','555-4063','77 Dogwood Pl, Buffalo, NY',1),
(64,63,'Joy','Henderson','Spouse','1986-01-14','555-4064','21 Cypress Pl, Fort Wayne, IN',0),
(65,64,'Leo','Coleman','Brother','1989-06-27','555-4065','54 Redwood Pl, Jersey City, NJ',1),
(66,65,'Eva','Jenkins','Mother','1953-11-10','555-4066','87 Sequoia Pl, Chula Vista, CA',1),
(67,66,'Roy','Perry','Spouse','1994-04-23','555-4067','31 Willow Pl, Orlando, FL',0),
(68,67,'Amy','Powell','Spouse','1981-09-06','555-4068','64 Sycamore Pl, St. Louis, MO',1),
(69,68,'Lee','Long','Father','1971-02-19','555-4069','97 Aspen Pl, Madison, WI',0),
(70,69,'Kim','Patterson','Spouse','1988-07-02','555-4070','42 Juniper Pl, Laredo, TX',1),
(71,70,'Bob','Hughes','Brother','1987-12-15','555-4071','75 Larch Pl, Chandler, AZ',0),
(72,71,'Sue','Foster','Spouse','1985-05-28','555-4072','19 Alder Pl, Lubbock, TX',1),
(73,72,'Ron','Simmons','Father','1960-10-11','555-4073','52 Beech Pl, Norfolk, VA',1),
(74,73,'Ann','Butler','Spouse','1979-03-24','555-4074','85 Elm Way, Madison, AL',0),
(75,74,'Tim','Gonzalez','Brother','1990-08-07','555-4075','29 Oak Way, Durham, NC',1),
(76,75,'Kay','Bryant','Spouse','1987-01-20','555-4076','62 Pine Way, Garland, TX',0),
(77,76,'Don','Alexander','Father','1963-06-03','555-4077','95 Maple Way, Glendale, AZ',1),
(78,77,'Pat','Russell','Spouse','1982-11-16','555-4078','39 Cedar Way, Hialeah, FL',1),
(79,78,'Sam','Griffin','Brother','1991-04-29','555-4079','72 Birch Way, Reno, NV',0),
(80,79,'Nan','Diaz','Spouse','1978-09-12','555-4080','16 Walnut Way, Baton Rouge, LA',1),
(81,80,'Cal','Hayes','Father','1961-02-25','555-4081','49 Spruce Way, Irvine, CA',0),
(82,81,'Dot','Myers','Spouse','1986-08-08','555-4082','82 Poplar Way, Birmingham, AL',1),
(83,82,'Eli','Ford','Brother','1989-01-21','555-4083','26 Ash Way, Rochester, NY',0),
(84,83,'Flo','Hamilton','Spouse','1983-06-04','555-4084','59 Hickory Way, Las Vegas, NV',1),
(85,84,'Gus','Graham','Father','1959-11-17','555-4085','92 Magnolia Way, Irving, TX',1),
(86,85,'Hel','Sullivan','Spouse','1981-04-30','555-4086','36 Chestnut Way, Scottsdale, AZ',0),
(87,86,'Ian','Jordan','Brother','1990-09-13','555-4087','69 Dogwood Way, N. Hempstead, NY',1),
(88,87,'Jan','Patterson','Spouse','1988-02-26','555-4088','13 Cypress Way, Winston-Salem, NC',0),
(89,88,'Ken','Perry','Father','1963-07-11','555-4089','46 Redwood Way, Chesapeake, VA',1),
(90,89,'Lyn','Long','Spouse','1980-12-24','555-4090','79 Sequoia Way, Gilbert, AZ',0),
(91,90,'Max','Price','Brother','1992-05-07','555-4091','23 Willow Way, Henderson, NV',1),
(92,91,'Nan','Bennett','Spouse','1985-10-20','555-4092','56 Sycamore Way, Fremont, CA',1),
(93,92,'Orin','Wood','Father','1960-03-03','555-4093','89 Aspen Way, Port Arthur, TX',0),
(94,93,'Pam','Barnes','Spouse','1982-08-16','555-4094','33 Juniper Way, Montgomery, AL',1),
(95,94,'Quinn','Ross','Brother','1991-01-29','555-4095','66 Larch Way, Little Rock, AR',0),
(96,95,'Rosa','Henderson','Spouse','1979-06-12','555-4096','99 Alder Way, Salt Lake City, UT',1),
(97,96,'Scott','Coleman','Father','1962-11-25','555-4097','43 Beech Way, Tallahassee, FL',1),
(98,97,'Tess','Jenkins','Spouse','1987-04-08','555-4098','76 Elm Blvd, Providence, RI',0),
(99,98,'Uma','Perry','Mother','1960-09-21','555-4099','20 Oak Blvd, Richmond, VA',1),
(100,99,'Val','Powell','Spouse','1984-02-04','555-4100','53 Pine Blvd, Des Moines, IA',0);
SET IDENTITY_INSERT FamilyMember OFF;

GO

-- ============================================================
-- USEFUL VIEWS
-- ============================================================

-- View 1: Full Case Summary
CREATE VIEW vw_CaseSummary AS
SELECT
    cr.CaseNumber,
    cr.CaseTitle,
    cr.CaseStatus,
    cr.Verdict,
    cr.FilingDate,
    cr.HearingDate,
    cr.SentenceYears,
    cr.FineAmount,
    c.CrimeType,
    c.Severity,
    c.DateOccurred,
    c.Location AS CrimeLocation,
    crim.FirstName + ' ' + crim.LastName AS CriminalName,
    crim.CriminalStatus,
    po.FirstName + ' ' + po.LastName AS OfficerName,
    po.Rank AS OfficerRank,
    l.FirstName + ' ' + l.LastName AS LawyerName,
    l.Specialization AS LawyerSpecialization,
    ct.CourtName,
    ct.JudgeName
FROM CaseRecord cr
JOIN Crime5 c      ON cr.CrimeID   = c.CrimeID
JOIN Criminal6 crim ON c.CriminalID = crim.CriminalID
JOIN PoliceOfficer po ON cr.OfficerID = po.OfficerID
JOIN Lawyer2 l     ON cr.LawyerID  = l.LawyerID
JOIN Court3 ct     ON cr.CourtID   = ct.CourtID;
GO
select * from vw_CaseSummary;

-- View 2: Criminal Profile with Family
CREATE VIEW vw_CriminalProfile AS
SELECT
    crim.CriminalID,
    crim.FirstName + ' ' + crim.LastName AS CriminalName,
    crim.DateOfBirth,
    crim.Gender,
    crim.Nationality,
    crim.CriminalStatus,
    crim.Address,
    fm.FirstName + ' ' + fm.LastName AS FamilyMemberName,
    fm.Relationship,
    fm.IsCooperating
FROM Criminal crim
LEFT JOIN FamilyMember fm ON crim.CriminalID = fm.CriminalID;
GO

-- ============================================================
-- USEFUL STORED PROCEDURES
-- ============================================================

-- SP1: Get cases by status
CREATE PROCEDURE sp_GetCasesByStatus
    @Status NVARCHAR(30)
AS
BEGIN
    SELECT cr.CaseNumber, cr.CaseTitle, cr.Verdict, cr.FilingDate,
           c.CrimeType, crim.FirstName + ' ' + crim.LastName AS Criminal
    FROM CaseRecord cr
    JOIN Crime c ON cr.CrimeID = c.CrimeID
    JOIN Criminal crim ON c.CriminalID = crim.CriminalID
    WHERE cr.CaseStatus = @Status;
END;
GO

-- SP2: Get criminal record by ID
CREATE PROCEDURE sp_GetCriminalRecord
    @CriminalID INT
AS
BEGIN
    SELECT crim.*, c.CrimeType, c.DateOccurred, c.Location,
           cr.CaseNumber, cr.Verdict, cr.SentenceYears
    FROM Criminal crim
    LEFT JOIN Crime c ON crim.CriminalID = c.CriminalID
    LEFT JOIN CaseRecord cr ON c.CrimeID = cr.CrimeID
    WHERE crim.CriminalID = @CriminalID;
END;
GO

PRINT 'Criminal Records Management System database created successfully.';
PRINT 'All 7 tables created with 100 rows each.';
PRINT 'Views and Stored Procedures added.';
GO

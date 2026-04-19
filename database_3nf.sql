USE master;
GO
IF EXISTS (SELECT name FROM sys.databases WHERE name = N'dbmsmini3')
BEGIN
    ALTER DATABASE dbmsmini3 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE dbmsmini3;
END
CREATE DATABASE dbmsmini3;
GO
USE dbmsmini3;
GO

CREATE TABLE system_users (user_id INT PRIMARY KEY IDENTITY(1,1), username NVARCHAR(50) UNIQUE NOT NULL, password_hash NVARCHAR(255) NOT NULL, role NVARCHAR(20) DEFAULT 'User');
CREATE TABLE Ranks (RankID INT PRIMARY KEY IDENTITY(1,1), Name NVARCHAR(50) UNIQUE);
CREATE TABLE Departments (DeptID INT PRIMARY KEY IDENTITY(1,1), Name NVARCHAR(100) UNIQUE);
CREATE TABLE CourtTypes (TypeID INT PRIMARY KEY IDENTITY(1,1), Name NVARCHAR(50) UNIQUE);
CREATE TABLE Locations (LocationID INT PRIMARY KEY IDENTITY(1,1), City NVARCHAR(100), State NVARCHAR(100), Address NVARCHAR(255));
CREATE TABLE Specializations (SpecID INT PRIMARY KEY IDENTITY(1,1), Name NVARCHAR(100) UNIQUE);
CREATE TABLE CriminalStatuses (CSID INT PRIMARY KEY IDENTITY(1,1), Name NVARCHAR(30) UNIQUE);
CREATE TABLE Severities (SeverityID INT PRIMARY KEY IDENTITY(1,1), Name NVARCHAR(20) UNIQUE);
CREATE TABLE Verdicts (VerdictID INT PRIMARY KEY IDENTITY(1,1), Name NVARCHAR(50) UNIQUE);
CREATE TABLE CaseStatuses (StatusID INT PRIMARY KEY IDENTITY(1,1), Name NVARCHAR(30) UNIQUE);
CREATE TABLE Relationships (RelID INT PRIMARY KEY IDENTITY(1,1), Name NVARCHAR(50) UNIQUE);
GO

INSERT INTO system_users (username, password_hash, role) VALUES ('Admin', 'scrypt:32768:8:1$83wzVvP6HtG8fj79$665e9b2a3e14760923a2aba63f9832590beab3d9fc70112f4251ed7d47d5d88500cb2d452caa0d9948d0cad8810a4fe3144e37dc6c4f1e458856665c66da2cfc', 'Admin');
INSERT INTO system_users (username, password_hash, role) VALUES ('User', 'scrypt:32768:8:1$RW4Nsx1bWqCUwYbA$566d9fbd7918166200785dcf76518386a9e2535a255133c7ed090200b199260ebaf13299528485b0d6ede219e0aac1389a11080dc39badf31d9b5cfe0d9aae36', 'User');
INSERT INTO Ranks (Name) VALUES ('Inspector');
INSERT INTO Ranks (Name) VALUES ('Sergeant');
INSERT INTO Ranks (Name) VALUES ('Constable');
INSERT INTO Ranks (Name) VALUES ('Detective');
INSERT INTO Departments (Name) VALUES ('Homicide');
INSERT INTO Departments (Name) VALUES ('Narcotics');
INSERT INTO Departments (Name) VALUES ('Patrol');
INSERT INTO Departments (Name) VALUES ('Cybercrime');
INSERT INTO Departments (Name) VALUES ('Fraud');
INSERT INTO Departments (Name) VALUES ('Robbery');
INSERT INTO Departments (Name) VALUES ('Traffic');
INSERT INTO CourtTypes (Name) VALUES ('District');
INSERT INTO CourtTypes (Name) VALUES ('High');
INSERT INTO CourtTypes (Name) VALUES ('Sessions');
INSERT INTO CourtTypes (Name) VALUES ('Magistrate');
INSERT INTO Specializations (Name) VALUES ('Criminal Defense');
INSERT INTO Specializations (Name) VALUES ('Prosecution');
INSERT INTO Specializations (Name) VALUES ('Corporate Crime');
INSERT INTO Specializations (Name) VALUES ('Drug Offenses');
INSERT INTO Specializations (Name) VALUES ('Cyber Crime');
INSERT INTO Specializations (Name) VALUES ('Homicide');
INSERT INTO Specializations (Name) VALUES ('Financial Crime');
INSERT INTO Specializations (Name) VALUES ('Juvenile Crime');
INSERT INTO Specializations (Name) VALUES ('White-Collar Crime');
INSERT INTO CriminalStatuses (Name) VALUES ('Convicted');
INSERT INTO CriminalStatuses (Name) VALUES ('Arrested');
INSERT INTO CriminalStatuses (Name) VALUES ('Released');
INSERT INTO CriminalStatuses (Name) VALUES ('Fugitive');
INSERT INTO Severities (Name) VALUES ('Serious');
INSERT INTO Severities (Name) VALUES ('Heinous');
INSERT INTO Severities (Name) VALUES ('Moderate');
INSERT INTO Severities (Name) VALUES ('Minor');
INSERT INTO Verdicts (Name) VALUES ('Guilty');
INSERT INTO Verdicts (Name) VALUES ('Not Guilty');
INSERT INTO Verdicts (Name) VALUES ('Pending');
INSERT INTO Verdicts (Name) VALUES ('Acquitted');
INSERT INTO CaseStatuses (Name) VALUES ('Closed');
INSERT INTO CaseStatuses (Name) VALUES ('Open');
INSERT INTO Relationships (Name) VALUES ('Spouse');
INSERT INTO Relationships (Name) VALUES ('Father');
INSERT INTO Relationships (Name) VALUES ('Brother');
INSERT INTO Relationships (Name) VALUES ('Mother');
INSERT INTO Locations (City, State, Address) VALUES ('New York','New York','100 Centre St, NY 10013');
INSERT INTO Locations (City, State, Address) VALUES ('Chicago','Illinois','69 W Washington St');
INSERT INTO Locations (City, State, Address) VALUES ('Houston','Texas','1201 Franklin St');
INSERT INTO Locations (City, State, Address) VALUES ('Philadelphia','Pennsylvania','601 Market St');
INSERT INTO Locations (City, State, Address) VALUES ('Phoenix','Arizona','175 W Madison St');
INSERT INTO Locations (City, State, Address) VALUES ('San Antonio','Texas','300 Dolorosa St');
INSERT INTO Locations (City, State, Address) VALUES ('San Diego','California','220 W Broadway');
INSERT INTO Locations (City, State, Address) VALUES ('Dallas','Texas','600 Commerce St');
INSERT INTO Locations (City, State, Address) VALUES ('San Jose','California','191 N 1st St');
INSERT INTO Locations (City, State, Address) VALUES ('Austin','Texas','1000 Guadalupe St');
INSERT INTO Locations (City, State, Address) VALUES ('Jacksonville','Florida','330 E Bay St');
INSERT INTO Locations (City, State, Address) VALUES ('Columbus','Ohio','369 S High St');
INSERT INTO Locations (City, State, Address) VALUES ('Charlotte','North Carolina','832 E 4th St');
INSERT INTO Locations (City, State, Address) VALUES ('Indianapolis','Indiana','200 E Washington St');
INSERT INTO Locations (City, State, Address) VALUES ('San Francisco','California','400 McAllister St');
INSERT INTO Locations (City, State, Address) VALUES ('Seattle','Washington','516 3rd Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Denver','Colorado','1437 Bannock St');
INSERT INTO Locations (City, State, Address) VALUES ('Nashville','Tennessee','1 Public Sq');
INSERT INTO Locations (City, State, Address) VALUES ('Oklahoma City','Oklahoma','321 Robert S Kerr Ave');
INSERT INTO Locations (City, State, Address) VALUES ('El Paso','Texas','500 E San Antonio Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Louisville','Kentucky','700 W Jefferson St');
INSERT INTO Locations (City, State, Address) VALUES ('Baltimore','Maryland','100 N Calvert St');
INSERT INTO Locations (City, State, Address) VALUES ('Milwaukee','Wisconsin','901 N 9th St');
INSERT INTO Locations (City, State, Address) VALUES ('Albuquerque','New Mexico','400 Lomas Blvd NW');
INSERT INTO Locations (City, State, Address) VALUES ('Tucson','Arizona','110 W Congress St');
INSERT INTO Locations (City, State, Address) VALUES ('Fresno','California','1100 Van Ness Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Sacramento','California','813 6th St');
INSERT INTO Locations (City, State, Address) VALUES ('Long Beach','California','415 W Ocean Blvd');
INSERT INTO Locations (City, State, Address) VALUES ('Kansas City','Missouri','415 E 12th St');
INSERT INTO Locations (City, State, Address) VALUES ('Mesa','Arizona','555 N Center St');
INSERT INTO Locations (City, State, Address) VALUES ('Atlanta','Georgia','75 Ted Turner Dr SW');
INSERT INTO Locations (City, State, Address) VALUES ('Virginia Beach','Virginia','2425 Nimmo Pkwy');
INSERT INTO Locations (City, State, Address) VALUES ('Raleigh','North Carolina','100 E Morgan St');
INSERT INTO Locations (City, State, Address) VALUES ('Colorado Springs','Colorado','270 S Tejon St');
INSERT INTO Locations (City, State, Address) VALUES ('Miami','Florida','175 NW 1st Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Omaha','Nebraska','1701 Farnam St');
INSERT INTO Locations (City, State, Address) VALUES ('Oakland','California','1225 Fallon St');
INSERT INTO Locations (City, State, Address) VALUES ('Minneapolis','Minnesota','300 S 6th St');
INSERT INTO Locations (City, State, Address) VALUES ('Tulsa','Oklahoma','500 S Denver Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Tampa','Florida','800 E Twiggs St');
INSERT INTO Locations (City, State, Address) VALUES ('Arlington','Texas','101 W Abram St');
INSERT INTO Locations (City, State, Address) VALUES ('New Orleans','Louisiana','421 Loyola Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Wichita','Kansas','525 N Main St');
INSERT INTO Locations (City, State, Address) VALUES ('Bakersfield','California','1415 Truxtun Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Aurora','Colorado','15151 E Alameda Pkwy');
INSERT INTO Locations (City, State, Address) VALUES ('Anaheim','California','425 S Harbor Blvd');
INSERT INTO Locations (City, State, Address) VALUES ('Santa Ana','California','700 Civic Center Dr W');
INSERT INTO Locations (City, State, Address) VALUES ('Corpus Christi','Texas','901 Leopard St');
INSERT INTO Locations (City, State, Address) VALUES ('Riverside','California','4100 Main St');
INSERT INTO Locations (City, State, Address) VALUES ('Lexington','Kentucky','100 E Vine St');
INSERT INTO Locations (City, State, Address) VALUES ('Pittsburgh','Pennsylvania','414 Grant St');
INSERT INTO Locations (City, State, Address) VALUES ('Stockton','California','222 E Weber Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Anchorage','Alaska','825 W 4th Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Cincinnati','Ohio','1000 Main St');
INSERT INTO Locations (City, State, Address) VALUES ('St. Paul','Minnesota','15 W Kellogg Blvd');
INSERT INTO Locations (City, State, Address) VALUES ('Toledo','Ohio','555 N Erie St');
INSERT INTO Locations (City, State, Address) VALUES ('Greensboro','North Carolina','201 S Eugene St');
INSERT INTO Locations (City, State, Address) VALUES ('Newark','New Jersey','50 W Market St');
INSERT INTO Locations (City, State, Address) VALUES ('Plano','Texas','900 E Park Blvd');
INSERT INTO Locations (City, State, Address) VALUES ('Henderson','Nevada','240 S Water St');
INSERT INTO Locations (City, State, Address) VALUES ('Lincoln','Nebraska','575 S 10th St');
INSERT INTO Locations (City, State, Address) VALUES ('Buffalo','New York','50 Delaware Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Fort Wayne','Indiana','715 S Calhoun St');
INSERT INTO Locations (City, State, Address) VALUES ('Jersey City','New Jersey','283 Newark Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Chula Vista','California','276 4th Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Orlando','Florida','301 N Rosalind Ave');
INSERT INTO Locations (City, State, Address) VALUES ('St. Louis','Missouri','1114 Market St');
INSERT INTO Locations (City, State, Address) VALUES ('Madison','Wisconsin','210 MLK Jr Blvd');
INSERT INTO Locations (City, State, Address) VALUES ('Laredo','Texas','1110 Victoria St');
INSERT INTO Locations (City, State, Address) VALUES ('Chandler','Arizona','250 E Chicago St');
INSERT INTO Locations (City, State, Address) VALUES ('Lubbock','Texas','904 Broadway Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Norfolk','Virginia','811 E City Hall Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Madison','Alabama','100 Hughes Rd');
INSERT INTO Locations (City, State, Address) VALUES ('Durham','North Carolina','201 E Main St');
INSERT INTO Locations (City, State, Address) VALUES ('Garland','Texas','200 N 5th St');
INSERT INTO Locations (City, State, Address) VALUES ('Glendale','Arizona','5850 W Glendale Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Hialeah','Florida','501 Palm Ave');
INSERT INTO Locations (City, State, Address) VALUES ('Reno','Nevada','1 S Sierra St');
INSERT INTO Locations (City, State, Address) VALUES ('Baton Rouge','Louisiana','222 St Louis St');
INSERT INTO Locations (City, State, Address) VALUES ('Irvine','California','14400 Myford Rd');
INSERT INTO Locations (City, State, Address) VALUES ('Birmingham','Alabama','801 Richard Arrington Blvd');
INSERT INTO Locations (City, State, Address) VALUES ('Rochester','New York','99 Exchange Blvd');
INSERT INTO Locations (City, State, Address) VALUES ('North Las Vegas','Nevada','2200 Civic Center Dr');
INSERT INTO Locations (City, State, Address) VALUES ('Irving','Texas','825 W Irving Blvd');
INSERT INTO Locations (City, State, Address) VALUES ('Scottsdale','Arizona','7447 E Indian School Rd');
INSERT INTO Locations (City, State, Address) VALUES ('North Hempstead','New York','220 Plandome Rd');
INSERT INTO Locations (City, State, Address) VALUES ('Winston-Salem','North Carolina','101 N Main St');
INSERT INTO Locations (City, State, Address) VALUES ('Chesapeake','Virginia','306 Cedar Rd');
INSERT INTO Locations (City, State, Address) VALUES ('Gilbert','Arizona','50 E Civic Center Dr');
INSERT INTO Locations (City, State, Address) VALUES ('Fremont','California','39550 Liberty St');
INSERT INTO Locations (City, State, Address) VALUES ('Port Arthur','Texas','444 4th St');
INSERT INTO Locations (City, State, Address) VALUES ('Montgomery','Alabama','251 S Lawrence St');
INSERT INTO Locations (City, State, Address) VALUES ('Little Rock','Arkansas','101 W Markham St');
INSERT INTO Locations (City, State, Address) VALUES ('Salt Lake City','Utah','450 S State St');
INSERT INTO Locations (City, State, Address) VALUES ('Tallahassee','Florida','301 S Monroe St');
INSERT INTO Locations (City, State, Address) VALUES ('Providence','Rhode Island','250 Benefit St');
INSERT INTO Locations (City, State, Address) VALUES ('Richmond','Virginia','400 N 9th St');
INSERT INTO Locations (City, State, Address) VALUES ('Des Moines','Iowa','215 E 7th St');
INSERT INTO Locations (City, State, Address) VALUES ('Spokane','Washington','1116 W Broadway Ave');
INSERT INTO Locations (City, State, Address) VALUES ('','','12 Main St, New York, NY');
INSERT INTO Locations (City, State, Address) VALUES ('','','45 Harbor Blvd, Chicago, IL');
INSERT INTO Locations (City, State, Address) VALUES ('','','78 Park Ave, Houston, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','Online - Philadelphia, PA');
INSERT INTO Locations (City, State, Address) VALUES ('','','23 Commerce St, Phoenix, AZ');
INSERT INTO Locations (City, State, Address) VALUES ('','','89 Club Row, San Antonio, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','32 Highway 10, San Diego, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','67 School Rd, Dallas, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','14 Suburban Dr, San Jose, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','48 Financial Blvd, Austin, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','81 Industrial Rd, Jacksonville, FL');
INSERT INTO Locations (City, State, Address) VALUES ('','','25 Parking Ave, Columbus, OH');
INSERT INTO Locations (City, State, Address) VALUES ('','','59 Suburban Ln, Charlotte, NC');
INSERT INTO Locations (City, State, Address) VALUES ('','','92 Commerce Dr, Indianapolis, IN');
INSERT INTO Locations (City, State, Address) VALUES ('','','37 Industrial Ct, San Francisco, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','70 Park Rd, Seattle, WA');
INSERT INTO Locations (City, State, Address) VALUES ('','','13 Office Park, Denver, CO');
INSERT INTO Locations (City, State, Address) VALUES ('','','47 Residential Rd, Nashville, TN');
INSERT INTO Locations (City, State, Address) VALUES ('','','80 Highway 40, Oklahoma City, OK');
INSERT INTO Locations (City, State, Address) VALUES ('','','24 Maple Dr, El Paso, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','58 Alley Rd, Louisville, KY');
INSERT INTO Locations (City, State, Address) VALUES ('','','91 Mall Ave, Baltimore, MD');
INSERT INTO Locations (City, State, Address) VALUES ('','','35 Market St, Milwaukee, WI');
INSERT INTO Locations (City, State, Address) VALUES ('','','68 Bank Row, Albuquerque, NM');
INSERT INTO Locations (City, State, Address) VALUES ('','','11 Border Rd, Tucson, AZ');
INSERT INTO Locations (City, State, Address) VALUES ('','','44 Office Blvd, Fresno, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','77 Residential Ave, Sacramento, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','22 Document St, Long Beach, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','55 Government Blvd, Kansas City, MO');
INSERT INTO Locations (City, State, Address) VALUES ('','','88 Crime Alley, Mesa, AZ');
INSERT INTO Locations (City, State, Address) VALUES ('','','33 Bank St, Atlanta, GA');
INSERT INTO Locations (City, State, Address) VALUES ('','','66 Residential Ct, Virginia Beach, VA');
INSERT INTO Locations (City, State, Address) VALUES ('','','99 Home Rd, Raleigh, NC');
INSERT INTO Locations (City, State, Address) VALUES ('','','43 Insurance Blvd, Colorado Springs, CO');
INSERT INTO Locations (City, State, Address) VALUES ('','','76 Street Corner, Miami, FL');
INSERT INTO Locations (City, State, Address) VALUES ('','','20 Highway 95, Omaha, NE');
INSERT INTO Locations (City, State, Address) VALUES ('','','53 Remote Area, Oakland, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','Online - Minneapolis, MN');
INSERT INTO Locations (City, State, Address) VALUES ('','','30 Suburban St, Tulsa, OK');
INSERT INTO Locations (City, State, Address) VALUES ('','','63 Dining Ave, Tampa, FL');
INSERT INTO Locations (City, State, Address) VALUES ('','','96 Jewelry Row, Arlington, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','40 Warehouse St, New Orleans, LA');
INSERT INTO Locations (City, State, Address) VALUES ('','','73 Dark Alley, Wichita, KS');
INSERT INTO Locations (City, State, Address) VALUES ('','','17 Auto Row, Bakersfield, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','50 Bank Ave, Aurora, CO');
INSERT INTO Locations (City, State, Address) VALUES ('','','83 City Park, Anaheim, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','27 Investment Blvd, Santa Ana, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','60 Industrial Park, Corpus Christi, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','93 Museum Dr, Riverside, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','37 Casino Blvd, Lexington, KY');
INSERT INTO Locations (City, State, Address) VALUES ('','','70 Office Park, Pittsburgh, PA');
INSERT INTO Locations (City, State, Address) VALUES ('','','14 Shopping Center, Stockton, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','47 Downtown Rd, Anchorage, AK');
INSERT INTO Locations (City, State, Address) VALUES ('','','80 Gas Station Row, Cincinnati, OH');
INSERT INTO Locations (City, State, Address) VALUES ('','','24 Suburban Blvd, St. Paul, MN');
INSERT INTO Locations (City, State, Address) VALUES ('','','57 Media Blvd, Toledo, OH');
INSERT INTO Locations (City, State, Address) VALUES ('','','90 Gang Territory, Greensboro, NC');
INSERT INTO Locations (City, State, Address) VALUES ('','','34 Commerce St, Newark, NJ');
INSERT INTO Locations (City, State, Address) VALUES ('','','67 Courthouse Ln, Plano, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','11 Home Ave, Henderson, NV');
INSERT INTO Locations (City, State, Address) VALUES ('','','44 Transport Route, Lincoln, NE');
INSERT INTO Locations (City, State, Address) VALUES ('','','77 Residential Blvd, Buffalo, NY');
INSERT INTO Locations (City, State, Address) VALUES ('','','21 Institution Rd, Fort Wayne, IN');
INSERT INTO Locations (City, State, Address) VALUES ('','','54 Medical Blvd, Jersey City, NJ');
INSERT INTO Locations (City, State, Address) VALUES ('','','87 Street Ave, Chula Vista, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','31 Highway 5, Orlando, FL');
INSERT INTO Locations (City, State, Address) VALUES ('','','64 Airport Area, St. Louis, MO');
INSERT INTO Locations (City, State, Address) VALUES ('','','Online - Madison, WI');
INSERT INTO Locations (City, State, Address) VALUES ('','','97 Wilderness Area, Laredo, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','42 Gang Area, Chandler, AZ');
INSERT INTO Locations (City, State, Address) VALUES ('','','75 Restaurant Row, Lubbock, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','19 Port Area, Norfolk, VA');
INSERT INTO Locations (City, State, Address) VALUES ('','','52 Witness St, Madison, AL');
INSERT INTO Locations (City, State, Address) VALUES ('','','85 Auto Park, Durham, NC');
INSERT INTO Locations (City, State, Address) VALUES ('','','29 Charity Blvd, Garland, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','62 Campus Rd, Glendale, AZ');
INSERT INTO Locations (City, State, Address) VALUES ('','','Online - Hialeah, FL');
INSERT INTO Locations (City, State, Address) VALUES ('','','95 Industrial Area, Reno, NV');
INSERT INTO Locations (City, State, Address) VALUES ('','','39 Art District, Baton Rouge, LA');
INSERT INTO Locations (City, State, Address) VALUES ('','','72 Property Row, Irvine, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','16 Political Blvd, Birmingham, AL');
INSERT INTO Locations (City, State, Address) VALUES ('','','49 Port Rd, Rochester, NY');
INSERT INTO Locations (City, State, Address) VALUES ('','','82 Sports Park, Las Vegas, NV');
INSERT INTO Locations (City, State, Address) VALUES ('','','Online - Irving, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','26 Border Area, Scottsdale, AZ');
INSERT INTO Locations (City, State, Address) VALUES ('','','59 Political Ave, N. Hempstead, NY');
INSERT INTO Locations (City, State, Address) VALUES ('','','92 Gang Zone, Winston-Salem, NC');
INSERT INTO Locations (City, State, Address) VALUES ('','','36 Property Lane, Chesapeake, VA');
INSERT INTO Locations (City, State, Address) VALUES ('','','69 Customs Rd, Gilbert, AZ');
INSERT INTO Locations (City, State, Address) VALUES ('','','13 Quiet Street, Henderson, NV');
INSERT INTO Locations (City, State, Address) VALUES ('','','46 Pharmacy Row, Fremont, CA');
INSERT INTO Locations (City, State, Address) VALUES ('','','79 Residential Area, Port Arthur, TX');
INSERT INTO Locations (City, State, Address) VALUES ('','','Online - Montgomery, AL');
INSERT INTO Locations (City, State, Address) VALUES ('','','23 Stock Exchange, Little Rock, AR');
INSERT INTO Locations (City, State, Address) VALUES ('','','56 Festival Grounds, Salt Lake City, UT');
INSERT INTO Locations (City, State, Address) VALUES ('','','89 Highway 15, Tallahassee, FL');
INSERT INTO Locations (City, State, Address) VALUES ('','','33 Family Rd, Providence, RI');
INSERT INTO Locations (City, State, Address) VALUES ('','','Online - Richmond, VA');
INSERT INTO Locations (City, State, Address) VALUES ('','','66 Commerce Way, Des Moines, IA');
INSERT INTO Locations (City, State, Address) VALUES ('','','99 Highway 90, Spokane, WA');
GO

CREATE TABLE PoliceOfficer (OfficerID INT PRIMARY KEY IDENTITY(1,1), FirstName NVARCHAR(50), LastName NVARCHAR(50), BadgeNumber NVARCHAR(20) UNIQUE, RankID INT, DeptID INT, PhoneNumber NVARCHAR(15), Email NVARCHAR(100), DateJoined DATE, IsActive BIT, FOREIGN KEY (RankID) REFERENCES Ranks(RankID), FOREIGN KEY (DeptID) REFERENCES Departments(DeptID));
CREATE TABLE Court3 (CourtID INT PRIMARY KEY IDENTITY(1,1), CourtName NVARCHAR(150), CourtTypeID INT, LocationID INT, PhoneNumber NVARCHAR(15), JudgeName NVARCHAR(100), EstablishedYear INT, FOREIGN KEY (CourtTypeID) REFERENCES CourtTypes(TypeID), FOREIGN KEY (LocationID) REFERENCES Locations(LocationID));
CREATE TABLE Lawyer2 (LawyerID INT PRIMARY KEY IDENTITY(1,1), FirstName NVARCHAR(50), LastName NVARCHAR(50), LicenseNumber NVARCHAR(30) UNIQUE, SpecID INT, PhoneNumber NVARCHAR(15), Email NVARCHAR(100), BarAssociation NVARCHAR(100), YearsExperience INT, IsDefenseAttorney BIT, FOREIGN KEY (SpecID) REFERENCES Specializations(SpecID));
CREATE TABLE Criminal6 (CriminalID INT PRIMARY KEY IDENTITY(1,1), FirstName NVARCHAR(50), LastName NVARCHAR(50), DateOfBirth DATE, Gender CHAR(1), Nationality NVARCHAR(50), NationalID NVARCHAR(30) UNIQUE, Address NVARCHAR(255), PhoneNumber NVARCHAR(15), StatusID INT, FOREIGN KEY (StatusID) REFERENCES CriminalStatuses(CSID));
CREATE TABLE Crime5 (CrimeID INT PRIMARY KEY IDENTITY(1,1), CrimeType NVARCHAR(100), Description NVARCHAR(500), SeverityID INT, DateOccurred DATE, LocationID INT, CriminalID INT, OfficerID INT, IsResolved BIT, FOREIGN KEY (SeverityID) REFERENCES Severities(SeverityID), FOREIGN KEY (LocationID) REFERENCES Locations(LocationID), FOREIGN KEY (CriminalID) REFERENCES Criminal6(CriminalID), FOREIGN KEY (OfficerID) REFERENCES PoliceOfficer(OfficerID));
CREATE TABLE CaseRecord (CaseID INT PRIMARY KEY IDENTITY(1,1), CaseNumber NVARCHAR(30) UNIQUE, CaseTitle NVARCHAR(200), CrimeID INT, CourtID INT, LawyerID INT, OfficerID INT, FilingDate DATE, HearingDate DATE, VerdictID INT, StatusID INT, SentenceYears INT, FineAmount DECIMAL(12,2), FOREIGN KEY (CrimeID) REFERENCES Crime5(CrimeID), FOREIGN KEY (CourtID) REFERENCES Court3(CourtID), FOREIGN KEY (LawyerID) REFERENCES Lawyer2(LawyerID), FOREIGN KEY (OfficerID) REFERENCES PoliceOfficer(OfficerID), FOREIGN KEY (VerdictID) REFERENCES Verdicts(VerdictID), FOREIGN KEY (StatusID) REFERENCES CaseStatuses(StatusID));
CREATE TABLE FamilyMember (FamilyMemberID INT PRIMARY KEY IDENTITY(1,1), CriminalID INT, FirstName NVARCHAR(50), LastName NVARCHAR(50), RelID INT, DateOfBirth DATE, PhoneNumber NVARCHAR(15), Address NVARCHAR(255), IsCooperating BIT, FOREIGN KEY (CriminalID) REFERENCES Criminal6(CriminalID), FOREIGN KEY (RelID) REFERENCES Relationships(RelID));
GO

SET IDENTITY_INSERT PoliceOfficer ON;
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (1,'James','Anderson','B1001',1,1,'555-1001','j.anderson@police.gov','2005-03-15',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (2,'Maria','Garcia','B1002',2,2,'555-1002','m.garcia@police.gov','2008-06-20',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (3,'Robert','Johnson','B1003',3,3,'555-1003','r.johnson@police.gov','2015-09-10',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (4,'Linda','Martinez','B1004',4,4,'555-1004','l.martinez@police.gov','2012-11-01',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (5,'William','Wilson','B1005',1,5,'555-1005','w.wilson@police.gov','2003-01-22',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (6,'Patricia','Moore','B1006',2,6,'555-1006','p.moore@police.gov','2010-07-14',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (7,'David','Taylor','B1007',3,3,'555-1007','d.taylor@police.gov','2018-04-05',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (8,'Barbara','Thomas','B1008',4,1,'555-1008','b.thomas@police.gov','2009-12-30',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (9,'Richard','Jackson','B1009',1,2,'555-1009','r.jackson@police.gov','2006-08-18',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (10,'Susan','White','B1010',2,4,'555-1010','s.white@police.gov','2011-02-25',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (11,'Joseph','Harris','B1011',3,7,'555-1011','j.harris@police.gov','2019-05-16',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (12,'Jessica','Martin','B1012',4,5,'555-1012','j.martin@police.gov','2007-10-09',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (13,'Thomas','Thompson','B1013',1,6,'555-1013','t.thompson@police.gov','2004-03-28',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (14,'Sarah','Garcia','B1014',2,2,'555-1014','s.garciax@police.gov','2013-09-03',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (15,'Charles','Martinez','B1015',3,3,'555-1015','c.martinez@police.gov','2017-06-11',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (16,'Karen','Robinson','B1016',4,1,'555-1016','k.robinson@police.gov','2008-01-19',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (17,'Christopher','Clark','B1017',1,4,'555-1017','c.clark@police.gov','2002-12-07',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (18,'Nancy','Rodriguez','B1018',2,5,'555-1018','n.rodriguez@police.gov','2014-04-23',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (19,'Daniel','Lewis','B1019',3,3,'555-1019','d.lewis@police.gov','2020-08-30',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (20,'Lisa','Lee','B1020',4,6,'555-1020','l.lee@police.gov','2010-11-14',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (21,'Matthew','Walker','B1021',1,2,'555-1021','m.walker@police.gov','2005-07-02',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (22,'Betty','Hall','B1022',2,1,'555-1022','b.hall@police.gov','2009-03-17',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (23,'Anthony','Allen','B1023',3,7,'555-1023','a.allen@police.gov','2016-10-25',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (24,'Margaret','Young','B1024',4,4,'555-1024','m.young@police.gov','2011-06-08',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (25,'Mark','Hernandez','B1025',1,5,'555-1025','m.hernandez@police.gov','2003-09-20',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (26,'Sandra','King','B1026',2,6,'555-1026','s.king@police.gov','2012-02-14',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (27,'Donald','Wright','B1027',3,3,'555-1027','d.wright@police.gov','2018-07-06',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (28,'Ashley','Scott','B1028',4,2,'555-1028','a.scott@police.gov','2007-04-29',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (29,'Paul','Torres','B1029',1,1,'555-1029','p.torres@police.gov','2001-11-11',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (30,'Kimberly','Nguyen','B1030',2,4,'555-1030','k.nguyen@police.gov','2015-01-03',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (31,'Steven','Hill','B1031',3,3,'555-1031','s.hill@police.gov','2019-08-22',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (32,'Emily','Flores','B1032',4,5,'555-1032','e.flores@police.gov','2006-05-15',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (33,'Andrew','Green','B1033',1,6,'555-1033','a.green@police.gov','2004-12-01',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (34,'Donna','Adams','B1034',2,2,'555-1034','d.adams@police.gov','2013-06-27',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (35,'Joshua','Nelson','B1035',3,7,'555-1035','j.nelson@police.gov','2017-03-09',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (36,'Carol','Baker','B1036',4,1,'555-1036','c.baker@police.gov','2008-09-14',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (37,'Kevin','Carter','B1037',1,4,'555-1037','k.carter@police.gov','2002-04-18',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (38,'Michelle','Mitchell','B1038',2,5,'555-1038','m.mitchell@police.gov','2014-10-05',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (39,'Brian','Perez','B1039',3,3,'555-1039','b.perez@police.gov','2021-02-12',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (40,'Amanda','Roberts','B1040',4,6,'555-1040','a.roberts@police.gov','2010-07-31',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (41,'George','Turner','B1041',1,2,'555-1041','g.turner@police.gov','2005-11-24',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (42,'Melissa','Phillips','B1042',2,1,'555-1042','m.phillips@police.gov','2009-08-07',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (43,'Edward','Campbell','B1043',3,7,'555-1043','e.campbell@police.gov','2016-05-19',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (44,'Deborah','Parker','B1044',4,4,'555-1044','d.parker@police.gov','2011-12-26',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (45,'Ronald','Evans','B1045',1,5,'555-1045','r.evans@police.gov','2003-06-13',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (46,'Stephanie','Edwards','B1046',2,6,'555-1046','s.edwards@police.gov','2012-09-02',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (47,'Timothy','Collins','B1047',3,3,'555-1047','t.collins@police.gov','2018-01-28',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (48,'Rebecca','Stewart','B1048',4,2,'555-1048','r.stewart@police.gov','2007-07-21',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (49,'Larry','Sanchez','B1049',1,1,'555-1049','l.sanchez@police.gov','2001-03-04',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (50,'Sharon','Morris','B1050',2,4,'555-1050','s.morris@police.gov','2015-10-16',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (51,'Jeffrey','Rogers','B1051',3,3,'555-1051','j.rogers@police.gov','2020-04-08',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (52,'Cynthia','Reed','B1052',4,5,'555-1052','c.reed@police.gov','2006-01-31',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (53,'Frank','Cook','B1053',1,6,'555-1053','f.cook@police.gov','2004-08-17',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (54,'Angela','Morgan','B1054',2,2,'555-1054','a.morgan@police.gov','2013-03-10',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (55,'Scott','Bell','B1055',3,7,'555-1055','s.bell@police.gov','2017-10-29',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (56,'Kathleen','Murphy','B1056',4,1,'555-1056','k.murphy@police.gov','2008-06-05',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (57,'Eric','Bailey','B1057',1,4,'555-1057','e.bailey@police.gov','2002-01-23',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (58,'Shirley','Rivera','B1058',2,5,'555-1058','s.rivera@police.gov','2014-07-18',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (59,'Stephen','Cooper','B1059',3,3,'555-1059','s.cooper@police.gov','2021-09-06',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (60,'Janet','Richardson','B1060',4,6,'555-1060','j.richardson@police.gov','2010-04-14',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (61,'Raymond','Cox','B1061',1,2,'555-1061','r.cox@police.gov','2005-08-27',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (62,'Pamela','Howard','B1062',2,1,'555-1062','p.howard@police.gov','2009-05-20',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (63,'Gregory','Ward','B1063',3,7,'555-1063','g.ward@police.gov','2016-02-03',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (64,'Virginia','Torres','B1064',4,4,'555-1064','v.torres@police.gov','2011-09-11',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (65,'Harold','Peterson','B1065',1,5,'555-1065','h.peterson@police.gov','2003-03-30',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (66,'Catherine','Gray','B1066',2,6,'555-1066','c.gray@police.gov','2012-12-19',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (67,'Patrick','Ramirez','B1067',3,3,'555-1067','p.ramirez@police.gov','2018-10-15',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (68,'Christine','James','B1068',4,2,'555-1068','c.james@police.gov','2007-01-08',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (69,'Jack','Watson','B1069',1,1,'555-1069','j.watson@police.gov','2001-06-21',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (70,'Samantha','Brooks','B1070',2,4,'555-1070','s.brooks@police.gov','2015-07-04',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (71,'Dennis','Kelly','B1071',3,3,'555-1071','d.kelly@police.gov','2020-11-23',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (72,'Rachel','Sanders','B1072',4,5,'555-1072','r.sanders@police.gov','2006-08-26',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (73,'Jerry','Price','B1073',1,6,'555-1073','j.price@police.gov','2004-05-09',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (74,'Carolyn','Bennett','B1074',2,2,'555-1074','c.bennett@police.gov','2013-12-22',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (75,'Walter','Wood','B1075',3,7,'555-1075','w.wood@police.gov','2017-07-17',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (76,'Maria','Barnes','B1076',4,1,'555-1076','m.barnes@police.gov','2008-03-01',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (77,'Alan','Ross','B1077',1,4,'555-1077','a.ross@police.gov','2002-08-14',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (78,'Heather','Henderson','B1078',2,5,'555-1078','h.henderson@police.gov','2014-01-07',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (79,'Arthur','Coleman','B1079',3,3,'555-1079','a.coleman@police.gov','2021-06-18',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (80,'Julie','Jenkins','B1080',4,6,'555-1080','j.jenkins@police.gov','2010-01-31',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (81,'Roger','Perry','B1081',1,2,'555-1081','r.perry@police.gov','2005-05-14',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (82,'Joyce','Powell','B1082',2,1,'555-1082','j.powell@police.gov','2009-02-06',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (83,'Bruce','Long','B1083',3,7,'555-1083','b.long@police.gov','2016-11-28',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (84,'Victoria','Patterson','B1084',4,4,'555-1084','v.patterson@police.gov','2011-07-21',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (85,'Terry','Hughes','B1085',1,5,'555-1085','t.hughes@police.gov','2003-12-10',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (86,'Frances','Flores','B1086',2,6,'555-1086','f.floresx@police.gov','2012-06-29',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (87,'Willie','Washington','B1087',3,3,'555-1087','w.washington@police.gov','2018-04-12',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (88,'Evelyn','Butler','B1088',4,2,'555-1088','e.butler@police.gov','2007-10-25',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (89,'Wayne','Simmons','B1089',1,1,'555-1089','w.simmons@police.gov','2001-09-08',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (90,'Theresa','Foster','B1090',2,4,'555-1090','t.foster@police.gov','2015-04-21',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (91,'Ralph','Gonzalez','B1091',3,3,'555-1091','r.gonzalez@police.gov','2020-08-14',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (92,'Janice','Bryant','B1092',4,5,'555-1092','j.bryant@police.gov','2006-04-07',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (93,'Roy','Alexander','B1093',1,6,'555-1093','r.alexander@police.gov','2004-11-20',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (94,'Alice','Russell','B1094',2,2,'555-1094','a.russell@police.gov','2013-07-03',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (95,'Billy','Griffin','B1095',3,7,'555-1095','b.griffin@police.gov','2017-01-16',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (96,'Jean','Diaz','B1096',4,1,'555-1096','j.diaz@police.gov','2008-09-29',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (97,'Joe','Hayes','B1097',1,4,'555-1097','j.hayes@police.gov','2002-06-12',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (98,'Diane','Myers','B1098',2,5,'555-1098','d.myers@police.gov','2014-11-25',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (99,'Henry','Ford','B1099',3,3,'555-1099','h.ford@police.gov','2021-03-09',1);
INSERT INTO PoliceOfficer (OfficerID, FirstName, LastName, BadgeNumber, RankID, DeptID, PhoneNumber, Email, DateJoined, IsActive) VALUES (100,'Gloria','Hamilton','B1100',4,6,'555-1100','g.hamilton@police.gov','2010-10-18',1);
SET IDENTITY_INSERT PoliceOfficer OFF;
DBCC CHECKIDENT ('PoliceOfficer', RESEED, 100);
GO
SET IDENTITY_INSERT Court3 ON;
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (1,'Central District Court',1,1,'212-555-0001','Hon. Robert Stevens',1950);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (2,'Northern High Court',2,2,'312-555-0002','Hon. Linda Chang',1945);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (3,'Southern Sessions Court',3,3,'713-555-0003','Hon. Michael Torres',1960);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (4,'Eastern District Court',1,4,'215-555-0004','Hon. Sarah Brooks',1955);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (5,'Western High Court',2,5,'602-555-0005','Hon. David Nguyen',1948);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (6,'Metro Sessions Court',3,6,'210-555-0006','Hon. Jennifer Reed',1962);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (7,'Bay Area District Court',1,7,'619-555-0007','Hon. James Carter',1952);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (8,'North High Court',2,8,'214-555-0008','Hon. Patricia Evans',1947);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (9,'City Sessions Court',3,9,'408-555-0009','Hon. William Morgan',1965);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (10,'Central High Court',2,10,'512-555-0010','Hon. Elizabeth Bell',1943);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (11,'Riverside District Court',1,11,'904-555-0011','Hon. Charles Murphy',1958);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (12,'Lakeside Sessions Court',3,12,'614-555-0012','Hon. Karen Bailey',1963);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (13,'Westside High Court',2,13,'704-555-0013','Hon. Daniel Rivera',1950);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (14,'Eastside District Court',1,14,'317-555-0014','Hon. Michelle Cooper',1955);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (15,'Harbor Sessions Court',3,15,'415-555-0015','Hon. Joseph Richardson',1940);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (16,'Hillside High Court',2,16,'206-555-0016','Hon. Mary Cox',1946);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (17,'Valley District Court',1,17,'303-555-0017','Hon. Steven Ward',1957);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (18,'Summit Sessions Court',3,18,'615-555-0018','Hon. Donna Torres',1961);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (19,'Central Sessions Court',3,19,'405-555-0019','Hon. Thomas Peterson',1966);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (20,'Main District Court',1,20,'915-555-0020','Hon. Sandra Gray',1953);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (21,'Grand High Court',2,21,'502-555-0021','Hon. Edward Ramirez',1944);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (22,'Crown Sessions Court',3,22,'410-555-0022','Hon. Lisa James',1960);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (23,'North District Court',1,23,'414-555-0023','Hon. Ronald Watson',1956);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (24,'South High Court',2,24,'505-555-0024','Hon. Dorothy Brooks',1949);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (25,'City District Court',1,25,'520-555-0025','Hon. Kenneth Kelly',1954);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (26,'Regional Sessions Court',3,26,'559-555-0026','Hon. Sharon Sanders',1967);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (27,'Municipal High Court',2,27,'916-555-0027','Hon. George Price',1948);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (28,'Township District Court',1,28,'562-555-0028','Hon. Betty Bennett',1952);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (29,'County Sessions Court',3,29,'816-555-0029','Hon. Carl Wood',1963);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (30,'State High Court',2,30,'480-555-0030','Hon. Helen Barnes',1951);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (31,'Federal District Court',1,31,'404-555-0031','Hon. Frank Ross',1958);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (32,'Justice Sessions Court',3,32,'757-555-0032','Hon. Ruth Henderson',1964);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (33,'Supreme High Court',2,33,'919-555-0033','Hon. Harold Coleman',1946);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (34,'Lincoln District Court',1,34,'719-555-0034','Hon. Beverly Jenkins',1955);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (35,'Adams Sessions Court',3,35,'305-555-0035','Hon. Keith Perry',1962);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (36,'Jefferson High Court',2,36,'402-555-0036','Hon. Judy Long',1947);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (37,'Madison District Court',1,37,'510-555-0037','Hon. Billy Patterson',1953);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (38,'Monroe Sessions Court',3,38,'612-555-0038','Hon. Joan Hughes',1961);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (39,'Jackson High Court',2,39,'918-555-0039','Hon. Peter Flores',1944);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (40,'Harrison District Court',1,40,'813-555-0040','Hon. Frances Washington',1957);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (41,'Tyler Sessions Court',3,41,'817-555-0041','Hon. Roger Butler',1965);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (42,'Polk High Court',2,42,'504-555-0042','Hon. Ann Simmons',1943);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (43,'Taylor District Court',1,43,'316-555-0043','Hon. Johnny Foster',1956);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (44,'Fillmore Sessions Court',3,44,'661-555-0044','Hon. Virginia Gonzalez',1968);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (45,'Pierce High Court',2,45,'303-555-0045','Hon. Walter Bryant',1950);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (46,'Buchanan District Court',1,46,'714-555-0046','Hon. Catherine Alexander',1954);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (47,'Johnson Sessions Court',3,47,'714-555-0047','Hon. Larry Russell',1963);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (48,'Grant High Court',2,48,'361-555-0048','Hon. Mary Griffin',1948);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (49,'Hayes District Court',1,49,'951-555-0049','Hon. Edward Diaz',1952);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (50,'Garfield Sessions Court',3,50,'859-555-0050','Hon. Donna Hayes',1966);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (51,'Arthur High Court',2,51,'412-555-0051','Hon. Samuel Myers',1945);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (52,'Cleveland District Court',1,52,'209-555-0052','Hon. Gloria Ford',1957);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (53,'McKinley Sessions Court',3,53,'907-555-0053','Hon. Earl Hamilton',1960);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (54,'Roosevelt High Court',2,54,'513-555-0054','Hon. Evelyn Graham',1942);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (55,'Taft District Court',1,55,'651-555-0055','Hon. Fred Sullivan',1958);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (56,'Wilson Sessions Court',3,56,'419-555-0056','Hon. Alice Jordan',1964);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (57,'Harding High Court',2,57,'336-555-0057','Hon. Arthur Patterson',1947);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (58,'Coolidge District Court',1,58,'973-555-0058','Hon. Doris Perry',1953);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (59,'Hoover Sessions Court',3,59,'469-555-0059','Hon. Raymond Long',1967);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (60,'Truman High Court',2,60,'702-555-0060','Hon. Lois Price',1950);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (61,'Eisenhower District Court',1,61,'402-555-0061','Hon. Jerome Bennett',1955);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (62,'Kennedy Sessions Court',3,62,'716-555-0062','Hon. Phyllis Wood',1961);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (63,'Nixon High Court',2,63,'260-555-0063','Hon. Dale Barnes',1944);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (64,'Ford District Court',1,64,'201-555-0064','Hon. Norma Ross',1956);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (65,'Carter Sessions Court',3,65,'619-555-0065','Hon. Howard Henderson',1962);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (66,'Reagan High Court',2,66,'407-555-0066','Hon. Marjorie Coleman',1948);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (67,'Bush District Court',1,67,'314-555-0067','Hon. Vernon Jenkins',1952);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (68,'Clinton Sessions Court',3,68,'608-555-0068','Hon. Leroy Perry',1964);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (69,'Obama High Court',2,69,'956-555-0069','Hon. Mildred Powell',1946);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (70,'Central Magistrate Court',4,70,'480-555-0070','Hon. Leonard Long',1958);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (71,'District Magistrate Court',4,71,'806-555-0071','Hon. Irene Patterson',1963);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (72,'County Magistrate Court',4,72,'757-555-0072','Hon. Curtis Hughes',1965);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (73,'City Magistrate Court',4,73,'256-555-0073','Hon. Agnes Flores',1951);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (74,'Town Magistrate Court',4,74,'919-555-0074','Hon. Stanley Washington',1957);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (75,'Metro Magistrate Court',4,75,'972-555-0075','Hon. Violet Butler',1960);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (76,'West High Court',2,76,'623-555-0076','Hon. Ralph Simmons',1949);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (77,'East High Court',2,77,'305-555-0077','Hon. Gertrude Foster',1954);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (78,'South Sessions Court',3,78,'775-555-0078','Hon. Herman Gonzalez',1966);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (79,'North Sessions Court',3,79,'225-555-0079','Hon. Beatrice Bryant',1943);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (80,'Apex District Court',1,80,'949-555-0080','Hon. Wallace Alexander',1955);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (81,'Prime High Court',2,81,'205-555-0081','Hon. Esther Russell',1947);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (82,'Royal Sessions Court',3,82,'585-555-0082','Hon. Eugene Griffin',1961);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (83,'Imperial District Court',1,83,'702-555-0083','Hon. Marcia Diaz',1959);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (84,'Capitol High Court',2,84,'972-555-0084','Hon. Clarence Hayes',1945);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (85,'Liberty Sessions Court',3,85,'480-555-0085','Hon. Rosemary Myers',1964);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (86,'Union District Court',1,86,'516-555-0086','Hon. Marcus Ford',1956);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (87,'Freedom High Court',2,87,'336-555-0087','Hon. Josephine Hamilton',1948);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (88,'Justice District Court',1,88,'757-555-0088','Hon. Theodore Graham',1953);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (89,'Heritage Sessions Court',3,89,'480-555-0089','Hon. Edna Sullivan',1967);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (90,'Colonial High Court',2,60,'702-555-0090','Hon. Cecil Jordan',1951);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (91,'Pioneer District Court',1,90,'510-555-0091','Hon. Hattie Patterson',1957);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (92,'Frontier Sessions Court',3,91,'409-555-0092','Hon. Elmer Perry',1962);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (93,'Great Plains High Court',2,92,'334-555-0093','Hon. Mabel Long',1944);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (94,'Mountain District Court',1,93,'501-555-0094','Hon. Alvin Price',1958);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (95,'Pacific Sessions Court',3,94,'801-555-0095','Hon. Effie Bennett',1963);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (96,'Atlantic High Court',2,95,'850-555-0096','Hon. Albert Wood',1946);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (97,'Gulf District Court',1,96,'401-555-0097','Hon. Ella Barnes',1954);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (98,'Prairie Sessions Court',3,97,'804-555-0098','Hon. Amos Ross',1961);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (99,'Coastal High Court',2,98,'515-555-0099','Hon. Della Henderson',1949);
INSERT INTO Court3 (CourtID, CourtName, CourtTypeID, LocationID, PhoneNumber, JudgeName, EstablishedYear) VALUES (100,'Valley Sessions Court',3,99,'509-555-0100','Hon. Owen Coleman',1965);
SET IDENTITY_INSERT Court3 OFF;
DBCC CHECKIDENT ('Court3', RESEED, 100);
GO
SET IDENTITY_INSERT Lawyer2 ON;
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (1,'Alexander','Mitchell','LIC-001',1,'555-2001','a.mitchell@lawfirm.com','New York Bar',20,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (2,'Samantha','Brown','LIC-002',2,'555-2002','s.brown@lawfirm.com','Illinois Bar',15,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (3,'Benjamin','Davis','LIC-003',1,'555-2003','b.davis@lawfirm.com','Texas Bar',25,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (4,'Natalie','Wilson','LIC-004',3,'555-2004','n.wilson@lawfirm.com','California Bar',10,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (5,'Ethan','Anderson','LIC-005',2,'555-2005','e.anderson@lawfirm.com','Florida Bar',18,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (6,'Olivia','Taylor','LIC-006',1,'555-2006','o.taylor@lawfirm.com','Pennsylvania Bar',12,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (7,'Noah','Thomas','LIC-007',4,'555-2007','n.thomas@lawfirm.com','Ohio Bar',22,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (8,'Emma','Jackson','LIC-008',2,'555-2008','e.jackson@lawfirm.com','Georgia Bar',8,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (9,'William','White','LIC-009',1,'555-2009','w.white@lawfirm.com','Michigan Bar',30,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (10,'Ava','Harris','LIC-010',5,'555-2010','a.harris@lawfirm.com','New Jersey Bar',5,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (11,'James','Martin','LIC-011',2,'555-2011','j.martin@lawfirm.com','Washington Bar',16,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (12,'Isabella','Garcia','LIC-012',1,'555-2012','i.garcia@lawfirm.com','Arizona Bar',14,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (13,'Oliver','Martinez','LIC-013',6,'555-2013','o.martinez@lawfirm.com','Tennessee Bar',28,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (14,'Mia','Robinson','LIC-014',2,'555-2014','m.robinson@lawfirm.com','Virginia Bar',11,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (15,'Lucas','Clark','LIC-015',1,'555-2015','l.clark@lawfirm.com','Massachusetts Bar',19,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (16,'Charlotte','Rodriguez','LIC-016',7,'555-2016','c.rodriguez@lawfirm.com','Indiana Bar',7,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (17,'Liam','Lewis','LIC-017',2,'555-2017','l.lewis@lawfirm.com','Missouri Bar',23,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (18,'Amelia','Lee','LIC-018',1,'555-2018','a.lee@lawfirm.com','Maryland Bar',17,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (19,'Mason','Walker','LIC-019',8,'555-2019','m.walker@lawfirm.com','Minnesota Bar',9,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (20,'Harper','Hall','LIC-020',2,'555-2020','h.hall@lawfirm.com','Wisconsin Bar',13,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (21,'Elijah','Allen','LIC-021',1,'555-2021','e.allen@lawfirm.com','Colorado Bar',26,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (22,'Evelyn','Young','LIC-022',9,'555-2022','e.young@lawfirm.com','Oregon Bar',6,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (23,'James','Hernandez','LIC-023',2,'555-2023','j.hernandez@lawfirm.com','Oklahoma Bar',21,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (24,'Abigail','King','LIC-024',1,'555-2024','a.king@lawfirm.com','Connecticut Bar',15,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (25,'Logan','Wright','LIC-025',4,'555-2025','l.wright@lawfirm.com','Iowa Bar',10,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (26,'Emily','Scott','LIC-026',2,'555-2026','e.scott@lawfirm.com','Kansas Bar',18,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (27,'Jackson','Torres','LIC-027',1,'555-2027','j.torres@lawfirm.com','Arkansas Bar',27,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (28,'Elizabeth','Nguyen','LIC-028',5,'555-2028','e.nguyen@lawfirm.com','Mississippi Bar',4,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (29,'Sebastian','Hill','LIC-029',2,'555-2029','s.hill@lawfirm.com','Nevada Bar',20,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (30,'Avery','Flores','LIC-030',1,'555-2030','a.flores@lawfirm.com','New Mexico Bar',12,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (31,'Aiden','Green','LIC-031',7,'555-2031','a.green@lawfirm.com','Utah Bar',8,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (32,'Sofia','Adams','LIC-032',2,'555-2032','s.adams@lawfirm.com','Nebraska Bar',14,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (33,'Matthew','Nelson','LIC-033',1,'555-2033','m.nelson@lawfirm.com','Idaho Bar',22,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (34,'Ella','Baker','LIC-034',6,'555-2034','e.baker@lawfirm.com','Hawaii Bar',31,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (35,'Carter','Carter','LIC-035',2,'555-2035','c.carter@lawfirm.com','Maine Bar',9,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (36,'Scarlett','Mitchell','LIC-036',1,'555-2036','s.mitchell@lawfirm.com','New Hampshire Bar',16,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (37,'Owen','Perez','LIC-037',8,'555-2037','o.perez@lawfirm.com','Rhode Island Bar',6,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (38,'Victoria','Roberts','LIC-038',2,'555-2038','v.roberts@lawfirm.com','Montana Bar',19,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (39,'Wyatt','Turner','LIC-039',1,'555-2039','w.turner@lawfirm.com','South Dakota Bar',24,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (40,'Grace','Phillips','LIC-040',9,'555-2040','g.phillips@lawfirm.com','North Dakota Bar',11,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (41,'Elias','Campbell','LIC-041',2,'555-2041','e.campbell@lawfirm.com','Wyoming Bar',17,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (42,'Chloe','Parker','LIC-042',1,'555-2042','c.parker@lawfirm.com','Vermont Bar',13,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (43,'Julian','Evans','LIC-043',4,'555-2043','j.evans@lawfirm.com','Delaware Bar',29,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (44,'Penelope','Edwards','LIC-044',2,'555-2044','p.edwards@lawfirm.com','West Virginia Bar',7,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (45,'Levi','Collins','LIC-045',1,'555-2045','l.collins@lawfirm.com','Alaska Bar',21,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (46,'Riley','Stewart','LIC-046',5,'555-2046','r.stewart@lawfirm.com','North Carolina Bar',5,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (47,'Isaac','Sanchez','LIC-047',2,'555-2047','i.sanchez@lawfirm.com','South Carolina Bar',23,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (48,'Layla','Morris','LIC-048',1,'555-2048','l.morris@lawfirm.com','Kentucky Bar',16,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (49,'Gabriel','Rogers','LIC-049',7,'555-2049','g.rogers@lawfirm.com','Louisiana Bar',10,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (50,'Zoey','Reed','LIC-050',2,'555-2050','z.reed@lawfirm.com','Alabama Bar',14,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (51,'Anthony','Cook','LIC-051',1,'555-2051','a.cook@lawfirm.com','New York Bar',18,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (52,'Lillian','Morgan','LIC-052',6,'555-2052','l.morgan@lawfirm.com','Illinois Bar',25,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (53,'Dylan','Bell','LIC-053',2,'555-2053','d.bell@lawfirm.com','Texas Bar',12,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (54,'Nora','Murphy','LIC-054',1,'555-2054','n.murphy@lawfirm.com','California Bar',20,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (55,'Leo','Bailey','LIC-055',4,'555-2055','l.bailey@lawfirm.com','Florida Bar',8,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (56,'Addison','Rivera','LIC-056',2,'555-2056','a.rivera@lawfirm.com','Pennsylvania Bar',16,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (57,'Josiah','Cooper','LIC-057',1,'555-2057','j.cooper@lawfirm.com','Ohio Bar',27,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (58,'Hannah','Richardson','LIC-058',9,'555-2058','h.richardson@lawfirm.com','Georgia Bar',6,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (59,'Andrew','Cox','LIC-059',2,'555-2059','a.cox@lawfirm.com','Michigan Bar',19,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (60,'Eleanor','Howard','LIC-060',1,'555-2060','e.howard@lawfirm.com','New Jersey Bar',14,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (61,'Jaxon','Ward','LIC-061',8,'555-2061','j.ward@lawfirm.com','Washington Bar',9,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (62,'Aurora','Torres','LIC-062',2,'555-2062','a.torresx@lawfirm.com','Arizona Bar',22,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (63,'Christopher','Peterson','LIC-063',1,'555-2063','c.peterson@lawfirm.com','Tennessee Bar',17,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (64,'Bella','Gray','LIC-064',5,'555-2064','b.gray@lawfirm.com','Virginia Bar',5,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (65,'Ezra','Ramirez','LIC-065',2,'555-2065','e.ramirez@lawfirm.com','Massachusetts Bar',21,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (66,'Skylar','James','LIC-066',1,'555-2066','s.james@lawfirm.com','Indiana Bar',13,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (67,'Henry','Watson','LIC-067',7,'555-2067','h.watson@lawfirm.com','Missouri Bar',7,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (68,'Paisley','Brooks','LIC-068',2,'555-2068','p.brooks@lawfirm.com','Maryland Bar',24,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (69,'Nicholas','Kelly','LIC-069',1,'555-2069','n.kelly@lawfirm.com','Minnesota Bar',30,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (70,'Savannah','Sanders','LIC-070',6,'555-2070','s.sanders@lawfirm.com','Wisconsin Bar',11,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (71,'Hunter','Price','LIC-071',2,'555-2071','h.price@lawfirm.com','Colorado Bar',18,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (72,'Claire','Bennett','LIC-072',1,'555-2072','c.bennett@lawfirm.com','Oregon Bar',15,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (73,'Eli','Wood','LIC-073',4,'555-2073','e.wood@lawfirm.com','Oklahoma Bar',10,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (74,'Kennedy','Barnes','LIC-074',2,'555-2074','k.barnes@lawfirm.com','Connecticut Bar',20,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (75,'Grayson','Ross','LIC-075',1,'555-2075','g.ross@lawfirm.com','Iowa Bar',26,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (76,'Violet','Henderson','LIC-076',9,'555-2076','v.henderson@lawfirm.com','Kansas Bar',8,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (77,'Landon','Coleman','LIC-077',2,'555-2077','l.coleman@lawfirm.com','Arkansas Bar',14,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (78,'Stella','Jenkins','LIC-078',1,'555-2078','s.jenkins@lawfirm.com','Mississippi Bar',19,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (79,'Dominic','Perry','LIC-079',5,'555-2079','d.perry@lawfirm.com','Nevada Bar',6,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (80,'Autumn','Powell','LIC-080',2,'555-2080','a.powell@lawfirm.com','New Mexico Bar',23,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (81,'Cooper','Long','LIC-081',1,'555-2081','c.long@lawfirm.com','Utah Bar',16,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (82,'Naomi','Patterson','LIC-082',7,'555-2082','n.patterson@lawfirm.com','Nebraska Bar',12,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (83,'Greyson','Hughes','LIC-083',2,'555-2083','g.hughes@lawfirm.com','Idaho Bar',27,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (84,'Leah','Flores','LIC-084',1,'555-2084','l.floresx@lawfirm.com','Hawaii Bar',9,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (85,'Jace','Washington','LIC-085',8,'555-2085','j.washington@lawfirm.com','Maine Bar',17,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (86,'Audrey','Butler','LIC-086',2,'555-2086','a.butler@lawfirm.com','New Hampshire Bar',21,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (87,'Micah','Simmons','LIC-087',1,'555-2087','m.simmons@lawfirm.com','Rhode Island Bar',14,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (88,'Anna','Foster','LIC-088',6,'555-2088','a.foster@lawfirm.com','Montana Bar',32,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (89,'Cole','Gonzalez','LIC-089',2,'555-2089','c.gonzalez@lawfirm.com','South Dakota Bar',7,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (90,'Natalia','Bryant','LIC-090',1,'555-2090','n.bryant@lawfirm.com','North Dakota Bar',22,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (91,'Roman','Alexander','LIC-091',4,'555-2091','r.alexander@lawfirm.com','Wyoming Bar',11,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (92,'Madeline','Russell','LIC-092',2,'555-2092','m.russell@lawfirm.com','Vermont Bar',18,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (93,'Cameron','Griffin','LIC-093',1,'555-2093','c.griffin@lawfirm.com','Delaware Bar',25,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (94,'Alice','Diaz','LIC-094',9,'555-2094','a.diazx@lawfirm.com','West Virginia Bar',5,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (95,'Tristan','Hayes','LIC-095',2,'555-2095','t.hayes@lawfirm.com','Alaska Bar',20,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (96,'Sadie','Myers','LIC-096',1,'555-2096','s.myers@lawfirm.com','North Carolina Bar',13,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (97,'Miles','Ford','LIC-097',5,'555-2097','m.ford@lawfirm.com','South Carolina Bar',8,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (98,'Clara','Hamilton','LIC-098',2,'555-2098','c.hamilton@lawfirm.com','Kentucky Bar',16,0);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (99,'Preston','Graham','LIC-099',1,'555-2099','p.graham@lawfirm.com','Louisiana Bar',28,1);
INSERT INTO Lawyer2 (LawyerID, FirstName, LastName, LicenseNumber, SpecID, PhoneNumber, Email, BarAssociation, YearsExperience, IsDefenseAttorney) VALUES (100,'Violet','Sullivan','LIC-100',7,'555-2100','v.sullivan@lawfirm.com','Alabama Bar',10,1);
SET IDENTITY_INSERT Lawyer2 OFF;
DBCC CHECKIDENT ('Lawyer2', RESEED, 100);
GO
SET IDENTITY_INSERT Criminal6 ON;
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (1,'Marcus','Stone','1985-04-12','M','American','NID-CR001','12 Elm St, New York, NY','555-3001',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (2,'Angela','Price','1990-07-22','F','American','NID-CR002','45 Oak Ave, Chicago, IL','555-3002',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (3,'Dwayne','Brooks','1978-11-03','M','American','NID-CR003','78 Pine Rd, Houston, TX','555-3003',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (4,'Tiffany','Reed','1995-02-17','F','American','NID-CR004','23 Maple Dr, Philadelphia, PA','555-3004',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (5,'Jerome','Coleman','1982-09-29','M','American','NID-CR005','56 Cedar Ln, Phoenix, AZ','555-3005',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (6,'Vanessa','Hughes','1988-05-14','F','American','NID-CR006','89 Birch St, San Antonio, TX','555-3006',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (7,'Terrence','Foster','1975-12-08','M','American','NID-CR007','32 Walnut Ave, San Diego, CA','555-3007',4);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (8,'Crystal','Simmons','1993-03-25','F','American','NID-CR008','67 Spruce Rd, Dallas, TX','555-3008',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (9,'Derrick','Butler','1980-08-16','M','American','NID-CR009','14 Poplar Dr, San Jose, CA','555-3009',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (10,'Latoya','Gonzalez','1992-01-07','F','American','NID-CR010','48 Ash Ln, Austin, TX','555-3010',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (11,'Xavier','Bryant','1987-06-19','M','American','NID-CR011','81 Hickory St, Jacksonville, FL','555-3011',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (12,'Monique','Alexander','1997-10-30','F','American','NID-CR012','25 Magnolia Ave, Columbus, OH','555-3012',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (13,'Tyrone','Russell','1983-04-04','M','American','NID-CR013','59 Chestnut Rd, Charlotte, NC','555-3013',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (14,'Keisha','Griffin','1991-09-11','F','American','NID-CR014','92 Dogwood Dr, Indianapolis, IN','555-3014',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (15,'Lamont','Diaz','1977-02-28','M','American','NID-CR015','37 Cypress Ln, San Francisco, CA','555-3015',4);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (16,'Brianna','Hayes','1994-07-15','F','American','NID-CR016','70 Redwood St, Seattle, WA','555-3016',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (17,'Darnell','Myers','1986-12-22','M','American','NID-CR017','13 Sequoia Ave, Denver, CO','555-3017',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (18,'Shaniqua','Ford','1989-05-09','F','American','NID-CR018','47 Willow Rd, Nashville, TN','555-3018',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (19,'Antoine','Hamilton','1981-10-26','M','American','NID-CR019','80 Sycamore Dr, Oklahoma City, OK','555-3019',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (20,'Precious','Graham','1996-03-13','F','American','NID-CR020','24 Aspen Ln, El Paso, TX','555-3020',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (21,'Rasheed','Sullivan','1984-08-07','M','American','NID-CR021','58 Juniper St, Louisville, KY','555-3021',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (22,'Tamika','Jordan','1990-01-24','F','American','NID-CR022','91 Larch Ave, Baltimore, MD','555-3022',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (23,'Deon','Patterson','1979-06-11','M','American','NID-CR023','35 Alder Rd, Milwaukee, WI','555-3023',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (24,'Yolanda','Perry','1993-11-28','F','American','NID-CR024','68 Beech Dr, Albuquerque, NM','555-3024',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (25,'Jamal','Long','1985-04-15','M','American','NID-CR025','11 Elm Ct, Tucson, AZ','555-3025',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (26,'Renee','Price','1988-09-02','F','American','NID-CR026','44 Oak Ct, Fresno, CA','555-3026',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (27,'Terrell','Bennett','1976-02-19','M','American','NID-CR027','77 Pine Ct, Sacramento, CA','555-3027',4);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (28,'Shanice','Wood','1995-07-06','F','American','NID-CR028','22 Maple Ct, Long Beach, CA','555-3028',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (29,'Dominique','Barnes','1983-12-23','M','American','NID-CR029','55 Cedar Ct, Kansas City, MO','555-3029',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (30,'Jasmine','Ross','1991-05-10','F','American','NID-CR030','88 Birch Ct, Mesa, AZ','555-3030',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (31,'Cedric','Henderson','1987-10-27','M','American','NID-CR031','33 Walnut Ct, Atlanta, GA','555-3031',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (32,'Aisha','Coleman','1994-03-14','F','American','NID-CR032','66 Spruce Ct, Virginia Beach, VA','555-3032',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (33,'Darius','Jenkins','1980-08-01','M','American','NID-CR033','99 Poplar Ct, Raleigh, NC','555-3033',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (34,'Shalonda','Perry','1989-01-18','F','American','NID-CR034','43 Ash Ct, Colorado Springs, CO','555-3034',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (35,'Maurice','Powell','1982-06-05','M','American','NID-CR035','76 Hickory Ct, Miami, FL','555-3035',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (36,'Tonya','Long','1996-11-22','F','American','NID-CR036','20 Magnolia Ct, Omaha, NE','555-3036',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (37,'Kendrick','Patterson','1978-04-09','M','American','NID-CR037','53 Chestnut Ct, Oakland, CA','555-3037',4);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (38,'Felicia','Hughes','1992-09-26','F','American','NID-CR038','86 Dogwood Ct, Minneapolis, MN','555-3038',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (39,'Deshawn','Foster','1984-02-13','M','American','NID-CR039','30 Cypress Ct, Tulsa, OK','555-3039',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (40,'Niesha','Simmons','1990-07-30','F','American','NID-CR040','63 Redwood Ct, Tampa, FL','555-3040',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (41,'Elroy','Butler','1977-12-17','M','American','NID-CR041','96 Sequoia Ct, Arlington, TX','555-3041',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (42,'Antoinette','Gonzalez','1993-05-04','F','American','NID-CR042','40 Willow Ct, New Orleans, LA','555-3042',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (43,'Leroy','Bryant','1986-10-21','M','American','NID-CR043','73 Sycamore Ct, Wichita, KS','555-3043',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (44,'Rochelle','Alexander','1991-03-08','F','American','NID-CR044','17 Aspen Ct, Bakersfield, CA','555-3044',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (45,'Marvin','Russell','1983-08-25','M','American','NID-CR045','50 Juniper Ct, Aurora, CO','555-3045',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (46,'Simone','Griffin','1988-01-12','F','American','NID-CR046','83 Larch Ct, Anaheim, CA','555-3046',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (47,'Otis','Diaz','1975-06-29','M','American','NID-CR047','27 Alder Ct, Santa Ana, CA','555-3047',4);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (48,'Alicia','Hayes','1994-11-16','F','American','NID-CR048','60 Beech Ct, Corpus Christi, TX','555-3048',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (49,'Quinton','Myers','1981-04-03','M','American','NID-CR049','93 Elm Pl, Riverside, CA','555-3049',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (50,'Loretta','Ford','1997-09-20','F','American','NID-CR050','37 Oak Pl, Lexington, KY','555-3050',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (51,'Byron','Hamilton','1985-02-07','M','American','NID-CR051','70 Pine Pl, Pittsburgh, PA','555-3051',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (52,'Wanda','Graham','1989-07-24','F','American','NID-CR052','14 Maple Pl, Stockton, CA','555-3052',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (53,'Reginald','Sullivan','1980-12-11','M','American','NID-CR053','47 Cedar Pl, Anchorage, AK','555-3053',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (54,'Debra','Jordan','1993-05-28','F','American','NID-CR054','80 Birch Pl, Cincinnati, OH','555-3054',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (55,'Clyde','Patterson','1978-10-15','M','American','NID-CR055','24 Walnut Pl, St. Paul, MN','555-3055',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (56,'Rhonda','Perry','1991-03-02','F','American','NID-CR056','57 Spruce Pl, Toledo, OH','555-3056',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (57,'Curtis','Long','1987-08-19','M','American','NID-CR057','90 Poplar Pl, Greensboro, NC','555-3057',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (58,'Tamara','Price','1994-01-06','F','American','NID-CR058','34 Ash Pl, Newark, NJ','555-3058',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (59,'Wendell','Bennett','1982-06-23','M','American','NID-CR059','67 Hickory Pl, Plano, TX','555-3059',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (60,'Carolyn','Wood','1990-11-10','F','American','NID-CR060','11 Magnolia Pl, Henderson, NV','555-3060',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (61,'Freddie','Barnes','1976-04-27','M','American','NID-CR061','44 Chestnut Pl, Lincoln, NE','555-3061',4);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (62,'Annette','Ross','1995-09-14','F','American','NID-CR062','77 Dogwood Pl, Buffalo, NY','555-3062',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (63,'Eugene','Henderson','1984-02-01','M','American','NID-CR063','21 Cypress Pl, Fort Wayne, IN','555-3063',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (64,'Ruthie','Coleman','1988-07-18','F','American','NID-CR064','54 Redwood Pl, Jersey City, NJ','555-3064',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (65,'Clarence','Jenkins','1981-12-05','M','American','NID-CR065','87 Sequoia Pl, Chula Vista, CA','555-3065',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (66,'Mabel','Perry','1992-05-22','F','American','NID-CR066','31 Willow Pl, Orlando, FL','555-3066',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (67,'Floyd','Powell','1979-10-09','M','American','NID-CR067','64 Sycamore Pl, St. Louis, MO','555-3067',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (68,'Bertha','Long','1996-03-26','F','American','NID-CR068','97 Aspen Pl, Madison, WI','555-3068',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (69,'Willie','Patterson','1986-08-13','M','American','NID-CR069','42 Juniper Pl, Laredo, TX','555-3069',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (70,'Hattie','Hughes','1990-01-30','F','American','NID-CR070','75 Larch Pl, Chandler, AZ','555-3070',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (71,'Nathaniel','Foster','1983-06-17','M','American','NID-CR071','19 Alder Pl, Lubbock, TX','555-3071',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (72,'Gladys','Simmons','1988-11-04','F','American','NID-CR072','52 Beech Pl, Norfolk, VA','555-3072',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (73,'Virgil','Butler','1977-04-21','M','American','NID-CR073','85 Elm Way, Madison, AL','555-3073',4);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (74,'Eunice','Gonzalez','1993-09-08','F','American','NID-CR074','29 Oak Way, Durham, NC','555-3074',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (75,'Herbert','Bryant','1985-02-25','M','American','NID-CR075','62 Pine Way, Garland, TX','555-3075',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (76,'Ernestine','Alexander','1991-07-12','F','American','NID-CR076','95 Maple Way, Glendale, AZ','555-3076',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (77,'Clifton','Russell','1980-12-29','M','American','NID-CR077','39 Cedar Way, Hialeah, FL','555-3077',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (78,'Beulah','Griffin','1994-05-16','F','American','NID-CR078','72 Birch Way, Reno, NV','555-3078',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (79,'Harvey','Diaz','1976-10-03','M','American','NID-CR079','16 Walnut Way, Baton Rouge, LA','555-3079',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (80,'Pearl','Hayes','1989-03-20','F','American','NID-CR080','49 Spruce Way, Irvine, CA','555-3080',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (81,'Chester','Myers','1984-08-07','M','American','NID-CR081','82 Poplar Way, Birmingham, AL','555-3081',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (82,'Leola','Ford','1992-01-24','F','American','NID-CR082','26 Ash Way, Rochester, NY','555-3082',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (83,'Roscoe','Hamilton','1981-06-11','M','American','NID-CR083','59 Hickory Way, Las Vegas, NV','555-3083',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (84,'Verna','Graham','1987-11-28','F','American','NID-CR084','92 Magnolia Way, Irving, TX','555-3084',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (85,'Luther','Sullivan','1979-04-15','M','American','NID-CR085','36 Chestnut Way, Scottsdale, AZ','555-3085',4);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (86,'Lela','Jordan','1993-09-02','F','American','NID-CR086','69 Dogwood Way, North Hempstead, NY','555-3086',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (87,'Nolan','Patterson','1986-02-19','M','American','NID-CR087','13 Cypress Way, Winston-Salem, NC','555-3087',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (88,'Alma','Perry','1991-07-06','F','American','NID-CR088','46 Redwood Way, Chesapeake, VA','555-3088',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (89,'Leroy','Long','1978-12-23','M','American','NID-CR089','79 Sequoia Way, Gilbert, AZ','555-3089',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (90,'Ida','Price','1995-05-10','F','American','NID-CR090','23 Willow Way, Henderson, NV','555-3090',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (91,'Sherman','Bennett','1983-10-27','M','American','NID-CR091','56 Sycamore Way, Fremont, CA','555-3091',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (92,'Lula','Wood','1988-03-14','F','American','NID-CR092','89 Aspen Way, Port Arthur, TX','555-3092',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (93,'Randolph','Barnes','1980-08-01','M','American','NID-CR093','33 Juniper Way, Montgomery, AL','555-3093',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (94,'Opal','Ross','1994-01-18','F','American','NID-CR094','66 Larch Way, Little Rock, AR','555-3094',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (95,'Wilbur','Henderson','1977-06-05','M','American','NID-CR095','99 Alder Way, Salt Lake City, UT','555-3095',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (96,'Sadie','Coleman','1990-11-22','F','American','NID-CR096','43 Beech Way, Tallahassee, FL','555-3096',1);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (97,'Cornelius','Jenkins','1985-04-09','M','American','NID-CR097','76 Elm Blvd, Providence, RI','555-3097',4);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (98,'Minnie','Perry','1989-09-26','F','American','NID-CR098','20 Oak Blvd, Richmond, VA','555-3098',3);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (99,'Odell','Powell','1982-02-13','M','American','NID-CR099','53 Pine Blvd, Des Moines, IA','555-3099',2);
INSERT INTO Criminal6 (CriminalID, FirstName, LastName, DateOfBirth, Gender, Nationality, NationalID, Address, PhoneNumber, StatusID) VALUES (100,'Bessie','Long','1996-07-30','F','American','NID-CR100','86 Maple Blvd, Spokane, WA','555-3100',1);
SET IDENTITY_INSERT Criminal6 OFF;
DBCC CHECKIDENT ('Criminal6', RESEED, 100);
GO
SET IDENTITY_INSERT Crime5 ON;
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (1,'Armed Robbery','Suspect robbed a convenience store at gunpoint',1,'2022-01-15',100,1,1,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (2,'Drug Trafficking','Large quantity of narcotics seized during transport',2,'2022-02-20',101,2,2,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (3,'Homicide','Victim found at scene with multiple stab wounds',2,'2022-03-10',102,3,8,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (4,'Cybercrime','Unauthorized access to banking systems',1,'2022-04-05',103,4,4,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (5,'Fraud','Identity theft affecting 200 victims',1,'2022-05-18',104,5,5,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (6,'Assault','Victim attacked outside nightclub',3,'2022-06-22',105,6,6,0);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (7,'Drug Possession','Methamphetamine found during vehicle search',3,'2022-07-14',106,7,9,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (8,'Kidnapping','Child abducted from school premises',2,'2022-08-03',107,8,12,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (9,'Burglary','Residential break-in, valuables stolen',3,'2022-09-17',108,9,3,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (10,'Money Laundering','Funds funneled through shell corporations',2,'2022-10-29',109,10,17,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (11,'Arson','Warehouse deliberately set on fire',1,'2022-11-08',110,11,41,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (12,'Sexual Assault','Victim attacked in parking garage',2,'2022-12-15',111,12,22,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (13,'Vehicle Theft','Luxury car stolen from driveway',4,'2023-01-20',112,13,7,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (14,'Extortion','Business owner threatened for monthly payments',1,'2023-02-11',113,14,29,0);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (15,'Human Trafficking','Three victims recovered from warehouse',2,'2023-03-25',114,15,49,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (16,'Vandalism','Public property extensively damaged',4,'2023-04-07',115,16,11,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (17,'Embezzlement','$500,000 stolen from employer accounts',1,'2023-05-19',116,17,32,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (18,'Domestic Violence','Victim hospitalized with serious injuries',1,'2023-06-30',117,18,56,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (19,'Carjacking','Vehicle stolen at gunpoint on highway',1,'2023-07-12',118,19,40,0);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (20,'Drug Manufacturing','Meth lab discovered in residential basement',2,'2023-08-24',119,20,34,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (21,'Murder','Victim shot during dispute',2,'2023-09-05',120,21,16,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (22,'Theft','Shoplifting of electronic goods',4,'2023-10-17',121,22,23,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (23,'Assault with Weapon','Victim stabbed during robbery attempt',1,'2023-11-28',122,23,13,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (24,'Credit Card Fraud','Cards cloned at multiple ATMs',3,'2023-12-09',123,24,44,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (25,'Drug Trafficking','Cocaine shipment intercepted at border',2,'2022-01-25',124,25,54,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (26,'Blackmail','Private information used for extortion',1,'2022-02-28',125,26,65,0);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (27,'Gang Violence','Drive-by shooting in residential area',2,'2022-03-15',126,27,73,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (28,'Forgery','Counterfeit documents used for fraud',3,'2022-04-20',127,28,37,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (29,'Bribery','Official bribed to overlook violations',1,'2022-05-31',128,29,53,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (30,'Attempted Murder','Victim survived multiple gunshot wounds',2,'2022-07-01',129,30,69,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (31,'Robbery','Bank robbed during business hours',1,'2022-08-12',130,31,81,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (32,'Stalking','Victim followed and harassed over 6 months',3,'2022-09-23',131,32,62,0);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (33,'Child Abuse','Minors found malnourished and abused',2,'2022-10-04',132,33,36,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (34,'Fraud','Insurance fraud totaling $1 million',1,'2022-11-15',133,34,92,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (35,'Drug Possession','Heroin found on suspect',3,'2022-12-26',134,35,28,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (36,'Manslaughter','Victim killed in road rage incident',1,'2023-01-06',135,36,48,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (37,'Kidnapping','Victim held for ransom for 5 days',2,'2023-02-17',136,37,57,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (38,'Cybercrime','Ransomware attack on hospital systems',2,'2023-03-28',137,38,77,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (39,'Arson','Residential home set ablaze',1,'2023-04-08',138,39,89,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (40,'Assault','Unprovoked attack in restaurant',3,'2023-05-20',139,40,3,0);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (41,'Armed Robbery','Jewelry store heist',1,'2023-06-30',140,41,19,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (42,'Drug Trafficking','Fentanyl distribution ring dismantled',2,'2023-08-11',141,42,61,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (43,'Homicide','Execution-style killing',2,'2023-09-22',142,43,96,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (44,'Vehicle Theft','Multiple cars stolen from dealership',4,'2023-10-03',143,44,35,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (45,'Embezzlement','Bank employee stole $200,000',1,'2023-11-14',144,45,98,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (46,'Sexual Assault','Attack in public park',2,'2023-12-25',145,46,42,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (47,'Fraud','Ponzi scheme affecting 500 investors',2,'2022-01-10',146,47,21,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (48,'Drug Manufacturing','Carfentanil lab found',2,'2022-02-21',147,48,61,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (49,'Burglary','Museum artifact theft',1,'2022-03-04',148,49,80,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (50,'Money Laundering','Casino used to launder millions',2,'2022-04-15',149,50,88,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (51,'Murder','Premeditated killing of business rival',2,'2022-05-26',150,51,29,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (52,'Theft','Retail theft exceeding $50,000',3,'2022-07-06',151,52,7,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (53,'Assault with Weapon','Machete attack on pedestrian',1,'2022-08-17',152,53,93,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (54,'Credit Card Fraud','Skimming devices installed at gas stations',3,'2022-09-28',153,54,44,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (55,'Drug Trafficking','Cannabis distribution network',3,'2022-11-08',154,55,14,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (56,'Blackmail','Celebrity blackmailed with private photos',1,'2022-12-19',155,56,18,0);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (57,'Gang Violence','Turf war results in 3 casualties',2,'2023-01-30',156,57,89,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (58,'Forgery','$50,000 in counterfeit bills circulated',1,'2023-03-12',157,58,53,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (59,'Bribery','Judge bribed in high-profile case',1,'2023-04-23',158,59,37,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (60,'Attempted Murder','Poison administered to spouse',2,'2023-05-04',159,60,69,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (61,'Robbery','Armored car heist',2,'2023-07-16',160,61,33,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (62,'Stalking','Online and physical stalking',3,'2023-08-27',161,62,50,0);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (63,'Child Abuse','Institutionalized abuse case',2,'2023-09-07',162,63,70,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (64,'Fraud','Healthcare fraud - $3 million',1,'2023-10-18',163,64,5,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (65,'Drug Possession','Multiple controlled substances',3,'2023-11-29',164,65,9,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (66,'Manslaughter','Negligent homicide in accident',1,'2023-12-10',165,66,25,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (67,'Kidnapping','International abduction case',2,'2022-01-20',166,67,41,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (68,'Cybercrime','State-level election interference',2,'2022-03-02',167,68,24,0);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (69,'Arson','Forest fire deliberately started',2,'2022-04-13',168,69,76,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (70,'Assault','Gang initiation beating',1,'2022-05-24',169,70,82,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (71,'Armed Robbery','Restaurant held up during dinner service',1,'2022-07-04',170,71,6,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (72,'Drug Trafficking','Opium importation network',2,'2022-08-15',171,72,2,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (73,'Homicide','Witness eliminated before trial',2,'2022-09-26',172,'73',16,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (74,'Vehicle Theft','Car theft ring - 20 vehicles stolen',3,'2022-11-06',173,74,20,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (75,'Embezzlement','Charity fraud - $750,000',1,'2022-12-17',174,75,52,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (76,'Sexual Assault','Attack during college campus event',2,'2023-01-28',175,76,96,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (77,'Fraud','Social media investment scam',3,'2023-03-10',176,77,60,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (78,'Drug Manufacturing','PCP lab dismantled',1,'2023-04-21',177,78,34,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (79,'Burglary','Art gallery robbery',1,'2023-05-01',178,79,86,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (80,'Money Laundering','Real estate used for money laundering',2,'2023-06-12',179,80,58,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (81,'Murder','Assassination of local politician',2,'2023-07-23',180,81,49,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (82,'Theft','Cargo theft from shipping yard',3,'2023-09-03',181,82,40,0);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (83,'Assault with Weapon','Baseball bat attack',3,'2023-10-14',182,83,30,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (84,'Credit Card Fraud','Online shopping fraud network',3,'2023-11-25',183,84,10,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (85,'Drug Trafficking','Heroin pipeline from Mexico',2,'2023-12-06',184,85,54,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (86,'Blackmail','Politician blackmailed',1,'2022-02-10',185,86,26,0);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (87,'Gang Violence','Gang-related arson',1,'2022-03-22',186,87,38,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (88,'Forgery','Fake property documents',3,'2022-05-02',187,88,66,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (89,'Bribery','Customs officer bribed',1,'2022-06-13',188,89,74,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (90,'Attempted Murder','Hit and run attempt',1,'2022-07-24',189,90,48,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (91,'Robbery','Pharmacy robbed for prescriptions',3,'2022-09-04',190,91,84,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (92,'Stalking','Ex-partner stalking campaign',3,'2022-10-15',191,92,64,0);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (93,'Child Abuse','Online exploitation network',2,'2022-11-26',192,93,17,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (94,'Fraud','Stock market manipulation',2,'2022-12-07',193,94,45,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (95,'Drug Possession','Ecstasy at music festival',4,'2023-01-18',194,95,47,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (96,'Manslaughter','Drunk driving fatality',1,'2023-02-28',195,96,75,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (97,'Kidnapping','Child custody violation',1,'2023-04-10',196,97,63,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (98,'Cybercrime','Dark web marketplace operator',2,'2023-05-21',197,98,97,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (99,'Arson','Business competitor sabotage',1,'2023-06-01',198,99,87,1);
INSERT INTO Crime5 (CrimeID, CrimeType, Description, SeverityID, DateOccurred, LocationID, CriminalID, OfficerID, IsResolved) VALUES (100,'Assault','Road rage physical altercation',3,'2023-07-13',199,100,55,1);
SET IDENTITY_INSERT Crime5 OFF;
DBCC CHECKIDENT ('Crime5', RESEED, 100);
GO
SET IDENTITY_INSERT CaseRecord ON;
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (1,'CASE-2022-001','State v. Stone - Armed Robbery',1,1,1,1,'2022-02-01','2022-06-15',1,1,8,5000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (2,'CASE-2022-002','State v. Price - Drug Trafficking',2,2,2,2,'2022-03-10','2022-08-20',1,1,15,25000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (3,'CASE-2022-003','State v. Brooks - Homicide',3,3,3,8,'2022-04-15','2022-10-10',1,1,25,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (4,'CASE-2022-004','State v. Reed - Cybercrime',4,4,4,4,'2022-05-20','2022-11-05',2,1,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (5,'CASE-2022-005','State v. Coleman - Fraud',5,5,5,5,'2022-06-25','2023-01-18',1,1,5,100000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (6,'CASE-2022-006','State v. Hughes - Assault',6,6,6,6,'2022-07-30','2023-02-22',3,2,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (7,'CASE-2022-007','State v. Foster - Drug Possession',7,7,7,9,'2022-09-04','2023-03-14',1,1,3,2000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (8,'CASE-2022-008','State v. Simmons - Kidnapping',8,8,8,12,'2022-10-09','2023-04-03',1,1,20,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (9,'CASE-2022-009','State v. Butler - Burglary',9,9,9,3,'2022-11-14','2023-05-17',1,1,4,10000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (10,'CASE-2022-010','State v. Gonzalez - Money Laundering',10,10,10,17,'2022-12-19','2023-06-29',1,1,12,500000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (11,'CASE-2022-011','State v. Bryant - Arson',11,11,11,41,'2023-01-23','2023-07-08',1,1,7,50000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (12,'CASE-2022-012','State v. Alexander - Sexual Assault',12,12,12,22,'2023-02-28','2023-09-15',1,1,10,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (13,'CASE-2022-013','State v. Russell - Vehicle Theft',13,13,13,7,'2023-03-05','2023-10-20',1,1,2,5000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (14,'CASE-2022-014','State v. Griffin - Extortion',14,14,14,29,'2023-04-10','2023-11-11',3,2,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (15,'CASE-2022-015','State v. Diaz - Human Trafficking',15,15,15,49,'2023-05-15','2023-12-25',1,1,30,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (16,'CASE-2022-016','State v. Hayes - Vandalism',16,16,16,11,'2023-06-20','2024-01-07',1,1,NULL,1500.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (17,'CASE-2022-017','State v. Myers - Embezzlement',17,17,17,32,'2023-07-25','2024-02-19',1,1,8,500000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (18,'CASE-2022-018','State v. Ford - Domestic Violence',18,18,18,56,'2023-08-30','2024-03-30',1,1,3,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (19,'CASE-2022-019','State v. Hamilton - Carjacking',19,19,19,40,'2023-10-04','2024-04-12',3,2,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (20,'CASE-2022-020','State v. Graham - Drug Manufacturing',20,20,20,34,'2023-11-09','2024-05-24',1,1,18,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (21,'CASE-2022-021','State v. Sullivan - Murder',21,21,21,16,'2023-12-14','2024-06-04',1,1,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (22,'CASE-2022-022','State v. Jordan - Theft',22,22,22,23,'2024-01-18','2024-07-17',1,1,NULL,3000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (23,'CASE-2022-023','State v. Patterson - Assault',23,23,23,13,'2024-02-23','2024-08-28',1,1,2,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (24,'CASE-2022-024','State v. Perry - Credit Card Fraud',24,24,24,44,'2024-03-28','2024-09-10',1,1,4,50000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (25,'CASE-2022-025','State v. Long - Drug Trafficking',25,25,25,54,'2024-04-02','2024-10-22',1,1,20,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (26,'CASE-2022-026','State v. Price - Blackmail',26,26,26,65,'2024-05-07','2024-11-04',3,2,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (27,'CASE-2022-027','State v. Bennett - Gang Violence',27,27,27,73,'2024-06-12','2024-12-16',1,1,15,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (28,'CASE-2022-028','State v. Wood - Forgery',28,28,28,37,'2024-07-17','2025-01-28',1,1,3,20000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (29,'CASE-2022-029','State v. Barnes - Bribery',29,29,29,53,'2024-08-22','2025-02-09',1,1,6,75000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (30,'CASE-2022-030','State v. Ross - Attempted Murder',30,30,30,69,'2024-09-27','2025-03-24',1,1,15,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (31,'CASE-2022-031','State v. Henderson - Robbery',31,31,31,81,'2024-10-01','2025-04-03',1,1,7,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (32,'CASE-2022-032','State v. Coleman - Stalking',32,32,32,62,'2024-11-06','2025-05-16',3,2,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (33,'CASE-2022-033','State v. Jenkins - Child Abuse',33,33,33,36,'2024-12-11','2025-06-27',1,1,12,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (34,'CASE-2022-034','State v. Perry - Fraud',34,34,34,92,'2022-03-16','2022-09-28',1,1,6,1000000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (35,'CASE-2022-035','State v. Powell - Drug Possession',35,35,35,28,'2022-04-21','2022-11-10',1,1,2,1000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (36,'CASE-2022-036','State v. Long - Manslaughter',36,36,36,48,'2022-05-26','2022-12-22',1,1,8,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (37,'CASE-2022-037','State v. Patterson - Kidnapping',37,37,37,57,'2022-07-01','2023-01-04',1,1,22,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (38,'CASE-2022-038','State v. Hughes - Cybercrime',38,38,38,77,'2022-08-05','2023-02-17',1,1,10,200000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (39,'CASE-2022-039','State v. Foster - Arson',39,39,39,89,'2022-09-10','2023-03-29',1,1,9,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (40,'CASE-2022-040','State v. Simmons - Assault',40,40,40,3,'2022-10-15','2023-05-11',3,2,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (41,'CASE-2022-041','State v. Butler - Armed Robbery',41,41,41,19,'2022-11-20','2023-06-23',1,1,10,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (42,'CASE-2022-042','State v. Gonzalez - Drug Trafficking',42,42,42,61,'2022-12-25','2023-08-04',1,1,18,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (43,'CASE-2022-043','State v. Bryant - Homicide',43,43,43,96,'2023-01-29','2023-09-16',1,1,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (44,'CASE-2022-044','State v. Alexander - Vehicle Theft',44,44,44,35,'2023-03-05','2023-10-28',1,1,1,3000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (45,'CASE-2022-045','State v. Russell - Embezzlement',45,45,45,98,'2023-04-10','2023-12-09',1,1,5,200000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (46,'CASE-2022-046','State v. Griffin - Sexual Assault',46,46,46,42,'2023-05-15','2024-01-21',1,1,12,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (47,'CASE-2022-047','State v. Diaz - Fraud',47,47,47,21,'2023-06-20','2024-03-04',1,1,7,500000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (48,'CASE-2022-048','State v. Hayes - Drug Manufacturing',48,48,48,61,'2023-07-25','2024-04-16',1,1,14,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (49,'CASE-2022-049','State v. Myers - Burglary',49,49,49,80,'2023-09-29','2024-05-28',1,1,4,30000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (50,'CASE-2022-050','State v. Ford - Money Laundering',50,50,50,88,'2023-11-03','2024-07-09',1,1,11,2000000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (51,'CASE-2022-051','State v. Hamilton - Murder',51,51,51,29,'2023-12-08','2024-08-21',1,1,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (52,'CASE-2022-052','State v. Graham - Theft',52,52,52,7,'2024-01-13','2024-10-02',1,1,NULL,50000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (53,'CASE-2022-053','State v. Sullivan - Assault',53,53,53,93,'2024-02-17','2024-11-14',1,1,3,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (54,'CASE-2022-054','State v. Jordan - Credit Card Fraud',54,54,54,44,'2024-03-23','2024-12-26',1,1,3,40000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (55,'CASE-2022-055','State v. Patterson - Drug Trafficking',55,55,55,14,'2024-04-28','2025-02-07',1,1,10,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (56,'CASE-2022-056','State v. Perry - Blackmail',56,56,56,18,'2024-06-02','2025-03-21',3,2,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (57,'CASE-2022-057','State v. Long - Gang Violence',57,57,57,89,'2024-07-07','2025-05-02',1,1,20,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (58,'CASE-2022-058','State v. Price - Forgery',58,58,58,53,'2024-08-12','2025-06-14',1,1,4,50000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (59,'CASE-2022-059','State v. Bennett - Bribery',59,59,59,37,'2024-09-17','2025-07-28',1,1,7,150000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (60,'CASE-2022-060','State v. Wood - Attempted Murder',60,60,60,69,'2024-10-22','2025-08-08',1,1,18,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (61,'CASE-2022-061','State v. Barnes - Robbery',61,61,61,33,'2024-11-27','2025-09-22',1,1,9,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (62,'CASE-2022-062','State v. Ross - Stalking',62,62,62,50,'2022-02-05','2022-08-17',3,2,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (63,'CASE-2022-063','State v. Henderson - Child Abuse',63,63,63,70,'2022-03-11','2022-09-29',1,1,15,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (64,'CASE-2022-064','State v. Coleman - Fraud',64,64,64,5,'2022-04-16','2022-11-10',1,1,6,3000000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (65,'CASE-2022-065','State v. Jenkins - Drug Possession',65,65,65,9,'2022-05-21','2023-01-22',1,1,1,500.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (66,'CASE-2022-066','State v. Perry - Manslaughter',66,66,66,25,'2022-06-26','2023-03-06',1,1,7,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (67,'CASE-2022-067','State v. Powell - Kidnapping',67,67,67,41,'2022-07-31','2023-04-17',1,1,25,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (68,'CASE-2022-068','State v. Long - Cybercrime',68,68,68,24,'2022-09-05','2023-05-30',2,1,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (69,'CASE-2022-069','State v. Patterson - Arson',69,69,69,76,'2022-10-10','2023-07-11',1,1,11,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (70,'CASE-2022-070','State v. Hughes - Assault',70,70,70,82,'2022-11-15','2023-08-23',1,1,2,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (71,'CASE-2022-071','State v. Foster - Armed Robbery',71,71,71,6,'2022-12-20','2023-10-04',1,1,8,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (72,'CASE-2022-072','State v. Simmons - Drug Trafficking',72,72,72,2,'2023-01-24','2023-11-16',1,1,16,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (73,'CASE-2022-073','State v. Butler - Homicide',73,73,73,16,'2023-02-28','2024-01-28',1,1,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (74,'CASE-2022-074','State v. Gonzalez - Vehicle Theft',74,74,74,20,'2023-04-04','2024-03-11',1,1,2,5000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (75,'CASE-2022-075','State v. Bryant - Embezzlement',75,75,75,52,'2023-05-09','2024-04-22',1,1,6,750000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (76,'CASE-2022-076','State v. Alexander - Sexual Assault',76,76,76,96,'2023-06-14','2024-06-04',1,1,15,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (77,'CASE-2022-077','State v. Russell - Fraud',77,77,77,60,'2023-07-19','2024-07-16',1,1,3,200000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (78,'CASE-2022-078','State v. Griffin - Drug Manufacturing',78,78,78,34,'2023-08-24','2024-08-27',1,1,12,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (79,'CASE-2022-079','State v. Diaz - Burglary',79,79,79,86,'2023-09-28','2024-10-09',1,1,3,25000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (80,'CASE-2022-080','State v. Hayes - Money Laundering',80,80,80,58,'2023-11-02','2024-11-20',1,1,14,1500000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (81,'CASE-2022-081','State v. Myers - Murder',81,81,81,49,'2023-12-07','2025-01-01',1,1,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (82,'CASE-2022-082','State v. Ford - Theft',82,82,82,40,'2024-01-12','2025-02-13',3,2,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (83,'CASE-2022-083','State v. Hamilton - Assault',83,83,83,30,'2024-02-16','2025-03-27',1,1,1,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (84,'CASE-2022-084','State v. Graham - Credit Card Fraud',84,84,84,10,'2024-03-22','2025-05-08',1,1,2,30000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (85,'CASE-2022-085','State v. Sullivan - Drug Trafficking',85,85,85,54,'2024-04-27','2025-06-20',1,1,22,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (86,'CASE-2022-086','State v. Jordan - Blackmail',86,86,86,26,'2024-06-01','2025-08-01',3,2,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (87,'CASE-2022-087','State v. Patterson - Gang Violence',87,87,87,38,'2024-07-06','2025-09-12',1,1,12,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (88,'CASE-2022-088','State v. Perry - Forgery',88,88,88,66,'2024-08-11','2025-10-24',1,1,2,15000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (89,'CASE-2022-089','State v. Long - Bribery',89,89,89,74,'2024-09-16','2025-11-05',1,1,5,100000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (90,'CASE-2022-090','State v. Price - Attempted Murder',90,90,90,48,'2024-10-21','2025-12-18',1,1,12,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (91,'CASE-2022-091','State v. Bennett - Robbery',91,91,91,84,'2024-11-25','2026-01-29',1,1,6,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (92,'CASE-2022-092','State v. Wood - Stalking',92,92,92,64,'2022-01-06','2022-07-18',3,2,NULL,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (93,'CASE-2022-093','State v. Barnes - Child Abuse',93,93,93,17,'2022-02-10','2022-08-30',1,1,20,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (94,'CASE-2022-094','State v. Ross - Fraud',94,94,94,45,'2022-03-17','2022-10-12',1,1,8,3000000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (95,'CASE-2022-095','State v. Henderson - Drug Possession',95,95,95,47,'2022-04-22','2022-11-24',1,1,NULL,200.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (96,'CASE-2022-096','State v. Coleman - Manslaughter',96,96,96,75,'2022-05-27','2023-01-05',1,1,6,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (97,'CASE-2022-097','State v. Jenkins - Kidnapping',97,97,97,63,'2022-06-01','2023-02-17',1,1,10,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (98,'CASE-2022-098','State v. Perry - Cybercrime',98,98,98,97,'2022-08-06','2023-03-31',1,1,8,500000.00);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (99,'CASE-2022-099','State v. Powell - Arson',99,99,99,87,'2022-09-11','2023-05-12',1,1,7,NULL);
INSERT INTO CaseRecord (CaseID, CaseNumber, CaseTitle, CrimeID, CourtID, LawyerID, OfficerID, FilingDate, HearingDate, VerdictID, StatusID, SentenceYears, FineAmount) VALUES (100,'CASE-2022-100','State v. Long - Assault',100,100,100,55,'2022-10-16','2023-06-25',4,1,NULL,NULL);
SET IDENTITY_INSERT CaseRecord OFF;
DBCC CHECKIDENT ('CaseRecord', RESEED, 100);
GO
SET IDENTITY_INSERT FamilyMember ON;
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (1,1,'Diana','Stone',1,'1987-06-18','555-4001','12 Elm St, New York, NY',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (2,1,'George','Stone',2,'1958-03-22','555-4002','88 Senior Rd, New York, NY',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (3,2,'Carlos','Price',3,'1992-11-09','555-4003','45 Oak Ave, Chicago, IL',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (4,3,'Helen','Brooks',4,'1950-08-14','555-4004','78 Pine Rd, Houston, TX',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (5,4,'Kevin','Reed',1,'1993-04-27','555-4005','23 Maple Dr, Philadelphia, PA',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (6,5,'Dorothy','Coleman',1,'1984-01-10','555-4006','56 Cedar Ln, Phoenix, AZ',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (7,6,'Henry','Hughes',2,'1960-07-23','555-4007','89 Birch St, San Antonio, TX',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (8,7,'Grace','Foster',1,'1977-10-06','555-4008','32 Walnut Ave, San Diego, CA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (9,8,'Aaron','Simmons',3,'1990-03-19','555-4009','67 Spruce Rd, Dallas, TX',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (10,9,'Ruth','Butler',4,'1952-12-02','555-4010','14 Poplar Dr, San Jose, CA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (11,10,'Marcus','Gonzalez',1,'1989-05-15','555-4011','48 Ash Ln, Austin, TX',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (12,11,'Tara','Bryant',1,'1989-09-28','555-4012','81 Hickory St, Jacksonville, FL',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (13,12,'Victor','Alexander',2,'1965-02-11','555-4013','25 Magnolia Ave, Columbus, OH',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (14,13,'Iris','Russell',1,'1985-07-24','555-4014','59 Chestnut Rd, Charlotte, NC',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (15,14,'Owen','Griffin',3,'1988-12-07','555-4015','92 Dogwood Dr, Indianapolis, IN',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (16,15,'Nina','Diaz',4,'1949-05-20','555-4016','37 Cypress Ln, San Francisco, CA',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (17,16,'Felix','Hayes',2,'1966-10-03','555-4017','70 Redwood St, Seattle, WA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (18,17,'Lena','Myers',1,'1988-03-16','555-4018','13 Sequoia Ave, Denver, CO',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (19,18,'Troy','Ford',3,'1984-08-29','555-4019','47 Willow Rd, Nashville, TN',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (20,19,'Vera','Hamilton',1,'1983-02-12','555-4020','80 Sycamore Dr, Oklahoma City, OK',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (21,20,'Ross','Graham',2,'1968-07-25','555-4021','24 Aspen Ln, El Paso, TX',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (22,21,'Faye','Sullivan',1,'1986-01-08','555-4022','58 Juniper St, Louisville, KY',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (23,22,'Noel','Jordan',3,'1987-06-21','555-4023','91 Larch Ave, Baltimore, MD',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (24,23,'Maud','Patterson',4,'1951-11-04','555-4024','35 Alder Rd, Milwaukee, WI',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (25,24,'Leon','Perry',1,'1991-04-17','555-4025','68 Beech Dr, Albuquerque, NM',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (26,25,'Cora','Long',1,'1987-09-30','555-4026','11 Elm Ct, Tucson, AZ',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (27,26,'Seth','Price',2,'1960-02-13','555-4027','44 Oak Ct, Fresno, CA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (28,27,'Ivy','Bennett',1,'1978-07-26','555-4028','77 Pine Ct, Sacramento, CA',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (29,28,'Ray','Wood',3,'1992-01-09','555-4029','22 Maple Ct, Long Beach, CA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (30,29,'Ada','Barnes',4,'1955-06-22','555-4030','55 Cedar Ct, Kansas City, MO',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (31,30,'Zane','Ross',1,'1993-11-05','555-4031','88 Birch Ct, Mesa, AZ',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (32,31,'Bess','Henderson',1,'1989-04-18','555-4032','33 Walnut Ct, Atlanta, GA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (33,32,'Clive','Coleman',2,'1966-09-01','555-4033','66 Spruce Ct, Virginia Beach, VA',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (34,33,'Nell','Jenkins',1,'1982-02-14','555-4034','99 Poplar Ct, Raleigh, NC',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (35,34,'Wade','Perry',3,'1986-07-27','555-4035','43 Ash Ct, Colorado Springs, CO',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (36,35,'Ida','Powell',4,'1954-01-10','555-4036','76 Hickory Ct, Miami, FL',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (37,36,'Clay','Long',1,'1998-06-23','555-4037','20 Magnolia Ct, Omaha, NE',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (38,37,'Ola','Patterson',1,'1980-11-06','555-4038','53 Chestnut Ct, Oakland, CA',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (39,38,'Brad','Hughes',2,'1964-04-19','555-4039','86 Dogwood Ct, Minneapolis, MN',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (40,39,'Lois','Foster',1,'1986-09-02','555-4040','30 Cypress Ct, Tulsa, OK',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (41,40,'Dean','Simmons',3,'1988-02-15','555-4041','63 Redwood Ct, Tampa, FL',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (42,41,'Ina','Butler',4,'1949-07-28','555-4042','96 Sequoia Ct, Arlington, TX',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (43,42,'Kirk','Gonzalez',1,'1995-01-11','555-4043','40 Willow Ct, New Orleans, LA',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (44,43,'Alma','Bryant',1,'1988-06-24','555-4044','73 Sycamore Ct, Wichita, KS',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (45,44,'Ross','Alexander',2,'1963-11-07','555-4045','17 Aspen Ct, Bakersfield, CA',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (46,45,'Bea','Russell',1,'1985-04-20','555-4046','50 Juniper Ct, Aurora, CO',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (47,46,'Carl','Griffin',3,'1985-09-03','555-4047','83 Larch Ct, Anaheim, CA',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (48,47,'Eda','Diaz',4,'1947-02-16','555-4048','27 Alder Ct, Santa Ana, CA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (49,48,'Luis','Hayes',1,'1996-07-29','555-4049','60 Beech Ct, Corpus Christi, TX',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (50,49,'Fern','Myers',1,'1983-01-12','555-4050','93 Elm Pl, Riverside, CA',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (51,50,'Glen','Ford',2,'1969-06-25','555-4051','37 Oak Pl, Lexington, KY',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (52,51,'Mona','Hamilton',1,'1987-11-08','555-4052','70 Pine Pl, Pittsburgh, PA',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (53,52,'Rex','Graham',3,'1986-04-21','555-4053','14 Maple Pl, Stockton, CA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (54,53,'Una','Sullivan',1,'1982-09-04','555-4054','47 Cedar Pl, Anchorage, AK',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (55,54,'Ned','Jordan',2,'1965-02-17','555-4055','80 Birch Pl, Cincinnati, OH',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (56,55,'Ora','Patterson',1,'1979-07-30','555-4056','24 Walnut Pl, St. Paul, MN',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (57,56,'Stan','Perry',3,'1988-01-13','555-4057','57 Spruce Pl, Toledo, OH',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (58,57,'Pia','Long',1,'1989-06-26','555-4058','90 Poplar Pl, Greensboro, NC',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (59,58,'Otto','Price',2,'1966-11-09','555-4059','34 Ash Pl, Newark, NJ',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (60,59,'May','Bennett',1,'1984-04-22','555-4060','67 Hickory Pl, Plano, TX',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (61,60,'Evan','Wood',3,'1988-09-05','555-4061','11 Magnolia Pl, Henderson, NV',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (62,61,'Rae','Barnes',1,'1978-02-18','555-4062','44 Chestnut Pl, Lincoln, NE',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (63,62,'Guy','Ross',2,'1967-07-31','555-4063','77 Dogwood Pl, Buffalo, NY',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (64,63,'Joy','Henderson',1,'1986-01-14','555-4064','21 Cypress Pl, Fort Wayne, IN',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (65,64,'Leo','Coleman',3,'1989-06-27','555-4065','54 Redwood Pl, Jersey City, NJ',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (66,65,'Eva','Jenkins',4,'1953-11-10','555-4066','87 Sequoia Pl, Chula Vista, CA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (67,66,'Roy','Perry',1,'1994-04-23','555-4067','31 Willow Pl, Orlando, FL',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (68,67,'Amy','Powell',1,'1981-09-06','555-4068','64 Sycamore Pl, St. Louis, MO',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (69,68,'Lee','Long',2,'1971-02-19','555-4069','97 Aspen Pl, Madison, WI',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (70,69,'Kim','Patterson',1,'1988-07-02','555-4070','42 Juniper Pl, Laredo, TX',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (71,70,'Bob','Hughes',3,'1987-12-15','555-4071','75 Larch Pl, Chandler, AZ',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (72,71,'Sue','Foster',1,'1985-05-28','555-4072','19 Alder Pl, Lubbock, TX',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (73,72,'Ron','Simmons',2,'1960-10-11','555-4073','52 Beech Pl, Norfolk, VA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (74,73,'Ann','Butler',1,'1979-03-24','555-4074','85 Elm Way, Madison, AL',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (75,74,'Tim','Gonzalez',3,'1990-08-07','555-4075','29 Oak Way, Durham, NC',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (76,75,'Kay','Bryant',1,'1987-01-20','555-4076','62 Pine Way, Garland, TX',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (77,76,'Don','Alexander',2,'1963-06-03','555-4077','95 Maple Way, Glendale, AZ',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (78,77,'Pat','Russell',1,'1982-11-16','555-4078','39 Cedar Way, Hialeah, FL',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (79,78,'Sam','Griffin',3,'1991-04-29','555-4079','72 Birch Way, Reno, NV',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (80,79,'Nan','Diaz',1,'1978-09-12','555-4080','16 Walnut Way, Baton Rouge, LA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (81,80,'Cal','Hayes',2,'1961-02-25','555-4081','49 Spruce Way, Irvine, CA',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (82,81,'Dot','Myers',1,'1986-08-08','555-4082','82 Poplar Way, Birmingham, AL',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (83,82,'Eli','Ford',3,'1989-01-21','555-4083','26 Ash Way, Rochester, NY',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (84,83,'Flo','Hamilton',1,'1983-06-04','555-4084','59 Hickory Way, Las Vegas, NV',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (85,84,'Gus','Graham',2,'1959-11-17','555-4085','92 Magnolia Way, Irving, TX',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (86,85,'Hel','Sullivan',1,'1981-04-30','555-4086','36 Chestnut Way, Scottsdale, AZ',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (87,86,'Ian','Jordan',3,'1990-09-13','555-4087','69 Dogwood Way, N. Hempstead, NY',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (88,87,'Jan','Patterson',1,'1988-02-26','555-4088','13 Cypress Way, Winston-Salem, NC',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (89,88,'Ken','Perry',2,'1963-07-11','555-4089','46 Redwood Way, Chesapeake, VA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (90,89,'Lyn','Long',1,'1980-12-24','555-4090','79 Sequoia Way, Gilbert, AZ',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (91,90,'Max','Price',3,'1992-05-07','555-4091','23 Willow Way, Henderson, NV',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (92,91,'Nan','Bennett',1,'1985-10-20','555-4092','56 Sycamore Way, Fremont, CA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (93,92,'Orin','Wood',2,'1960-03-03','555-4093','89 Aspen Way, Port Arthur, TX',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (94,93,'Pam','Barnes',1,'1982-08-16','555-4094','33 Juniper Way, Montgomery, AL',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (95,94,'Quinn','Ross',3,'1991-01-29','555-4095','66 Larch Way, Little Rock, AR',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (96,95,'Rosa','Henderson',1,'1979-06-12','555-4096','99 Alder Way, Salt Lake City, UT',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (97,96,'Scott','Coleman',2,'1962-11-25','555-4097','43 Beech Way, Tallahassee, FL',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (98,97,'Tess','Jenkins',1,'1987-04-08','555-4098','76 Elm Blvd, Providence, RI',0);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (99,98,'Uma','Perry',4,'1960-09-21','555-4099','20 Oak Blvd, Richmond, VA',1);
INSERT INTO FamilyMember (FamilyMemberID, CriminalID, FirstName, LastName, RelID, DateOfBirth, PhoneNumber, Address, IsCooperating) VALUES (100,99,'Val','Powell',1,'1984-02-04','555-4100','53 Pine Blvd, Des Moines, IA',0);
SET IDENTITY_INSERT FamilyMember OFF;
DBCC CHECKIDENT ('FamilyMember', RESEED, 100);
GO

--40 queries 
-- 1. Update criminal status
UPDATE Criminal6
SET CriminalStatus = 'Arrested'
WHERE CriminalID = 1;
select*from Criminal6;

-- 2. Update lawyer phone number
UPDATE Lawyer2
SET PhoneNumber = '9999999999'
WHERE LawyerID = 2;
select*from Lawyer2 ;

-- 3. Update court judge name
UPDATE Court3
SET JudgeName = 'Justice Sharma'
WHERE CourtID = 1;
select * from Court3;

-- 4. Update crime severity
UPDATE Crime5
SET Severity = 'High'
WHERE CrimeID = 3;
select * from Crime5;

-- 5. Update criminal address
UPDATE Criminal6
SET Address = 'Mumbai'
WHERE CriminalID = 4;
select* from Criminal6;

-- 6
ALTER TABLE Criminal6
ADD Age INT;
SELECT TOP 5 * FROM Criminal6;

-- 7
ALTER TABLE Court3
ADD Email VARCHAR(100);
SELECT TOP 5 * FROM Court3;

-- 8
ALTER TABLE Lawyer2
ALTER COLUMN PhoneNumber VARCHAR(15);
SELECT TOP 5 * FROM Lawyer2;

-- 9
ALTER TABLE Crime5
ADD Status VARCHAR(20);
SELECT TOP 5 * FROM Crime5;

-- 10
ALTER TABLE Criminal6
ADD CONSTRAINT df_status DEFAULT 'Active' FOR CriminalStatus;
SELECT TOP 5 * FROM Criminal6;

-- 11. INNER JOIN (Criminal + Crime)
SELECT c.FirstName, c.LastName, cr.CrimeType
FROM Criminal6 c
INNER JOIN Crime5 cr 
ON c.CriminalID = cr.CriminalID;

-- 12. LEFT JOIN (show all criminals even if no crime)
SELECT c.FirstName, cr.CrimeType
FROM Criminal6 c
LEFT JOIN Crime5 cr 
ON c.CriminalID = cr.CriminalID;

-- 13. RIGHT JOIN (show all lawyers even if no court)
SELECT l.FirstName, co.CourtName
FROM Lawyer2 l
RIGHT JOIN Court3 co 
ON l.LawyerID = co.CourtID;

-- 14. FULL JOIN (all criminals and crimes)
SELECT c.FirstName, cr.CrimeType
FROM Criminal6 c
FULL JOIN Crime5 cr 
ON c.CriminalID = cr.CriminalID;

-- 15. MULTIPLE JOIN (Criminal + Crime + Court)
SELECT c.FirstName, cr.CrimeType, co.CourtName
FROM Criminal6 c
JOIN Crime5 cr 
ON c.CriminalID = cr.CriminalID
JOIN Court3 co 
ON cr.CrimeID = co.CourtID;

-- 16
UPDATE Criminal6
SET CriminalStatus = 'Under Investigation'
WHERE CriminalID IN (SELECT CriminalID FROM Crime5);
SELECT * FROM Criminal6;

-- 17
UPDATE Crime5
SET Severity = 'Low'
WHERE CrimeID IN (SELECT CrimeID FROM Crime5 WHERE Severity='Minor');
SELECT * FROM Crime5;

-- 18
UPDATE Lawyer2
SET Specialization = 'Civil'
WHERE LawyerID IN (SELECT CourtID FROM Court3);
SELECT * FROM Lawyer2;

-- 19
UPDATE Court3
SET Location ='Updated'
WHERE CourtID IN (SELECT CrimeID FROM Crime5);
SELECT * FROM Court3;

-- 20
UPDATE Criminal6
SET Address = 'Unknown'
WHERE CriminalID NOT IN (SELECT CriminalID FROM Crime5);
SELECT * FROM Criminal6;

-- 21. Count crimes per criminal
SELECT CriminalID, COUNT(*) AS TotalCrimes
FROM Crime5
GROUP BY CriminalID;

-- 22. Count crimes by type
SELECT CrimeType, COUNT(*) AS Total
FROM Crime5
GROUP BY CrimeType;

-- 23. Count criminals by status
SELECT CriminalStatus, COUNT(*) AS Total
FROM Criminal6
GROUP BY CriminalStatus;

-- 24. Count lawyers by specialization
SELECT Specialization, COUNT(*) AS Total
FROM Lawyer2
GROUP BY Specialization;

-- 25. Count courts by location
SELECT Location, COUNT(*) AS Total
FROM Court3
GROUP BY Location;
-- 26. Criminals with more than 1 crime
SELECT CriminalID, COUNT(*) AS TotalCrimes
FROM Crime5
GROUP BY CriminalID
HAVING COUNT(*) > 1;
select * from Crime5;

-- 27. Crime types occurring more than once
SELECT CrimeType, COUNT(*) AS Total
FROM Crime5
GROUP BY CrimeType
HAVING COUNT(*) > 1;
select * from Crime5;


-- 29. Specializations with more than 1 lawyer
SELECT Specialization, COUNT(*) AS Total
FROM Lawyer2
GROUP BY Specialization
HAVING COUNT(*) > 1;

-- 30. Locations with more than 1 court
SELECT Location, COUNT(*) AS Total
FROM Court3
GROUP BY Location
HAVING COUNT(*) > 1;
select * from Court3;

-- 31. Sort criminals by first name (A to Z)
SELECT * FROM Criminal6
ORDER BY FirstName ASC;

-- 32. Sort crimes by severity (high to low)
SELECT * FROM Crime5
ORDER BY Severity DESC;

-- 33. Sort lawyers by specialization
SELECT * FROM Lawyer2
ORDER BY Specialization ASC;

-- 34. Sort courts by location (descending)
SELECT * FROM Court3
ORDER BY Location DESC;

-- 35. Sort criminals by status then name
SELECT * FROM Criminal6
ORDER BY CriminalStatus ASC, FirstName ASC;
-- 36. Total number of criminals
SELECT COUNT(*) AS TotalCriminals
FROM Criminal6;
-- 37. Maximum crime ID
SELECT MAX(CrimeID) AS MaxCrimeID
FROM Crime5;

-- 38. Minimum court ID
SELECT MIN(CourtID) AS MinCourtID
FROM Court3;
-- 39. Average Criminal ID
SELECT AVG(CriminalID) AS AvgCriminalID
FROM Criminal6;
-- 40. Total lawyers
SELECT COUNT(*) AS TotalLawyers
FROM Lawyer2;


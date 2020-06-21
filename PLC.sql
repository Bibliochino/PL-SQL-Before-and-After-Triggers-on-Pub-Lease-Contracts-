host echo Building Oracle Pub_Lease_Contracts tables.  Please wait.
Clear Screen

Set Termout On
Set Echo On
Set Feedback On
Set Verify On
Set Heading on

Set Pagesize 100
Set Linesize 190

Drop Table Lease_Agreement;
Drop Table Solicitor;
Drop Table Letting_Agent;
Drop Table Publican;
Drop Table Pub;
Drop Table Landlord;

Drop Table Landlord;
Create Table Landlord (
Landlord_Id Number(2),
Fname Varchar2(8),
Sname Varchar2(10) Constraint Landlord_Sname_Nn Not Null,
Address Varchar2(19),
Town Varchar2(11),
County Varchar2(9),
Tel_No Varchar2(6),
Email Varchar2(18),
Specialism Varchar2(11),
Constraint Landlord_Landlord_Id_Pk Primary Key (Landlord_Id),
Constraint Landlord_Specialism_Ck Check(Specialism In('Small Pubs', 'Medium Pubs', 'Large Pubs')),
Constraint Landlord_Tel_No_Uq Unique(Tel_No),
Constraint Landlord_Email_Uq Unique(Email)
);


Drop Table Pub;
Create Table Pub(
Pub_Id Number(3),
Name Varchar2(19) Constraint Pub_Name_Nn Not Null,
Address Varchar2(21),
City Varchar2(11),
County Varchar2(9),
Tel_No Number(6),
Email Varchar2(22),
Capacity Number(4),
Year_Built Number(4),
Sq_Meters Number(5),
Customer_Profile Varchar2(13),
Current_Value Number(7),
Specialism Varchar2(8),
Location Varchar2(9),
Landlord_Id Number(2),
Constraint Pub_Pub_Id_Pk Primary Key(Pub_Id),
Constraint Pub_Customer_Profile_Ck Check(Customer_Profile In('Students', 'Professionals', 'Sports Fans', 'Pensioners')),
Constraint Pub_Specialism_Ck Check(Specialism In('Food', 'Music', 'Sports', 'Ambience','Parties')),
Constraint Pub_Location_Ck Check(Location In('Poor', 'Good', 'Excellent')),
Constraint Pub_Tel_No_Uq Unique(Tel_No),
Constraint Pub_Email_Uq Unique(Email),
Constraint Pub_Landlord_Id_Fk Foreign Key(Landlord_Id) References  Landlord(Landlord_Id)
);


Drop Table Publican;
Create Table Publican(
Publican_Id Number(3),
Fname Varchar2(7),
Sname Varchar2(11) Constraint Publican_Sname_Nn Not Null,
Address Varchar2(22),
County Varchar2(9),
Gender Varchar2(1),
Date_of_Birth Date,
Mobile_No Number(6),
Email_Address Varchar2(18),
Qualifications Varchar2(14),
Specialism Varchar2(7),
Constraint Publican_Publican_Id_Pk Primary Key(Publican_Id),
Constraint Publican_Qualifications_Ck Check(Qualifications in('Bar Manager', 'Chef', 'Bar Supervisor')),
Constraint Publican_Specialism_Ck Check(Specialism In('Music', 'Food', 'Sports', 'Parties')),
Constraint Publican_Gender_Ck Check(Gender in('M','F')),
Constraint Publican_Mobile_No_Uq Unique(Mobile_No),
Constraint Publican_Email_Address_Uq Unique(Email_Address)
);


Drop Table Letting_Agent;
Create Table Letting_Agent(
Letting_Agent_Id Number(3),
Name Varchar2(14) Constraint Letting_Agent_Name_Nn Not Null,
City Varchar2(11),
County Varchar2(9),
Specialism Varchar2(20),
Web_Site Varchar2(26),
Email Varchar2(26),
Year_Founded Number(4),
Annual_Turnover Number(5),
Reputation Varchar2(9),
Constraint Letting_Agent_Letting_Id_Pk Primary Key(Letting_Agent_Id),
Constraint Letting_Agent_Reputation_Ck Check(Reputation In('Fair','Good','Excellent')),
Constraint Letting_Agent_Web_Site_Uq Unique(Web_Site),
Constraint Letting_Agent_Email_Uq Unique(Email)
);


Drop Table Solicitor;
Create Table Solicitor(
Solicitor_Id Number(3),
Fname Varchar2(6),
Sname Varchar2(8) Constraint Solicitor_Sname_Nn Not Null,
Address Varchar2(17),
County Varchar2(9),
Gender Varchar2(1),
Date_of_Birth Date,
Mobile_No Number(6),
Email_Address Varchar2(17),
Qualifications Varchar2(8),
Constraint Solicitor_Solicitor_Id_Pk Primary Key(Solicitor_Id),
Constraint Solicitor_Gender_Ck Check(Gender In('M','F')),
Constraint Solicitor_Qualifications_Ck Check(Qualifications In('Bachelor','Master','PhD')),
Constraint Solicitor_Mobile_No_Uq Unique(Mobile_No),
Constraint Solicitor_Email_Address_Uq Unique(Email_Address)
);


Drop Table Lease_Agreement;
Create Table Lease_Agreement(
Lease_Agreement_Id Number(4),
Pub_Id Number(3),
Publican_Id Number(3),
Start_Date Date,
End_Date Date,
Deposit Number(5),
Installment_frequency Varchar2(9),
Payment_Method Varchar2(14),
Installment_Amount Number(6),
Letting_Agent_Id Number(3),
Solicitor_Id Number(3),
Constraint Lease_Agreement_Lease_Id_Pk Primary Key(Lease_Agreement_Id),
Constraint Lease_Agreement_Inst_freq_Ck Check(Installment_frequency In('Annually','Quarterly','Monthly')),
Constraint Lease_Agreement_Pay_Method_Ck Check(Payment_Method In('Cheque','Direct Debit','Standing Order')),
Constraint Lease_Agreement_Pub_Id_Fk Foreign Key(Pub_Id) References Pub(Pub_Id),
Constraint Lease_Agreement_Publican_Id_Fk Foreign Key(Publican_Id) References Publican(Publican_Id),
Constraint Lease_Agreement_Letting_Id_Fk Foreign Key(Letting_Agent_Id) References Letting_Agent(Letting_Agent_Id),
Constraint Lease_Agreement_Solicit_Id_Fk Foreign Key(Solicitor_Id) References Solicitor(Solicitor_Id)
);



/* Table Name:Landlord  */
  /*Landlord_Id,Fname,Sname,Address,Town,County,Tel_No,Email,Specialism */
Insert Into  Landlord Values (1,'Boris','Shcherbina','4721 Quisque Avenue','Drogheda','Louth',900001,'BorisShcherbina@ie','Medium Pubs');
Insert Into  Landlord Values (2,'Mary','Shelley','3854 Ut Street','Dingle','Kerry',900002,'MaryShelley@ie','Small Pubs');
Insert Into  Landlord Values (3,'John','Hudson','3854 Ut Street','Athlone','Westmeath',900003,'JohnHudson@ie','Medium Pubs');
Insert Into  Landlord Values (4,'Fanny','Brawne','2790 At St.','Dublin','Dublin',900004,'FannyBrawne@ie','Large Pubs');
Insert Into  Landlord Values (5,'Shauna','O Brien','80 Nec Rd.','Cork','Cork',900005,'ShaunaOBrien@ie','Large Pubs');
Insert Into  Landlord Values (6,'Peter','O Connor','503 Pede, Av.','Athlone','Westmeath',900006,'PeterOConnor@ie','Medium Pubs');
Insert Into  Landlord Values (7,'Jack','Williams','19 Quisque Rd.','Limerick','Limerick',900007,'JackWilliams@ie','Large Pubs');
Insert Into  Landlord Values (8,'Kevin','Limey','9 Consectetuer Rd.','Cork','Cork',900008,'KevinLimey@ie','Large Pubs');
Insert Into  Landlord Values (9,'Sandra','Cox','114 Dolor, Ave','Dublin','Dublin',900009,'SandraCox@ie','Large Pubs');
Insert Into  Landlord Values (10,'David','Morrison','3 Interdum Rd.','Dublin','Dublin',900010,'DavidMorrison@ie','Small Pubs');
Insert Into  Landlord Values (11,'Hillary','Swans','8681 A, Ave','Letterkenny','Donegal',900011,'HillarySwans@ie','Small Pubs');
Insert Into  Landlord Values (12,'Patricia','Burns','62 Egestas St.','Sligo','Sligo',900012,'PatriciaBurns@ie','Small Pubs');
Insert Into  Landlord Values (13,'Rachael','Brown','7 Morbi Avenue','Waterford','Waterford',900013,'RachaelBrown@ie','Medium Pubs');
commit;

  /* Table Name:Pub  */
  /*Pub_Id,Name,Address,City,County,Tel_No,Email,Capacity,Year_Built,Sq_Meters,Customer_Profile,Current_Value,Specialism,Location,Landlord_Id */
Insert Into  Pub Values (101,'Charlies','79 Ante Ave','Athlone','Westmeath',400001,'Charlies@ie',500,1990,5500,'Students',450000,'Music','Good',1);
Insert Into  Pub Values (102,'Tack Room','9 Sapien. St.','Athlone','Westmeath',400002,'Tack Room@ie',400,1970,6000,'Students',680000,'Music','Good',2);
Insert Into  Pub Values (103,'Seans Bar','604 Ut, Rd.','Athlone','Westmeath',400003,'Seans Bar@ie',750,200,7500,'Professionals',5000000,'Ambience','Excellent',3);
Insert Into  Pub Values (104,'Piano Bar','431 Mi Av.','Dublin','Dublin',400004,'Piano Bar@ie',1000,1850,9950,'Professionals',750000,'Music',NULL,4);
Insert Into  Pub Values (105,'Granary Gastro Pub','563 Turpis St.','Dundalk','Louth',400005,'Granary Gastro Pub@ie',250,1875,3500,'Pensioners',210000,'Food','Poor',5);
Insert Into  Pub Values (106,'Bacchus','3930 In Avenue','Ballymahon','Longford',400006,'Bacchus@ie',300,1698,3750,'Pensioners',175000,'Food','Excellent',6);
Insert Into  Pub Values (107,'Murphys Law','2260 Quisque Ave','Cork','Cork',400007,'Murphys Law@ie',150,2001,1800,'Sports Fans',475000,'Sports',NULL,7);
Insert Into  Pub Values (108,'Gertie Browne','6434 Adipiscing Rd.','Limerick','Limerick',400008,'Gertie Browne@ie',950,1997,10000,'Students',345000,'Parties','Poor',8);
Insert Into  Pub Values (109,'Careys Tavern','1628 Luctus. St.','Sligo','Sligo',400009,'Careys Tavern@ie',600,2010,6000,'Sports Fans',310000,'Sports','Good',9);
Insert Into  Pub Values (110,'Shack Pub','9139 Erat Rd.','Waterford','Waterford',400010,'Shack Pub@ie',1250,1995,12500,'Sports Fans',490000,'Sports',NULL,10);
Insert Into  Pub Values (111,'Snug Bar','3495 Massa. Rd.','Dublin','Dublin',400011,'Snug Bar@ie',1500,1960,13500,'Professionals',680000,'Ambience','Good',11);
Insert Into  Pub Values (112,'Dark Horse','7897 Sollicitudin Rd.','Cork','Cork',400012,'Dark Horse@ie',1250,1950,10500,'Students',715000,'Parties','Excellent',12);
Insert Into  Pub Values (113,'Castle Inn','9576 Eu Rd.','Limerick','Limerick',400013,'Castle Inn@ie',750,1750,7950,'Pensioners',500000,'Food','Good',13);
Insert Into  Pub Values (114,'Flannerys Bar','6508 Litora St.','Dingle','Kerry',400014,'Flannerys Bar@ie',1150,1850,11250,'Pensioners',290000,'Food','Good',1);
Insert Into  Pub Values (115,'Malt House','9327 Magna. Av.','Dublin','Dublin',400015,'Malt House@ie',1750,1999,17500,'Students',650000,'Parties','Poor',2);
Insert Into  Pub Values (116,'Nuts Corner','2432 Id, St.','Waterford','Waterford',400016,'Nuts Corner@ie',950,2005,10000,'Students',450000,'Music',NULL,3);
Insert Into  Pub Values (117,'Fiddlers','46 Et St.','Drogheda','Louth',400017,'Fiddlers@ie',400,1940,5950,'Sports Fans',175000,'Sports','Poor',4);
Insert Into  Pub Values (118,'Three Jolly Pigeons','1380 Velit St.','Letterkenny','Donegal',400018,'Three Jolly Pigeons@ie',250,1963,2100,'Pensioners',375000,'Music',NULL,5);
Insert Into  Pub Values (119,'Seerys Bar','3080 Magna. Rd.','Cork','Cork',400019,'Seerys Bar@ie',550,2007,5700,'Professionals',680000,'Food','Good',2);
Insert Into  Pub Values (120,'Temple Bar','5586 Eu, Rd.','Dublin','Dublin',400020,'Temple Bar@ie',750,1993,8100,'Professionals',4800000,'Ambience',NULL,1);
commit;


  /* Table Name:Publican  */
  /*Publican_Id,Fname,Sname,Address,County,Gender,Date_of_Birth,Mobile_No,Email_Address,Qualifications,Specialism */
Insert Into  Publican Values (200,'Jim','Gallows','502 Ac Rd.','Louth','M','18-Aug-74',500001,'JimGallows@ie','Bar Manager','Music');
Insert Into  Publican Values (210,'Jerry','Ryan','94 Enim. Av.','Kerry','F','02-Feb-67',500002,'JerryRyan@ie','Bar Manager','Food');
Insert Into  Publican Values (220,'Jane','Campion','7804 Phasellus Rd.','Westmeath','F','05-Mar-52',500003,'JaneCampion@ie','Bar Manager','Sports');
Insert Into  Publican Values (230,'Rachael','Maurier','7347 Et, St.','Dublin','F','03-Nov-60',500004,'RachaelMaurier@ie','Chef','Parties');
Insert Into  Publican Values (240,'Sophie','Turner','7379 Vulputate Ave','Waterford','F','24-Sep-74',500005,'SophieTurner@ie','Bar Supervisor','Music');
Insert Into  Publican Values (250,'Rebecca','Jones','8956 Est, St.','Limerick','F','16-Dec-77',500006,'RebeccaJones@ie','Bar Supervisor','Food');
Insert Into  Publican Values (260,'Donald','Glover','5315 Nam Av.','Cork','M','22-Apr-55',500007,'DonaldGlover@ie','Chef','Sports');
Insert Into  Publican Values (270,'Shannan','O Reilly','5919 Ac Rd.','Galway','F','28-Oct-51',500008,'ShannanO Reilly@ie','Bar Manager','Parties');
Insert Into  Publican Values (280,'Max','Rocketowsky','6434 Mauris Rd.','Dublin','M','12-Apr-60',500009,'MaxRocketowsky@ie','Bar Supervisor','Music');
Insert Into  Publican Values (290,'Tristan','Starr','772 Amet Street','Westmeath','M','09-Apr-78',500010,'TristanStarr@ie','Bar Supervisor','Food');
Insert Into  Publican Values (300,'Jaime','Murray','39 Feugiat Road','Sligo','F','04-Jan-52',500011,'JaimeMurray@ie','Bar Manager','Sports');
Insert Into  Publican Values (310,'Barry','Sands','3716 Adipiscing Street','Dublin','M','09-Oct-67',500012,'BarrySands@ie','Chef','Parties');
commit;


  /* Table Name:Letting_Agent  */
  /*Letting_Agent_Id,Name,City,County,Specialism,Web_Site,Email,Year_Founded,Annual_Turnover,Reputation */
Insert Into  Letting_Agent Values (501,'Gore Vidal','Galway','Galway','Long Term Contracts','gorevidalgalway.ie','gorevidalgalway@ie',1968,35000,'Good');
Insert Into  Letting_Agent Values (502,'James Hatfield','Dingle','Kerry','Medium Term Leases','jameshatfielddingle.ie','jameshatfielddingle@ie',1971,21500,'Good');
Insert Into  Letting_Agent Values (503,'Chris Conner','Athlone','Westmeath','Medium Term Leases','chrisconnerathlone.ie','chrisconnerathlone@ie',1991,19500,'Fair');
Insert Into  Letting_Agent Values (504,'Teresa  Palmer','Letterkenny','Donegal','Long Term Agreements','teresapalmerletterkenny.ie','teresapalmerletterkenny@ie',1986,39500,'Excellent');
Insert Into  Letting_Agent Values (505,'Katie Holmes','Dublin','Dublin','Medium Term Leases','katieholmesdublin.ie','katieholmesdublin@ie',1999,41500,'Good');
Insert Into  Letting_Agent Values (506,'Jessica Rogers','Limerick','Limerick','Long Term Agreements','jessicarogerslimerick.ie','jessicarogerslimerick@ie',2001,27500,'Fair');
Insert Into  Letting_Agent Values (507,'Gary Limey','Dundalk','Louth','Long Term Contracts','garylimeydundalk.ie','garylimeydundalk@ie',1973,35000,'Good');
Insert Into  Letting_Agent Values (508,'Jacob Bloggs','Dublin','Dublin','Long Term Agreements','jacobbloggsdublin.ie','jacobbloggsdublin@ie',1969,52500,'Good');
Insert Into  Letting_Agent Values (509,'Rick Sanchez','Cork','Cork','Medium Term Leases','ricksanchezcork.ie','ricksanchezcork@ie',1986,47500,'Excellent');
Insert Into  Letting_Agent Values (510,'Erica Yong','Dublin','Dublin','Medium Term Leases','ericayongdublin.ie','ericayongdublin@ie',1989,24000,'Fair');
Insert Into  Letting_Agent Values (511,'Louis Sixx','Waterford','Waterford','Long Term Contracts','louissixxwaterford.ie','louissixxwaterford@ie',1995,40000,'Good');
Insert Into  Letting_Agent Values (512,'Felicia Day','Galway','Galway','Medium Term Leases','feliciadaygalway.ie','feliciadaygalway@ie',2000,50000,'Excellent');
Insert Into  Letting_Agent Values (513,'Salmon Leads','Cork','Cork','Long Term Contracts','salmonleadscork.ie','salmonleadscork@ie',2003,32500,'Fair');
commit;

  /*  Table Name:Solicitor  */
  /*Solicitor_Id,Fname,Sname,Address,County,Gender,Date_of_Birth,Mobile_No,Email_Address,Qualifications */
Insert Into Solicitor Values (701,'Ashley','Horns','48 Vestibulum Rd.','Westmeath','F','09-Oct-67',700001,'AshleyHorns@ie','Master');
Insert Into Solicitor Values (702,'Benny','Lane','51 Semper Rd.','Limerick','M','11-Mar-58',700002,'BennyLane@ie','PhD');
Insert Into Solicitor Values (703,'Frank','Murphy','241 Amet St.','Dublin','M','19-May-57',700003,'FrankMurphy@ie','PhD');
Insert Into Solicitor Values (704,'Janice','Pierce','2 At Rd.','Galway','F','26-Feb-72',700004,'JanicePierce@ie','Master');
Insert Into Solicitor Values (705,'Ian','Freeman','74 Interdum. Road','Dublin','M','31-Dec-66',700005,'IanFreeman@ie','Master');
Insert Into Solicitor Values (706,'Patsy','Vance','99 Neque Av.','Dublin','F','29-Aug-71',700006,'PatsyVance@ie','Master');
Insert Into Solicitor Values (707,'Elise','Nichols','95 Semper, Road','Cork','F','31-Mar-80',700007,'EliseNichols@ie','Bachelor');
Insert Into Solicitor Values (708,'Simone','Miramar','33 Nulla. Road','Louth','F','24-Jun-57',700008,'SimoneMiramar@ie','PhD');
Insert Into Solicitor Values (709,'Quincy','Kent','15 Augue Avenue','Waterford','M','11-May-74',700009,'QuincyKent@ie','Master');
Insert Into Solicitor Values (710,'Darren','Goldberg','8 Risus. St.','Kerry','M','14-Feb-67',700010,'DarrenGoldberg@ie','PhD');
Insert Into Solicitor Values (711,'Warren','Edwards','150 Magna. Rd.','Cork','M','04-Nov-78',700011,'WarrenEdwards@ie','Bachelor');
Insert Into Solicitor Values (712,'Gloria','Luan','38 Erat Av.','Limerick','F','10-Jul-68',700012,'GloriaLuan@ie','Master');
commit;


  /*  Table Name:Lease_Agreement  */

  /*  Lease_Agreement_Id,Pub_Id,Publican_Id,Start_Date,End_Date,Deposit,Installment_frequency,Payment_Method,Installment_Amount,Letting_Agent_Id,Solicitor_Id*/
Insert Into  Lease_Agreement Values (1000,101,200,'20-Jan-79','03-Dec-00',5000,'Monthly','Cheque',20000,501,701);
Insert Into  Lease_Agreement Values (1010,102,210,'05-Jan-88','27-Jun-14',7500,'Quarterly','Cheque',50000,502,702);
Insert Into  Lease_Agreement Values (1020,103,220,'10-Oct-92','30-Mar-08',9550,'Annually','Standing Order',200000,503,703);
Insert Into  Lease_Agreement Values (1030,104,230,'24-Aug-85','03-Sep-12',9950,'Annually','Direct Debit',225000,504,704);
Insert Into  Lease_Agreement Values (1040,105,240,'29-Jun-97','20-Aug-09',5000,'Monthly','Cheque',15500,505,705);
Insert Into  Lease_Agreement Values (1050,106,250,'13-Feb-81','07-Aug-24',7500,'Quarterly','Direct Debit',65000,506,706);
Insert Into  Lease_Agreement Values (1060,107,260,'10-Aug-95','30-Oct-17',10000,'Annually','Standing Order',177500,507,707);
Insert Into  Lease_Agreement Values (1070,108,270,'08-Sep-86','11-Dec-00',12500,'Annually','Direct Debit',159000,501,708);
Insert Into  Lease_Agreement Values (1080,109,210,'11-Feb-96','26-Jan-19',2500,'Monthly','Cheque',12500,502,703);
Insert Into  Lease_Agreement Values (1090,110,220,'15-Jul-90','11-Feb-13',1570,'Monthly','Direct Debit',17750,503,704);
Insert Into  Lease_Agreement Values (1100,111,230,'13-Jan-87','23-Dec-10',2750,'Monthly','Direct Debit',18000,504,705);
Insert Into  Lease_Agreement Values (1110,112,240,'23-Sep-99','08-Jul-15',2500,'Monthly','Cheque',22500,505,706);
Insert Into  Lease_Agreement Values (1120,113,200,'18-Oct-87','20-Oct-18',3570,'Monthly','Direct Debit',27000,506,701);
Insert Into  Lease_Agreement Values (1130,114,200,'16-Aug-75','08-Jan-08',3500,'Monthly','Direct Debit',11500,501,701);
Insert Into  Lease_Agreement Values (1140,115,200,'07-Dec-92','25-Feb-01',7500,'Quarterly','Cheque',57000,501,701);
Insert Into  Lease_Agreement Values (1150,116,210,'05-Aug-84','30-Jun-05',8570,'Quarterly','Standing Order',55000,502,702);
Insert Into  Lease_Agreement Values (1160,117,210,'20-Oct-83','31-Aug-13',6500,'Monthly','Direct Debit',16000,503,702);
Insert Into  Lease_Agreement Values (1170,118,220,'09-Dec-79','20-Aug-00',8000,'Quarterly','Cheque',45000,504,703);
Insert Into  Lease_Agreement Values (1180,119,230,'09-Sep-91','29-Oct-05',2950,'Monthly','Direct Debit',21000,505,704);
Insert Into  Lease_Agreement Values (1190,120,240,'21-Nov-80','17-Jun-21',3150,'Monthly','Direct Debit',23500,506,705);
commit;


Select * 
From Tab
Where Tname In ('LANDLORD', 'PUB', 'PUBLICAN', 'LETTING_AGENT', 'SOLICITOR','LEASE_AGREEMENT')
Order By Tname;

Select * 
From LANDLORD;

Select * 
From PUB;

Select * 
From PUBLICAN;

Select * 
From LETTING_AGENT;

Select * 
From SOLICITOR;

Select * 
From LEASE_AGREEMENT;

Cl Scr
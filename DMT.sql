Set SQLPrompt 'ARK_SQL >' 

Set Termout On 

Set Echo On 

Set Feedback On 

Set Verify On 

Set Heading on 

Set Linesize 180 

Set Pagesize 100

Drop Table Mission;
Drop Table Drone;

Drop Table Drone;
Create Table Drone (
Drone_ID Number(3),
Drone_Name Varchar2(16),
Manufacturer Varchar2(12),
Purchase_Date Date,
Material_Type Varchar2(12),
Weight Number(3,1),
Max_Speed Number(2),
Range Number(2),
Camera_Type Varchar2(8),
Primary_Use Varchar2(17),
Autonomy_Level Varchar2(16),
GPS_Enabled Varchar2(3),
Weather_Resistance Varchar2(10),
Battery_Type Varchar2(6),
Control_Method Varchar2(11),
Owner_Name Varchar2(13),
Cost_Price Number(5));



Drop Table Mission;
Create Table Mission(
Mission_Id Number(5),
Drone_Id Number(3),
Mission_Date Date,
Duration Number(2),
Start_Loc Varchar2(9),
End_Loc Varchar2(9),
Distance Number(2),
Average_Speed Number(3),
Max_Altitude Number(3),
Payload_Weight Number(3,1),
Mission_Type Varchar2(11),
Weather_Conditions Varchar2(10),
Data_Collected  Number(4),
Mission_Purpose Varchar2(28),
Cost Number(3));

--primary keys (PK)
Alter table   Drone  Add constraint  Drone_Id_Pk Primary Key (Drone_Id);
Alter table   Mission  Add constraint  Mission_Id_Pk Primary Key (Mission_Id);

-- Foreign Keys (FK)
Alter table   Mission  Add constraint Mission_Drone_Id_Fk Foreign Key (Drone_Id) references Drone(Drone_Id);

/* Table Name:Drone  */
/*Drone_ID,Drone_Name,Manufacturer,Purchase_Date,Material_Type,Weight,Max_Speed,Range,Camera_Type,Primary_Use,Autonomy_Level,GPS_Enabled,Weather_Resistance,Battery_Type,Control_Method,Owner_Name,Cost_Price */
Insert Into  Drone Values (10,'Aero Nova X1','Aluminium','28-Jul-21','Aluminium',1.2,90,10,'None','Delivery','Fully Autonomous','Yes','Light Rain','Lipo','Remote','Sky Works',8600);
Insert Into  Drone Values (20,'Sky Pulse V8','Titanium','19-Aug-21','Titanium',1.9,30,20,'Hd','Search and Rescue','Semi-Autonomous','Yes','Waterproof','Nimh','App','Aero Vision',5050);
Insert Into  Drone Values (30,'Terra Flex One','Carbon Fibre','21-Nov-23','Carbon Fibre',3.6,40,15,'Thermal','Search and Rescue','Semi-Autonomous','Yes','Waterproof','Lipo','App','Enviro Flight',8350);
Insert Into  Drone Values (40,'Nimbus Core S7','Plastic','27-Sep-22','Plastic',5.6,80,10,'None','Logistic Supp','Fully Autonomous','Yes','Light Rain','Lipo','App','Rescue Ops',1550);
Insert Into  Drone Values (50,'Horizon Edge 5','Titanium','14-May-19','Titanium',2.6,70,25,'Hd','Surveying','Semi-Autonomous','Yes','Waterproof','Nimh','AI-assisted','Rescue Ops',6700);
Insert Into  Drone Values (60,'Vertex Air 300','Titanium','25-Oct-19','Titanium',3.3,50,5,'Thermal','Search and Rescue','Manual','Yes','Waterproof','Nimh','Remote','Agri Fly',13100);
Insert Into  Drone Values (70,'StratoWing Z2','Composite','22-Oct-20','Composite',4.6,90,15,'4k','Photography','Manual','No','Waterproof','Lipo','App','Rescue Ops',2250);
Insert Into  Drone Values (80,'Falcon Reach 10','Composite','12-Apr-20','Composite',1,50,15,'None','Delivery','Semi-Autonomous','Yes','Waterproof','Lipo','Remote','Urban Scan',5950);
Insert Into  Drone Values (90,'Crest Flyer A1','Plastic','11-Mar-23','Plastic',3.8,80,10,'4k','Surveying','Fully Autonomous','Yes','None','Nimh','Remote','Aero Vision',3850);
Insert Into  Drone Values (100,'Drift Scan Pro','Titanium','09-Mar-20','Titanium',3.2,40,10,'Hd','Env Monitoring','Fully Autonomous','Yes','Light Rain','Li-Ion','AI-assisted','North Star',13550);
Insert Into  Drone Values (110,'Opti Cruise 4K','Carbon Fibre','25-Jun-23','Carbon Fibre',3.3,70,5,'4k','Photography','Manual','No','Waterproof','Li-Ion','AI-assisted','Urban Scan',3750);
Insert Into  Drone Values (120,'Sonic Aero Lite','Titanium','02-Aug-20','Titanium',1.2,90,25,'4k','Surveying','Semi-Autonomous','Yes','None','Nimh','Remote','Agri Fly',6000);
Insert Into  Drone Values (130,'Glide Matrix 2','Carbon Fibre','12-Nov-20','Carbon Fibre',4.9,40,10,'4k','Surveying','Semi-Autonomous','Yes','None','Nimh','Remote','Agri Fly',4750);
Insert Into  Drone Values (140,'Velo Scan Ultra','Plastic','28-Dec-22','Plastic',4,90,10,'None','Logistic Supp','Fully Autonomous','Yes','Light Rain','Nimh','Remote','Agri Fly',14400);
Insert Into  Drone Values (150,'Ion Survey 6','Titanium','31-Dec-19','Titanium',2.3,70,5,'Hd','Agriculture','Semi-Autonomous','Yes','Light Rain','Li-Ion','AI-assisted','Aero Vision',9550);
Insert Into  Drone Values (160,'Sky Harbor VX','Aluminium','12-Mar-20','Aluminium',2.2,90,10,'Thermal','Env Monitoring','Semi-Autonomous','Yes','Waterproof','Li-Ion','Remote','Urban Scan',2850);
Insert Into  Drone Values (170,'Pulse Ranger 3','Carbon Fibre','17-Oct-19','Carbon Fibre',2.6,60,10,'Infrared','Surveying','Semi-Autonomous','Yes','Waterproof','Lipo','App','Sky Works',10750);
Insert Into  Drone Values (180,'Aero Spirit CX','Carbon Fibre','24-Mar-21','Carbon Fibre',2.6,30,5,'4k','Photography','Fully Autonomous','Yes','None','Lipo','AI-assisted','North Star',4900);
Insert Into  Drone Values (190,'Helio Track M2','Aluminium','14-Apr-19','Aluminium',4.3,90,15,'Hd','Agriculture','Fully Autonomous','Yes','Light Rain','Nimh','Remote','Rescue Ops',2450);
Insert Into  Drone Values (200,'Cloud Guard X','Carbon Fibre','27-Jan-20','Carbon Fibre',3.9,90,15,'Hd','Photography','Manual','No','Waterproof','Nimh','App','North Star',4950);
Insert Into  Drone Values (210,'Eco Flight One','Composite','19-Aug-19','Composite',4.6,30,15,'Infrared','Agriculture','Semi-Autonomous','Yes','None','Lipo','Remote','Sky Works',7100);
Insert Into  Drone Values (220,'Urban Quest 5','Aluminium','07-Mar-19','Aluminium',2.2,50,25,'Thermal','Env Monitoring','Manual','No','None','Li-Ion','Remote','Aero Vision',6350);
Insert Into  Drone Values (230,'Prime Scout Air','Carbon Fibre','11-May-19','Carbon Fibre',0.6,70,10,'Hd','Agriculture','Semi-Autonomous','Yes','Light Rain','Li-Ion','AI-assisted','Agri Fly',14150);
Insert Into  Drone Values (240,'Vista Pro X9','Carbon Fibre','18-May-22','Carbon Fibre',4.5,40,25,'Infrared','Env Monitoring','Manual','No','Light Rain','Li-Ion','Remote','Sky Works',2500);
Insert Into  Drone Values (250,'Radiant Sky 4','Plastic','04-Aug-21','Plastic',4.7,30,15,'Infrared','Env Monitoring','Fully Autonomous','Yes','Waterproof','Lipo','AI-assisted','Urban Scan',13750);
Insert Into  Drone Values (260,'Geo Cruiser L1','Aluminium','01-Dec-22','Aluminium',2.7,80,10,'Hd','Photography','Semi-Autonomous','Yes','None','Lipo','AI-assisted','North Star',10650);
Insert Into  Drone Values (270,'Trail Seeker Q','Plastic','07-Jun-20','Plastic',2.3,50,10,'4k','Surveying','Semi-Autonomous','Yes','Waterproof','Nimh','Remote','Aero Vision',11550);
Insert Into  Drone Values (280,'Spectra Hover 2','Plastic','22-Mar-21','Plastic',4.3,30,15,'Thermal','Agriculture','Semi-Autonomous','Yes','Light Rain','Li-Ion','AI-assisted','Sky Works',14350);
Insert Into  Drone Values (290,'Air Sentinel R1','Carbon Fibre','16-Aug-22','Carbon Fibre',5.9,70,5,'None','Logistic Supp','Fully Autonomous','Yes','None','Nimh','Remote','Agri Fly',11300);
Insert Into  Drone Values (300,'Bird Voyage 7','Carbon Fibre','16-Jan-23','Carbon Fibre',3.4,80,5,'Hd','Search and Rescue','Semi-Autonomous','Yes','Waterproof','Nimh','AI-assisted','Aero Vision',4750);
Insert Into  Drone Values (310,'Wind Pilot X','Composite','21-Sep-21','Composite',1.2,80,15,'Infrared','Surveying','Fully Autonomous','Yes','None','Li-Ion','Remote','Agri Fly',8100);
Insert Into  Drone Values (320,'Nova Surveyor 8','Plastic','24-Nov-23','Plastic',3.8,50,10,'Hd','Delivery','Semi-Autonomous','Yes','Waterproof','Li-Ion','App','Aero Vision',5800);
Insert Into  Drone Values (330,'Omni Hover 3D','Titanium','13-Aug-22','Titanium',0.8,30,25,'4k','Photography','Fully Autonomous','Yes','Waterproof','Lipo','App','Enviro Flight',13250);
Insert Into  Drone Values (340,'Astra Pilot Mini','Plastic','16-Sep-22','Plastic',2.3,60,20,'4k','Photography','Manual','No','Waterproof','Lipo','Remote','Aero Vision',11600);
Insert Into  Drone Values (350,'Ranger Glide 6','Titanium','22-May-22','Titanium',5,40,20,'None','Delivery','Fully Autonomous','Yes','Light Rain','Li-Ion','AI-assisted','Urban Scan',1850);
Insert Into  Drone Values (360,'Sky Lancer Pro','Titanium','04-Nov-20','Titanium',1.8,60,5,'Thermal','Search and Rescue','Semi-Autonomous','Yes','Light Rain','Lipo','App','North Star',4450);
Insert Into  Drone Values (370,'Vortex Mapper S','Titanium','15-Mar-20','Titanium',2.3,70,10,'Infrared','Surveying','Fully Autonomous','Yes','Waterproof','Lipo','AI-assisted','Agri Fly',6450);
Insert Into  Drone Values (380,'Cloud Runner 2','Plastic','10-May-21','Plastic',2.6,50,5,'4k','Photography','Fully Autonomous','Yes','Waterproof','Lipo','AI-assisted','Aero Vision',13400);
Insert Into  Drone Values (390,'Hyper Scout Z1','Composite','31-Aug-22','Composite',2.8,30,10,'4k','Photography','Semi-Autonomous','Yes','Light Rain','Lipo','Remote','Aero Vision',11650);
Insert Into  Drone Values (400,'Motion Aero X5','Composite','11-Nov-21','Composite',3.2,50,20,'Hd','Logistic Supp','Semi-Autonomous','Yes','Light Rain','Li-Ion','App','Enviro Flight',8250);
Insert Into  Drone Values (410,'Zenith Tracker 4','Composite','22-Sep-21','Composite',2.2,60,10,'4k','Photography','Fully Autonomous','Yes','Waterproof','Lipo','AI-assisted','Sky Works',13350);
Insert Into  Drone Values (420,'Pulse Vector Air','Titanium','22-Jul-20','Titanium',4,50,10,'Hd','Env Monitoring','Manual','No','Waterproof','Lipo','AI-assisted','Enviro Flight',8150);
commit;

  /* Table Name:Mission  */

  /*Mission_Id,Drone_Id,Mission_Date,Duration,Start_Loc,End_Loc,Distance,Average_Speed,Max_Altitude,Payload_Weight,Mission_Type,Weather_Conditions,Data_Collected ,Mission_Purpose,Cost */
Insert Into  Mission Values (1100,10,'21-Mar-24',15,'Dublin','Antrim',13,52,75,3,'Delivery','Clear',90,'Document Delivery Run',112);
Insert Into  Mission Values (1200,20,'05-Nov-22',40,'Sligo','Donegal',2,3,65,0.1,'Inspection','Windy',870,'Powerline Routine Inspection',90);
Insert Into  Mission Values (1300,30,'10-Aug-24',10,'Mayo','Mayo',8,48,65,0.5,'Inspection','Rainy',450,'Bridge Structural Inspection',60);
Insert Into  Mission Values (1400,40,'15-Jan-24',5,'Galway','Galway',7,84,80,3,'Delivery','Rainy',300,'Medical Supply Drop',68);
Insert Into  Mission Values (1500,50,'08-Feb-20',75,'Fermanagh','Fermanagh',3,2,115,0.8,'Photography','Windy',400,'Tourism Promo Footage',118);
Insert Into  Mission Values (1600,60,'04-Jan-22',40,'Armagh','Armagh',4,6,65,0.4,'Inspection','Windy',300,'Bridge Structural Inspection',95);
Insert Into  Mission Values (1700,70,'23-Nov-24',85,'Kilkenny','Sligo',5,4,55,0.1,'Inspection','Clear',760,'Wind Turbine Blade Check',165);
Insert Into  Mission Values (1800,80,'07-Mar-24',15,'Westmeath','Westmeath',3,12,60,2.5,'Delivery','Windy',130,'Equipment Transfer Flight',72);
Insert Into  Mission Values (1900,90,'24-Oct-23',75,'Louth','Louth',8,6,20,0.3,'Inspection','Windy',880,'Bridge Structural Inspection',158);
Insert Into  Mission Values (2000,100,'18-Dec-23',90,'Louth','Louth',4,3,140,1.1,'Photography','Windy',590,'Tourism Promo Footage',138);
Insert Into  Mission Values (2100,110,'24-Feb-24',60,'Sligo','Wexford',6,6,155,0.5,'Survey','Windy',1060,'Coastal Erosion Survey',146);
Insert Into  Mission Values (2200,120,'17-Apr-24',65,'Longford','Longford',4,4,150,0.2,'Photography','Clear',290,'Tourism Promo Footage',108);
Insert Into  Mission Values (2300,130,'29-Apr-23',25,'Wexford','Wexford',9,22,80,1.6,'Inspection','Windy',420,'Bridge Structural Inspection',85);
Insert Into  Mission Values (2400,140,'23-Dec-24',15,'Monaghan','Monaghan',6,24,100,2.5,'Delivery','Rainy',150,'Emergency Parcel Deployment',84);
Insert Into  Mission Values (2500,150,'23-Jan-21',65,'Antrim','Carlow',3,3,60,0.1,'Inspection','Clear',660,'Wind Turbine Blade Check',130);
Insert Into  Mission Values (2600,160,'02-Mar-24',75,'Clare','Clare',10,8,50,1.4,'Inspection','Clear',690,'Roof Damage Assessment',163);
Insert Into  Mission Values (2700,170,'08-Aug-23',15,'Carlow','Fermanagh',13,52,65,5,'Delivery','Rainy',220,'Medical Supply Drop',112);
Insert Into  Mission Values (2800,180,'01-Nov-24',35,'Monaghan','Monaghan',1,2,60,1.3,'Photography','Clear',620,'Construction Progress Photos',65);
Insert Into  Mission Values (2900,190,'03-Mar-21',80,'Roscommon','Tipperary',13,10,120,0.2,'Survey','Rainy',780,'Coastal Erosion Survey',203);
Insert Into  Mission Values (3000,200,'01-Apr-23',90,'Offaly','Offaly',4,3,145,1.1,'Photography','Hailstones',370,'Tourism Promo Footage',138);
Insert Into  Mission Values (3100,210,'15-Nov-23',80,'Tipperary','Tipperary',10,8,160,1.2,'Survey','Hailstones',1150,'Coastal Erosion Survey',194);
Insert Into  Mission Values (3200,220,'28-Aug-24',85,'Monaghan','Roscommon',9,6,50,0.7,'Inspection','Clear',360,'Powerline Routine Inspection',175);
Insert Into  Mission Values (3300,230,'31-Oct-24',30,'Offaly','Offaly',10,20,40,2.5,'Delivery','Snow',300,'Equipment Transfer Flight',130);
Insert Into  Mission Values (3400,240,'22-May-22',5,'Offaly','Offaly',1,12,20,1.9,'Inspection','Snow',280,'Roof Damage Assessment',35);
Insert Into  Mission Values (3500,250,'28-Sep-24',65,'Down','Down',8,7,40,2,'Inspection','Clear',410,'Wind Turbine Blade Check',143);
Insert Into  Mission Values (3600,260,'18-Nov-24',60,'Monaghan','Monaghan',7,7,95,1.1,'Photography','Windy',300,'Urban Skyline Photography',110);
Insert Into  Mission Values (3700,270,'13-Nov-22',35,'Cork','Fermanagh',13,22,70,1.6,'Survey','Clear',780,'Topographic Scan',122);
Insert Into  Mission Values (3800,280,'06-Mar-24',40,'Derry','Fermanagh',3,5,40,3.5,'Delivery','Hailstones',220,'Document Delivery Run',122);
Insert Into  Mission Values (3900,290,'27-Aug-24',65,'Donegal','Donegal',9,8,75,4.5,'Delivery','Snow',260,'Medical Supply Drop',196);
Insert Into  Mission Values (4000,300,'28-Mar-23',45,'Cavan','Cavan',3,4,65,1.7,'Inspection','Snow',710,'Bridge Structural Inspection',100);
Insert Into  Mission Values (4100,10,'01-Oct-24',55,'Meath','Meath',13,14,25,1,'Delivery','Windy',290,'Equipment Transfer Flight',192);
Insert Into  Mission Values (4200,20,'23-Jul-22',60,'Meath','Meath',7,7,70,1.5,'Delivery','Rainy',70,'Medical Supply Drop',178);
Insert Into  Mission Values (4300,30,'02-Sep-24',80,'Waterford','Offaly',7,5,140,0.2,'Survey','Snow',1030,'Crop Health Mapping',185);
Insert Into  Mission Values (4400,40,'22-Oct-22',75,'Antrim','Waterford',14,11,90,5,'Delivery','Rainy',70,'Emergency Parcel Deployment',236);
Insert Into  Mission Values (4500,50,'01-Jan-22',35,'Antrim','Antrim',9,15,60,0.4,'Inspection','Rainy',810,'Roof Damage Assessment',100);
Insert Into  Mission Values (4600,60,'09-Jun-21',75,'Monaghan','Monaghan',6,5,35,1.8,'Inspection','Windy',740,'Powerline Routine Inspection',153);
Insert Into  Mission Values (4700,70,'13-Apr-23',90,'Kerry','Kerry',8,5,100,1.3,'Photography','Clear',510,'Urban Skyline Photography',148);
Insert Into  Mission Values (4800,80,'30-Jul-23',30,'Waterford','Cork',6,12,100,1.5,'Delivery','Clear',90,'Equipment Transfer Flight',114);
Insert Into  Mission Values (4900,90,'14-Jul-24',80,'Monaghan','Monaghan',7,5,95,1.3,'Survey','Clear',790,'Land Parcel Survey',185);
Insert Into  Mission Values (5000,100,'29-Nov-21',70,'Kerry','Kerry',10,9,185,0.4,'Survey','Rainy',580,'Crop Health Mapping',176);
Insert Into  Mission Values (5100,110,'09-Mar-24',55,'Longford','Longford',3,3,70,1.9,'Inspection','Rainy',880,'Roof Damage Assessment',115);
Insert Into  Mission Values (5200,120,'10-Dec-20',45,'Fermanagh','Fermanagh',4,5,45,0.9,'Photography','Clear',720,'Urban Skyline Photography',84);
Insert Into  Mission Values (5300,130,'02-Sep-24',25,'Offaly','Tipperary',8,19,130,0.7,'Photography','Clear',310,'Tourism Promo Footage',70);
Insert Into  Mission Values (5400,140,'13-Oct-24',5,'Dublin','Dublin',8,96,105,1,'Delivery','Clear',250,'Document Delivery Run',72);
Insert Into  Mission Values (5500,150,'20-Sep-23',75,'Mayo','Mayo',8,6,175,0.6,'Survey','Clear',440,'Land Parcel Survey',179);
Insert Into  Mission Values (5600,160,'13-Feb-21',20,'Meath','Meath',7,21,80,0.4,'Inspection','Windy',720,'Bridge Structural Inspection',73);
Insert Into  Mission Values (5700,170,'10-Apr-23',15,'Kerry','Kerry',4,16,115,1,'Delivery','Clear',170,'Equipment Transfer Flight',76);
Insert Into  Mission Values (5800,180,'25-Mar-24',15,'Fermanagh','Roscommon',5,20,105,3,'Delivery','Clear',180,'Equipment Transfer Flight',80);
Insert Into  Mission Values (5900,190,'04-Dec-19',35,'Carlow','Carlow',15,26,90,0.8,'Survey','Rainy',890,'Coastal Erosion Survey',128);
Insert Into  Mission Values (6000,200,'08-Dec-20',20,'Clare','Meath',6,18,90,1.7,'Survey','Rainy',820,'Topographic Scan',74);
Insert Into  Mission Values (6100,210,'30-Apr-24',35,'Meath','Meath',5,9,55,0.1,'Photography','Hailstones',440,'Tourism Promo Footage',75);
Insert Into  Mission Values (6200,220,'29-Jan-22',20,'Louth','Louth',9,27,20,1.2,'Inspection','Windy',400,'Powerline Routine Inspection',78);
Insert Into  Mission Values (6300,230,'13-Mar-20',40,'Louth','Louth',1,2,70,0.8,'Inspection','Clear',270,'Powerline Routine Inspection',88);
Insert Into  Mission Values (6400,240,'28-Jun-22',60,'Cork','Kilkenny',15,15,100,0.7,'Survey','Rainy',480,'Coastal Erosion Survey',173);
Insert Into  Mission Values (6500,250,'25-Jun-23',75,'Monaghan','Monaghan',4,3,100,4.5,'Delivery','Clear',190,'Medical Supply Drop',196);
Insert Into  Mission Values (6600,260,'14-Oct-24',10,'Longford','Longford',3,18,65,0.4,'Inspection','Clear',240,'Bridge Structural Inspection',48);
Insert Into  Mission Values (6700,270,'14-May-21',15,'Louth','Louth',15,60,50,1,'Delivery','Clear',150,'Emergency Parcel Deployment',120);
Insert Into  Mission Values (6800,280,'02-May-23',10,'Offaly','Offaly',4,24,10,1.7,'Inspection','Hailstones',640,'Roof Damage Assessment',50);
Insert Into  Mission Values (6900,290,'12-Oct-24',40,'Kildare','Kildare',3,5,90,1.5,'Photography','Snow',760,'Urban Skyline Photography',76);
Insert Into  Mission Values (7000,300,'01-Dec-24',10,'Waterford','Waterford',6,36,65,2,'Delivery','Windy',70,'Medical Supply Drop',74);
Insert Into  Mission Values (7100,10,'15-Jun-23',5,'Leitrim','Kerry',8,96,115,0.8,'Photography','Clear',320,'Aerial Landscape Shoot',46);
Insert Into  Mission Values (7200,20,'17-Nov-21',80,'Roscommon','Roscommon',1,1,85,0.1,'Photography','Clear',600,'Tourism Promo Footage',119);
Insert Into  Mission Values (7300,30,'22-Aug-24',60,'Down','Down',8,8,80,1,'Inspection','Clear',570,'Wind Turbine Blade Check',135);
Insert Into  Mission Values (7400,40,'15-Nov-24',10,'Fermanagh','Fermanagh',7,42,40,1.4,'Inspection','Windy',790,'Wind Turbine Blade Check',58);
Insert Into  Mission Values (7500,50,'04-Jun-22',90,'Limerick','Limerick',3,2,105,0.9,'Photography','Clear',390,'Tourism Promo Footage',136);
Insert Into  Mission Values (7600,60,'16-Feb-22',85,'Monaghan','Waterford',14,10,170,0.7,'Survey','Clear',1100,'Coastal Erosion Survey',215);
Insert Into  Mission Values (7700,70,'24-May-24',45,'Waterford','Waterford',11,15,85,1,'Survey','Windy',520,'Topographic Scan',134);
Insert Into  Mission Values (7800,80,'07-Mar-23',20,'Galway','Down',3,9,60,0.1,'Inspection','Rainy',210,'Roof Damage Assessment',63);
Insert Into  Mission Values (7900,90,'26-Jun-24',10,'Armagh','Armagh',6,36,55,1.4,'Inspection','Clear',290,'Roof Damage Assessment',55);
Insert Into  Mission Values (8000,100,'30-Mar-21',30,'Westmeath','Kildare',1,2,65,0.3,'Inspection','Hailstones',200,'Roof Damage Assessment',73);
Insert Into  Mission Values (8100,110,'27-May-24',90,'Meath','Monaghan',5,3,85,1.5,'Photography','Clear',380,'Aerial Landscape Shoot',141);
Insert Into  Mission Values (8200,120,'20-Nov-22',10,'Donegal','Donegal',6,36,10,1.9,'Inspection','Rainy',560,'Powerline Routine Inspection',55);
Insert Into  Mission Values (8300,130,'05-Jan-24',75,'Kilkenny','Kilkenny',9,7,60,1,'Delivery','Clear',400,'Equipment Transfer Flight',216);
Insert Into  Mission Values (8400,140,'24-Jun-23',70,'Derry','Carlow',2,2,40,1.2,'Photography','Hailstones',260,'Tourism Promo Footage',109);
Insert Into  Mission Values (8500,150,'28-Feb-21',20,'Wicklow','Wicklow',1,3,35,1.2,'Inspection','Snow',480,'Roof Damage Assessment',58);
Insert Into  Mission Values (8600,160,'01-Apr-21',40,'Longford','Antrim',6,9,75,0.8,'Inspection','Rainy',350,'Bridge Structural Inspection',100);
Insert Into  Mission Values (8700,170,'30-May-20',35,'Monaghan','Monaghan',11,19,100,2,'Survey','Clear',920,'Topographic Scan',116);
Insert Into  Mission Values (8800,180,'28-May-24',5,'Tipperary','Tipperary',10,120,65,4.5,'Delivery','Rainy',70,'Document Delivery Run',80);
Insert Into  Mission Values (8900,190,'22-May-22',40,'Leitrim','Cork',10,15,70,4,'Delivery','Windy',190,'Equipment Transfer Flight',150);
Insert Into  Mission Values (9000,200,'18-Nov-22',60,'Antrim','Antrim',4,4,65,0.3,'Photography','Clear',250,'Construction Progress Photos',102);
Insert Into  Mission Values (9100,210,'06-Jul-23',50,'Waterford','Waterford',9,11,115,1,'Delivery','Rainy',170,'Document Delivery Run',166);
Insert Into  Mission Values (9200,220,'02-Mar-24',35,'Westmeath','Westmeath',5,9,145,1.2,'Photography','Rainy',730,'Urban Skyline Photography',75);
Insert Into  Mission Values (9300,230,'15-Nov-22',5,'Cork','Cork',7,84,35,3,'Delivery','Snow',390,'Medical Supply Drop',68);
Insert Into  Mission Values (9400,240,'27-Nov-23',60,'Cork','Cork',1,1,20,0.7,'Inspection','Clear',950,'Wind Turbine Blade Check',118);
Insert Into  Mission Values (9500,250,'25-Nov-21',10,'Wexford','Wexford',5,30,95,0.6,'Photography','Clear',300,'Tourism Promo Footage',45);
Insert Into  Mission Values (9600,260,'02-Feb-24',60,'Carlow','Carlow',8,8,65,0.8,'Photography','Clear',660,'Urban Skyline Photography',112);
Insert Into  Mission Values (9700,270,'23-Sep-23',40,'Monaghan','Monaghan',7,11,75,0.5,'Delivery','Clear',60,'Document Delivery Run',138);
Insert Into  Mission Values (9800,280,'10-Feb-23',85,'Antrim','Antrim',7,5,55,1.1,'Photography','Clear',800,'Construction Progress Photos',140);
Insert Into  Mission Values (9900,290,'30-May-24',65,'Wexford','Fermanagh',8,7,15,0.8,'Inspection','Snow',840,'Powerline Routine Inspection',143);
Insert Into  Mission Values (10000,300,'02-Oct-24',65,'Down','Meath',2,2,150,0.4,'Photography','Hailstones',420,'Aerial Landscape Shoot',103);
Insert Into  Mission Values (10100,290,'05-Sep-24',65,'Fermanagh','Fermanagh',13,12,25,3.5,'Delivery','Snow',240,'Document Delivery Run',212);
Insert Into  Mission Values (10200,300,'10-May-24',65,'Down','Down',11,10,115,1,'Delivery','Windy',150,'Equipment Transfer Flight',204);
Insert Into  Mission Values (10300,10,'16-May-24',75,'Down','Down',1,1,50,0.4,'Inspection','Windy',730,'Wind Turbine Blade Check',140);
Insert Into  Mission Values (10400,20,'11-Aug-24',20,'Wicklow','Wicklow',15,45,90,1.5,'Survey','Rainy',910,'Crop Health Mapping',101);
Insert Into  Mission Values (10500,30,'16-Jun-24',55,'Monaghan','Monaghan',3,3,65,1.5,'Photography','Rainy',400,'Aerial Landscape Shoot',94);
Insert Into  Mission Values (10600,40,'28-Sep-22',25,'Cork','Louth',7,17,70,0.7,'Inspection','Clear',790,'Roof Damage Assessment',80);
Insert Into  Mission Values (10700,50,'21-Sep-19',75,'Westmeath','Westmeath',2,2,60,0.6,'Inspection','Rainy',440,'Wind Turbine Blade Check',143);
Insert Into  Mission Values (10800,60,'16-Nov-20',60,'Monaghan','Monaghan',7,7,110,1.2,'Photography','Windy',250,'Aerial Landscape Shoot',110);
Insert Into  Mission Values (10900,70,'24-Aug-24',85,'Roscommon','Roscommon',1,1,15,1.7,'Inspection','Hailstones',400,'Wind Turbine Blade Check',155);
Insert Into  Mission Values (11000,310,'27-Aug-22',75,'Carlow','Carlow',4,3,120,0.5,'Photography','Clear',740,'Construction Progress Photos',120);
Insert Into  Mission Values (11100,320,'26-Nov-24',45,'Leitrim','Leitrim',14,19,45,3.5,'Delivery','Windy',150,'Emergency Parcel Deployment',176);
commit;

USE [master]
GO
/****** Object:  Database [Patient]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE DATABASE [Patient]
 
GO
ALTER DATABASE [Patient] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Patient].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Patient] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Patient] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Patient] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Patient] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Patient] SET ARITHABORT OFF 
GO
ALTER DATABASE [Patient] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Patient] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Patient] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Patient] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Patient] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Patient] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Patient] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Patient] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Patient] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Patient] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Patient] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Patient] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Patient] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Patient] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Patient] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Patient] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Patient] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Patient] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Patient] SET  MULTI_USER 
GO
ALTER DATABASE [Patient] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Patient] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Patient] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Patient] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Patient] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Patient]
GO
/****** Object:  User [users]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE USER [users] FOR LOGIN [BUILTIN\Users]
GO
/****** Object:  User [patientSQL]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE USER [patientSQL] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [users]
GO
ALTER ROLE [db_owner] ADD MEMBER [patientSQL]
GO
/****** Object:  Table [dbo].[category]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[categoryId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[concentrationUnit]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[concentrationUnit](
	[concentrationCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_concentrationUnit] PRIMARY KEY CLUSTERED 
(
	[concentrationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[country]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[countryCode] [char](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[postalPattern] [varchar](120) NULL,
	[phonePattern] [varchar](50) NULL,
 CONSTRAINT [PK_country] PRIMARY KEY CLUSTERED 
(
	[countryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[diagnosis]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diagnosis](
	[diagnosisId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[categoryId] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[dispensingUnit]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[dispensingUnit](
	[dispensingCode] [varchar](50) NOT NULL,
 CONSTRAINT [PK_dispensingUnit] PRIMARY KEY CLUSTERED 
(
	[dispensingCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[medication]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medication](
	[din] [varchar](50) NOT NULL,
	[name] [nvarchar](20) NULL,
	[image] [varchar](50) NULL,
	[medicationTypeId] [int] NOT NULL,
	[dispensingCode] [varchar](50) NULL,
	[concentration] [float] NOT NULL,
	[concentrationCode] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[medicationType]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[medicationType](
	[medicationTypeId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_medicationType] PRIMARY KEY CLUSTERED 
(
	[medicationTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[patient]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[patientId] [int] IDENTITY(1,1) NOT NULL,
	[firstName] [varchar](50) NOT NULL,
	[lastName] [varchar](50) NOT NULL,
	[address] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[provinceCode] [char](10) NULL,
	[postalCode] [varchar](50) NULL,
	[OHIP] [varchar](50) NULL,
	[dateOfBirth] [datetime] NULL,
	[deceased] [bit] NOT NULL,
	[dateOfDeath] [datetime] NULL,
	[homePhone] [varchar](50) NULL,
	[gender] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[patientMedication]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patientMedication](
	[patientMedicationId] [int] IDENTITY(1,1) NOT NULL,
	[patientTreatmentId] [int] NOT NULL,
	[din] [varchar](50) NOT NULL,
	[dose] [float] NULL,
	[frequency] [int] NULL,
	[frequencyPeriod] [varchar](50) NULL,
	[exactMinMax] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[patientTreatment]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patientTreatment](
	[patientTreatmentId] [int] IDENTITY(1,1) NOT NULL,
	[patientId] [int] NULL,
	[treatmentId] [int] NULL,
	[datePrescribed] [datetime] NOT NULL,
	[comments] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[province]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[province](
	[provinceCode] [char](10) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[countryCode] [char](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[treatment]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treatment](
	[treatmentId] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[description] [varchar](max) NULL,
	[diagnosisId] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[treatmentMedication]    Script Date: 2017-10-05 11:18:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[treatmentMedication](
	[treatmentId] [int] NOT NULL,
	[din] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([categoryId], [name]) VALUES (1, N'cardiovascular')
INSERT [dbo].[category] ([categoryId], [name]) VALUES (2, N'respiratory')
INSERT [dbo].[category] ([categoryId], [name]) VALUES (3, N'circulatory')
INSERT [dbo].[category] ([categoryId], [name]) VALUES (4, N'dermatology')
INSERT [dbo].[category] ([categoryId], [name]) VALUES (5, N'musculoskeletal')
SET IDENTITY_INSERT [dbo].[category] OFF
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'%')
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'cc')
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'mcg')
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'mg')
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'n/a')
INSERT [dbo].[concentrationUnit] ([concentrationCode]) VALUES (N'UI')
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern]) VALUES (N'CA        ', N'Canada', N'[ABCEGHJKLMNPRSTVXY]\d[ABCEGHJKLMNPRSTVWXYZ] ?\d[ABCEGHJKLMNPRSTVWXYZ]\d', N'\d{3}-\d{3}-\d{4}')
INSERT [dbo].[country] ([countryCode], [name], [postalPattern], [phonePattern]) VALUES (N'US        ', N'United States Of America', N'\d{5}(-\d{4})?', N'\(\d{3}\) \d{3}-\d{4}')
SET IDENTITY_INSERT [dbo].[diagnosis] ON 

INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (1, N'eczema', 4)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (2, N'hives', 4)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (3, N'stenosis of left coronary artery', 1)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (4, N'mitral valve disease', 1)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (5, N'ventral septal defect', 1)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (6, N'asthma', 2)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (7, N'bronchial infection', 2)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (8, N'pneumonia', 2)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (9, N'varicose veins', 3)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (10, N'stenosis of carotid artery', 3)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (11, N'peripheral vascular disease', 3)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (12, N'basal cell carcinoma', 4)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (13, N'compound fracture of femur', 5)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (14, N'greenstick fracture - radius', 5)
INSERT [dbo].[diagnosis] ([diagnosisId], [name], [categoryId]) VALUES (15, N'fractured clavicle', 5)
SET IDENTITY_INSERT [dbo].[diagnosis] OFF
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'caplets')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'doses')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'each')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'mg')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'ml')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'oz')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'tablets')
INSERT [dbo].[dispensingUnit] ([dispensingCode]) VALUES (N'tsp')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'00178403', N'Aspirin', N'Aspirin.jpg', 1, N'tablets', 325, N'mg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'00559407', N'Tylenol', N'Tylenol.jpg', 1, N'tablets', 500, N'mg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'02017849', N'Benadryl', N'benadryl.jpg', 2, N'caplets', 25, N'mg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'90893845', N'Himilayan Salts', N'bathSalts.jpg', 3, N'tsp', 98, N'%')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'92397584', N'calamine lotion', N'calamine.jpg', 4, N'tsp', 90, N'%')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'97837248', N'penicillin', N'penicillin.jpg', 5, N'ml', 10, N'mg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'97897898', N'suture', N'suture.jpg', 6, N'each', 0, N'n/a')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'97899798', N'heparin', N'heparinAnticoagulant.jpg', 7, N'ml', 12, N'mg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'97988768', N'Flovent HFA', N'flovent.jpg', 8, N'doses', 125, N'mcg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'98589753', N'Irish oatmeal bath', N'oatmealBath.jpg', 9, N'oz', 100, N'%')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'98748734', N'ratio-salbutamol', N'salbutamol.jpg', 8, N'doses', 100, N'mcg')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'98765421', N'RossValve', N'aorticValve.jpg', 10, N'each', 0, N'n/a')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'98798375', N'sitzbath', N'SitzBath.jpg', 11, N'each', 50, N'%')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'98798798', N'stent, arterial', N'stent.jpg', 12, N'each', 0, N'n/a')
INSERT [dbo].[medication] ([din], [name], [image], [medicationTypeId], [dispensingCode], [concentration], [concentrationCode]) VALUES (N'99876587', N'Hydrocortizone', N'cortisone.jpg', 13, N'mg', 1, N'%')
SET IDENTITY_INSERT [dbo].[medicationType] ON 

INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (1, N'pain relief')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (2, N'alergy relief')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (3, N'bath salts')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (4, N'itch relief')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (5, N'antibacterial')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (6, N'closing incisions')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (7, N'blood thinning')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (8, N'asthma relief')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (9, N'baths')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (10, N'heart valve')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (11, N'swelling, redness')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (12, N'opening arteries')
INSERT [dbo].[medicationType] ([medicationTypeId], [name]) VALUES (13, N'rash/eczema relief')
SET IDENTITY_INSERT [dbo].[medicationType] OFF
SET IDENTITY_INSERT [dbo].[patient] ON 

INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (1, N'Fred', N'Penner', N'123 SongBird Rd', N'Kitchener', N'ON        ', N'K3K 5M3', N'4562123545JK', CAST(N'1945-03-04T00:00:00.000' AS DateTime), 1, CAST(N'1999-06-12T00:00:00.000' AS DateTime), N'5196547894', N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (3, N'John', N'Doe', NULL, NULL, N'BC        ', NULL, NULL, NULL, 0, NULL, NULL, N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (4, N'Jane', N'Doe', NULL, NULL, N'BC        ', NULL, NULL, NULL, 0, NULL, NULL, N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (5, N'Mary', N'Miller', N'78 Kingsway Court', N'Kitcheneer', N'ON        ', N'K6K 3L3', N'0980980980UP', CAST(N'1998-02-23T00:00:00.000' AS DateTime), 0, NULL, N'5195648971', N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (6, N'Teddy', N'Popping', N'56 Middleton Rd', N'Waterloo', N'ON        ', N'KJ6 5K4', N'2817816545KL', CAST(N'1950-06-09T00:00:00.000' AS DateTime), 0, NULL, N'5194565987', N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (7, N'Shania', N'Twang', N'86 Storey Lane', N'Waterloo', N'ON        ', N'K3K 2K2', N'9898538730TF', CAST(N'1987-05-05T00:00:00.000' AS DateTime), 0, NULL, N'5192318546', N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (8, N'Heddy', N'Lorse', N'68 Overhill Dr', N'Kitchener', N'ON        ', N'K4K 4K4', N'6432684318YY', CAST(N'1918-04-21T00:00:00.000' AS DateTime), 0, NULL, N'5198713787', N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (9, N'Tony', N'Arbuckle', N'78 Highland Rd', N'Kitchener', N'ON        ', N'F2G 3G3', N'098487I763GF', CAST(N'1962-04-23T00:00:00.000' AS DateTime), 0, NULL, N'5195987261', N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (10, N'Gloria', N'Kerblunski', N'15 Dairy Rd', N'Kitchener', N'ON        ', N'G2G 7J8', N'8457643987NM', CAST(N'1978-05-03T00:00:00.000' AS DateTime), 0, NULL, N'5195648915', N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (11, N'Jebu', N'Yulio', N'375 Park St', N'Waterloo', N'ON        ', N'L8D 9F9', N'8579874953GH', CAST(N'1953-03-10T00:00:00.000' AS DateTime), 0, NULL, N'5198979561', N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (12, N'Eisen', N'Stroman', N'25 Elm St', N'Cambridge', N'ON        ', N'L2K 4L4', N'2323903255LM', CAST(N'1949-11-22T00:00:00.000' AS DateTime), 0, NULL, N'5198765423', N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (13, N'Donna', N'Koragasu', N'65 Windy Lane', N'Waterloo', N'ON        ', N'L8K 9I9', N'2898978978KL', CAST(N'1979-01-21T00:00:00.000' AS DateTime), 0, NULL, N'5198765413', N'F')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (14, N'Tayo', N'Izanami', N'89 Kami Crt.', N'Kitchener', N'ON        ', N'KL4 3K1', N'8973987240FG', CAST(N'1967-07-21T00:00:00.000' AS DateTime), 0, NULL, N'5197845456', N'M')
INSERT [dbo].[patient] ([patientId], [firstName], [lastName], [address], [city], [provinceCode], [postalCode], [OHIP], [dateOfBirth], [deceased], [dateOfDeath], [homePhone], [gender]) VALUES (15, N'Jewel', N'Weber', N'56 Weber St', N'Kitchener', N'ON        ', N'F4F 4F4', N'8728934875TR', CAST(N'1973-02-27T00:00:00.000' AS DateTime), 0, NULL, N'5198765463', N'F')
SET IDENTITY_INSERT [dbo].[patient] OFF
SET IDENTITY_INSERT [dbo].[patientMedication] ON 

INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax]) VALUES (1, 3, N'99876587', 1, 2, N'day', N'exact')
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax]) VALUES (2, 4, N'99876587', 1, 2, N'day', N'exact')
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax]) VALUES (3, 6, N'00178403', 1, 1, N'week', N'exact')
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax]) VALUES (4, 6, N'97899798', 1, 3, N'day', N'max')
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax]) VALUES (5, 7, N'00178403', 1, 1, N'day', N'exact')
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax]) VALUES (6, 9, N'98798798', 1, 1, N'day', N'min')
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax]) VALUES (7, 10, N'00178403', 1, 1, N'month', N'exact')
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax]) VALUES (8, 11, N'97988768', 2, 0, N'week', N'exact')
INSERT [dbo].[patientMedication] ([patientMedicationId], [patientTreatmentId], [din], [dose], [frequency], [frequencyPeriod], [exactMinMax]) VALUES (9, 11, N'98748734', 2, 0, N'day', N'exact')
SET IDENTITY_INSERT [dbo].[patientMedication] OFF
SET IDENTITY_INSERT [dbo].[patientTreatment] ON 

INSERT [dbo].[patientTreatment] ([patientTreatmentId], [patientId], [treatmentId], [datePrescribed], [comments]) VALUES (3, 1, 1, CAST(N'1987-09-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [patientId], [treatmentId], [datePrescribed], [comments]) VALUES (4, 1, 1, CAST(N'1989-10-12T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [patientId], [treatmentId], [datePrescribed], [comments]) VALUES (5, 1, 2, CAST(N'1989-10-12T00:00:00.000' AS DateTime), N'added to steriod cream')
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [patientId], [treatmentId], [datePrescribed], [comments]) VALUES (6, 5, 7, CAST(N'1998-02-08T00:00:00.000' AS DateTime), N'put on exercise program & blood thinners')
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [patientId], [treatmentId], [datePrescribed], [comments]) VALUES (7, 5, 7, CAST(N'1998-03-10T00:00:00.000' AS DateTime), N'more thinners')
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [patientId], [treatmentId], [datePrescribed], [comments]) VALUES (8, 5, 7, CAST(N'1999-02-09T00:00:00.000' AS DateTime), N'heavier exercise stuff')
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [patientId], [treatmentId], [datePrescribed], [comments]) VALUES (9, 5, 5, CAST(N'1999-04-15T00:00:00.000' AS DateTime), N'full failure of artery')
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [patientId], [treatmentId], [datePrescribed], [comments]) VALUES (10, 5, 7, CAST(N'1999-04-16T00:00:00.000' AS DateTime), N'heavier thinners')
INSERT [dbo].[patientTreatment] ([patientTreatmentId], [patientId], [treatmentId], [datePrescribed], [comments]) VALUES (11, 1, 13, CAST(N'1990-10-08T00:00:00.000' AS DateTime), N'associated with eczema?')
SET IDENTITY_INSERT [dbo].[patientTreatment] OFF
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'BC        ', N'British Columbia', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'NL        ', N'Newfoundland and Labrador', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'ON        ', N'Ontario', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'QC        ', N'Quebec', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'MI        ', N'Michigan', N'US        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'AB        ', N'Alberta', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'MB        ', N'Manitoba', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'NB        ', N'New Brunswick                 ', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'NS        ', N'Nova Scotia', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'PI        ', N'Prince Edward Island          ', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'SK        ', N'Saskatchewan                  ', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'NU        ', N'Nunavut', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'YT        ', N'Yukon', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'NT        ', N'Northwest Territories', N'CA        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'NY        ', N'New York', N'US        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'KY        ', N'Kentucky', N'US        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'CA        ', N'California', N'US        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'ME        ', N'Maine', N'US        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'NJ        ', N'New Jersey', N'US        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'CT        ', N'Connecticut', N'US        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'PA        ', N'Pennsylvania', N'US        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'FL        ', N'Forida', N'US        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'AZ        ', N'Arizona', N'US        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'GA        ', N'Georgia', N'US        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'DC        ', N'District of Columbia', N'US        ')
INSERT [dbo].[province] ([provinceCode], [name], [countryCode]) VALUES (N'WA        ', N'Washington', N'US        ')
SET IDENTITY_INSERT [dbo].[treatment] ON 

INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (1, N'steroid cream', N'topical use, initialliy 0.10, max concentration', 1)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (2, N'baths', N'oatmeal-based soaps and baths salts, usually every other day', 1)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (3, N'antihistamine', N'oral or topical', 2)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (4, N'calamine lotion', N'topical to affected area', 2)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (5, N'insertion of stent', N'insert through catheter from femoral/brachial artery, dilate at site', 3)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (6, N'artery replacement', N'open-heart surgery', 3)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (7, N'lifestyle changes, medication', N'aspirin & blood thinners', 3)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (8, N'valve replacement', N'open heart surgery: mechanical or biological valve', 4)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (9, N'antibiotics', N'penicillin', 4)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (10, N'anticlotting medication', N'aspirin  blood thinners', 4)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (11, N'suturing', N'suturing the opening between the left & right ventricles', 5)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (12, N'patch', N'suturing a patch over opening', 5)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (13, N'inhaler: dilator', N'salbutamol to dilate broncial', 6)
INSERT [dbo].[treatment] ([treatmentId], [name], [description], [diagnosisId]) VALUES (14, N'inhaler: steriod', N'flovent to strengthen alveoli & reduce inflamation', 6)
SET IDENTITY_INSERT [dbo].[treatment] OFF
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (1, N'99876587')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (2, N'90893845')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (2, N'92397584')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (2, N'98589753')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (3, N'02017849')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (4, N'92397584')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (5, N'00559407')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (5, N'98798798')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (6, N'97837248')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (7, N'00178403')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (7, N'00559407')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (7, N'97899798')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (8, N'97897898')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (8, N'98765421')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (9, N'97837248')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (10, N'00178403')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (10, N'97899798')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (11, N'97897898')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (12, N'97897898')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (13, N'98748734')
INSERT [dbo].[treatmentMedication] ([treatmentId], [din]) VALUES (14, N'97988768')
/****** Object:  Index [aaaaacategory_PK]    Script Date: 2017-10-05 11:18:04 AM ******/
ALTER TABLE [dbo].[category] ADD  CONSTRAINT [aaaaacategory_PK] PRIMARY KEY NONCLUSTERED 
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [categoryId]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [categoryId] ON [dbo].[category]
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaadiagnosis_PK]    Script Date: 2017-10-05 11:18:04 AM ******/
ALTER TABLE [dbo].[diagnosis] ADD  CONSTRAINT [aaaaadiagnosis_PK] PRIMARY KEY NONCLUSTERED 
(
	[diagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [ailmentId]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [ailmentId] ON [dbo].[diagnosis]
(
	[diagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [categorydiagnosis]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [categorydiagnosis] ON [dbo].[diagnosis]
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [diseasecategoryId]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [diseasecategoryId] ON [dbo].[diagnosis]
(
	[categoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aaaaamedication_PK]    Script Date: 2017-10-05 11:18:04 AM ******/
ALTER TABLE [dbo].[medication] ADD  CONSTRAINT [aaaaamedication_PK] PRIMARY KEY NONCLUSTERED 
(
	[din] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaapatient_PK]    Script Date: 2017-10-05 11:18:04 AM ******/
ALTER TABLE [dbo].[patient] ADD  CONSTRAINT [aaaaapatient_PK] PRIMARY KEY NONCLUSTERED 
(
	[patientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [homePhone]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [homePhone] ON [dbo].[patient]
(
	[homePhone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [patientId]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [patientId] ON [dbo].[patient]
(
	[patientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [postalCode]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [postalCode] ON [dbo].[patient]
(
	[postalCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [provinceCode]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [provinceCode] ON [dbo].[patient]
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [provincepatient]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [provincepatient] ON [dbo].[patient]
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaapatientMedication_PK]    Script Date: 2017-10-05 11:18:04 AM ******/
ALTER TABLE [dbo].[patientMedication] ADD  CONSTRAINT [aaaaapatientMedication_PK] PRIMARY KEY NONCLUSTERED 
(
	[patientMedicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [medicationpatientMedication]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [medicationpatientMedication] ON [dbo].[patientMedication]
(
	[din] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [patientTreatmentpatientMedication]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [patientTreatmentpatientMedication] ON [dbo].[patientMedication]
(
	[patientTreatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaapatientTreatment_PK]    Script Date: 2017-10-05 11:18:04 AM ******/
ALTER TABLE [dbo].[patientTreatment] ADD  CONSTRAINT [aaaaapatientTreatment_PK] PRIMARY KEY NONCLUSTERED 
(
	[patientTreatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [patientId]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [patientId] ON [dbo].[patientTreatment]
(
	[patientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [patientpatientProcedure]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [patientpatientProcedure] ON [dbo].[patientTreatment]
(
	[patientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [patientProcedureId]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [patientProcedureId] ON [dbo].[patientTreatment]
(
	[patientTreatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [procedureId]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [procedureId] ON [dbo].[patientTreatment]
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [procedurepatientProcedure]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [procedurepatientProcedure] ON [dbo].[patientTreatment]
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aaaaaprovince_PK]    Script Date: 2017-10-05 11:18:04 AM ******/
ALTER TABLE [dbo].[province] ADD  CONSTRAINT [aaaaaprovince_PK] PRIMARY KEY NONCLUSTERED 
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ProvinceCode]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [ProvinceCode] ON [dbo].[province]
(
	[provinceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [aaaaatreatment_PK]    Script Date: 2017-10-05 11:18:04 AM ******/
ALTER TABLE [dbo].[treatment] ADD  CONSTRAINT [aaaaatreatment_PK] PRIMARY KEY NONCLUSTERED 
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [diagnosisId]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [diagnosisId] ON [dbo].[treatment]
(
	[diagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [diagnosisprocedure]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [diagnosisprocedure] ON [dbo].[treatment]
(
	[diagnosisId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [procedureId]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [procedureId] ON [dbo].[treatment]
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [aaaaatreatmentMedication_PK]    Script Date: 2017-10-05 11:18:04 AM ******/
ALTER TABLE [dbo].[treatmentMedication] ADD  CONSTRAINT [aaaaatreatmentMedication_PK] PRIMARY KEY NONCLUSTERED 
(
	[treatmentId] ASC,
	[din] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [medicationtreatmentMedication]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [medicationtreatmentMedication] ON [dbo].[treatmentMedication]
(
	[din] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [treatmentId]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [treatmentId] ON [dbo].[treatmentMedication]
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [treatmenttreatmentMedication]    Script Date: 2017-10-05 11:18:04 AM ******/
CREATE NONCLUSTERED INDEX [treatmenttreatmentMedication] ON [dbo].[treatmentMedication]
(
	[treatmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[diagnosis] ADD  CONSTRAINT [DF__diagnosis__categ__1ED998B2]  DEFAULT ((0)) FOR [categoryId]
GO
ALTER TABLE [dbo].[patientMedication] ADD  CONSTRAINT [DF__patientMe__patie__0F975522]  DEFAULT ((0)) FOR [patientTreatmentId]
GO
ALTER TABLE [dbo].[patientMedication] ADD  CONSTRAINT [DF__patientMed__dose__108B795B]  DEFAULT ((0)) FOR [dose]
GO
ALTER TABLE [dbo].[patientMedication] ADD  CONSTRAINT [DF__patientMe__frequ__117F9D94]  DEFAULT ((0)) FOR [frequency]
GO
ALTER TABLE [dbo].[patientMedication] ADD  CONSTRAINT [DF_patientMedication_exactMinMax]  DEFAULT (N'exact') FOR [exactMinMax]
GO
ALTER TABLE [dbo].[patientTreatment] ADD  CONSTRAINT [DF__patientTr__patie__09DE7BCC]  DEFAULT ((0)) FOR [patientId]
GO
ALTER TABLE [dbo].[patientTreatment] ADD  CONSTRAINT [DF__patientTr__treat__0AD2A005]  DEFAULT ((0)) FOR [treatmentId]
GO
ALTER TABLE [dbo].[treatment] ADD  CONSTRAINT [DF__treatment__diagn__014935CB]  DEFAULT ((0)) FOR [diagnosisId]
GO
ALTER TABLE [dbo].[treatmentMedication] ADD  CONSTRAINT [DF__treatment__treat__7C8480AE]  DEFAULT ((0)) FOR [treatmentId]
GO
ALTER TABLE [dbo].[diagnosis]  WITH CHECK ADD  CONSTRAINT [diagnosis_FK00] FOREIGN KEY([categoryId])
REFERENCES [dbo].[category] ([categoryId])
GO
ALTER TABLE [dbo].[diagnosis] CHECK CONSTRAINT [diagnosis_FK00]
GO
ALTER TABLE [dbo].[medication]  WITH CHECK ADD  CONSTRAINT [FK_medication_concentrationUnit] FOREIGN KEY([concentrationCode])
REFERENCES [dbo].[concentrationUnit] ([concentrationCode])
GO
ALTER TABLE [dbo].[medication] CHECK CONSTRAINT [FK_medication_concentrationUnit]
GO
ALTER TABLE [dbo].[medication]  WITH CHECK ADD  CONSTRAINT [FK_medication_dispensingUnit] FOREIGN KEY([dispensingCode])
REFERENCES [dbo].[dispensingUnit] ([dispensingCode])
GO
ALTER TABLE [dbo].[medication] CHECK CONSTRAINT [FK_medication_dispensingUnit]
GO
ALTER TABLE [dbo].[medication]  WITH CHECK ADD  CONSTRAINT [FK_medication_medicationType] FOREIGN KEY([medicationTypeId])
REFERENCES [dbo].[medicationType] ([medicationTypeId])
GO
ALTER TABLE [dbo].[medication] CHECK CONSTRAINT [FK_medication_medicationType]
GO
ALTER TABLE [dbo].[patient]  WITH CHECK ADD  CONSTRAINT [patient_FK00] FOREIGN KEY([provinceCode])
REFERENCES [dbo].[province] ([provinceCode])
GO
ALTER TABLE [dbo].[patient] CHECK CONSTRAINT [patient_FK00]
GO
ALTER TABLE [dbo].[patientMedication]  WITH CHECK ADD  CONSTRAINT [FK_patientMedication_medication] FOREIGN KEY([din])
REFERENCES [dbo].[medication] ([din])
GO
ALTER TABLE [dbo].[patientMedication] CHECK CONSTRAINT [FK_patientMedication_medication]
GO
ALTER TABLE [dbo].[patientMedication]  WITH CHECK ADD  CONSTRAINT [FK_patientMedication_patientTreatment] FOREIGN KEY([patientTreatmentId])
REFERENCES [dbo].[patientTreatment] ([patientTreatmentId])
GO
ALTER TABLE [dbo].[patientMedication] CHECK CONSTRAINT [FK_patientMedication_patientTreatment]
GO
ALTER TABLE [dbo].[patientTreatment]  WITH CHECK ADD  CONSTRAINT [patientTreatment_FK00] FOREIGN KEY([patientId])
REFERENCES [dbo].[patient] ([patientId])
GO
ALTER TABLE [dbo].[patientTreatment] CHECK CONSTRAINT [patientTreatment_FK00]
GO
ALTER TABLE [dbo].[patientTreatment]  WITH CHECK ADD  CONSTRAINT [patientTreatment_FK01] FOREIGN KEY([treatmentId])
REFERENCES [dbo].[treatment] ([treatmentId])
GO
ALTER TABLE [dbo].[patientTreatment] CHECK CONSTRAINT [patientTreatment_FK01]
GO
ALTER TABLE [dbo].[province]  WITH CHECK ADD  CONSTRAINT [FK_province_country] FOREIGN KEY([countryCode])
REFERENCES [dbo].[country] ([countryCode])
GO
ALTER TABLE [dbo].[province] CHECK CONSTRAINT [FK_province_country]
GO
ALTER TABLE [dbo].[treatment]  WITH CHECK ADD  CONSTRAINT [treatment_FK00] FOREIGN KEY([diagnosisId])
REFERENCES [dbo].[diagnosis] ([diagnosisId])
GO
ALTER TABLE [dbo].[treatment] CHECK CONSTRAINT [treatment_FK00]
GO
ALTER TABLE [dbo].[treatmentMedication]  WITH CHECK ADD  CONSTRAINT [FK_treatmentMedication_medication] FOREIGN KEY([din])
REFERENCES [dbo].[medication] ([din])
GO
ALTER TABLE [dbo].[treatmentMedication] CHECK CONSTRAINT [FK_treatmentMedication_medication]
GO
ALTER TABLE [dbo].[treatmentMedication]  WITH CHECK ADD  CONSTRAINT [FK_treatmentMedication_treatment] FOREIGN KEY([treatmentId])
REFERENCES [dbo].[treatment] ([treatmentId])
GO
ALTER TABLE [dbo].[treatmentMedication] CHECK CONSTRAINT [FK_treatmentMedication_treatment]
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'random key, allowing category to be renamed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'categoryId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'categoryId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1605' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'major medical categories: cardiology, respiratory, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05/01/2007 8:39:53 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29/05/2007 1:22:41 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'category' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'category'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2-character short form for country' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country', @level2type=N'COLUMN',@level2name=N'countryCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'formal name of country' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'regular expression used to validate the postal or zip code for this country, includes ^ and $' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country', @level2type=N'COLUMN',@level2name=N'postalPattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'regular expression used to validate a phone number in this country, includes ^ and $' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country', @level2type=N'COLUMN',@level2name=N'phonePattern'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'list of countries and data pertinent to them' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'country'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'??I?????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'random key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'diagnosisId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'diagnosisId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'diagnosis' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2805' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'medical name for ailment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'diagnosis' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'?L??????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link to major categories' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'categoryId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'categoryId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'diagnosis' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'COLUMN',@level2name=N'categoryId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05/01/2007 8:41:56 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'05/01/2007 4:51:33 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'diagnosis' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ConstraintText', @value=N'You cannot add, change, or delete this record because of the relationship restriction between the tables ''category'' and ''diagnosis''.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'diagnosis', @level2type=N'CONSTRAINT',@level2name=N'diagnosis_FK00'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'8-digit drug identification number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_InputMask', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'name of drug as branded by manufacturer' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'brandName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'brandName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'file-name of product image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'image' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'image'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'1890' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'«???????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'type of drug ... anticoagulant, antihistimine, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'20' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'type' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'medicationTypeId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dispensing units: pills, capsils, mg, tablespoons, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'units' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'units' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'dispensingCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'concentration quantity, n concentration units, zero if n/a' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'concentration' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'concentration' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication', @level2type=N'COLUMN',@level2name=N'concentration'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'10/05/2007 1:34:43 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'18/06/2007 4:31:38 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'medication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'15' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'medication'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'random patient number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patientId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'patientId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'patient''s first or given name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'firstName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'firstName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'firstName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'É???????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'patient''s surname or family name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'lastName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'lastName' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'lastName'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'street address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'address' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'address'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'city' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'city' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'30' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'city' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'city'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2-character province code' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provinceCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provinceCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'postal code: A9A 9A9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'postalCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'postalCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'postalCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'12-character provincial medical' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'OHIP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'7' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'OHIP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'OHIP'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'date of birth' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'dateOfBirth' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'dateOfBirth' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfBirth'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'if yes, date of death required else, ignore date of death' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'106' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Format', @value=N'Yes/No' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'deceased' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'deceased' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'deceased'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'date of death (null if alive)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'dateOfDeath' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'dateOfDeath' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'dateOfDeath'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'10-digit home phone number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'homePhone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'11' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'homePhone' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'homePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'M or F' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'gendre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'gendre' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'COLUMN',@level2name=N'gender'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05/01/2007 8:37:11 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'18/07/2008 11:02:39 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ConstraintText', @value=N'You cannot add, change, or delete this record because of the relationship restriction between the tables ''province'' and ''patient''.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patient', @level2type=N'CONSTRAINT',@level2name=N'patient_FK00'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link back to the procedure for this patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patientTreatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'patientTreatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link to medication by drug identification number' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'number of dispensing units at a time' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'dose' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'dose' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'6' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'dose'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'number of doses per day/week/month; zero if as-required' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'frequency' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'frequency' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'period of frequency: per day, week, month or as-required' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'frequencyPeriod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'dosage frequency is exactly x periods, minimum of, or maximum of' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication', @level2type=N'COLUMN',@level2name=N'exactMinMax'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05/01/2007 3:21:50 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29/05/2007 1:13:47 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patientMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'random key for treatment on this patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patientTreatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'patientTreatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientTreatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientTreatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link back to patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patientId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'patientId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientTreatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'patientId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link back to treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'treatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'treatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientTreatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'date treatment prescribed to patient' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'datePrescribed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'datePrescribed' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientTreatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'8' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'datePrescribed'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2400' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'general free-form comments about treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'comments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'5' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'comments' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'patientTreatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'COLUMN',@level2name=N'comments'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05/01/2007 8:53:09 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29/05/2007 1:13:47 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'patientTreatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'9' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ConstraintText', @value=N'You cannot add, change, or delete this record because of the relationship restriction between the tables ''treatment'' and ''patientTreatment''.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'patientTreatment', @level2type=N'CONSTRAINT',@level2name=N'patientTreatment_FK01'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'2-character province code ... ON, BC, etc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'provinceCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'provinceCode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'province' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'provinceCode'
GO
EXEC sys.sp_addextendedproperty @name=N'AggregateType', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2820' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'full province name ... Ontario, etc.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'province' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'TextAlign', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'12/01/2007 8:47:41 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'DisplayViewsOnSharePointSite', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'FilterOnLoad', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'HideNewField', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'18/07/2008 11:05:46 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'province' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'OrderByOnLoad', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'TotalsRow', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'province'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'17' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'random key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'treatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'treatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'2640' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'formal name of the procedure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'name'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'3585' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'free-form decription of the procedure' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'12' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'description'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'915' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'GUID', @value=N'????????' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link back to diagnosis' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'diagnosisId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'diagnosisId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'COLUMN',@level2name=N'diagnosisId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'05/01/2007 11:22:02 AM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29/05/2007 1:18:56 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_ConstraintText', @value=N'You cannot add, change, or delete this record because of the relationship restriction between the tables ''diagnosis'' and ''treatment''.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatment', @level2type=N'CONSTRAINT',@level2name=N'treatment_FK00'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'DefaultValue', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DecimalPlaces', @value=N'255' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link to treatment this record is for' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'treatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'treatmentId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'treatmentMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'4' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'treatmentId'
GO
EXEC sys.sp_addextendedproperty @name=N'AllowZeroLength', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'AppendOnly', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'CollatingOrder', @value=N'1033' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnHidden', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnOrder', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'ColumnWidth', @value=N'-1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'DataUpdatable', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'link to medication for this treatment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DisplayControl', @value=N'109' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMEMode', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_IMESentMode', @value=N'3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'DIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'OrdinalPosition', @value=N'1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Required', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Size', @value=N'50' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceField', @value=N'DIN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'SourceTable', @value=N'treatmentMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Type', @value=N'10' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'UnicodeCompression', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication', @level2type=N'COLUMN',@level2name=N'din'
GO
EXEC sys.sp_addextendedproperty @name=N'Attributes', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'DateCreated', @value=N'29/05/2007 1:18:23 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'LastUpdated', @value=N'29/05/2007 1:19:00 PM' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DefaultView', @value=N'2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_OrderByOn', @value=N'False' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Orientation', @value=N'0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'Name', @value=N'treatmentMedication' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'RecordCount', @value=N'21' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
EXEC sys.sp_addextendedproperty @name=N'Updatable', @value=N'True' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'treatmentMedication'
GO
USE [master]
GO
ALTER DATABASE [Patient] SET  READ_WRITE 
GO

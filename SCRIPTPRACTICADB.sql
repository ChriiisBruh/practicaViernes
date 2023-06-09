USE [master]
GO
/****** Object:  Database [PRACTICADB]    Script Date: 09-06-2023 21:18:27 ******/
CREATE DATABASE [PRACTICADB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PRACTICADB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PRACTICADB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PRACTICADB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\PRACTICADB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [PRACTICADB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PRACTICADB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PRACTICADB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PRACTICADB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PRACTICADB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PRACTICADB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PRACTICADB] SET ARITHABORT OFF 
GO
ALTER DATABASE [PRACTICADB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PRACTICADB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PRACTICADB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PRACTICADB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PRACTICADB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PRACTICADB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PRACTICADB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PRACTICADB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PRACTICADB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PRACTICADB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PRACTICADB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PRACTICADB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PRACTICADB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PRACTICADB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PRACTICADB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PRACTICADB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PRACTICADB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PRACTICADB] SET RECOVERY FULL 
GO
ALTER DATABASE [PRACTICADB] SET  MULTI_USER 
GO
ALTER DATABASE [PRACTICADB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PRACTICADB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PRACTICADB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PRACTICADB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PRACTICADB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PRACTICADB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PRACTICADB', N'ON'
GO
ALTER DATABASE [PRACTICADB] SET QUERY_STORE = ON
GO
ALTER DATABASE [PRACTICADB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [PRACTICADB]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 09-06-2023 21:18:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](255) NULL,
	[Book] [varchar](255) NULL,
	[Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reserves]    Script Date: 09-06-2023 21:18:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserves](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[reserverAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 09-06-2023 21:18:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NULL,
	[Faculty] [varchar](255) NULL,
	[CantReservesLastMonth] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Code], [Book], [Description]) VALUES (1, N'abcdef', N'Alicia', N'Alicia feliz')
INSERT [dbo].[Books] ([Id], [Code], [Book], [Description]) VALUES (2, N'gfdsa', N'Saw', N'Peliculamiedo')
INSERT [dbo].[Books] ([Id], [Code], [Book], [Description]) VALUES (3, N'123456', N'The Great Gatsby', N'A classic American novel')
INSERT [dbo].[Books] ([Id], [Code], [Book], [Description]) VALUES (4, N'789012', N'To Kill a Mockingbird', N'A story of racial injustice')
INSERT [dbo].[Books] ([Id], [Code], [Book], [Description]) VALUES (5, N'345678', N'Pride and Prejudice', N'A timeless romance')
INSERT [dbo].[Books] ([Id], [Code], [Book], [Description]) VALUES (6, N'901234', N'1984', N'A dystopian novel')
INSERT [dbo].[Books] ([Id], [Code], [Book], [Description]) VALUES (7, N'567890', N'The Catcher in the Rye', N'A coming-of-age story')
INSERT [dbo].[Books] ([Id], [Code], [Book], [Description]) VALUES (8, N'123789', N'Moby Dick', N'An epic tale of a whale hunt')
INSERT [dbo].[Books] ([Id], [Code], [Book], [Description]) VALUES (9, N'456012', N'The Lord of the Rings', N'A fantasy adventure')
INSERT [dbo].[Books] ([Id], [Code], [Book], [Description]) VALUES (10, N'789345', N'Harry Potter and the Sorcerer', N'The start of a magical series')
INSERT [dbo].[Books] ([Id], [Code], [Book], [Description]) VALUES (11, N'234678', N'To the Lighthouse', N'A modernist novel')
INSERT [dbo].[Books] ([Id], [Code], [Book], [Description]) VALUES (12, N'901123', N'Brave New World', N'A vision of a future society')
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Reserves] ON 

INSERT [dbo].[Reserves] ([Id], [UserId], [BookId], [reserverAt]) VALUES (2, 1, 2, CAST(N'2022-06-06T23:40:32.000' AS DateTime))
INSERT [dbo].[Reserves] ([Id], [UserId], [BookId], [reserverAt]) VALUES (3, 1, 1, CAST(N'2023-06-01T09:00:00.000' AS DateTime))
INSERT [dbo].[Reserves] ([Id], [UserId], [BookId], [reserverAt]) VALUES (4, 1, 3, CAST(N'2023-06-02T14:30:00.000' AS DateTime))
INSERT [dbo].[Reserves] ([Id], [UserId], [BookId], [reserverAt]) VALUES (5, 2, 2, CAST(N'2023-06-03T11:45:00.000' AS DateTime))
INSERT [dbo].[Reserves] ([Id], [UserId], [BookId], [reserverAt]) VALUES (8, 5, 1, CAST(N'2023-06-06T13:00:00.000' AS DateTime))
INSERT [dbo].[Reserves] ([Id], [UserId], [BookId], [reserverAt]) VALUES (9, 6, 3, CAST(N'2023-06-07T15:45:00.000' AS DateTime))
INSERT [dbo].[Reserves] ([Id], [UserId], [BookId], [reserverAt]) VALUES (10, 7, 2, CAST(N'2023-06-08T12:15:00.000' AS DateTime))
INSERT [dbo].[Reserves] ([Id], [UserId], [BookId], [reserverAt]) VALUES (11, 8, 4, CAST(N'2023-06-09T17:30:00.000' AS DateTime))
INSERT [dbo].[Reserves] ([Id], [UserId], [BookId], [reserverAt]) VALUES (12, 9, 5, CAST(N'2023-06-10T09:45:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reserves] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Name], [Faculty], [CantReservesLastMonth]) VALUES (1, N'Chris', N'Inge', 1)
INSERT [dbo].[Users] ([Id], [Name], [Faculty], [CantReservesLastMonth]) VALUES (2, N'Bruh', N'Ingep', 0)
INSERT [dbo].[Users] ([Id], [Name], [Faculty], [CantReservesLastMonth]) VALUES (3, N'John Doe', N'Engineering', 2)
INSERT [dbo].[Users] ([Id], [Name], [Faculty], [CantReservesLastMonth]) VALUES (4, N'Jane Smith', N'Computer Science', 1)
INSERT [dbo].[Users] ([Id], [Name], [Faculty], [CantReservesLastMonth]) VALUES (5, N'Michael Johnson', N'Business Administration', 0)
INSERT [dbo].[Users] ([Id], [Name], [Faculty], [CantReservesLastMonth]) VALUES (6, N'Emily Davis', N'Medicine', 3)
INSERT [dbo].[Users] ([Id], [Name], [Faculty], [CantReservesLastMonth]) VALUES (7, N'David Wilson', N'Law', 2)
INSERT [dbo].[Users] ([Id], [Name], [Faculty], [CantReservesLastMonth]) VALUES (8, N'Sarah Thompson', N'Social Sciences', 0)
INSERT [dbo].[Users] ([Id], [Name], [Faculty], [CantReservesLastMonth]) VALUES (9, N'Daniel Martinez', N'Psychology', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [CantReservesLastMonth]
GO
ALTER TABLE [dbo].[Reserves]  WITH CHECK ADD FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Reserves]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[GetBooksAndReserves]    Script Date: 09-06-2023 21:18:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBooksAndReserves]
AS
BEGIN
    SET NOCOUNT ON;
    
    SELECT
        b.[Book],
        b.[Description],
        (
            SELECT
                r.[Id],
                u.[Name],
                u.[Faculty]
            FROM [dbo].[Reserves] r
            INNER JOIN [dbo].[Users] u ON u.Id = r.UserId
            WHERE r.BookId = b.Id
            FOR JSON AUTO
        ) AS reserves
    FROM [dbo].[Books] b
    FOR JSON AUTO;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetUsersWithReservessss]    Script Date: 09-06-2023 21:18:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsersWithReservessss]
AS
BEGIN
    SET NOCOUNT ON;

    WITH LastReserve AS (
        SELECT
            r.UserId,
            MAX(r.reserverAt) AS date_last_reserve
        FROM [dbo].[Reserves] r
        GROUP BY r.UserId
    )

    SELECT
        u.[Name],
        u.Faculty,
        lr.date_last_reserve,
        u.CantReservesLastMonth AS cant_reserves_last_month,
        JSON_QUERY((
            SELECT
                b.[Id],
                b.[Code],
                b.[Book],
                b.[Description]
            FROM [dbo].[Reserves] r
            LEFT JOIN [dbo].[Books] b ON b.Id = r.BookId
            WHERE r.UserId = u.Id
            FOR JSON AUTO
        )) AS r
    FROM [dbo].[Users] u
    LEFT JOIN LastReserve lr ON lr.UserId = u.Id
    FOR JSON AUTO;
END;
GO
USE [master]
GO
ALTER DATABASE [PRACTICADB] SET  READ_WRITE 
GO

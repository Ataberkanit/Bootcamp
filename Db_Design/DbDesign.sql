USE [master]
GO
/****** Object:  Database [Odev3]    Script Date: 7.06.2022 23:57:40 ******/
CREATE DATABASE [Odev3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Odev3', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Odev3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Odev3_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Odev3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Odev3] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Odev3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Odev3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Odev3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Odev3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Odev3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Odev3] SET ARITHABORT OFF 
GO
ALTER DATABASE [Odev3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Odev3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Odev3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Odev3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Odev3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Odev3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Odev3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Odev3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Odev3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Odev3] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Odev3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Odev3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Odev3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Odev3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Odev3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Odev3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Odev3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Odev3] SET RECOVERY FULL 
GO
ALTER DATABASE [Odev3] SET  MULTI_USER 
GO
ALTER DATABASE [Odev3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Odev3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Odev3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Odev3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Odev3] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Odev3] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Odev3', N'ON'
GO
ALTER DATABASE [Odev3] SET QUERY_STORE = OFF
GO
USE [Odev3]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](250) NULL,
	[Send_date] [date] NULL,
	[Type_id] [int] NULL,
	[Sender] [int] NULL,
	[Post_id] [int] NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friend_approvements]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friend_approvements](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Friendship_id] [int] NULL,
	[Status_id] [int] NULL,
 CONSTRAINT [PK_Friend_approvements] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friendship_status]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friendship_status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](20) NULL,
 CONSTRAINT [PK_Friendship_status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friendships]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friendships](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [int] NULL,
	[Receiver] [int] NULL,
	[Status_id] [int] NULL,
 CONSTRAINT [PK_Friendships] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Group_messages]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group_messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type_id] [int] NULL,
	[Content] [nvarchar](250) NULL,
	[Send_date] [date] NULL,
	[Sender] [int] NULL,
	[Receiver] [int] NULL,
 CONSTRAINT [PK_Group_messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groupmsg_history]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groupmsg_history](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Gropmsg_id] [int] NULL,
	[Content] [nvarchar](250) NULL,
	[Update_date] [date] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_Groupmsg_history] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Groups]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Groups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Memberships]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Memberships](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Member_id] [int] NULL,
	[Group_id] [int] NULL,
 CONSTRAINT [PK_Memberships] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Description] [nvarchar](250) NULL,
	[Type_id] [int] NULL,
	[Send_date] [date] NULL,
	[Sender] [int] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Types]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Types](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_messages]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [int] NULL,
	[Receiver] [int] NULL,
	[Send_date] [date] NULL,
	[Type_id] [int] NULL,
	[Content] [nvarchar](250) NULL,
 CONSTRAINT [PK_User_messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usermsg_histories]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usermsg_histories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Usermessage_id] [int] NULL,
	[Type] [int] NULL,
	[Content] [nvarchar](250) NULL,
	[Update_date] [date] NULL,
 CONSTRAINT [PK_Usermsg_histories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts] FOREIGN KEY([Post_id])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Types] FOREIGN KEY([Type_id])
REFERENCES [dbo].[Types] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Types]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([Sender])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Friendships]  WITH CHECK ADD  CONSTRAINT [FK_Friendships_Friendship_status] FOREIGN KEY([Status_id])
REFERENCES [dbo].[Friendship_status] ([Id])
GO
ALTER TABLE [dbo].[Friendships] CHECK CONSTRAINT [FK_Friendships_Friendship_status]
GO
ALTER TABLE [dbo].[Friendships]  WITH CHECK ADD  CONSTRAINT [FK_Friendships_Users] FOREIGN KEY([Sender])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Friendships] CHECK CONSTRAINT [FK_Friendships_Users]
GO
ALTER TABLE [dbo].[Friendships]  WITH CHECK ADD  CONSTRAINT [FK_Friendships_Users1] FOREIGN KEY([Receiver])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Friendships] CHECK CONSTRAINT [FK_Friendships_Users1]
GO
ALTER TABLE [dbo].[Group_messages]  WITH CHECK ADD  CONSTRAINT [FK_Group_messages_Groups] FOREIGN KEY([Receiver])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Group_messages] CHECK CONSTRAINT [FK_Group_messages_Groups]
GO
ALTER TABLE [dbo].[Group_messages]  WITH CHECK ADD  CONSTRAINT [FK_Group_messages_Types] FOREIGN KEY([Type_id])
REFERENCES [dbo].[Types] ([Id])
GO
ALTER TABLE [dbo].[Group_messages] CHECK CONSTRAINT [FK_Group_messages_Types]
GO
ALTER TABLE [dbo].[Group_messages]  WITH CHECK ADD  CONSTRAINT [FK_Group_messages_Users] FOREIGN KEY([Sender])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Group_messages] CHECK CONSTRAINT [FK_Group_messages_Users]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [FK_Memberships_Groups] FOREIGN KEY([Group_id])
REFERENCES [dbo].[Groups] ([Id])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [FK_Memberships_Groups]
GO
ALTER TABLE [dbo].[Memberships]  WITH CHECK ADD  CONSTRAINT [FK_Memberships_Users] FOREIGN KEY([Member_id])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Memberships] CHECK CONSTRAINT [FK_Memberships_Users]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Types] FOREIGN KEY([Type_id])
REFERENCES [dbo].[Types] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Types]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users] FOREIGN KEY([Sender])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users]
GO
ALTER TABLE [dbo].[User_messages]  WITH CHECK ADD  CONSTRAINT [FK_User_messages_Types] FOREIGN KEY([Type_id])
REFERENCES [dbo].[Types] ([Id])
GO
ALTER TABLE [dbo].[User_messages] CHECK CONSTRAINT [FK_User_messages_Types]
GO
ALTER TABLE [dbo].[User_messages]  WITH CHECK ADD  CONSTRAINT [FK_User_messages_Users] FOREIGN KEY([Sender])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[User_messages] CHECK CONSTRAINT [FK_User_messages_Users]
GO
ALTER TABLE [dbo].[User_messages]  WITH CHECK ADD  CONSTRAINT [FK_User_messages_Users1] FOREIGN KEY([Receiver])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[User_messages] CHECK CONSTRAINT [FK_User_messages_Users1]
GO
/****** Object:  StoredProcedure [dbo].[Max_message]    Script Date: 7.06.2022 23:57:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Max_message]
AS
select top(3) 
	COUNT(um.Sender) msgCount,
	u.Name from User_messages um
	join Users u on um.Sender=u.Id
	group by u.Name
	order by msgCount desc	
GO
USE [master]
GO
ALTER DATABASE [Odev3] SET  READ_WRITE 
GO
CREATE TRIGGER [dbo].[addfriends]
   ON  [dbo].[Friendships]
   AFTER INSERT
AS 
BEGIN
DECLARE @Friendshipid INT, @Statusid INT
SELECT @Friendshipid=Id,@Statusid=Status_id FROM inserted

INSERT INTO Friend_approvements (Friendship_id,Status_id)  VALUES (@Friendshipid,@Statusid)

END
CREATE TRIGGER [dbo].[msg_up]
ON [dbo].[User_messages]
INSTEAD OF UPDATE
AS
BEGIN
DECLARE @Messageid INT
DECLARE @Content NVARCHAR(250)
DECLARE @Type_id INT
DECLARE @Senddate DATETIME

SELECT @Messageid=Id,@Content=Content,@Type_id=Type_id,@Senddate=Send_date FROM inserted

INSERT INTO Usermsg_histories (Usermessage_id,Content,Type,Update_date)
VALUES (@Messageid,@Content,@Type_id,@Senddate)

UPDATE User_messages SET Content=@Content,Send_date=GETDATE()
WHERE Id=@Messageid

END
USE [master]
GO
/****** Object:  Database [UserDb]    Script Date: 23.11.2020 18:01:32 ******/
CREATE DATABASE [UserDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UserDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UserDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\UserDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UserDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UserDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UserDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UserDb] SET  MULTI_USER 
GO
ALTER DATABASE [UserDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UserDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UserDb] SET QUERY_STORE = OFF
GO
USE [UserDb]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 23.11.2020 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [varchar](50) NULL,
 CONSTRAINT [PK_categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[projects]    Script Date: 23.11.2020 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[iconHref] [varchar](50) NULL,
	[description] [varchar](250) NULL,
	[progress] [int] NULL,
	[categoryID] [int] NULL,
	[lastChangeDate] [datetime] NULL,
	[systemUserID] [int] NULL,
 CONSTRAINT [PK_projects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[projectTask]    Script Date: 23.11.2020 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projectTask](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[taskName] [varchar](50) NULL,
	[taskDescription] [varchar](250) NULL,
	[projectID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[modifyDate] [datetime] NULL,
	[createdDate] [datetime] NULL,
 CONSTRAINT [PK_projectTask] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[projectUsers]    Script Date: 23.11.2020 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[projectUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[projectID] [int] NOT NULL,
	[createdDate] [datetime] NOT NULL,
 CONSTRAINT [PK_projectUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 23.11.2020 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[levels] [int] NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userLog]    Script Date: 23.11.2020 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NULL,
	[ipAdress] [varchar](50) NULL,
	[systemRecordTime] [datetime] NULL,
 CONSTRAINT [PK_userLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 23.11.2020 18:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[password] [varchar](50) NULL,
	[confirmPass] [varchar](50) NULL,
	[firstName] [varchar](50) NULL,
	[lastName] [varchar](50) NULL,
	[createDate] [date] NULL,
	[email] [varchar](100) NULL,
	[roleID] [int] NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 

INSERT [dbo].[categories] ([ID], [categoryName]) VALUES (1, N'In Progress')
INSERT [dbo].[categories] ([ID], [categoryName]) VALUES (2, N'Completed')
INSERT [dbo].[categories] ([ID], [categoryName]) VALUES (3, N'Cancelled')
SET IDENTITY_INSERT [dbo].[categories] OFF
SET IDENTITY_INSERT [dbo].[projects] ON 

INSERT [dbo].[projects] ([ID], [name], [iconHref], [description], [progress], [categoryID], [lastChangeDate], [systemUserID]) VALUES (2, N'Account', N'', N'Hesap', 10, 1, CAST(N'2020-11-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[projects] ([ID], [name], [iconHref], [description], [progress], [categoryID], [lastChangeDate], [systemUserID]) VALUES (5, N'İgo Wordpress Theme', N'', N'Word', 50, 2, CAST(N'2020-11-18T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[projects] ([ID], [name], [iconHref], [description], [progress], [categoryID], [lastChangeDate], [systemUserID]) VALUES (6, N'kk', NULL, N'1', 1, 3, CAST(N'2020-11-21T21:51:24.910' AS DateTime), NULL)
INSERT [dbo].[projects] ([ID], [name], [iconHref], [description], [progress], [categoryID], [lastChangeDate], [systemUserID]) VALUES (7, N'aa', NULL, N'asasadasadad', 23, 2, CAST(N'2020-11-21T22:16:08.007' AS DateTime), NULL)
INSERT [dbo].[projects] ([ID], [name], [iconHref], [description], [progress], [categoryID], [lastChangeDate], [systemUserID]) VALUES (8, N'son deneme', NULL, N'sdsdsdsdsds', 10, 3, CAST(N'2020-11-21T23:29:43.363' AS DateTime), 1)
INSERT [dbo].[projects] ([ID], [name], [iconHref], [description], [progress], [categoryID], [lastChangeDate], [systemUserID]) VALUES (11, N'denemeeee', NULL, N'dfdf', 1, 3, CAST(N'2020-11-22T19:20:46.220' AS DateTime), 4)
INSERT [dbo].[projects] ([ID], [name], [iconHref], [description], [progress], [categoryID], [lastChangeDate], [systemUserID]) VALUES (12, N'b deneme', NULL, N'açıklama', 40, 1, CAST(N'2020-11-22T19:39:27.833' AS DateTime), 2)
INSERT [dbo].[projects] ([ID], [name], [iconHref], [description], [progress], [categoryID], [lastChangeDate], [systemUserID]) VALUES (13, N'AdminProje', NULL, N'AçıklamaAdmin', 50, 2, CAST(N'2020-11-22T20:08:26.573' AS DateTime), 8)
SET IDENTITY_INSERT [dbo].[projects] OFF
SET IDENTITY_INSERT [dbo].[projectUsers] ON 

INSERT [dbo].[projectUsers] ([ID], [userID], [projectID], [createdDate]) VALUES (6, 3, 2, CAST(N'2020-11-18T00:00:00.000' AS DateTime))
INSERT [dbo].[projectUsers] ([ID], [userID], [projectID], [createdDate]) VALUES (9, 1, 5, CAST(N'2020-11-18T00:00:00.000' AS DateTime))
INSERT [dbo].[projectUsers] ([ID], [userID], [projectID], [createdDate]) VALUES (10, 3, 5, CAST(N'2020-11-18T00:00:00.000' AS DateTime))
INSERT [dbo].[projectUsers] ([ID], [userID], [projectID], [createdDate]) VALUES (11, 2, 2, CAST(N'2020-11-18T00:00:00.000' AS DateTime))
INSERT [dbo].[projectUsers] ([ID], [userID], [projectID], [createdDate]) VALUES (12, 4, 2, CAST(N'2020-11-18T00:00:00.000' AS DateTime))
INSERT [dbo].[projectUsers] ([ID], [userID], [projectID], [createdDate]) VALUES (13, 1, 8, CAST(N'2020-11-21T23:29:46.243' AS DateTime))
INSERT [dbo].[projectUsers] ([ID], [userID], [projectID], [createdDate]) VALUES (16, 4, 11, CAST(N'2020-11-22T19:20:46.237' AS DateTime))
INSERT [dbo].[projectUsers] ([ID], [userID], [projectID], [createdDate]) VALUES (17, 2, 12, CAST(N'2020-11-22T19:39:27.867' AS DateTime))
INSERT [dbo].[projectUsers] ([ID], [userID], [projectID], [createdDate]) VALUES (18, 8, 13, CAST(N'2020-11-22T20:08:26.607' AS DateTime))
SET IDENTITY_INSERT [dbo].[projectUsers] OFF
SET IDENTITY_INSERT [dbo].[roles] ON 

INSERT [dbo].[roles] ([ID], [name], [levels]) VALUES (1, N'Admin', 5)
INSERT [dbo].[roles] ([ID], [name], [levels]) VALUES (2, N'User', 1)
SET IDENTITY_INSERT [dbo].[roles] OFF
SET IDENTITY_INSERT [dbo].[userLog] ON 

INSERT [dbo].[userLog] ([ID], [userID], [ipAdress], [systemRecordTime]) VALUES (1, 1, N'::1', CAST(N'2020-11-22T19:33:51.483' AS DateTime))
INSERT [dbo].[userLog] ([ID], [userID], [ipAdress], [systemRecordTime]) VALUES (2, 4, N'::1', CAST(N'2020-11-22T19:20:19.170' AS DateTime))
INSERT [dbo].[userLog] ([ID], [userID], [ipAdress], [systemRecordTime]) VALUES (3, 3, N'::1', CAST(N'2020-11-22T19:57:02.643' AS DateTime))
INSERT [dbo].[userLog] ([ID], [userID], [ipAdress], [systemRecordTime]) VALUES (4, 2, N'::1', CAST(N'2020-11-22T19:38:20.037' AS DateTime))
INSERT [dbo].[userLog] ([ID], [userID], [ipAdress], [systemRecordTime]) VALUES (5, 7, N'::1', CAST(N'2020-11-22T20:06:15.180' AS DateTime))
INSERT [dbo].[userLog] ([ID], [userID], [ipAdress], [systemRecordTime]) VALUES (6, 8, N'::1', CAST(N'2020-11-22T20:07:55.020' AS DateTime))
SET IDENTITY_INSERT [dbo].[userLog] OFF
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([ID], [username], [password], [confirmPass], [firstName], [lastName], [createDate], [email], [roleID]) VALUES (1, N'a', N'1', N'1', N'aga', N'ana', CAST(N'2020-11-17' AS Date), N'asd@asd.com', 2)
INSERT [dbo].[users] ([ID], [username], [password], [confirmPass], [firstName], [lastName], [createDate], [email], [roleID]) VALUES (2, N'b', N'2', N'2', N'ege', N'ene', CAST(N'2020-11-17' AS Date), N'zxc@zxc.com', 2)
INSERT [dbo].[users] ([ID], [username], [password], [confirmPass], [firstName], [lastName], [createDate], [email], [roleID]) VALUES (3, N'YasinElmas', N'123', N'123', N'Yasin', N'Elmas', NULL, N'ysnlms@gmail.com', 1)
INSERT [dbo].[users] ([ID], [username], [password], [confirmPass], [firstName], [lastName], [createDate], [email], [roleID]) VALUES (4, N'abcdef', N'456', N'456', N'abc ', N'def', CAST(N'2020-11-18' AS Date), N'abc@abc.com', 1)
INSERT [dbo].[users] ([ID], [username], [password], [confirmPass], [firstName], [lastName], [createDate], [email], [roleID]) VALUES (5, N'hilall', N'123', N'123', N'Hilal', N'Borazan', CAST(N'2020-11-21' AS Date), N'hborazan23@gmail.com', 2)
INSERT [dbo].[users] ([ID], [username], [password], [confirmPass], [firstName], [lastName], [createDate], [email], [roleID]) VALUES (6, N'userabc', N'123', N'123', N'abcfirst', N'abclast', CAST(N'2020-11-21' AS Date), N'abc@abc.com', 2)
INSERT [dbo].[users] ([ID], [username], [password], [confirmPass], [firstName], [lastName], [createDate], [email], [roleID]) VALUES (7, N'mavra', N'568', N'568', N'mqvra', N'erer', CAST(N'2020-11-22' AS Date), N'mavra2@mavra', 2)
INSERT [dbo].[users] ([ID], [username], [password], [confirmPass], [firstName], [lastName], [createDate], [email], [roleID]) VALUES (8, N'admin', N'test123', N'test123', N'Admin', N'Admin', CAST(N'2020-11-22' AS Date), N'admin@admin.com', 2)
SET IDENTITY_INSERT [dbo].[users] OFF
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [DF_users_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[projects]  WITH CHECK ADD  CONSTRAINT [FK_projects_categories] FOREIGN KEY([categoryID])
REFERENCES [dbo].[categories] ([ID])
GO
ALTER TABLE [dbo].[projects] CHECK CONSTRAINT [FK_projects_categories]
GO
ALTER TABLE [dbo].[projectTask]  WITH CHECK ADD  CONSTRAINT [FK_projectTask_projects] FOREIGN KEY([projectID])
REFERENCES [dbo].[projects] ([ID])
GO
ALTER TABLE [dbo].[projectTask] CHECK CONSTRAINT [FK_projectTask_projects]
GO
ALTER TABLE [dbo].[projectTask]  WITH CHECK ADD  CONSTRAINT [FK_projectTask_users] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[projectTask] CHECK CONSTRAINT [FK_projectTask_users]
GO
ALTER TABLE [dbo].[projectUsers]  WITH CHECK ADD  CONSTRAINT [FK_projectUsers_projects] FOREIGN KEY([projectID])
REFERENCES [dbo].[projects] ([ID])
GO
ALTER TABLE [dbo].[projectUsers] CHECK CONSTRAINT [FK_projectUsers_projects]
GO
ALTER TABLE [dbo].[projectUsers]  WITH CHECK ADD  CONSTRAINT [FK_projectUsers_users] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[projectUsers] CHECK CONSTRAINT [FK_projectUsers_users]
GO
ALTER TABLE [dbo].[userLog]  WITH CHECK ADD  CONSTRAINT [FK_userLog_users] FOREIGN KEY([userID])
REFERENCES [dbo].[users] ([ID])
GO
ALTER TABLE [dbo].[userLog] CHECK CONSTRAINT [FK_userLog_users]
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD  CONSTRAINT [FK_users_roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[roles] ([ID])
GO
ALTER TABLE [dbo].[users] CHECK CONSTRAINT [FK_users_roles]
GO
USE [master]
GO
ALTER DATABASE [UserDb] SET  READ_WRITE 
GO

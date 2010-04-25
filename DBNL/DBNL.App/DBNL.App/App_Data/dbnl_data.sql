/****** Object:  ForeignKey [FK_Content_ContentCategory]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Content_ContentCategory]') AND parent_object_id = OBJECT_ID(N'[artseed].[Content]'))
ALTER TABLE [artseed].[Content] DROP CONSTRAINT [FK_Content_ContentCategory]
GO
/****** Object:  ForeignKey [FK_ContentCategory_ContentCategory]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentCategory_ContentCategory]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
ALTER TABLE [artseed].[ContentCategory] DROP CONSTRAINT [FK_ContentCategory_ContentCategory]
GO
/****** Object:  ForeignKey [FK_ContentRelation_Content]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentRelation_Content]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentRelation]'))
ALTER TABLE [artseed].[ContentRelation] DROP CONSTRAINT [FK_ContentRelation_Content]
GO
/****** Object:  ForeignKey [FK_ContentRelation_Content1]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentRelation_Content1]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentRelation]'))
ALTER TABLE [artseed].[ContentRelation] DROP CONSTRAINT [FK_ContentRelation_Content1]
GO
/****** Object:  ForeignKey [FK_Navigation_Content]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_Content]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation] DROP CONSTRAINT [FK_Navigation_Content]
GO
/****** Object:  ForeignKey [FK_Navigation_ContentCategory1]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_ContentCategory1]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation] DROP CONSTRAINT [FK_Navigation_ContentCategory1]
GO
/****** Object:  ForeignKey [FK_Navigation_Navigation]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_Navigation]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation] DROP CONSTRAINT [FK_Navigation_Navigation]
GO
/****** Object:  ForeignKey [FK_PollQuestion_Poll]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_PollQuestion_Poll]') AND parent_object_id = OBJECT_ID(N'[artseed].[PollQuestion]'))
ALTER TABLE [artseed].[PollQuestion] DROP CONSTRAINT [FK_PollQuestion_Poll]
GO
/****** Object:  ForeignKey [FK_UserInRole_Role]    Script Date: 04/25/2010 12:09:43 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_UserInRole_Role]') AND parent_object_id = OBJECT_ID(N'[artseed].[UserInRole]'))
ALTER TABLE [artseed].[UserInRole] DROP CONSTRAINT [FK_UserInRole_Role]
GO
/****** Object:  ForeignKey [FK_UserInRole_User]    Script Date: 04/25/2010 12:09:43 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_UserInRole_User]') AND parent_object_id = OBJECT_ID(N'[artseed].[UserInRole]'))
ALTER TABLE [artseed].[UserInRole] DROP CONSTRAINT [FK_UserInRole_User]
GO
/****** Object:  Table [artseed].[UserInRole]    Script Date: 04/25/2010 12:09:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[UserInRole]') AND type in (N'U'))
DROP TABLE [artseed].[UserInRole]
GO
/****** Object:  Table [artseed].[ContentRelation]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[ContentRelation]') AND type in (N'U'))
DROP TABLE [artseed].[ContentRelation]
GO
/****** Object:  Table [artseed].[Navigation]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Navigation]') AND type in (N'U'))
DROP TABLE [artseed].[Navigation]
GO
/****** Object:  Table [artseed].[Content]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Content]') AND type in (N'U'))
DROP TABLE [artseed].[Content]
GO
/****** Object:  Table [artseed].[PollQuestion]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[PollQuestion]') AND type in (N'U'))
DROP TABLE [artseed].[PollQuestion]
GO
/****** Object:  Table [artseed].[Contact]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Contact]') AND type in (N'U'))
DROP TABLE [artseed].[Contact]
GO
/****** Object:  Table [artseed].[Role]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Role]') AND type in (N'U'))
DROP TABLE [artseed].[Role]
GO
/****** Object:  Table [artseed].[Job]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Job]') AND type in (N'U'))
DROP TABLE [artseed].[Job]
GO
/****** Object:  Table [artseed].[ContentCategory]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[ContentCategory]') AND type in (N'U'))
DROP TABLE [artseed].[ContentCategory]
GO
/****** Object:  Table [artseed].[Banner]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Banner]') AND type in (N'U'))
DROP TABLE [artseed].[Banner]
GO
/****** Object:  Table [artseed].[User]    Script Date: 04/25/2010 12:09:43 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[User]') AND type in (N'U'))
DROP TABLE [artseed].[User]
GO
/****** Object:  Table [artseed].[Link]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Link]') AND type in (N'U'))
DROP TABLE [artseed].[Link]
GO
/****** Object:  Table [artseed].[Poll]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Poll]') AND type in (N'U'))
DROP TABLE [artseed].[Poll]
GO
/****** Object:  Table [artseed].[Supporter]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Supporter]') AND type in (N'U'))
DROP TABLE [artseed].[Supporter]
GO
/****** Object:  Default [DF_ContentCategory_IsFeatured]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_ContentCategory_IsFeatured]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContentCategory_IsFeatured]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[ContentCategory] DROP CONSTRAINT [DF_ContentCategory_IsFeatured]
END


End
GO
/****** Object:  Default [DF_ContentCategory_ShowOnHP]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_ContentCategory_ShowOnHP]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContentCategory_ShowOnHP]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[ContentCategory] DROP CONSTRAINT [DF_ContentCategory_ShowOnHP]
END


End
GO
/****** Object:  Default [DF_ContentCategory_Invisible]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_ContentCategory_Invisible]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContentCategory_Invisible]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[ContentCategory] DROP CONSTRAINT [DF_ContentCategory_Invisible]
END


End
GO
/****** Object:  Default [DF_Job_CreatedDate]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Job_CreatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[Job]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Job] DROP CONSTRAINT [DF_Job_CreatedDate]
END


End
GO
/****** Object:  Default [DF_Job_Deadline]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Job_Deadline]') AND parent_object_id = OBJECT_ID(N'[artseed].[Job]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_Deadline]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Job] DROP CONSTRAINT [DF_Job_Deadline]
END


End
GO
/****** Object:  Default [DF_Job_UpdatedDate]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Job_UpdatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[Job]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Job] DROP CONSTRAINT [DF_Job_UpdatedDate]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageUser]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageUser]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageUser]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageUser]
END


End
GO
/****** Object:  Default [DF_Role_AllowManagePoll]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManagePoll]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManagePoll]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManagePoll]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageContact]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageContact]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageContact]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageContact]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageLink]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageLink]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageLink]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageLink]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageOnlineSupporter]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageOnlineSupporter]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageOnlineSupporter]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageOnlineSupporter]
END


End
GO
/****** Object:  Default [DF_Role_IsFullPermission]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_IsFullPermission]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_IsFullPermission]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_IsFullPermission]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageAllContent]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageAllContent]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageAllContent]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageAllContent]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageBanner]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageBanner]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageBanner]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageBanner]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageMenu]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageMenu]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageMenu]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageMenu]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageRole]    Script Date: 04/25/2010 12:09:42 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageRole]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageRole]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageRole]
END


End
GO
/****** Object:  Default [DF_User_CreatedDate]    Script Date: 04/25/2010 12:09:43 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_User_CreatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[User]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[User] DROP CONSTRAINT [DF_User_CreatedDate]
END


End
GO
/****** Object:  Default [DF_User_UpdatedDate]    Script Date: 04/25/2010 12:09:43 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_User_UpdatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[User]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[User] DROP CONSTRAINT [DF_User_UpdatedDate]
END


End
GO
/****** Object:  Schema [artseed]    Script Date: 04/25/2010 12:09:43 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'artseed')
DROP SCHEMA [artseed]
GO
/****** Object:  Role [artseed]    Script Date: 04/25/2010 12:09:43 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'artseed')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'artseed' AND type = 'R')
CREATE ROLE [artseed]

END
GO
/****** Object:  Schema [artseed]    Script Date: 04/25/2010 12:09:43 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'artseed')
EXEC sys.sp_executesql N'CREATE SCHEMA [artseed] AUTHORIZATION [artseed]'
GO
/****** Object:  Table [artseed].[Supporter]    Script Date: 04/25/2010 12:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Supporter]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[Supporter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Type] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[NickName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Supporter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [artseed].[Supporter] ON
INSERT [artseed].[Supporter] ([Id], [Name], [Type], [NickName], [Status]) VALUES (2, N'Truong Nguyen', N'Yahoo', N'samuraitruong', N'Actived')
INSERT [artseed].[Supporter] ([Id], [Name], [Type], [NickName], [Status]) VALUES (4, N'Xuân Thao', N'Yahoo', N'cauvang', N'Inactive')
INSERT [artseed].[Supporter] ([Id], [Name], [Type], [NickName], [Status]) VALUES (5, N'Alibaba', N'Yahoo', N'Alibama', N'Actived')
SET IDENTITY_INSERT [artseed].[Supporter] OFF
/****** Object:  Table [artseed].[Poll]    Script Date: 04/25/2010 12:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Poll]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[Poll](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PollName] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Poll] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [artseed].[Poll] ON
INSERT [artseed].[Poll] ([Id], [PollName], [Status]) VALUES (1, N'Theo Anh (Chị) những ngành nghề hiện nay đang thu hút tuyển dụng nhiều lao động?', N'Public')
SET IDENTITY_INSERT [artseed].[Poll] OFF
/****** Object:  Table [artseed].[Link]    Script Date: 04/25/2010 12:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Link]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[Link](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Url] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Link] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [artseed].[Link] ON
INSERT [artseed].[Link] ([Id], [Title], [Url], [CreatedDate], [UpdatedDate]) VALUES (1, N'Bộ Lao Động - Thương Binh Xã Hội', N'http://www.molisa.gov.vn/home', CAST(0x00009D4C00000000 AS DateTime), CAST(0x00009D4D00149A33 AS DateTime))
SET IDENTITY_INSERT [artseed].[Link] OFF
/****** Object:  Table [artseed].[User]    Script Date: 04/25/2010 12:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Password] [nvarchar](32) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [artseed].[User] ON
INSERT [artseed].[User] ([Id], [Username], [Name], [Password], [Status], [CreatedDate], [UpdatedDate]) VALUES (1, N'spadmin', N'Truong Nguyen', N'A4D312C461703C46A56B1BDCDA9B5CDC', N'Actived', CAST(0x00009D550163BAEC AS DateTime), CAST(0x00009D550163BAEC AS DateTime))
INSERT [artseed].[User] ([Id], [Username], [Name], [Password], [Status], [CreatedDate], [UpdatedDate]) VALUES (2, N'truong', N'Nguyen do nhat truong', N'701F07FD0A211B07A010BA73860F94E6', N'Inactive', CAST(0x00009D58001BD7DB AS DateTime), CAST(0x00009D58001BD7E9 AS DateTime))
INSERT [artseed].[User] ([Id], [Username], [Name], [Password], [Status], [CreatedDate], [UpdatedDate]) VALUES (4, N'user1', N'Content Editor 1', N'E10ADC3949BA59ABBE56E057F20F883E', N'Actived', CAST(0x00009D5A01560899 AS DateTime), CAST(0x00009D5D0128D0F6 AS DateTime))
SET IDENTITY_INSERT [artseed].[User] OFF
/****** Object:  Table [artseed].[Banner]    Script Date: 04/25/2010 12:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Banner]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[Banner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Url] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[BannerImage] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[BannerPosition] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [artseed].[Banner] ON
INSERT [artseed].[Banner] ([Id], [Name], [Url], [BannerImage], [Status], [CreatedDate], [UpdatedDate], [BannerPosition]) VALUES (4, N'Iphone &ABC', N'http://www.apple.com/iphone/', N'bottom-1.jpg', N'Actived', CAST(0x00009D5C00A34109 AS DateTime), CAST(0x00009D5C00A34109 AS DateTime), N'Bottom')
INSERT [artseed].[Banner] ([Id], [Name], [Url], [BannerImage], [Status], [CreatedDate], [UpdatedDate], [BannerPosition]) VALUES (5, N'Dell Inspiron 6000', N'http://www.notebookreview.com/default.asp?newsID=2376', N'bottom-2.jpg', N'Actived', CAST(0x00009D5C00A3A401 AS DateTime), CAST(0x00009D5C00A3A401 AS DateTime), N'Bottom')
INSERT [artseed].[Banner] ([Id], [Name], [Url], [BannerImage], [Status], [CreatedDate], [UpdatedDate], [BannerPosition]) VALUES (6, N'molisa.gov.vn', N'http://www.apple.com/iphone/', N'1.jpg', N'Actived', CAST(0x00009D5C00A84EC5 AS DateTime), CAST(0x00009D5E0150300E AS DateTime), N'Top')
INSERT [artseed].[Banner] ([Id], [Name], [Url], [BannerImage], [Status], [CreatedDate], [UpdatedDate], [BannerPosition]) VALUES (7, N'HCMUNS', N'http://hochiminhcity.gov.vn/default.aspx', N'2.jpg', N'Actived', CAST(0x00009D5C00A9E027 AS DateTime), CAST(0x00009D5C00A9E027 AS DateTime), N'Top')
INSERT [artseed].[Banner] ([Id], [Name], [Url], [BannerImage], [Status], [CreatedDate], [UpdatedDate], [BannerPosition]) VALUES (8, N'Liên đoàn lao động', N'http://www.ldld.hochiminhcity.gov.vn/', N'3.jpg', N'Actived', CAST(0x00009D5C00AA204C AS DateTime), CAST(0x00009D5C00AA204C AS DateTime), N'Top')
INSERT [artseed].[Banner] ([Id], [Name], [Url], [BannerImage], [Status], [CreatedDate], [UpdatedDate], [BannerPosition]) VALUES (9, N'Đoàn thanh niên', N'http://www.thanhdoan.hochiminhcity.gov.vn/', N'4.jpg', N'Actived', CAST(0x00009D5C00AA50E4 AS DateTime), CAST(0x00009D5C00AA50E4 AS DateTime), N'Top')
INSERT [artseed].[Banner] ([Id], [Name], [Url], [BannerImage], [Status], [CreatedDate], [UpdatedDate], [BannerPosition]) VALUES (10, N'Lissa', N'http://www.ilssa.org.vn/', N'lisa.jpg', N'Actived', CAST(0x00009D5C00AFAC34 AS DateTime), CAST(0x00009D5C00AFAC34 AS DateTime), N'Right')
INSERT [artseed].[Banner] ([Id], [Name], [Url], [BannerImage], [Status], [CreatedDate], [UpdatedDate], [BannerPosition]) VALUES (11, N'Sở lao động thương binh xã hội', N'http://www.sldtbxh.hochiminhcity.gov.vn/', N'so.jpg', N'Inactive', CAST(0x00009D5C00AFE097 AS DateTime), CAST(0x00009D5C00AFE097 AS DateTime), N'Right')
INSERT [artseed].[Banner] ([Id], [Name], [Url], [BannerImage], [Status], [CreatedDate], [UpdatedDate], [BannerPosition]) VALUES (12, N'HEPZA', N'http://www.hepza.hochiminhcity.gov.vn/', N'hepza.jpg', N'Actived', CAST(0x00009D5C00B18A62 AS DateTime), CAST(0x00009D5C00B18A62 AS DateTime), N'Right')
INSERT [artseed].[Banner] ([Id], [Name], [Url], [BannerImage], [Status], [CreatedDate], [UpdatedDate], [BannerPosition]) VALUES (13, N'SHTP', N'http://www.shtp.hochiminhcity.gov.vn/Sites/web/', N'shtp.jpg', N'Actived', CAST(0x00009D5C00B1B9AE AS DateTime), CAST(0x00009D5E015005C7 AS DateTime), N'Right')
SET IDENTITY_INSERT [artseed].[Banner] OFF
/****** Object:  Table [artseed].[ContentCategory]    Script Date: 04/25/2010 12:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[ContentCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[ContentCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Key] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ParentCategoryId] [int] NULL,
	[IsFeatured] [bit] NOT NULL,
	[ShowOnHP] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Status] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Invisible] [bit] NOT NULL,
 CONSTRAINT [PK_ContentCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON),
 CONSTRAINT [Category_Key_Unique] UNIQUE NONCLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [artseed].[ContentCategory] ON
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (32, N'TỔNG QUAN VỀ TP.HCM', N'TONG-QUAN-VE-TP-HCM', NULL, 0, 0, CAST(0x00009D620017A88B AS DateTime), CAST(0x00009D620017A8A7 AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (39, N'Giới thiệu vị trí địa lý', N'Gioi-thieu-vi-tri-dia-ly', 32, 0, 0, CAST(0x00009D62001BC7FB AS DateTime), CAST(0x00009D62001BC800 AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (40, N'Lao Động - Việc Làm', N'Lao-Dong---Viec-Lam', 32, 0, 0, CAST(0x00009D62001BF8E4 AS DateTime), CAST(0x00009D62001BF8E4 AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (41, N'SỐ LIỆU THỐNG KÊ', N'SO-LIEU-THONG-KE', NULL, 0, 0, CAST(0x00009D62001C52C2 AS DateTime), CAST(0x00009D62001C52C2 AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (42, N'THƯ VIỆN CSDL', N'THU-VIEN-CSDL', NULL, 0, 0, CAST(0x00009D62001C92FE AS DateTime), CAST(0x00009D62001C92FE AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (43, N'NHU CẦU NHÂN LỰC', N'NHU-CAU-NHAN-LUC', NULL, 0, 0, CAST(0x00009D62001CDD3D AS DateTime), CAST(0x00009D62001CDD3D AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (44, N'TRONG NƯỚC', N'TRONG-NUOC', 43, 0, 0, CAST(0x00009D62001CF7EB AS DateTime), CAST(0x00009D62001CF7EB AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (45, N'NGOÀI NƯỚC', N'NGOAI-NUOC', 43, 0, 0, CAST(0x00009D62001D12A7 AS DateTime), CAST(0x00009D62001D12A7 AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (46, N'DANH MỤC NGHIÊN CỨU', N'DANH-MUC-NGHIEN-CUU', NULL, 0, 0, CAST(0x00009D62001D94A3 AS DateTime), CAST(0x00009D62001D94A3 AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (47, N'NGHIÊN CỨU KHOA HỌC', N'NGHIEN-CUU-KHOA-HOC-1', 46, 0, 0, CAST(0x00009D62001DF1BF AS DateTime), CAST(0x00009D630009FA7C AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (48, N'DỰ BÁO NHU CẦU NHÂN LỰC', N'DU-BAO-NHU-CAU-NHAN-LUC', 46, 1, 1, CAST(0x00009D62001E8FC0 AS DateTime), CAST(0x00009D620024EFA8 AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (49, N'THÔNG TIN THỊ TRƯỜNG LAO ĐỘNG', N'THONG-TIN-THI-TRUONG-LAO-DONG', 46, 1, 1, CAST(0x00009D62001F48E3 AS DateTime), CAST(0x00009D620025A093 AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (50, N'Tin tức và sự kiện', N'Tin-tuc-va-su-kien', 80, 0, 0, CAST(0x00009D62002003C4 AS DateTime), CAST(0x00009D6201689E72 AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (51, N'Hoạt động ngành LĐ-TBXH', N'Hoat-dong-nganh-LD-TBXH', 80, 0, 0, CAST(0x00009D6200202936 AS DateTime), CAST(0x00009D6200202936 AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (52, N'Hội đồng chuyên gia tư vấn', N'Hoi-dong-chuyen-gia-tu-van', 80, 0, 0, CAST(0x00009D62002042F4 AS DateTime), CAST(0x00009D62002042F4 AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (53, N'Đào Tạo - Việc Làm', N'Dao-Tao---Viec-Lam', 80, 0, 0, CAST(0x00009D620020637E AS DateTime), CAST(0x00009D620020637E AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (54, N'Tư vấn - Hỏi đáp', N'Tu-van---Hoi-dap', 80, 0, 0, CAST(0x00009D620020AB1B AS DateTime), CAST(0x00009D620020AB1B AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (55, N'Văn bản pháp luật', N'Van-ban-phap-luat', 80, 0, 0, CAST(0x00009D620020C15A AS DateTime), CAST(0x00009D620020C15A AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (56, N'Quan hệ hợp tác', N'Quan-he-hop-tac', 80, 0, 0, CAST(0x00009D620020DA5D AS DateTime), CAST(0x00009D620020DA5D AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (80, N'Danh mục nổi bật', N'Danh-muc-noi-bat', NULL, 0, 0, CAST(0x00009D6201687E17 AS DateTime), CAST(0x00009D6201687E17 AS DateTime), N'Actived', 0)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (81, N'Trang Chủ', N'Trang-Chu', NULL, 0, 0, CAST(0x00009D6201698AB0 AS DateTime), CAST(0x00009D6201698AB0 AS DateTime), N'Actived', 1)
INSERT [artseed].[ContentCategory] ([ID], [CategoryName], [Key], [ParentCategoryId], [IsFeatured], [ShowOnHP], [CreatedDate], [UpdatedDate], [Status], [Invisible]) VALUES (82, N'HOẠT ĐỘNG TRUNG TÂM', N'HOAT-DONG-TRUNG-TAM', NULL, 0, 0, CAST(0x00009D630009A54E AS DateTime), CAST(0x00009D630009A54E AS DateTime), N'Actived', 0)
SET IDENTITY_INSERT [artseed].[ContentCategory] OFF
/****** Object:  Table [artseed].[Job]    Script Date: 04/25/2010 12:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Job]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[JobDetail] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Company] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CompanyInfo] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[Deadline] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Key] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [artseed].[Job] ON
INSERT [artseed].[Job] ([Id], [Title], [Description], [JobDetail], [Company], [CompanyInfo], [CreatedDate], [Deadline], [UpdatedDate], [Status], [Key]) VALUES (11, N'Update Title', N'aa', N'<p>
	a</p>
<p>
	&nbsp;</p>
<div firebugversion="1.5.3" id="_firebugConsole" style="display: none;">
	&nbsp;</div>
<p>
	a</p>
', N'Pycu', N'aa', CAST(0x00009D5F0165F9B9 AS DateTime), CAST(0x00009D5C00000000 AS DateTime), CAST(0x00009D5F01744D6B AS DateTime), N'Actived', N'a')
INSERT [artseed].[Job] ([Id], [Title], [Description], [JobDetail], [Company], [CompanyInfo], [CreatedDate], [Deadline], [UpdatedDate], [Status], [Key]) VALUES (12, N' Investigative Project Officer (Australian Citizens)', N'As Investigative Assistant /Project Officer to the Senior Liaison Officer (SLO), you will manage the transfer and dissemination of information between Australian law enforcement agencies and local law enforcement bodies, provide timely and responsive intelligence support and manage a range of projects originating from the Australian Federal Police Office Ho Chi Minh (AFP HCMC).', N'<div class="box_pre" style="">
	<div class="box_left">
		M&ocirc; tả C&ocirc;ng việc:</div>
	<div class="box_right" style="padding-bottom: 5px;">
		<p>
			As Investigative Assistant /Project Officer to the Senior Liaison Officer (SLO), you will manage the transfer and dissemination of information between Australian law enforcement agencies and local law enforcement bodies, provide timely and responsive intelligence support and manage a range of projects originating from the Australian Federal Police Office Ho Chi Minh (AFP HCMC).</p>
		<p>
			<i><b>** The position is part time (20 hours spread over 5 days/week) with details to be negotiated.</b></i></p>
		<p>
			&nbsp;</p>
		<p>
			Selection for the above vacancy will be based on merit and judged against following selection criteria:</p>
		<p>
<!-- [if !supportLists] -->			<b><i>1. </i></b><!-- [endif] --><b><i>Organising your work, making sound decisions and achieving outcomes.</i></b></p>
		<p>
			This selection criterion focuses on how you take responsibility for achieving outcomes, organise your own work, cope with challenging priorities and require minimal supervision to produce quality results. It also includes how you maintain awareness of broader, organisational issues, make considered professional decisions and anticipate key issues that impact on your work. On a personal level, it also includes how your own values align with that of the agency and how you show enthusiasm, commitment, resilience and initiative in your work.</p>
		<p>
<!-- [if !supportLists] -->			<br />
			<b><i>2. </i></b><!-- [endif] --><b><i>Communicating and working effectively with other people.</i></b></p>
		<p>
			This selection criterion focuses on how well you communicate clearly with others, how you listen and understand the views of your clients and colleagues, and how well you develop effective relationships both within the team and with others outside the team. It includes how you contribute as a team member by encouraging cooperation, tolerance of individual differences, effective feedback, sharing of knowledge and a focus on the objectives of the AFP HCMC team.</p>
		<p>
<!-- [if !supportLists] -->			<b><i>3. </i></b><!-- [endif] --><b><i>Applying technical knowledge, expertise and skills.</i></b></p>
		<p>
			This selection criterion focuses on your application of technical knowledge and skills to meet the objectives of the team. You are expected to be able to develop a practical knowledge of the operating environment of the AFP HCMC team, possess, or be able to develop the necessary skills to support the function of the AFP HCMC team and be able to take responsibility for project work, including complex projects with minimal supervision. It also includes how you systematically maintain and further develop your technical knowledge and skills.</p>
		<p>
			-----------</p>
		<p>
			Applications <b>addressing the selection criteria</b> must not be more than three pages in length. Supporting documents must be photocopied versions only, please do not submit original documents. Originals will be required at interview. Three referees should be nominated in the application. Only short listed applicants will be contacted regarding the next phase in the selection process. <b>Closing date is 21st April 2010</b>.<b> </b></p>
		<p>
			Applicants should send a copy of their application, resume and any supporting documentation marked &lsquo;Investigative Assistant/Project Officer Position - In Confidence&rsquo; to:&nbsp;</p>
		<p>
			Australian Federal Police</p>
		<p>
			Australian Consulate-General</p>
		<p>
			Level 7</p>
		<p>
			Landmark Building, 5th Floor</p>
		<p>
			5B Ton Duc Thang</p>
		<p>
			District 1, HCMC</p>
	</div>
</div>
<div class="tit_inf">
	Y&ecirc;u Cầu C&ocirc;ng Việc</div>
<div class="box_pre">
	<div class="box_left">
		Y&ecirc;u cầu chung:</div>
	<div class="box_right">
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
			<tbody>
				<tr>
					<td width="48%">
						Số năm kinh nghiệm:</td>
					<td width="52%">
						1 năm</td>
				</tr>
				<tr style="">
					<td>
						Cấp bậc tối thiểu:</td>
					<td>
						Nh&acirc;n vi&ecirc;n</td>
				</tr>
				<tr>
					<td>
						Bằng cấp tối thiểu:</td>
					<td>
						Cử nh&acirc;n</td>
				</tr>
			</tbody>
		</table>
		<br />
		The successful applicant should be prepared to undergo an Australian Federal Police Security Clearance process in order to undertake the range of functions of the position and only Australian Citizens may be considered. Applicants must possess the following:<br />
		<br />
		&bull; superior office management and organisational skills;<br />
		&bull; excellent interpersonal, coordination and liaison skills;<br />
		&bull; highly developed project management skills;<br />
		&bull; highly developed computing skills in word processing, databases and spreadsheets;<br />
		&bull; a working style that is team oriented, flexible and able to function under pressure;<br />
		&bull; willingness to undergo a security clearance process; and<br />
		&bull; a background in law enforcement is preferable but not essential.<br />
		&nbsp;</div>
	<div class="box_pre" style="">
		<div class="box_left">
			Nhận hồ sơ ứng vi&ecirc;n bằng ng&ocirc;n ngữ:</div>
		<div class="box_right" style="padding-bottom: 5px;">
			Tiếng Anh</div>
	</div>
</div>
<div class="tit_inf" style="display: none;">
	Kỹ năng</div>
<div class="box_pre" style="display: none;">
	<div class="box_left">
		Kỹ năng bắt buộc:</div>
	<div class="box_right" style="padding-bottom: 5px;">
		&nbsp;</div>
</div>
<div class="box_pre" style="display: none;">
	<div class="box_left">
		Kỹ năng mong muốn:</div>
	<div class="box_right">
		&nbsp;</div>
</div>
<div class="tit_inf">
	Th&ocirc;ng Tin Chung</div>
<div class="box_pre" style="">
	<div class="box_left">
		Loại h&igrave;nh l&agrave;m việc:</div>
	<div class="box_right">
		B&aacute;n thời gian cố định</div>
</div>
<div class="box_pre" style="">
	<div class="box_left">
		Nơi l&agrave;m việc:</div>
	<div class="box_right">
		Hồ Ch&iacute; Minh</div>
</div>
<div class="box_pre" style="">
	<div class="box_left">
		Ng&agrave;nh nghề:</div>
	<div class="box_right">
		Phi ch&iacute;nh phủ/Phi lợi nhuận<br />
		Người nước ngo&agrave;i/Việt Kiều</div>
</div>
<div class="box_pre">
	<div class="box_left">
		Cấp bậc tối thiểu:</div>
	<div class="box_right">
		Nh&acirc;n vi&ecirc;n</div>
</div>
<div class="box_pre">
	<div class="box_left">
		Mức lương:</div>
	<div class="box_right">
		Thỏa thuận</div>
</div>
', N' Australian Consulate General', N'We seek applications from Australian Citizens for the position of Investigative Assistant/Project Officer to the Senior Liaison Officer, Australian Federal Police Office, Australian Consulate General in Ho Chi Minh City which will become vacant in June 2010.', CAST(0x00009D5F017A49CA AS DateTime), CAST(0x00009D6800000000 AS DateTime), CAST(0x00009D5F017A49CA AS DateTime), N'Actived', N'-Investigative-Project-Officer--Australian-Citizens-')
SET IDENTITY_INSERT [artseed].[Job] OFF
/****** Object:  Table [artseed].[Role]    Script Date: 04/25/2010 12:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Role]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ContentPermission] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ComponentPermission] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AllowManageUser] [bit] NOT NULL,
	[AllowManagePoll] [bit] NOT NULL,
	[AllowManageContact] [bit] NOT NULL,
	[AllowManageLink] [bit] NOT NULL,
	[AllowManageOnlineSupporter] [bit] NOT NULL,
	[IsFullPermission] [bit] NOT NULL,
	[AllowManageAllContent] [bit] NOT NULL,
	[AllowManageBanner] [bit] NOT NULL,
	[AllowManageMenu] [bit] NOT NULL,
	[AllowManageRole] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [artseed].[Role] ON
INSERT [artseed].[Role] ([Id], [RoleName], [ContentPermission], [ComponentPermission], [AllowManageUser], [AllowManagePoll], [AllowManageContact], [AllowManageLink], [AllowManageOnlineSupporter], [IsFullPermission], [AllowManageAllContent], [AllowManageBanner], [AllowManageMenu], [AllowManageRole]) VALUES (1, N'Super Administrator', NULL, NULL, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0)
INSERT [artseed].[Role] ([Id], [RoleName], [ContentPermission], [ComponentPermission], [AllowManageUser], [AllowManagePoll], [AllowManageContact], [AllowManageLink], [AllowManageOnlineSupporter], [IsFullPermission], [AllowManageAllContent], [AllowManageBanner], [AllowManageMenu], [AllowManageRole]) VALUES (14, N'tét', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [artseed].[Role] ([Id], [RoleName], [ContentPermission], [ComponentPermission], [AllowManageUser], [AllowManagePoll], [AllowManageContact], [AllowManageLink], [AllowManageOnlineSupporter], [IsFullPermission], [AllowManageAllContent], [AllowManageBanner], [AllowManageMenu], [AllowManageRole]) VALUES (15, N'hihihehe', N'11,2,', NULL, 1, 0, 0, 1, 0, 0, 1, 0, 1, 1)
INSERT [artseed].[Role] ([Id], [RoleName], [ContentPermission], [ComponentPermission], [AllowManageUser], [AllowManagePoll], [AllowManageContact], [AllowManageLink], [AllowManageOnlineSupporter], [IsFullPermission], [AllowManageAllContent], [AllowManageBanner], [AllowManageMenu], [AllowManageRole]) VALUES (16, N'Limited Users', NULL, NULL, 0, 1, 1, 1, 1, 0, 1, 1, 0, 0)
INSERT [artseed].[Role] ([Id], [RoleName], [ContentPermission], [ComponentPermission], [AllowManageUser], [AllowManagePoll], [AllowManageContact], [AllowManageLink], [AllowManageOnlineSupporter], [IsFullPermission], [AllowManageAllContent], [AllowManageBanner], [AllowManageMenu], [AllowManageRole]) VALUES (17, N'ABC', NULL, NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [artseed].[Role] ([Id], [RoleName], [ContentPermission], [ComponentPermission], [AllowManageUser], [AllowManagePoll], [AllowManageContact], [AllowManageLink], [AllowManageOnlineSupporter], [IsFullPermission], [AllowManageAllContent], [AllowManageBanner], [AllowManageMenu], [AllowManageRole]) VALUES (18, N'Test 1', NULL, NULL, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0)
SET IDENTITY_INSERT [artseed].[Role] OFF
/****** Object:  Table [artseed].[Contact]    Script Date: 04/25/2010 12:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Contact]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Email] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [artseed].[Contact] ON
INSERT [artseed].[Contact] ([Id], [Name], [Email], [Status]) VALUES (1, N'Nguyễn Văn Hợi', N'hoinguyen855@yahoo.com', N'Inactive')
INSERT [artseed].[Contact] ([Id], [Name], [Email], [Status]) VALUES (2, N'Phan Anh Tài', N'taianh55@yahoo.com', N'Active')
INSERT [artseed].[Contact] ([Id], [Name], [Email], [Status]) VALUES (3, N'Trần Hồng Ngọc', N'ngoctranh45@yahoo.com', N'Active')
SET IDENTITY_INSERT [artseed].[Contact] OFF
/****** Object:  Table [artseed].[PollQuestion]    Script Date: 04/25/2010 12:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[PollQuestion]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[PollQuestion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[PollId] [int] NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Responses] [int] NOT NULL,
 CONSTRAINT [PK_PollQuestion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [artseed].[PollQuestion] ON
INSERT [artseed].[PollQuestion] ([Id], [Question], [PollId], [Status], [CreatedDate], [UpdatedDate], [Responses]) VALUES (1, N'Điện - Điện tử - Công Nghệ Thông Tin', 1, N'Actived', CAST(0x00009D4D00BC2651 AS DateTime), CAST(0x00009D4D00000000 AS DateTime), 13)
INSERT [artseed].[PollQuestion] ([Id], [Question], [PollId], [Status], [CreatedDate], [UpdatedDate], [Responses]) VALUES (4, N'Cơ Khí - Xây Dựng - Kiến Trúc - Vận Tải', 1, N'Actived', CAST(0x00009D4D00D54E72 AS DateTime), CAST(0x00009D4D00000000 AS DateTime), 8)
INSERT [artseed].[PollQuestion] ([Id], [Question], [PollId], [Status], [CreatedDate], [UpdatedDate], [Responses]) VALUES (5, N'Y - Dược - Mỹ Phẩm - Hóa Chất', 1, N'Actived', CAST(0x00009D4D00D5665C AS DateTime), CAST(0x00009D4D00000000 AS DateTime), 14)
INSERT [artseed].[PollQuestion] ([Id], [Question], [PollId], [Status], [CreatedDate], [UpdatedDate], [Responses]) VALUES (6, N'Du Lịch - Môi Trường - Nhà Hàng - Khách Sạn - Dịch Vụ', 1, N'Actived', CAST(0x00009D4D00D56B11 AS DateTime), CAST(0x00009D4D00000000 AS DateTime), 9)
INSERT [artseed].[PollQuestion] ([Id], [Question], [PollId], [Status], [CreatedDate], [UpdatedDate], [Responses]) VALUES (7, N'Maketing - Kinh Doanh - Bán Hàng - Phục Vụ', 1, N'Actived', CAST(0x00009D4D00E39FA6 AS DateTime), CAST(0x00009D4D00E39FA6 AS DateTime), 10)
INSERT [artseed].[PollQuestion] ([Id], [Question], [PollId], [Status], [CreatedDate], [UpdatedDate], [Responses]) VALUES (10, N'Quản Lý - Quản trị - Văn Phòng', 1, N'Actived', CAST(0x00009D5C00C69FCE AS DateTime), CAST(0x00009D5C00C69FCE AS DateTime), 5)
INSERT [artseed].[PollQuestion] ([Id], [Question], [PollId], [Status], [CreatedDate], [UpdatedDate], [Responses]) VALUES (11, N'Chế Biến Lương Thực - Thực Phẩm - Nông - Thủy Sản', 1, N'Actived', CAST(0x00009D5C00C6A767 AS DateTime), CAST(0x00009D5C00C6A767 AS DateTime), 2)
INSERT [artseed].[PollQuestion] ([Id], [Question], [PollId], [Status], [CreatedDate], [UpdatedDate], [Responses]) VALUES (12, N'Dệt - May - Giầy da - Bao Bì - Nhựa', 1, N'Actived', CAST(0x00009D5C00C6AE3B AS DateTime), CAST(0x00009D5C00C6AE3B AS DateTime), 4)
INSERT [artseed].[PollQuestion] ([Id], [Question], [PollId], [Status], [CreatedDate], [UpdatedDate], [Responses]) VALUES (13, N'Tài Chính - Kiểm Toán - Ngân Hàng - Bảo Hiểm', 1, N'Actived', CAST(0x00009D5C00C6B5C7 AS DateTime), CAST(0x00009D5C00C6B5C7 AS DateTime), 2)
INSERT [artseed].[PollQuestion] ([Id], [Question], [PollId], [Status], [CreatedDate], [UpdatedDate], [Responses]) VALUES (14, N'Luật - Pháp Lý - Nghiên Cứu Khoa Học', 1, N'Actived', CAST(0x00009D5C00C6BC13 AS DateTime), CAST(0x00009D5C00C6BC13 AS DateTime), 2)
SET IDENTITY_INSERT [artseed].[PollQuestion] OFF
/****** Object:  Table [artseed].[Content]    Script Date: 04/25/2010 12:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Content]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[Content](
	[ContentId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Content] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[IsFeatured] [bit] NOT NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Count] [int] NOT NULL,
	[UniqueKey] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Description] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Picture] [varchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [artseed].[Content] ON
INSERT [artseed].[Content] ([ContentId], [Title], [Content], [CategoryId], [CreatedDate], [UpdatedDate], [IsFeatured], [Status], [Count], [UniqueKey], [Description], [Picture]) VALUES (29, N'VẤN ĐỀ THIẾU NHÂN LỰC', N'<p>
	V&igrave; vậy, nhu cầu tuyển dụng lại c&agrave;ng lớn. Nhận định của TP. Hồ Ch&iacute; Minh, qu&yacute; II năm 2010, thiếu 110.000 người lao động. Trong đ&oacute;, nguồn lao động được ph&acirc;n bổ r&otilde; r&agrave;ng về tr&igrave;nh độ như 40% nhu cầu lao động chuy&ecirc;n m&ocirc;n cao, 20% lao động c&oacute; tr&igrave;nh độ cao đẳng, trung cấp v&agrave; 40% lao động sơ cấp, phổ th&ocirc;ng. Điều đ&oacute;, c&oacute; nghĩa l&agrave; nhu cầu về lao động phổ th&ocirc;ng kh&ocirc;ng nhiều, thậm ch&iacute; thấp so với nhu cầu lao động c&oacute; tr&igrave;nh độ tr&ecirc;n phổ th&ocirc;ng.</p>
<p style="text-align: justify;">
	<br />
	&nbsp;&nbsp; Tại c&aacute;c KCN đang thiếu lao động v&igrave; sau Tết nhiều lao động bỏ việc nhưng nhu cầu tuyển dụng của họ kh&ocirc;ng nhiều bằng số lượng cần tuyển. Tại một số ng&agrave;nh nghề mới, theo nhận định của c&aacute;c chuy&ecirc;n gia kinh tế, năm 2010, ch&uacute;ng ta đ&atilde; bước qua ngưỡng của suy tho&aacute;i n&ecirc;n c&oacute; rất nhiều ng&agrave;nh nghề phục hồi v&agrave; cần đến nhiều lao động như du lịch, chăm s&oacute;c sức khoẻ người d&acirc;n, maketing, dịch vụ b&aacute;n h&agrave;ng v&agrave; cả nhu cầu nh&acirc;n lực cho thị trường bất động sản, x&acirc;y dựng, c&ocirc;ng nghệ th&ocirc;ng tin 3 mảng m&agrave; nhu cầu nh&acirc;n lực năm 2009 giảm mạnh tới mức kh&oacute; lường... Ri&ecirc;ng thị trường lao động TP. Hồ Ch&iacute; Minh đ&atilde; c&oacute; 80.000 chỗ l&agrave;m mới chờ người. Trong đ&oacute;, tập trung chủ yếu v&agrave;o c&aacute;c c&ocirc;ng việc như b&aacute;n h&agrave;ng, phục vụ ăn uống, giới thiệu sản phẩm, ng&agrave;nh gia c&ocirc;ng sản xuất h&agrave;ng d&acirc;n dụng, chế biến thực phẩm, trang tr&iacute; nội thất, sửa chữa x&acirc;y dựng nhỏ, dịch vụ gia đ&igrave;nh...</p>
<p style="text-align: justify;">
	<br />
	&nbsp;&nbsp; Về ph&iacute;a cơ quan Nh&agrave; nước, ng&agrave;nh thiếu v&agrave; cần tuyển dụng nhiều nhất li&ecirc;n quan đến chăm s&oacute;c sức khoẻ&nbsp; người d&acirc;n. Bộ Y tế thừa nhận, nh&acirc;n lực cho c&ocirc;ng t&aacute;c chăm s&oacute;c sức khoẻ người d&acirc;n đang thiếu trầm trọng, nhất l&agrave; ở n&ocirc;ng th&ocirc;n, miền n&uacute;i, v&ugrave;ng s&acirc;u, v&ugrave;ng xa. Theo ước t&iacute;nh sơ bộ, ng&agrave;nh y tế hiện thiếu khoảng 6.000 b&aacute;c sỹ, 1.500 dược sỹ, 10.000 điều dưỡng vi&ecirc;n v&agrave; khoảng 7.000 c&aacute;c c&aacute;n bộ kh&aacute;c. Đ&acirc;y l&agrave; số liệu thiếu cho c&aacute;i gọi l&agrave; số lượng b&aacute;c sỹ /người d&acirc;n ở chỉ số trung b&igrave;nh cần thiết l&agrave; 1b&aacute;c sỹ /1.000 người d&acirc;n. Sự thiếu tr&ecirc;n chưa t&iacute;nh đến nhu cầu ph&aacute;t triển của ng&agrave;nh y cần th&ecirc;m nh&acirc;n lực để phục vụ tốt hơn. Như vậy, thị trường lao động Việt Nam đang thiếu ở rất nhiều nguồn nh&acirc;n lực kh&aacute;c nhau chứ kh&ocirc;ng phải chỉ l&agrave; lao động phổ th&ocirc;ng.</p>
<p style="text-align: right;">
	<br />
	<strong>Quế Ng&acirc;n</strong></p>
<p>
	<br />
	Nguồn: <em>doisongphapluat.com.vn</em></p>
', 48, CAST(0x00009D6200239AE6 AS DateTime), CAST(0x00009D6200239AE6 AS DateTime), 1, N'Actived', 0, N'VAN-DE-THIEU-NHAN-LUC', N'Theo ông Nguyễn Đại Đồng, Cục trưởng Cục Lao động Việc làm - Bộ Lao động, Thương binh & Xã hội cho biết: Thị trường lao động năm 2010 sôi động trong tuyển dụng không phải do thiếu nhiều mà có cả lý do tuyển dụng để thay thế những nhân lực đã không còn phù hợp với vị trí công việc, buộc phải thay thế.', NULL)
INSERT [artseed].[Content] ([ContentId], [Title], [Content], [CategoryId], [CreatedDate], [UpdatedDate], [IsFeatured], [Status], [Count], [UniqueKey], [Description], [Picture]) VALUES (30, N'"SĂN" NGHỀ NGẮN HẠN', N'<p>
	<span style="font-size: 13px;"><strong>Học ngắn, lợi nhiều</strong></span></p>
<p style="text-align: justify;">
	&nbsp;</p>
<p style="text-align: justify;">
	<span style="font-size: 13px;">&nbsp;&nbsp; Ch&uacute;ng t&ocirc;i c&oacute; mặt tại trường trung cấp nghề kỹ thuật c&ocirc;ng nghệ H&ugrave;ng Vương (Q.5, TP.HCM) l&uacute;c 18g. L&uacute;c n&agrave;y, học vi&ecirc;n (HV) tấp nập v&agrave;o lớp. Th&igrave; ra, c&aacute;c buổi tối trường mở tới 18 lớp học nghề ngắn hạn. Nguyễn Thị Trinh (22 tuổi) cho biết: &quot;M&igrave;nh vừa tốt nghiệp lớp 12, nhưng muốn c&oacute; một c&aacute;i nghề n&ecirc;n đ&atilde; chọn học may, để c&oacute; thể l&agrave;m việc được ngay&quot;. </span></p>
<p style="text-align: justify;">
	&nbsp;</p>
<p style="text-align: justify;">
	<span style="font-size: 13px;">&nbsp;&nbsp; L&agrave;m quen với anh Trần Văn Minh (30 tuổi), chủ tiệm sửa chữa điện lạnh Minh Cường (đường Nguyễn Văn Chi&ecirc;u, Q.G&ograve; Vấp, TP.HCM), ch&uacute;ng t&ocirc;i được biết: Năm 2006, anh học nghề điện tử trong ba th&aacute;ng ở Trung t&acirc;m dạy nghề Q.10, TP.HCM. Sau khi ra nghề, anh được một cơ sở điện lạnh ở Q.3 nhận v&agrave;o l&agrave;m việc. Bốn năm sau, t&iacute;ch c&oacute;p được ch&uacute;t vốn, Minh mở cửa h&agrave;ng ri&ecirc;ng.</span></p>
<p style="text-align: justify;">
	&nbsp;</p>
<p style="text-align: justify;">
	<span style="font-size: 13px;">&nbsp;&nbsp; Minh bộc bạch: &quot;Gia đ&igrave;nh t&ocirc;i kh&oacute; khăn, mặc d&ugrave; rất muốn theo đuổi việc học nhưng kh&ocirc;ng đủ khả năng. Thời gian n&agrave;y, ng&agrave;nh điện lạnh, điện tử lại rất thu h&uacute;t lao động n&ecirc;n t&ocirc;i quyết định chọn những kh&oacute;a điện lạnh ngắn hạn, vừa học vừa l&agrave;m. C&oacute; tiền sẽ tiếp tục học l&ecirc;n&quot;. Hiện nay, trung b&igrave;nh mỗi ng&agrave;y Minh nhận bảo tr&igrave; khoảng từ 10 &ndash; 15 tủ lạnh, m&aacute;y giặt tại nh&agrave;, kiếm tr&ecirc;n </span><span style="font-size: 13px;">500.000đ/ng&agrave;y.</span></p>
<p style="text-align: left;">
	&nbsp;</p>
<p style="text-align: left;">
	&nbsp;</p>
<table align="center" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>
				<img alt="" src="http://www.phunuonline.com.vn/vieclam/2010/Picture/Hung/09ASo28/nghenganhan.jpg" /></td>
		</tr>
		<tr>
			<td align="center">
				<p style="text-align: center;">
					<br />
					<span class="tLegend"><span style="font-size: 13px;"><em>Lớp cắt may ngắn hạn tại Trường trung cấp nghề KTCN H&ugrave;ng Vương lu&ocirc;n<br />
					đ&ocirc;ng học vi&ecirc;n nữ</em></span></span></p>
			</td>
		</tr>
	</tbody>
</table>
<p style="text-align: left;">
	&nbsp;</p>
<p style="text-align: justify;">
	<span style="font-size: 13px;">&nbsp;&nbsp; C&aacute;c kh&oacute;a học nghề ngắn hạn dưới 12 th&aacute;ng, th&ocirc;ng thường l&agrave; từ ba đến s&aacute;u th&aacute;ng, chủ yếu được tổ chức tại c&aacute;c trung t&acirc;m dạy nghề, trường nghề. HV sau khi tốt nghiệp c&aacute;c kh&oacute;a học nghề ngắn hạn c&oacute; thể xin v&agrave;o l&agrave;m tại nh&agrave; m&aacute;y, x&iacute; nghiệp, cũng c&oacute; thể tự mở cửa h&agrave;ng để kinh doanh, v&iacute; dụ như nghề sửa chữa điện thoại, điện lạnh, điện tử, xe m&aacute;y.... </span></p>
<p style="text-align: justify;">
	&nbsp;</p>
<p style="text-align: justify;">
	<span style="font-size: 13px;">&nbsp;&nbsp; V&otilde; L&ecirc; Minh Tuấn (27 tuổi) - HV đang theo học lớp sửa chữa phần cứng chuy&ecirc;n s&acirc;u tại trường CĐ nghề iSPACE (TP.HCM) cho biết, trước đ&acirc;y anh từng tốt nghiệp ng&agrave;nh điện &ndash; điện tử (ĐH KHTN TP.HCM), nhưng sau khi ra trường, anh lại đăng k&yacute; học th&ecirc;m một kh&oacute;a học ngắn hạn. Theo anh, học nghề ngắn hạn c&oacute; thuận lợi l&agrave; thời gian ngắn, chủ yếu thực h&agrave;nh v&agrave; c&oacute; thể quay lại học n&acirc;ng cao bất cứ l&uacute;c n&agrave;o. &quot;ĐH đ&agrave;o tạo sinh vi&ecirc;n (SV) theo kiểu rất &quot;h&agrave;n l&acirc;m&quot;, l&yacute; thuyết l&agrave; chủ yếu. Trong khi, c&aacute;c kh&oacute;a học nghề ngắn hạn lại thi&ecirc;n về đ&uacute;c kết chương tr&igrave;nh học từ thực tế, dạy chuy&ecirc;n s&acirc;u về nghề, thực h&agrave;nh nhiều. Hơn nữa, chương tr&igrave;nh học lu&ocirc;n được cập nhật ph&ugrave; hợp với thị trường, lớp học &iacute;t người n&ecirc;n HV được hướng dẫn kỹ hơn, tay nghề của HV được n&acirc;ng cao rất nhanh&quot; - Tuấn n&oacute;i.</span></p>
<p style="text-align: justify;">
	&nbsp;</p>
<p style="text-align: justify;">
	<span style="font-size: 13px;"><strong>&nbsp;&nbsp; Thị trường lu&ocirc;n &quot;kh&aacute;t&quot; lao động c&oacute; nghề</strong></span></p>
<p style="text-align: justify;">
	&nbsp;</p>
<p style="text-align: justify;">
	<span style="font-size: 13px;">&nbsp;&nbsp; B&agrave; Ng&ocirc; Ngọc Dung - Ph&oacute; ph&ograve;ng đ&agrave;o tạo Trường trung cấp nghề kỹ thuật c&ocirc;ng nghệ H&ugrave;ng Vương cho biết: &quot;V&agrave;i năm trở lại đ&acirc;y, lượng HV đăng k&yacute; học nghề ngắn hạn tại trường tăng cao. Qua khảo s&aacute;t, ch&uacute;ng t&ocirc;i thấy phần lớn c&aacute;c em học nghề để ra mở cửa h&agrave;ng ri&ecirc;ng. Nhiều c&ocirc;ng ty đến xin tuyển kỹ thuật vi&ecirc;n nhưng ch&uacute;ng t&ocirc;i kh&ocirc;ng cung cấp đủ số lượng&quot;. Theo b&agrave; Dung, những ng&agrave;nh nghề tiềm năng hiện nay l&agrave; điện lạnh, h&agrave;n, cắt gọt kim loại, vận h&agrave;nh sửa chữa thiết bị lạnh, cơ kh&iacute;... Đơn cử như ng&agrave;nh điện lạnh, năm 2009, c&oacute; hơn 16.000 HV theo học, trong đ&oacute; 100% ra trường đều c&oacute; việc, c&ograve;n c&aacute;c ng&agrave;nh kh&aacute;c số lượng HV cũng kh&ocirc;ng dưới 2.000, tỷ lệ c&oacute; việc l&agrave;m đạt từ 70% - 80%. Hiện, nh&agrave; trường c&ograve;n tồn nhiều đơn đặt h&agrave;ng tuyển người từ c&aacute;c doanh nghiệp nhưng kh&ocirc;ng c&oacute; người để giới thiệu.</span></p>
<p style="text-align: justify;">
	&nbsp;</p>
<p style="text-align: justify;">
	<span style="font-size: 13px;">&nbsp;&nbsp; Trong những th&aacute;ng đầu năm 2010, nhu cầu tuyển dụng lao động c&oacute; nghề&nbsp; lu&ocirc;n ở mức cao. Theo &ocirc;ng Nguyễn Văn Sang &ndash; PGĐ TT GTVL Thanh Ni&ecirc;n (Th&agrave;nh Đo&agrave;n TP.HCM), khoảng 30% doanh nghiệp c&oacute; nhu cầu tuyển dụng lao động c&oacute; tr&igrave;nh độ cao đẳng, trung cấp với c&aacute;c ng&agrave;nh nghề như cơ kh&iacute;, x&acirc;y dựng với mức lương kh&aacute; hấp dẫn, từ hai đến năm triệu đồng/th&aacute;ng. Tại TT GTVL VinhemPich, tỷ lệ nhu cầu tuyển lao động l&agrave; c&ocirc;ng nh&acirc;n kỹ thuật - trung cấp nghề cũng kh&aacute; cao (45%); TT GTVL TP.HCM, tỷ lệ n&agrave;y cũng chiếm gần 40%.</span></p>
<p style="text-align: justify;">
	<span style="font-size: 13px;">&nbsp;&nbsp; &Ocirc;ng Nguyễn Th&agrave;nh Hiệp &ndash; Trưởng ph&ograve;ng Dạy nghề Sở LĐ-TB-XH TP.HCM cho biết: Năm 2009, TP.HCM c&oacute; 359.600 HV học nghề, trong đ&oacute;, c&oacute; 80% - 90% ra trường c&oacute; việc l&agrave;m.&nbsp; Ngo&agrave;i c&aacute;c nghề thuộc nh&oacute;m kỹ thuật c&ocirc;ng nghệ, TP.HCM c&ograve;n l&agrave; địa phương ti&ecirc;n phong với c&aacute;c nghề thương mại dịch vụ mới, hấp dẫn, dễ t&igrave;m việc l&agrave;m như: t&agrave;i xế, thiết kế thời trang, b&aacute;n h&agrave;ng, kỹ thuật đ&agrave;m ph&aacute;n hợp đồng, thẩm mỹ, l&agrave;m vườn, c&acirc;y cảnh, sửa chữa thiết bị viễn th&ocirc;ng, quản l&yacute; nh&agrave; cao tầng... Đ&acirc;y l&agrave; những nghề đ&agrave;o tạo theo chương tr&igrave;nh ngắn hạn, dễ học, học nhanh m&agrave; thị trường lao động đang rất cần...&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>
<p style="text-align: left;">
	<span style="font-size: 13px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></p>
<p style="text-align: right;">
	<span style="font-size: 13px;"><strong>Ho&agrave;ng Mai</strong></span></p>
<p>
	Nguồn: <em>phunuonline.com.vn</em></p>
', 49, CAST(0x00009D620025770C AS DateTime), CAST(0x00009D620025770C AS DateTime), 1, N'Actived', 0, N'-SAN--NGHE-NGAN-HAN', N'PN - Trước tình trạng thừa thầy thiếu thợ như hiện nay, học nghề ngắn hạn là biện pháp hữu hiệu để giảm thất nghiệp, tự tạo thêm việc làm. Hơn nữa, đây là con đường mở ra nhiều cơ hội có việc làm và thu nhập ổn định.', N'-SAN--NGHE-NGAN-HAN.jpg')
INSERT [artseed].[Content] ([ContentId], [Title], [Content], [CategoryId], [CreatedDate], [UpdatedDate], [IsFeatured], [Status], [Count], [UniqueKey], [Description], [Picture]) VALUES (31, N'XUẤT KHẨU DỆT MAY: NỔI BUỒN QUÁN QUÂN - BÀI 1: CÓ TIẾNG, CHƯA CÓ MIẾNG!', N'<p>
	<font face="arial"><em><strong>Sau nhiều năm tăng trưởng xuất khẩu (XK) b&igrave;nh qu&acirc;n 30%/năm, năm 2008 h&agrave;ng may mặc Việt Nam (VN) ch&iacute;nh thức lọt v&agrave;o top 10 nước XK dệt may h&agrave;ng đầu thế giới. C&ugrave;ng với đ&oacute;, kim ngạch XK h&agrave;ng dệt may đ&atilde; từng bước vượt qua nhiều ng&agrave;nh h&agrave;ng kh&aacute;c để trở th&agrave;nh qu&aacute;n qu&acirc;n trong c&aacute;c ng&agrave;nh h&agrave;ng XK của VN. Tuy nhi&ecirc;n, sự tăng trưởng h&agrave;ng tỷ USD mỗi năm cũng chỉ l&agrave; con số &ldquo;hữu danh v&ocirc; thực&rdquo; v&igrave; thực tế, xuất nhiều m&agrave; nhập khẩu nguy&ecirc;n phụ liệu để sản xuất cũng rất cao. </strong></em></font></p>
<p align="justify">
	&nbsp;</p>
<div align="center">
	<table align="center" border="0" cellpadding="3" cellspacing="0" width="1">
		<tbody>
			<tr>
				<td>
					<img alt="" border="0" name="imagePhoto" src="http://sggp.org.vn/dataimages/original/2010/04/images329295_1b.jpg" width="399" /></td>
			</tr>
			<tr>
				<td class="Image">
					<p align="justify">
						<font color="#0000ff" face="Arial" size="2">May h&agrave;ng xuất khẩu tại C&ocirc;ng ty cổ phần May S&agrave;i G&ograve;n 3. Ảnh: CAO THĂNG</font></p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<blockquote dir="ltr" style="margin-right: 0px;">
	<p align="justify">
		<font face="arial"><strong>Sản xuất FOB: nh&agrave; nhập khẩu chỉ định nguy&ecirc;n phụ liệu</strong></font></p>
	<p align="justify">
		&nbsp;</p>
</blockquote>
<p align="justify">
	<font face="arial">&nbsp;&nbsp; Sản xuất h&agrave;ng FOB (mua đứt, b&aacute;n đoạn) đ&atilde; l&agrave; niềm khao kh&aacute;t v&agrave; l&agrave; mục ti&ecirc;u lớn của c&aacute;c doanh nghiệp (DN) ng&agrave;nh dệt may (DM) VN v&igrave; c&oacute; l&agrave;m h&agrave;ng FOB th&igrave; mới thấy được gi&aacute; trị gia tăng; sau ph&eacute;p cộng trừ giữa xuất v&agrave; nhập để c&oacute; được con số dư nhiều hơn. </font><font face="arial">Đ&oacute; l&agrave; c&aacute;i &ldquo;hữu thực&rdquo; m&agrave; ng&agrave;nh DM lu&ocirc;n hướng đến. Tuy nhi&ecirc;n, cho đến giờ ph&uacute;t n&agrave;y, 70% đơn h&agrave;ng dệt may sản xuất tại VN vẫn l&agrave; h&agrave;ng gia c&ocirc;ng, 30% đơn h&agrave;ng c&ograve;n lại sản xuất tr&ecirc;n danh nghĩa h&agrave;ng FOB. </font></p>
<p align="justify">
	&nbsp;</p>
<p align="justify">
	<font face="arial">&nbsp;&nbsp; V&agrave; thực chất, h&agrave;ng FOB m&agrave; c&aacute;c DN DM đang l&agrave;m cũng chỉ l&agrave; một h&igrave;nh thức gia c&ocirc;ng cấp cao hơn. Để l&agrave;m h&agrave;ng FOB, nh&agrave; sản xuất phải chủ động l&agrave;m tất cả từ kh&acirc;u thiết kế mẫu m&atilde;, chọn nguy&ecirc;n phụ liệu (NPL), ch&agrave;o h&agrave;ng đến nh&agrave; nhập khẩu (NNK), sản xuất, giao h&agrave;ng. Trong khi đ&oacute;, sản xuất FOB m&agrave; c&aacute;c DN VN đang l&agrave;m = gia c&ocirc;ng + th&ecirc;m một khoản tiền tr&aacute;ch nhiệm. Đ&acirc;y l&agrave; ph&eacute;p t&iacute;nh, những chia sẻ thật t&igrave;nh của nhiều DN lớn l&agrave;m h&agrave;ng FOB tại TPHCM. </font></p>
<p align="justify">
	&nbsp;</p>
<p align="justify">
	<font face="arial">&nbsp;&nbsp; Việc tăng tỷ lệ l&agrave;m h&agrave;ng FOB của DN trong thời gian gần đ&acirc;y, kh&ocirc;ng hẳn do năng lực cũng như sự chủ động chuyển cơ cấu sản xuất của DN VN m&agrave; đ&acirc;y l&agrave; c&aacute;ch l&agrave;m mới của c&aacute;c NNK nhằm giảm tr&aacute;ch nhiệm cũng như chi ph&iacute;. Nếu l&agrave;m h&agrave;ng gia c&ocirc;ng, NNK phải chịu tất cả mọi kh&acirc;u trong sản xuất v&agrave; tốn chi ph&iacute; thu&ecirc; chuy&ecirc;n gia để gi&aacute;m s&aacute;t. </font></p>
<p align="justify">
	&nbsp;</p>
<p align="justify">
	<font face="arial">&nbsp;&nbsp; Trong qu&aacute; tr&igrave;nh sản xuất, nếu thiếu ch&uacute;t vải, hột n&uacute;t, hư hao th&igrave; NNK cũng phải lo mua v&agrave; gởi cho DN gia c&ocirc;ng. Khi chuyển qua l&agrave;m FOB, NNK sẽ chuyển tr&aacute;ch nhiệm lo toan việc thiếu hụt NPL cho nh&agrave; sản xuất, cắt giảm bớt chi ph&iacute; thu&ecirc; chuy&ecirc;n gia gi&aacute;m s&aacute;t. B&ugrave; v&agrave;o đ&oacute;, nh&agrave; sản xuất c&oacute; th&ecirc;m mức lời cao hơn so với mức gia c&ocirc;ng tr&ecirc;n sản phẩm. Đ&oacute; l&agrave; t&igrave;nh trạng chung của việc sản xuất h&agrave;ng FOB tại VN hiện nay. </font></p>
<p align="justify">
	&nbsp;</p>
<p align="justify">
	<font face="arial">&nbsp;&nbsp; Thực tế, c&oacute; rất &iacute;t DN c&oacute; thể thương thảo để c&oacute; thể chủ động tự t&igrave;m mua nguồn NPL để sản xuất v&igrave; việc n&agrave;y sẽ gi&uacute;p DN c&oacute; th&ecirc;m nguồn lợi nhuận. Hiện tại, phần lớn đơn h&agrave;ng sản xuất FOB, nguồn NPL sản xuất đều do NNK chỉ định. Điều n&agrave;y cũng c&oacute; nghĩa rằng, NNK chắc chắn biết được gi&aacute; b&aacute;n NPL s&aacute;t nhất để đưa ra gi&aacute; mua s&aacute;t n&uacute;t với DN VN khi đ&agrave;m ph&aacute;n v&agrave; cũng c&oacute; thể NNK hưởng phần trăm lợi nhuận từ nh&agrave; cung cấp NPL khi chỉ định mua h&agrave;ng, hoặc NNK l&agrave; c&ocirc;ng ty mẹ, c&ocirc;ng ty th&agrave;nh vi&ecirc;n với nh&agrave; cung cấp NPL. </font></p>
<p align="justify">
	&nbsp;</p>
<p align="justify">
	<font face="arial">&nbsp;&nbsp; Tại TPHCM hiện nay, ch&iacute;nh mối quan hệ &ldquo;d&acirc;y mơ, rễ m&aacute;&rdquo; giữa c&aacute;c c&ocirc;ng ty mẹ ở nước ngo&agrave;i &ndash; c&ocirc;ng ty con ở VN đ&atilde; dẫn đến c&aacute;c trường hợp gian lận thương mại, trốn thuế. Cục Thuế TPHCM đ&atilde; ph&aacute;t hiện nhiều DN dệt may FDI b&aacute;o c&aacute;o lỗ, c&oacute; dấu hiệu trốn thuế. Việc chuẩn h&oacute;a c&aacute;c số liệu xuất - nhập khẩu giữa đầu v&agrave;o v&agrave; đầu ra giữa c&aacute;c c&ocirc;ng ty mẹ - con l&agrave; kẽ hở tạo điều kiện để c&aacute;c DN FDI b&aacute;o lỗ, trốn thuế. Trong hơn 2.000 DN dệt may tại VN, DN FDI chiếm khoảng 40%. </font></p>
<p align="justify">
	&nbsp;</p>
<blockquote dir="ltr" style="margin-right: 0px;">
	<p align="justify">
		<font face="arial"><strong>Thiếu hụt lao động: &aacute;p lực cho ng&agrave;nh dệt may </strong></font></p>
	<p align="justify">
		&nbsp;</p>
</blockquote>
<p align="justify">
	<font face="arial">&nbsp;&nbsp; DN DM VN đ&atilde; tạo uy t&iacute;n, gia tăng t&iacute;nh cạnh tranh tr&ecirc;n thị trường thế giới, vượt qua nhiều đối thủ mạnh như Trung Quốc, Th&aacute;i Lan, Bangladesh, Indonesia&hellip;để thu h&uacute;t đơn h&agrave;ng, NNK. Điều n&agrave;y đ&atilde; minh chứng r&otilde; trong năm 2009. Do ảnh hưởng khủng hoảng kinh tế, hầu hết c&aacute;c nước XK dệt may đều giảm s&uacute;t tại c&aacute;c thị trường th&igrave; h&agrave;ng dệt may VN vẫn đảm bảo XK, vẫn c&oacute; tăng trưởng ch&uacute;t &iacute;t (khoảng 1%) trong năm 2009. Khối lượng h&agrave;ng XK vẫn tăng so với năm 2008 nhưng do đơn gi&aacute; trung b&igrave;nh giảm 10%-15% n&ecirc;n tổng kim ngạch XK giảm. </font></p>
<p align="justify">
	&nbsp;</p>
<div align="center">
	<table align="center" border="0" cellpadding="3" cellspacing="0" width="1">
		<tbody>
			<tr>
				<td>
					<img alt="" border="0" name="imagePhoto" src="http://sggp.org.vn/dataimages/original/2010/04/images329293_7.jpg" width="399" /></td>
			</tr>
			<tr>
				<td class="Image">
					<p align="justify">
						<font color="#0000ff" face="Arial" size="2">Những d&acirc;y chuyền dệt hiện đại sẽ cho sản phẩm chất lượng cao, tiết kiệm điện. Ảnh: CAO THĂNG</font></p>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<p align="justify">
	&nbsp;</p>
<p align="justify">
	<font face="arial">&nbsp;&nbsp; VN đang c&oacute; nhiều thuận lợi trong thu h&uacute;t NNK cũng như đ&oacute;n đầu sự dịch chuyển sản xuất dệt may từ c&aacute;c nước trong khu vực ch&acirc;u &Aacute;. Tuy nhi&ecirc;n, đi ngược lại với tăng trưởng XK nh&iacute;ch l&ecirc;n từng năm th&igrave; lực lượng lao động của ng&agrave;nh dệt may lại đang giảm s&uacute;t nghi&ecirc;m trọng. Việc thiếu lao động hiện nay đang l&agrave; một &aacute;p lực lớn đối với ng&agrave;nh c&oacute; th&acirc;m dụng lao động như dệt may. </font></p>
<p align="justify">
	&nbsp;</p>
<p align="justify">
	<font face="arial">&nbsp;&nbsp; Dệt may đ&atilde; từng l&agrave; ng&agrave;nh &ldquo;thời thượng&rdquo;, nh&agrave; nh&agrave; ở TPHCM mở xưởng may. Tỷ lệ DN tư nh&acirc;n nhỏ v&agrave; vừa ra rất nhiều. C&aacute;c c&ocirc;ng ty, nh&agrave; m&aacute;y ở c&aacute;c khu chế xuất, khu c&ocirc;ng nghiệp TP lớn đ&atilde; trở th&agrave;nh miền đất hứa cho lao động c&aacute;c tỉnh đổ về. Nhưng nay, ng&agrave;nh may đ&atilde; kh&ocirc;ng c&ograve;n hấp dẫn. DN tư nh&acirc;n rơi rụng. Nhiều DN cho biết con c&aacute;i họ đ&atilde; thẳng thừng từ chối tiếp quản nghề của cha mẹ, nghề của gia đ&igrave;nh để lại. </font></p>
<p align="justify">
	&nbsp;</p>
<p align="justify">
	<font face="arial">&nbsp;&nbsp; Hiện nay, c&ograve;n lại nhiều c&ocirc;ng ty lớn, t&aacute;ch ra từ c&aacute;c c&ocirc;ng ty nh&agrave; nước. Những c&ocirc;ng ty n&agrave;y được lợi thế l&agrave; c&oacute; sẵn về mặt bằng, nh&agrave; xưởng. Một DN xuất khẩu lớn tại TPHCM c&oacute; 90% đơn h&agrave;ng XK đi nước ngo&agrave;i, trong đ&oacute; tỷ lệ l&agrave;m h&agrave;ng FOB chiếm đến 70%, c&oacute; lợi nhuận sau thuế h&agrave;ng chục tỷ đồng, lương trả cho người lao động thuộc h&agrave;ng cao, trung b&igrave;nh khoảng 3 - 3,5 triệu đồng/th&aacute;ng. Nhưng lợi nhuận thực từ hoạt động sản xuất dệt may mang lại chỉ khoảng 40%. 60% c&ograve;n lại từ c&aacute;c hoạt động kinh doanh kh&aacute;c. V&iacute; dụ tr&ecirc;n cho thấy, ch&iacute;nh việc &ldquo;c&oacute; tiếng, chưa c&oacute; miếng&rdquo; đ&atilde; v&agrave; đang tạo ra &aacute;p lực lớn cho ng&agrave;nh dệt may. </font></p>
<p align="justify">
	&nbsp;</p>
<p align="justify">
	<font face="arial">&nbsp;&nbsp; Trong khi đ&oacute;, d&ugrave; đang c&oacute; những thuận lợi về đơn h&agrave;ng, nhưng DN VN vẫn kh&oacute; c&oacute; được gi&aacute; b&aacute;n dễ thở v&igrave; sự đeo b&aacute;m s&aacute;t n&uacute;t của NNK. C&aacute;c DN dệt may cho rằng, trong t&igrave;nh h&igrave;nh kinh tế kh&oacute; khăn hiện nay, chi ph&iacute;, gi&aacute; cả đầu v&agrave;o tăng cao, NNK chịu tăng gi&aacute; ch&uacute;t &iacute;t, nhưng bấy nhi&ecirc;u kh&ocirc;ng đủ để DN tăng lương, hỗ trợ mức sống cho người lao động. V&igrave; hiện nay, DN đang chịu nhiều g&aacute;nh nặng trong chi ph&iacute; đầu v&agrave;o. Để n&iacute;u k&eacute;o, giữ lao động ở lại bằng việc tăng lương th&igrave; DN kh&ocirc;ng đủ sức.</font></p>
<p align="justify">
	&nbsp;</p>
<p align="justify">
	<font face="arial"><strong><u>B&agrave;i 2:</u> Ph&aacute;t triển nguy&ecirc;n phụ liệu: Lối ra n&agrave;o?</strong></font></p>
<p align="right">
	<font face="arial"><strong>Mỹ Hạnh</strong></font></p>
', 49, CAST(0x00009D620025F771 AS DateTime), CAST(0x00009D620025F771 AS DateTime), 1, N'Actived', 0, N'XUAT-KHAU-DET-MAY--NOI-BUON-QUAN-QUAN---BAI-1--CO-TIENG--CHUA-CO-MIENG-', N'Sau nhiều năm tăng trưởng xuất khẩu (XK) bình quân 30%/năm, năm 2008 hàng may mặc Việt Nam (VN) chính thức lọt vào top 10 nước XK dệt may hàng đầu thế giới. Cùng với đó, kim ngạch XK hàng dệt may đã từng bước vượt qua nhiều ngành hàng khác để trở thành quán quân trong các ngành hàng XK của VN. Tuy nhiên, sự tăng trưởng hàng tỷ USD mỗi năm cũng chỉ là con số “hữu danh vô thực” vì thực tế, xuất nhiều mà nhập khẩu nguyên phụ liệu để sản xuất cũng rất cao.', N'XUAT-KHAU-DET-MAY--NOI-BUON-QUAN-QUAN---BAI-1--CO-TIENG--CHUA-CO-MIENG-.jpg')
INSERT [artseed].[Content] ([ContentId], [Title], [Content], [CategoryId], [CreatedDate], [UpdatedDate], [IsFeatured], [Status], [Count], [UniqueKey], [Description], [Picture]) VALUES (32, N'NHÂN NGÀY NGƯỜI KHUYẾT TẬT VIỆT NAM (18-04): CHÚ TRỌNG DẠY NGHỀ CHO NGƯỜI KHUYẾT TẬT ', N'<table align="left" border="0" cellpadding="1" cellspacing="1" width="200">
	<tbody>
		<tr>
			<td>
				<img alt="" border="0" class="atc_img" id="_ctl0_rContent_imgImage" src="http://www.laodong.com.vn/avatar.aspx?ID=133455&amp;at=0&amp;ts=236&amp;lm=634069256175730000" /></td>
		</tr>
		<tr>
			<td>
				&nbsp;<span class="atc_imgCaption" id="_ctl0_rContent_lbImageCaption">Một em khuyết tật (ch&acirc;n) đang th&ecirc;u tranh tại Trung t&acirc;m Dạy nghề từ thiện Quỳnh Hoa. Ảnh: S.L.</span></td>
		</tr>
	</tbody>
</table>
<div class="atc_desc">
	&nbsp;&nbsp;&nbsp; Trong khi đ&oacute;, m&ocirc; h&igrave;nh dạy nghề cho NKT trong gia đ&igrave;nh, trong c&aacute;c trung t&acirc;m nh&acirc;n đạo, từ thiện đang đem lại hiệu quả tốt.<br />
	<span id="_ctl0_rContent_lbBody"> </span>
	<p align="justify">
		<br />
		<span id="_ctl0_rContent_lbBody"><strong>&nbsp;&nbsp; Dạy nghề trong gia đ&igrave;nh<br />
		</strong><br />
		&nbsp;&nbsp; Với hơn 300m2 nh&agrave; xưởng v&agrave; tr&ecirc;n 30 đầu m&aacute;y kh&acirc;u c&ocirc;ng nghiệp, Trung t&acirc;m Hướng nghiệp - ph&aacute;t triển việc l&agrave;m v&agrave; hỗ trợ NKT của anh Nguyễn Mạnh Tu&acirc;n tiếp nhận NKT l&agrave;m việc. Tại đ&acirc;y, NKT kh&ocirc;ng phải đ&oacute;ng một khoản tiền n&agrave;o ngo&agrave;i tiền ăn v&agrave; được học nghề trực tiếp tr&ecirc;n m&aacute;y trong 3 th&aacute;ng. Học vi&ecirc;n học xong c&oacute; nguyện vọng ở lại cơ sở l&agrave;m việc sẽ được tiếp nhận ngay.<br />
		<br />
		&nbsp;&nbsp; Trung t&acirc;m Dạy nghề từ thiện Quỳnh Hoa (Hữu H&ograve;a, Thanh Tr&igrave;, H&agrave; Nội) do chị Đo&agrave;n Thị Hoa l&agrave;m Gi&aacute;m đốc đang nhận nu&ocirc;i dạy 30 em nhỏ KT như trong một gia đ&igrave;nh. C&aacute;c em được học c&aacute;c nghề th&ecirc;u, l&agrave;m con giống, tranh gh&eacute;p, mộc... Chị Hoa cho biết: &ldquo;B&ecirc;n cạnh dạy nghề, ch&uacute;ng t&ocirc;i c&ograve;n tạo việc l&agrave;m cho c&aacute;c em. Sản phẩm c&aacute;c em l&agrave;m c&oacute; đầu ra n&ecirc;n c&aacute;c em cũng c&oacute; thu nhập. Nhiều em cứng tay nghề đ&atilde; c&oacute; thể t&aacute;ch ra l&agrave;m tại c&aacute;c cơ sở sản xuất kh&aacute;c&rdquo;.<br />
		<br />
		&nbsp;&nbsp; Cơ sở dạy nghề &ldquo;V&igrave; ng&agrave;y mai&rdquo; của chị L&ecirc; Minh Hiền (Ba Đ&igrave;nh, H&agrave; Nội) đang dạy nghề cho gần 60 NKT với c&aacute;c nghề may, th&ecirc;u, l&agrave;m hoa kh&ocirc;, sơn m&agrave;i, hoa lụa, đồ thủ c&ocirc;ng lưu niệm... Sản phẩm của cơ sở đ&atilde; xuất đi nhiều nước tr&ecirc;n thế giới. Nhiều Cty, DN trong nước cũng đ&atilde; t&igrave;m đến đặt h&agrave;ng. Chị Hiền cho biết, cơ sở vẫn li&ecirc;n tục nhận NKT đến học nghề miễn ph&iacute; v&agrave; tạo cơ hội việc l&agrave;m tại chỗ sau khi đ&atilde; học nghề xong.<br />
		<br />
		<strong> &nbsp;&nbsp; Dạy nghề trong doanh nghiệp<br />
		</strong><br />
		&nbsp;&nbsp; Theo quy định, mỗi cơ quan, DN phải tạo việc l&agrave;m cho NKT chiếm 1-2% tổng số nh&acirc;n vi&ecirc;n. Tuy nhi&ecirc;n, c&aacute;c DN vẫn n&eacute; tr&aacute;nh việc nhận NKT v&agrave;o l&agrave;m việc. &Ocirc;ng Nguyễn Xu&acirc;n Lập - Ph&oacute; Cục trưởng Cục Bảo trợ x&atilde; hội (Bộ LĐTBXH) - thừa nhận: &ldquo;Phần lớn NKT c&oacute; việc l&agrave;m kh&ocirc;ng ổn định, chủ yếu l&agrave; tự tạo việc l&agrave;m, l&agrave;m việc trong c&aacute;c tổ chức, cơ sở mang t&iacute;nh nh&acirc;n đạo, từ thiện. Rất &iacute;t người t&igrave;m được việc l&agrave;m ổn định trong c&aacute;c cơ quan, tổ chức, DN&rdquo;.<br />
		<br />
		&nbsp;&nbsp; Nhưng cũng c&oacute; DN chấp nhận những kh&oacute; khăn ban đầu trong việc dạy nghề v&agrave; nhận NKT v&agrave;o l&agrave;m việc. Cty mũ bảo hiểm Protec l&agrave; một v&iacute; dụ. B&agrave; Ho&agrave;ng Na Hương - Ph&oacute; TGĐ Cty - cho biết: &ldquo;Ngay từ khi th&agrave;nh lập Cty, ch&uacute;ng t&ocirc;i đ&atilde; chủ trương tuyển NKT v&agrave;o l&agrave;m việc theo dự &aacute;n phi lợi nhuận của Quỹ Ph&ograve;ng, chống thương vong Ch&acirc;u &Aacute;.<br />
		<br />
		&nbsp;&nbsp; Ban đầu chỉ c&oacute; 1 NKT l&agrave;m việc tại nh&agrave; m&aacute;y, nhưng đến nay ch&uacute;ng t&ocirc;i đang tạo việc l&agrave;m cho 20 NKT trong tổng số 200 CN đang l&agrave;m việc tại nh&agrave; m&aacute;y. Ưu điểm của NKT l&agrave; họ gắn b&oacute; l&acirc;u d&agrave;i với Cty, chăm chỉ&rdquo;. B&agrave; Hương cho biết, d&ugrave; muốn nhận th&ecirc;m NKT, nhưng kh&acirc;u tuyển dụng gặp một số kh&oacute; khăn như LĐ kh&ocirc;ng c&oacute; tr&igrave;nh độ, một số NKT vẫn c&ograve;n mặc cảm...</span></p>
	<p align="justify">
		<span id="_ctl0_rContent_lbBody">&nbsp;</span></p>
	<div class="page">
		&nbsp;</div>
	<div class="atc_aut" style="text-align: right;">
		<strong><span id="_ctl0_rContent_lbSource">Đ&agrave;m Anh</span></strong></div>
	<div class="atc_aut">
		&nbsp;</div>
</div>
<p>
	Nguồn: <em>laodong.com.vn</em></p>
', 49, CAST(0x00009D6200267870 AS DateTime), CAST(0x00009D6200267870 AS DateTime), 1, N'Actived', 0, N'NHAN-NGAY-NGUOI-KHUYET-TAT-VIET-NAM--18-04---CHU-TRONG-DAY-NGHE-CHO-NGUOI-KHUYET-TAT-', N'(LĐ) - Cả nước hiện có khoảng 260 cơ sở dạy nghề, trong đó có 55 cơ sở chuyên biệt và 205 cơ sở có tham gia dạy nghề cho NKT, nhưng chưa thực sự hiệu quả, vẫn còn những vướng mắc khi NKT học cùng người không có dị tật. ', N'NHAN-NGAY-NGUOI-KHUYET-TAT-VIET-NAM--18-04---CHU-TRONG-DAY-NGHE-CHO-NGUOI-KHUYET-TAT-.jpg')
INSERT [artseed].[Content] ([ContentId], [Title], [Content], [CategoryId], [CreatedDate], [UpdatedDate], [IsFeatured], [Status], [Count], [UniqueKey], [Description], [Picture]) VALUES (33, N'CÔNG NGHỆ THÔNG TIN THIẾU HƠN 200.000 NHÂN LỰC', N'<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">Đ&oacute; l&agrave; dự b&aacute;o được đưa ra tại hội nghị quốc gia &ldquo;Ph&aacute;t triển nguồn nh&acirc;n lực CNTT&rdquo; do Bộ GD-ĐT phối hợp c&ugrave;ng Bộ Th&ocirc;ng tin Truyền th&ocirc;ng tổ chức tại H&agrave; Nội s&aacute;ng nay 21-4.</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;</span></span></p>
<p class="pInterTitle" style="font-family: arial; font-size: 11pt; color: rgb(0, 0, 0); font-weight: bold; text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Cung chưa đủ cầu v&igrave; chất lượng thấp</span></span></p>
<p class="pInterTitle" style="font-family: arial; font-size: 11pt; color: rgb(0, 0, 0); font-weight: bold; text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;&nbsp; TS Qu&aacute;ch Tuấn Ngọc -&nbsp;Cục trưởng Cục C&ocirc;ng nghệ th&ocirc;ng tin -&nbsp;cho biết: t&iacute;nh đến năm 2010, c&oacute; 133 trường ĐH đ&agrave;o tạo c&aacute;c m&atilde; ng&agrave;nh CNTT - tin học v&agrave; 73 trường đ&agrave;o tạo c&aacute;c m&atilde; ng&agrave;nh điện tử - viễn th&ocirc;ng. Con số n&agrave;y ở bậc Cao đẳng l&agrave; 153 trường v&agrave; 52 trường. Mỗi năm chỉ ti&ecirc;u tuyển mới c&aacute;c ng&agrave;nh CNTT khoảng tr&ecirc;n 10.000 sinh vi&ecirc;n.&nbsp;Ngo&agrave;i ra c&ograve;n c&oacute; c&aacute;c cơ sở đ&agrave;o tạo kỹ thuật vi&ecirc;n CNTT ở tr&igrave;nh độ trung cấp chuy&ecirc;n nghiệp. B&ecirc;n cạnh đ&oacute;, nhiều chương tr&igrave;nh đ&agrave;o tạo quốc tế đ&atilde; được đưa v&agrave;o Việt Nam dưới h&igrave;nh thức li&ecirc;n kết, hợp t&aacute;c đ&agrave;o tạo&hellip;</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;&nbsp; Nếu nh&igrave;n v&agrave;o những con số n&agrave;y dễ c&oacute; cảm gi&aacute;c nguồn nh&acirc;n lực của ng&agrave;nh c&ocirc;ng nghiệp CNTT rất dồi d&agrave;o, sẵn s&agrave;ng đ&aacute;p ứng nhu cầu của c&aacute;c đơn vị, doanh nghiệp. Nhưng tr&ecirc;n thực tế, khả năng cung ứng nh&acirc;n lực cho lĩnh vực CNTT đang bị hạn chế bởi yếu tố chất lượng.</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;&nbsp; Theo TS Nguyễn Thanh Tuy&ecirc;n, Ph&oacute; vụ trưởng vụ CNTT (Bộ Th&ocirc;ng tin Truyền th&ocirc;ng), đ&aacute;nh gi&aacute; chung của doanh nghiệp về chất lượng lao động CNTT hiện nay l&agrave; khả năng ngoại ngữ chưa tốt, kỹ năng mềm (khả năng tr&igrave;nh b&agrave;y l&agrave;m việc nh&oacute;m, cập nhật c&ocirc;ng nghệ mới&hellip;) c&ograve;n yếu, sinh vi&ecirc;n mới ra trường thiếu kiến thức, khả năng tư duy v&agrave; l&agrave;m việc độc lập c&ograve;n k&eacute;m&hellip;</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;&nbsp; Cụ thể hơn, &ocirc;ng V&otilde; Tấn Long, gi&aacute;m đốc IBM Việt Nam, cho hay: &ldquo;C&aacute;c ứng vi&ecirc;n thiếu v&agrave; yếu c&aacute;c kỹ năng mềm. Ch&uacute;ng t&ocirc;i cho rằng c&aacute;c trường cần c&oacute; b&agrave;i giảng cập nhật sự thay đổi nhanh ch&oacute;ng của c&ocirc;ng nghệ, đ&agrave;o tạo theo nhu cầu của doanh nghiệp, của thị trường&hellip;&rdquo;.&nbsp;</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;&nbsp; Ph&aacute;t biểu tại hội nghị, TS Qu&aacute;ch Tuấn Ngọc cũng thừa nhận hạn chế lớn nhất với sự ph&aacute;t triển của c&ocirc;ng nghiệp CNTT n&oacute;i chung v&agrave; c&ocirc;ng nghiệp phần mềm n&oacute;i ri&ecirc;ng, kể cả việc khai th&aacute;c c&aacute;c thị trường nước ngo&agrave;i, l&agrave; chất lượng đ&agrave;o tạo nguồn nh&acirc;n lực CNTT.&nbsp;</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;</span></span></p>
<p class="pInterTitle" style="font-family: arial; font-size: 11pt; color: rgb(0, 0, 0); font-weight: bold; text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Thiếu hơn 200.000 nh&acirc;n lực</span></span></p>
<p class="pInterTitle" style="font-family: arial; font-size: 11pt; color: rgb(0, 0, 0); font-weight: bold; text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;&nbsp; B&ecirc;n cạnh nỗ lực n&acirc;ng cao chất lượng đ&agrave;o tạo v&agrave; hiệu quả sử dụng SV tốt nghiệp c&aacute;c ng&agrave;nh CNTT - điện tử viễn th&ocirc;ng, một số đại biểu cũng lưu &yacute; Bộ GD-ĐT vẫn phải tiếp tục quan t&acirc;m đến qui m&ocirc; đ&agrave;o tạo để đ&aacute;p ứng nhu cầu ph&aacute;t triển với tốc độ kh&aacute; nhanh của ng&agrave;nh c&ocirc;ng nghiệp n&agrave;y trong những năm tới.</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;">&nbsp;</span></span></p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">
	&nbsp;</p>
<table align="right" border="0" bordercolor="#ecf2fe" bordercolordark="#456ae1" bordercolorlight="#4792d9" cellpadding="5" cellspacing="5" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); line-height: 1.4; border-collapse: separate;" width="200">
	<tbody>
		<tr>
			<td bgcolor="#cfe6f9" valign="center">
				<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
					<span class="Apple-style-span" style="border-collapse: separate; color: rgb(0, 0, 0); font-family: ''Times New Roman''; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; font-size: medium;"><span class="Apple-style-span" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; line-height: 17px;"><font color="#686868"><font color="#fafafa"><font color="#030303">Trao đổi với Tuổi Trẻ b&ecirc;n lề hội nghị, đại diện một số trường ĐH đ&agrave;o tạo ng&agrave;nh CNTT b&agrave;y tỏ sự lo ngại sự thay đổi trong xu hướng chọn ng&agrave;nh nghề dự thi của th&iacute; sinh trong v&agrave;i năm gần đ&acirc;y. Theo đ&aacute;nh gi&aacute; của c&aacute;c trường n&agrave;y, ng&agrave;nh CNTT gần đ&acirc;y kh&ocirc;ng c&ograve;n giữ vị tr&iacute; ng&agrave;nh học &ldquo;hot&rdquo; trong sự lựa chọn của th&iacute; sinh v&agrave; x&atilde; hội.</font></font></font></span></span></p>
			</td>
		</tr>
	</tbody>
</table>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	&nbsp;&nbsp; &Ocirc;ng Nguyễn Thanh Tuy&ecirc;n (Bộ Th&ocirc;ng tin Truyền th&ocirc;ng) đưa ra dự b&aacute;o nhu cầu nh&acirc;n lực của c&ocirc;ng nghiệp CNTT đến năm 2020 l&agrave; 528.000 người, trong đ&oacute; c&ocirc;ng nghệ phần cứng cần 250.000 người, c&ocirc;ng nghệ phần mềm cần 130.000 người v&agrave; c&ocirc;ng nghiệp nội dung số cần 148.000 người.</p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	&nbsp;</p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	&nbsp;&nbsp; Đến năm 2020, dự b&aacute;o được c&ocirc;ng bố tại hội nghị cho rằng con số thiếu hụt nh&acirc;n lực trong ng&agrave;nh c&ocirc;ng nghiệp CNTT c&oacute; thể l&ecirc;n tới tr&ecirc;n 200.000 người.</p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	&nbsp;</p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	&nbsp;&nbsp; Ngay ở thời điểm hiện nay, đ&acirc;y vẫn đang l&agrave; một ng&agrave;nh c&oacute; nhu cầu cao về nh&acirc;n lực. TS L&ecirc; Thị Thanh Mai cho biết &ldquo;khảo s&aacute;t th&ocirc;ng tin tuyển dụng cho thấy nh&oacute;m ng&agrave;nh CNTT - điện tử viễn th&ocirc;ng thuộc top 10 ng&agrave;nh c&oacute; nhiều vị tr&iacute; tuyển dụng nhất&rdquo;.</p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	&nbsp;</p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	&nbsp;&nbsp; Hiện đang c&oacute; xu hướng kh&aacute; r&otilde; rệt l&agrave; lượng th&iacute; sinh đăng k&yacute; dự thi v&agrave;o ng&agrave;nh CNTT- điện tử viễn th&ocirc;ng ở hầu hết c&aacute;c trường ĐH &iacute;t hơn, nhiều th&iacute; sinh giỏi chuyển hướng sang nh&oacute;m ng&agrave;nh t&agrave;i ch&iacute;nh - ng&acirc;n h&agrave;ng, quản trị kinh doanh&hellip; khiến ng&agrave;nh CNTT kh&ocirc;ng chỉ giảm về số lượng m&agrave; giảm cả về chất lượng đầu v&agrave;o.</p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
	&nbsp;</p>
<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0);">
	&nbsp;</p>
<table align="center" border="0" bordercolor="#ecf2fe" bordercolordark="#456ae1" bordercolorlight="#4792d9" cellpadding="5" cellspacing="5" style="font-family: Arial,Helvetica,sans-serif; font-size: 12px; color: rgb(0, 0, 0); line-height: 1.4; border-collapse: separate;" width="95%">
	<tbody>
		<tr>
			<td bgcolor="#cfe6f9" valign="center">
				<p class="pInterTitle" style="font-family: arial; font-size: 11pt; color: rgb(0, 0, 0); font-weight: bold; text-align: justify;">
					<font color="#686868"><font color="#fafafa"><font color="#030303">CNTT được thi tuyển bằng khối thi mới?</font></font></font></p>
				<p class="pInterTitle" style="font-family: arial; font-size: 11pt; color: rgb(0, 0, 0); font-weight: bold; text-align: justify;">
					<font color="#686868"><font color="#fafafa"><font color="#030303">&nbsp;</font></font></font></p>
				<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
					<font color="#686868"><font color="#fafafa"><font color="#030303">Đứng từ g&oacute;c độ l&agrave; &ldquo;nh&agrave; cung cấp nh&acirc;n lực&rdquo;, ph&aacute;t biểu tại hội nghị n&agrave;y, đại diện một số trường ĐH cũng kh&ocirc;ng n&eacute; tr&aacute;nh những hạn chế ở &ldquo;chất lượng sản phẩm&rdquo; của m&igrave;nh v&agrave; trao đổi kinh nghiệm, đề xuất kh&aacute; nhiều giải ph&aacute;p để cải thiện chất lượng đ&agrave;o tạo. Trong đ&oacute;, việc li&ecirc;n kết chặt chẽ với c&aacute;c doanh nghiệp được ưu ti&ecirc;n h&agrave;ng đầu với nhiều h&igrave;nh thức thực hiện. Từ chỗ t&igrave;m hiểu, nắm bắt được nhu cầu sử dụng thực tế, c&aacute;c trường cũng cải tiến nội dung chương tr&igrave;nh đ&agrave;o tạo cho ph&ugrave; hợp hơn với nhu cầu tuyển dụng.</font></font></font></p>
				<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
					<font color="#686868"><font color="#fafafa"><font color="#030303">&nbsp;</font></font></font></p>
				<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
					<font color="#686868"><font color="#fafafa"><font color="#030303">TS Thanh Mai cho biết: &ldquo;Nhiều doanh nghiệp CNTT y&ecirc;u cầu người tuyển dụng phải c&oacute; kiến thức li&ecirc;n ng&agrave;nh hoặc kiến thức ng&agrave;nh rộng. V&igrave; vậy b&ecirc;n cạnh ng&agrave;nh truyền thống về CNTT, để tăng mức độ th&iacute;ch ứng với doanh nghiệp, ĐHQG TP.HCM đ&atilde; h&igrave;nh th&agrave;nh nhiều chương tr&igrave;nh đ&agrave;o tạo CNTT trong một số lĩnh vực như CNTT - sinh học (Sinh tin học), CNTT - kinh Tế (Hệ thống th&ocirc;ng tin kinh tế), CNTT - kế to&aacute;n - kiểm to&aacute;n, CNTT - t&agrave;i ch&iacute;nh - ng&acirc;n h&agrave;ng, thư viện - th&ocirc;ng tin&hellip; Trường ĐH H&agrave; Nội v&agrave; một số trường kh&aacute;c th&igrave; cho biết đ&atilde; triển khai đ&agrave;o tạo ng&agrave;nh CNTT bằng tiếng Anh, nhập khẩu chương tr&igrave;nh từ c&aacute;c ĐH h&agrave;ng đầu về đ&agrave;o tạo CNTT&hellip;</font></font></font></p>
				<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
					<font color="#686868"><font color="#fafafa"><font color="#030303">&nbsp;</font></font></font></p>
				<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
					<font color="#686868"><font color="#fafafa"><font color="#030303">Nhưng mặt kh&aacute;c, đối với doanh nghiệp, &ocirc;ng Nguyễn Thanh Tuy&ecirc;n v&agrave; nhiều đại biểu cũng cho rằng cần nh&igrave;n thị trường nh&acirc;n lực CNTT theo cơ chế thị trường, muốn c&oacute; chất lượng tốt doanh nghiệp cũng phải c&oacute; tr&aacute;ch nhiệm nhiều hơn: cần phải bỏ tiền đầu tư, đầu tư cho Quỹ ph&aacute;t triển nguồn nh&acirc;n lực CNTT VN, c&oacute; cam kết phối hợp với nh&agrave; trường, tạo điều kiện cho sinh vi&ecirc;n thực tập&hellip; &Ocirc;ng Tuy&ecirc;n cũng nhấn mạnh đến việc c&aacute;c doanh nghiệp phải x&acirc;y dựng chiến lược đ&agrave;o tạo lại nh&acirc;n lực mới để ph&ugrave; hợp với nhu cầu của m&igrave;nh chứ kh&ocirc;ng thể giữ tư tưởng &ldquo;tất cả SV đ&agrave;o tạo ra l&agrave; phải sử dụng được ngay&rdquo;.</font></font></font></p>
				<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
					<font color="#686868"><font color="#fafafa"><font color="#030303">&nbsp;</font></font></font></p>
				<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
					<font color="#686868"><font color="#fafafa"><font color="#030303">Ở g&oacute;c độ quản l&yacute; nh&agrave; nước, TS Qu&aacute;ch Tuấn Ngọc đề xuất cần tổng điều tra nh&acirc;n lực CNTT để đ&aacute;nh gi&aacute; về số lượng, chất lượng, loại h&igrave;nh, bằng cấp. Đồng thời x&acirc;y dựng chương tr&igrave;nh chuẩn quốc gia chung về đ&agrave;o tạo CNTT đối với c&aacute;c tr&igrave;nh độ đ&agrave;o tạo ĐH, CĐ, TCCN. Trong việc x&acirc;y dựng c&aacute;c chương tr&igrave;nh chuẩn quốc gia về đ&agrave;o tạo CNTT, đặc biệt ch&uacute; &yacute; chuẩn đầu ra v&agrave; tham khảo mạnh yếu tố nước ngo&agrave;i.</font></font></font></p>
				<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
					<font color="#686868"><font color="#fafafa"><font color="#030303">&nbsp;</font></font></font></p>
				<p class="pBody" style="font-family: arial; font-size: 10pt; color: rgb(0, 0, 0); text-align: justify;">
					<font color="#686868"><font color="#fafafa"><font color="#030303">Đặc biệt &ocirc;ng Ngọc đề nghị cần thực hiện tuyển sinh ng&agrave;nh CNTT - điện tử - viễn th&ocirc;ng với ba m&ocirc;n thi l&agrave; to&aacute;n, l&yacute; v&agrave; ngoại ngữ v&igrave; đ&acirc;y mới l&agrave; những m&ocirc;n ph&ugrave; hợp với nội dung chương tr&igrave;nh đ&agrave;o tạo của c&aacute;c ng&agrave;nh n&agrave;y. C&ugrave;ng quan điểm n&agrave;y, TS Nguyễn Thanh Tuy&ecirc;n cũng cho rằng Bộ GD-ĐT cần sớm cho ph&eacute;p tuyển sinh đầu v&agrave;o c&aacute;c m&atilde; ng&agrave;nh CNTT với ba m&ocirc;n to&aacute;n, l&yacute; v&agrave; tiếng Anh để lựa chọn được c&aacute;c sinh vi&ecirc;n ph&ugrave; hợp.</font></font></font></p>
			</td>
		</tr>
	</tbody>
</table>
<p class="pAuthor" style="font-family: arial; font-size: 10pt; text-align: right; font-weight: bold;">
	THANH H&Agrave;</p>
<p class="pAuthor" style="font-family: arial; font-size: 10pt; text-align: right; font-weight: bold;">
	&nbsp;</p>
<p class="pAuthor" style="font-family: arial; font-size: 10pt; text-align: left; font-weight: bold;">
	Nguồn: tuoitre.vn</p>
', 48, CAST(0x00009D620026D630 AS DateTime), CAST(0x00009D620026D630 AS DateTime), 1, N'Actived', 0, N'CONG-NGHE-THONG-TIN-THIEU-HON-200-000-NHAN-LUC', N'TTO - Sẽ ngày càng thiếu nhân lực cho ngành công nghiệp công nghệ thông tin (CNTT), con số thiếu hụt thậm chí có thể lên tới 200.000-300.000 lao động vào thời điểm năm 2020.
 ', N'CONG-NGHE-THONG-TIN-THIEU-HON-200-000-NHAN-LUC.jpg')
INSERT [artseed].[Content] ([ContentId], [Title], [Content], [CategoryId], [CreatedDate], [UpdatedDate], [IsFeatured], [Status], [Count], [UniqueKey], [Description], [Picture]) VALUES (34, N'DIỄN ĐÀN GIẢI BÀI TOÁN LAO ĐỘNG CHO TP.HCM: TRÁCH NHIỆM CỦA CẢ 3 PHÍA', N'<div>
	<p>
		Giải quyết tốt b&agrave;i to&aacute;n cung &ndash; cầu lao động l&agrave; giải quyết vấn đề gi&aacute; nh&acirc;n c&ocirc;ng, vấn đề t&aacute;i cấu tr&uacute;c nh&acirc;n lực, ph&acirc;n bổ nguồn lao động hợp l&yacute; theo xu hướng TPHCM ph&aacute;t triển tập trung nền kinh tế c&ocirc;ng nghệ. Hiện nay, TPHCM vẫn c&ograve;n một tỉ lệ nhất định người thất nghiệp.<br />
		<br />
		Sở dĩ người lao động chưa muốn t&igrave;m việc v&igrave; tiền lương qu&aacute; thấp, kh&ocirc;ng đủ nu&ocirc;i sống bản th&acirc;n v&agrave; t&aacute;i tạo sức lao động. C&aacute;c doanh nghiệp (DN) kh&ocirc;ng n&ecirc;n để bị cuốn v&agrave;o những cơn sốt lao động m&agrave; phải đặt vấn đề m&igrave;nh đ&atilde; đối xử với người lao động như thế n&agrave;o để điều chỉnh ch&iacute;nh s&aacute;ch sử dụng lao động một c&aacute;ch l&acirc;u d&agrave;i.</p>
	<p>
		<img _fl="" alt="" src="http://nld.vcmedia.vn/Images/Uploaded/Share/2010/04/02/6620417816-Chot.jpg" width="450" /><br />
		C&ocirc;ng nh&acirc;n C&ocirc;ng ty Nhựa Phước Th&agrave;nh (quận 5 - TPHCM) được chăm lo chu đ&aacute;o việc l&agrave;m, ăn ở, học h&agrave;nh. Ảnh: HỒNG Đ&Agrave;O</p>
	<p>
		<br />
		Đ&agrave;o tạo phải theo nhu cầu</p>
	<p>
		Trong phạm vi b&agrave;i viết n&agrave;y, t&ocirc;i chỉ đứng ở một g&oacute;c độhẹp: Vấn đề đ&agrave;o tạo v&agrave; sử dụng lao động. Đ&agrave;o tạo chất lượng cao sẽ th&uacute;c đẩy sử dụng lao động; sản xuất, kinh doanh sẽ ph&aacute;t triển. Sử dụng lao động c&oacute; hiệu quả th&uacute;c đẩy ph&aacute;t triển đ&agrave;o tạo, n&acirc;ng cao chất lượng đ&agrave;o tạo, hỗ trợ đ&agrave;o tạo ph&aacute;t triển.<br />
		&nbsp;</p>
	<p>
		Để tạo sự gắn kết đ&agrave;o tạo v&agrave; việc l&agrave;m theo nhu cầu x&atilde; hội cần phải c&oacute; một qu&aacute; tr&igrave;nh với nhiều giải ph&aacute;p t&iacute;ch cực th&uacute;c đẩy thị trường lao động ph&aacute;t triển. Đối với nh&agrave; trường, cơ sở đ&agrave;o tạo, cần tăng cường tiếp cận th&ocirc;ng tin nhu cầu nh&acirc;n lực trong x&atilde; hội về cơ cấu, tr&igrave;nh độ nghề, ng&agrave;nh nghề, quy m&ocirc;, số lượng.<br />
		<br />
		Nh&agrave; trường cũng phải nắm được th&ocirc;ng tin về người học, nhu cầu việc l&agrave;m, điều kiện v&agrave; khả năng học, tư vấn, hỗ trợ đ&agrave;o tạo; phải gắn b&oacute; với DN, x&atilde; hội trong qu&aacute; tr&igrave;nh đ&agrave;o tạo như mời DN tham gia đ&agrave;o tạo, hỗ trợ thực tập, nội dung đ&agrave;o tạo, phối hợp đ&agrave;o tạo theo kế hoạch, tổ chức thực tập cho học vi&ecirc;n... B&ecirc;n cạnh đ&oacute;, nh&agrave; trường phải tăng cường th&ocirc;ng tin, tiếp thị cho x&atilde; hội, DN v&agrave; người lao động về hoạt động đ&agrave;o tạo của nh&agrave; trường; thường xuy&ecirc;n tổ chức hoạt động th&ocirc;ng tin thị trường lao động, ng&agrave;y hội nghề nghiệp &ndash; việc l&agrave;m, hoạt động giới thiệu việc l&agrave;m cho học vi&ecirc;n...<br />
		&nbsp;</p>
	<p>
		Ch&uacute; trọng ch&iacute;nh s&aacute;ch tiền lương, khen thưởng</p>
	<p>
		<br />
		Về ph&iacute;a c&aacute;c DN, cơ sở sản xuất &ndash; kinh doanh, cần ch&uacute; trọng x&acirc;y dựng kế hoạch nh&acirc;n lực trung hạn v&agrave; d&agrave;i hạn về cơ cấu ng&agrave;nh nghề, quy m&ocirc;, chất lượng v&agrave; th&ocirc;ng tin về nhu cầu x&atilde; hội. Phải x&acirc;y dựng những ch&iacute;nh s&aacute;ch về tiền lương v&agrave; khen thưởng ph&ugrave; hợp thực tế đời sống x&atilde; hội v&agrave; gi&aacute; trị sức lao động; đặc biệt l&agrave; lực lượng lao động kỹ thuật, lao động phổ th&ocirc;ng để thu h&uacute;t người lao động.<br />
		<br />
		Nếu kh&ocirc;ng giải được b&agrave;i to&aacute;n n&agrave;y, DN sẽ kh&oacute; c&oacute; được đội ngũ lao động gắn b&oacute;, c&oacute; tay nghề, kỹ năng... Ngo&agrave;i ra, cần tăng cường quan hệ với nh&agrave; trường, cơ sở đ&agrave;o tạo để đặt y&ecirc;u cầu v&agrave; hợp đồng nh&acirc;n lực; đồng h&agrave;nh c&ugrave;ng nh&agrave; trường, cơ sở đ&agrave;o tạo trong suốt qu&aacute; tr&igrave;nh đ&agrave;o tạo v&agrave; sử dụng nguồn nh&acirc;n lực.<br />
		&nbsp;</p>
	<p>
		Đối với người lao động, phải t&igrave;m hiểu thị trường lao động, DN, nh&agrave; trường, cơ sở đ&agrave;o tạo để biết nhu cầu việc l&agrave;m, điều kiện l&agrave;m việc, ng&agrave;nh nghề đ&agrave;o tạo... Cần ch&uacute; &yacute; chọn nghề, việc l&agrave;m, ng&agrave;nh nghề, bậc học ph&ugrave; hợp năng lực, sở trường, điều kiện học tập. Một điều hết sức quan trọng kh&aacute;c l&agrave;, sau khi đ&atilde; được trang bị những kiến thức cơ bản của nghề nghiệp, người lao động phải kh&ocirc;ng ngừng tự r&egrave;n luyện kỹ năng nghề, t&aacute;c phong, lề lối l&agrave;m việc để th&iacute;ch nghi với m&ocirc;i trường lao động c&ocirc;ng nghiệp.</p>
	<p>
		&nbsp;</p>
	<p>
		<strong>Trần Anh Tuấn </strong><br />
		&nbsp;</p>
	<table align="center" cellpadding="0" cellspacing="5" style="width: 522px; height: 21px;">
		<tbody>
			<tr>
				<td>
					<p align="justify">
						Mời tham gia diễn đ&agrave;n</p>
					<p align="justify">
						&ldquo;Giải b&agrave;i to&aacute;n lao động cho TPHCM&rdquo;</p>
					<p align="justify">
						<br />
						TPHCM - trung t&acirc;m kinh tế lớn nhất của đất nước - đang đối mặt với vấn đề nan giải: Thiếu trầm trọng lao động ở tất cả c&aacute;c cấp độ: lao động quản l&yacute;, lao động kỹ thuật, đặc biệt l&agrave; lao động phổ th&ocirc;ng. Trước t&igrave;nh h&igrave;nh n&agrave;y, B&aacute;o Người Lao Động đ&atilde; đặt vấn đề &ldquo;TPHCM kh&aacute;t nh&acirc;n lực&rdquo; v&agrave; nhận được sự quan t&acirc;m của đ&ocirc;ng đảo bạn đọc.<br />
						&nbsp;</p>
					<p align="justify">
						Tầm quan trọng của nguồn nh&acirc;n lực đối với nền kinh tế đ&atilde; được khẳng định trong thực tiễn hoạt động của DN. Nh&acirc;n lực tốt l&agrave; tiền đề để ph&aacute;t triển DN một c&aacute;ch bền vững.<br />
						&nbsp;</p>
					<p align="justify">
						Để g&oacute;p phần c&ugrave;ng TP giải quyết vấn đề n&agrave;y, B&aacute;o Người Lao Động mở diễn đ&agrave;n &ldquo;Giải b&agrave;i to&aacute;n lao động cho TPHCM&rdquo; với mong muốn nhận được những &yacute; kiến đ&oacute;ng g&oacute;p ch&acirc;n t&igrave;nh, thẳng thắn, x&acirc;y dựng của c&aacute;c chuy&ecirc;n gia, c&aacute;c nh&agrave; quản l&yacute; Nh&agrave; nước v&agrave; quản l&yacute; DN, c&aacute;c bạn đọc quan t&acirc;m đến vấn đề n&agrave;y.</p>
					<p align="justify">
						<br />
						B&agrave;i viết tham gia diễn đ&agrave;n, vui l&ograve;ng gởi về B&aacute;o Người Lao Động, số 14 C&aacute;ch Mạng Th&aacute;ng T&aacute;m, quận 1 - TPHCM. Hoặc email: lethuy@nld.com.vn.</p>
				</td>
			</tr>
		</tbody>
	</table>
	<div style="clear: both;">
		&nbsp;</div>
</div>
<div align="right">
	&nbsp;</div>
<p>
	&nbsp;Nguồn: <em>nld.com.vn</em></p>
', 48, CAST(0x00009D6200273CBA AS DateTime), CAST(0x00009D6200273CBA AS DateTime), 1, N'Actived', 0, N'DIEN-DAN-GIAI-BAI-TOAN-LAO-DONG-CHO-TP-HCM--TRACH-NHIEM-CUA-CA-3-PHIA', N'Đào tạo chất lượng cao sẽ thúc đẩy sử dụng lao động, sử dụng lao động hiệu quả thúc đẩy phát triển, nâng cao chất lượng đào tạo...
 
', N'DIEN-DAN-GIAI-BAI-TOAN-LAO-DONG-CHO-TP-HCM--TRACH-NHIEM-CUA-CA-3-PHIA.jpg')
INSERT [artseed].[Content] ([ContentId], [Title], [Content], [CategoryId], [CreatedDate], [UpdatedDate], [IsFeatured], [Status], [Count], [UniqueKey], [Description], [Picture]) VALUES (35, N'Giới thiệu Trung tâm', N'<p style="text-align: justify;">
	Trung t&acirc;m Dự b&aacute;o nhu cầu nh&acirc;n lực v&agrave; Th&ocirc;ng tin thị trường lao động th&agrave;nh phố Hồ Ch&iacute; Minh (t&ecirc;n tiếng anh l&agrave;: Center of Forecasting Manpower Needs and Labor Market Information HCMC &ndash; t&ecirc;n viết tắt l&agrave;: FALMI) thuộc Sở Lao Động &ndash; Thương binh v&agrave; X&atilde; hội th&agrave;nh phố, l&agrave; đơn vị sự nghiệp c&ocirc;ng lập, được th&agrave;nh lập theo quyết định số 1518/QĐ-UBND ng&agrave;y 11 th&aacute;ng 4 năm 2009 của Ủy ban nh&acirc;n d&acirc;n th&agrave;nh phố Hồ Ch&iacute; Minh c&oacute; c&aacute;c nhiệm vụ ch&iacute;nh như sau:</p>
<p style="text-align: justify;">
	&nbsp;</p>
<p style="text-align: justify;">
	&nbsp;1. X&acirc;y dựng kế hoạch hằng năm v&agrave; 5 năm về dự b&aacute;o nhu cầu&nbsp; nh&acirc;n lực v&agrave; th&ocirc;ng tin thị trường lao động tr&ecirc;n địa b&agrave;n th&agrave;nh phố Hồ Ch&iacute; Minh, tr&igrave;nh Ủy ban nh&acirc;n d&acirc;n th&agrave;nh phố xem x&eacute;t, ph&ecirc; duyệt<br />
	&nbsp;<br />
	&nbsp;2. Tổ chức nghi&ecirc;n cứu, khảo s&aacute;t, thu thập, ph&acirc;n t&iacute;ch, đ&aacute;nh gi&aacute;, cung cấp c&aacute;c th&ocirc;ng tin về nguồn nh&acirc;n lực, lao động, việc l&agrave;m v&agrave; dạy nghề; thu thập th&ocirc;ng tin thị trường lao động trong nước v&agrave; ngo&agrave;i nước, nhu cầu lao động v&agrave; đ&agrave;o tạo nghề tr&ecirc;n địa b&agrave;n th&agrave;nh phố để dự b&aacute;o v&agrave; phục vụ c&ocirc;ng t&aacute;c quản l&yacute; nh&agrave; nước về lao động - việc l&agrave;m tr&ecirc;n địa b&agrave;n th&agrave;nh phố.<br />
	&nbsp;<br />
	3. Quản l&yacute;, khai th&aacute;c cơ sở dữ liệu về lao động - việc l&agrave;m phục vụ c&ocirc;ng t&aacute;c dự b&aacute;o nhu cầu nh&acirc;n lực v&agrave; th&ocirc;ng tin thị trường lao động tr&ecirc;n địa b&agrave;n để l&agrave;m cơ sở định hướng đ&agrave;o tạo nguồn nh&acirc;n lực đ&aacute;p ứng nhu cầu ph&aacute;t triển của th&agrave;nh phố.<br />
	&nbsp;<br />
	4. Cung cấp th&ocirc;ng tin về lao động, thị trường lao động, cung ứng dịch vụ lao động -&nbsp; việc l&agrave;m đối với cơ quan nh&agrave; nước, c&aacute;c th&agrave;nh phần kinh tế v&agrave; c&aacute;c tổ chức, c&aacute; nh&acirc;n c&oacute; nhu cầu theo quy định của ph&aacute;p luật<br />
	&nbsp;<br />
	5.&nbsp; Thực hiện chế độ thống k&ecirc;, b&aacute;o c&aacute;o định kỳ hoặc đột xuất theo quy định cho c&aacute;c cơ quan chức năng v&agrave; Ủy ban nh&acirc;n d&acirc;n th&agrave;nh phố.<br />
	&nbsp;</p>
<p style="text-align: justify;">
	<img alt="" height="718" src="http://dubaonhanluchcmc.com/fckFiles/image/so%20do%20nghiep%20vu.bmp" width="630" /></p>
', 81, CAST(0x00009D62018895FF AS DateTime), CAST(0x00009D62018895FF AS DateTime), 0, N'Actived', 0, N'Gioi-thieu-Trung-tam', N'Trung tâm Dự báo nhu cầu nhân lực và Thông tin thị trường lao động thành phố Hồ Chí Minh (tên tiếng anh là: Center of Forecasting Manpower Needs and Labor Market Information HCMC – tên viết tắt là: FALMI) thuộc Sở Lao Động – Thương binh và Xã hội thành phố, là đơn vị sự nghiệp công lập, được thành lập theo quyết định số 1518/QĐ-UBND ngày 11 tháng 4 năm 2009 của Ủy ban nhân dân thành phố Hồ Chí Minh có các nhiệm vụ chính như sau:', N'Gioi-thieu-Trung-tam.jpg')
INSERT [artseed].[Content] ([ContentId], [Title], [Content], [CategoryId], [CreatedDate], [UpdatedDate], [IsFeatured], [Status], [Count], [UniqueKey], [Description], [Picture]) VALUES (36, N'Sơ đồ tổ chức', N'<p style="text-align: center;">
	&nbsp;&nbsp;<span style="font-size: medium;">Trung t&acirc;m c&oacute; định bi&ecirc;n 30 c&aacute;n bộ vi&ecirc;n chức với cơ cấu tổ chức</span></p>
<p style="text-align: center;">
	&nbsp;</p>
<p style="text-align: center;">
	<img alt="" height="427" src="http://dubaonhanluchcmc.com/fckFiles/image/hot.JPG" width="660" /><br />
	&nbsp;</p>
<p>
	&nbsp;</p>
<p>
	&nbsp;</p>
<p>
	&nbsp;</p>
<p style="text-align: center;">
	Số điện thoại: 08.(35888754) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Fax: 08.(35888753)<br />
	Website: <a href="http://www%2Einfor@dubaonhanluchcmc.gov.vn/">www. dubaonhanluchcmc.gov.vn</a><br />
	Email :&nbsp;&nbsp;&nbsp; <a href="http://www%2Einfo@dubaonhanluchcmc.gov.vn/">www.falmi@dubaonhanluchcmc.gov.vn</a></p>
<h3>
	&nbsp;</h3>
<p style="text-align: center;">
	&nbsp;</p>
<h3 style="text-align: center;">
	&nbsp;</h3>
<blockquote>
	<p>
		&nbsp;</p>
</blockquote>
', 81, CAST(0x00009D6300083B29 AS DateTime), CAST(0x00009D6300083B29 AS DateTime), 0, N'Actived', 0, N'So-do-to-chuc', N'  Trung tâm có định biên 30 cán bộ viên chức với cơ cấu tổ chức', N'So-do-to-chuc.jpg')
INSERT [artseed].[Content] ([ContentId], [Title], [Content], [CategoryId], [CreatedDate], [UpdatedDate], [IsFeatured], [Status], [Count], [UniqueKey], [Description], [Picture]) VALUES (37, N'Sơ đồ vị trí Trung tâm', N'<p>
<!--top page-->	&nbsp;&nbsp; <strong><img alt="" height="482" src="http://dubaonhanluchcmc.com/fckFiles/image/so%20do.jpg" width="660" /></strong></p>
', 81, CAST(0x00009D630008D1D2 AS DateTime), CAST(0x00009D630008D1D2 AS DateTime), 0, N'Actived', 0, N'So-do-vi-tri-Trung-tam', N'Sơ đồ vị trí Trung tâm', N'So-do-vi-tri-Trung-tam.jpg')
SET IDENTITY_INSERT [artseed].[Content] OFF
/****** Object:  Table [artseed].[Navigation]    Script Date: 04/25/2010 12:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Navigation]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[Navigation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ParentId] [int] NULL,
	[Position] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[RelativeUrl] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DisplayOrder] [int] NULL,
	[Image] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ContentId] [int] NULL,
	[CategoryId] [int] NULL,
	[Component] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ExternalUrl] [varchar](250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Action] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Controller] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Area] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Navigation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [artseed].[Navigation] ON
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (1, N'Trang chủ', NULL, N'Main', N'Actived', NULL, 1, NULL, NULL, NULL, N'Home', NULL, N'Index', N'Home', NULL, CAST(0x00009D62001740C2 AS DateTime), CAST(0x00009D62001740C2 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (6, N'TỔNG QUAN VỀ TP.HCM', NULL, N'Main', N'Actived', NULL, 2, NULL, NULL, 32, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62001A4DC7 AS DateTime), CAST(0x00009D62001A4DC7 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (7, N'Giới thiệu vị trí địa lý', 6, N'Main', N'Actived', NULL, 1, NULL, NULL, 39, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62001BC7FB AS DateTime), CAST(0x00009D62001BC7FB AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (8, N'Lao Động - Việc Làm', 6, N'Main', N'Actived', NULL, 2, NULL, NULL, 40, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62001BF8E4 AS DateTime), CAST(0x00009D62001BF8E4 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (9, N'SỐ LIỆU THỐNG KÊ', NULL, N'Main', N'Actived', NULL, 3, NULL, NULL, 41, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62001C52C2 AS DateTime), CAST(0x00009D62001C52C2 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (10, N'THƯ VIỆN CSDL', NULL, N'Main', N'Actived', NULL, 4, NULL, NULL, 42, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62001C92FE AS DateTime), CAST(0x00009D62001C92FE AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (11, N'NHU CẦU NHÂN LỰC', NULL, N'Main', N'Actived', NULL, 5, NULL, NULL, 43, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62001CDD3D AS DateTime), CAST(0x00009D62001CDD3D AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (12, N'TRONG NƯỚC', 11, N'Main', N'Actived', NULL, 1, NULL, NULL, 44, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62001CF7EB AS DateTime), CAST(0x00009D62001CF7EB AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (13, N'NGOÀI NƯỚC', 11, N'Main', N'Actived', NULL, 2, NULL, NULL, 45, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62001D12A7 AS DateTime), CAST(0x00009D62001D12A7 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (14, N'NGHIÊN CỨU KHOA HỌC', NULL, N'Top', N'Actived', NULL, 1, NULL, NULL, 47, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62001DF1BF AS DateTime), CAST(0x00009D62001DF1BF AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (15, N'DỰ BÁO NHU CẦU NHÂN LỰC', NULL, N'Top', N'Actived', NULL, 2, NULL, NULL, 48, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62001E8FC0 AS DateTime), CAST(0x00009D62001E8FC0 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (16, N'THÔNG TIN THỊ TRƯỜNG LAO ĐỘNG', NULL, N'Top', N'Actived', NULL, 3, NULL, NULL, 49, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62001F48E3 AS DateTime), CAST(0x00009D62001F48E3 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (17, N'Tin tức và sự kiện', NULL, N'Left', N'Actived', NULL, 1, NULL, NULL, 50, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62002003C4 AS DateTime), CAST(0x00009D62002003C4 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (18, N'Hoạt động ngành LĐ-TBXH', NULL, N'Left', N'Actived', NULL, 2, NULL, NULL, 51, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D6200202936 AS DateTime), CAST(0x00009D6200202936 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (19, N'Hội đồng chuyên gia tư vấn', NULL, N'Left', N'Actived', NULL, 3, NULL, NULL, 52, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D62002042F4 AS DateTime), CAST(0x00009D62002042F4 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (20, N'Đào Tạo - Việc Làm', NULL, N'Left', N'Actived', NULL, 4, NULL, NULL, 53, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D620020637E AS DateTime), CAST(0x00009D620020637E AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (21, N'Tư vấn - Hỏi đáp', NULL, N'Left', N'Actived', NULL, 5, NULL, NULL, 54, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D620020AB1B AS DateTime), CAST(0x00009D620020AB1B AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (22, N'Văn bản pháp luật', NULL, N'Left', N'Actived', NULL, 6, NULL, NULL, 55, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D620020C15A AS DateTime), CAST(0x00009D620020C15A AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (23, N'Quan hệ hợp tác', NULL, N'Left', N'Actived', NULL, 7, NULL, NULL, 56, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D620020DA5D AS DateTime), CAST(0x00009D620020DA5D AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (24, N'Liên kết Website', NULL, N'Left', N'Actived', NULL, 8, NULL, NULL, NULL, N'WebLink', NULL, N'Index', N'WebLink', NULL, CAST(0x00009D620020F5B4 AS DateTime), CAST(0x00009D620020F5B4 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (25, N'Liên Hệ', NULL, N'Left', N'Actived', NULL, 9, NULL, NULL, NULL, N'WebContact', NULL, N'Index', N'WebContact', NULL, CAST(0x00009D620021163D AS DateTime), CAST(0x00009D620021163D AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (29, N'Giới thiệu Trung tâm', 1, N'Main', N'Actived', NULL, 1, NULL, 35, NULL, N'Post', NULL, N'View', N'Article', N'', CAST(0x00009D630004288A AS DateTime), CAST(0x00009D630004288A AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (30, N'Sơ đồ tổ chức', 1, N'Main', N'Actived', NULL, 2, NULL, 36, NULL, N'Post', NULL, N'View', N'Article', N'', CAST(0x00009D6300096062 AS DateTime), CAST(0x00009D6300096062 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (31, N'Sơ đồ vị trí trung tâm', 1, N'Main', N'Actived', NULL, NULL, NULL, 37, NULL, N'Post', NULL, N'View', N'Article', N'', CAST(0x00009D6300097E16 AS DateTime), CAST(0x00009D6300097E16 AS DateTime))
INSERT [artseed].[Navigation] ([Id], [Name], [ParentId], [Position], [Status], [RelativeUrl], [DisplayOrder], [Image], [ContentId], [CategoryId], [Component], [ExternalUrl], [Action], [Controller], [Area], [CreatedDate], [UpdatedDate]) VALUES (32, N'HOẠT ĐỘNG TRUNG TÂM', 1, N'Main', N'Actived', NULL, NULL, NULL, 35, 82, N'Article', NULL, N'Category', N'Article', N'', CAST(0x00009D630009A54E AS DateTime), CAST(0x00009D630009A54E AS DateTime))
SET IDENTITY_INSERT [artseed].[Navigation] OFF
/****** Object:  Table [artseed].[ContentRelation]    Script Date: 04/25/2010 12:09:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[ContentRelation]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[ContentRelation](
	[ContentId] [int] NOT NULL,
	[RelatedId] [int] NOT NULL,
 CONSTRAINT [PK_ContentRelation] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC,
	[RelatedId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [artseed].[UserInRole]    Script Date: 04/25/2010 12:09:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[UserInRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [artseed].[UserInRole](
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserInRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [artseed].[UserInRole] ([RoleId], [UserId]) VALUES (1, 1)
INSERT [artseed].[UserInRole] ([RoleId], [UserId]) VALUES (1, 2)
INSERT [artseed].[UserInRole] ([RoleId], [UserId]) VALUES (1, 4)
INSERT [artseed].[UserInRole] ([RoleId], [UserId]) VALUES (15, 2)
INSERT [artseed].[UserInRole] ([RoleId], [UserId]) VALUES (15, 4)
INSERT [artseed].[UserInRole] ([RoleId], [UserId]) VALUES (16, 4)
/****** Object:  Default [DF_ContentCategory_IsFeatured]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_ContentCategory_IsFeatured]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContentCategory_IsFeatured]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[ContentCategory] ADD  CONSTRAINT [DF_ContentCategory_IsFeatured]  DEFAULT ((0)) FOR [IsFeatured]
END


End
GO
/****** Object:  Default [DF_ContentCategory_ShowOnHP]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_ContentCategory_ShowOnHP]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContentCategory_ShowOnHP]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[ContentCategory] ADD  CONSTRAINT [DF_ContentCategory_ShowOnHP]  DEFAULT ((0)) FOR [ShowOnHP]
END


End
GO
/****** Object:  Default [DF_ContentCategory_Invisible]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_ContentCategory_Invisible]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContentCategory_Invisible]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[ContentCategory] ADD  CONSTRAINT [DF_ContentCategory_Invisible]  DEFAULT ((0)) FOR [Invisible]
END


End
GO
/****** Object:  Default [DF_Job_CreatedDate]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Job_CreatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[Job]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Job] ADD  CONSTRAINT [DF_Job_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END


End
GO
/****** Object:  Default [DF_Job_Deadline]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Job_Deadline]') AND parent_object_id = OBJECT_ID(N'[artseed].[Job]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_Deadline]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Job] ADD  CONSTRAINT [DF_Job_Deadline]  DEFAULT (getdate()) FOR [Deadline]
END


End
GO
/****** Object:  Default [DF_Job_UpdatedDate]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Job_UpdatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[Job]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Job] ADD  CONSTRAINT [DF_Job_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageUser]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageUser]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageUser]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageUser]  DEFAULT ((0)) FOR [AllowManageUser]
END


End
GO
/****** Object:  Default [DF_Role_AllowManagePoll]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManagePoll]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManagePoll]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManagePoll]  DEFAULT ((0)) FOR [AllowManagePoll]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageContact]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageContact]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageContact]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageContact]  DEFAULT ((0)) FOR [AllowManageContact]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageLink]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageLink]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageLink]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageLink]  DEFAULT ((0)) FOR [AllowManageLink]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageOnlineSupporter]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageOnlineSupporter]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageOnlineSupporter]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageOnlineSupporter]  DEFAULT ((0)) FOR [AllowManageOnlineSupporter]
END


End
GO
/****** Object:  Default [DF_Role_IsFullPermission]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_IsFullPermission]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_IsFullPermission]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_IsFullPermission]  DEFAULT ((0)) FOR [IsFullPermission]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageAllContent]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageAllContent]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageAllContent]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageAllContent]  DEFAULT ((0)) FOR [AllowManageAllContent]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageBanner]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageBanner]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageBanner]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageBanner]  DEFAULT ((0)) FOR [AllowManageBanner]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageMenu]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageMenu]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageMenu]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageMenu]  DEFAULT ((0)) FOR [AllowManageMenu]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageRole]    Script Date: 04/25/2010 12:09:42 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageRole]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageRole]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageRole]  DEFAULT ((0)) FOR [AllowManageRole]
END


End
GO
/****** Object:  Default [DF_User_CreatedDate]    Script Date: 04/25/2010 12:09:43 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_User_CreatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[User]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END


End
GO
/****** Object:  Default [DF_User_UpdatedDate]    Script Date: 04/25/2010 12:09:43 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_User_UpdatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[User]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[User] ADD  CONSTRAINT [DF_User_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
END


End
GO
/****** Object:  ForeignKey [FK_Content_ContentCategory]    Script Date: 04/25/2010 12:09:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Content_ContentCategory]') AND parent_object_id = OBJECT_ID(N'[artseed].[Content]'))
ALTER TABLE [artseed].[Content]  WITH NOCHECK ADD  CONSTRAINT [FK_Content_ContentCategory] FOREIGN KEY([CategoryId])
REFERENCES [artseed].[ContentCategory] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Content_ContentCategory]') AND parent_object_id = OBJECT_ID(N'[artseed].[Content]'))
ALTER TABLE [artseed].[Content] CHECK CONSTRAINT [FK_Content_ContentCategory]
GO
/****** Object:  ForeignKey [FK_ContentCategory_ContentCategory]    Script Date: 04/25/2010 12:09:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentCategory_ContentCategory]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
ALTER TABLE [artseed].[ContentCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_ContentCategory_ContentCategory] FOREIGN KEY([ParentCategoryId])
REFERENCES [artseed].[ContentCategory] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentCategory_ContentCategory]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
ALTER TABLE [artseed].[ContentCategory] CHECK CONSTRAINT [FK_ContentCategory_ContentCategory]
GO
/****** Object:  ForeignKey [FK_ContentRelation_Content]    Script Date: 04/25/2010 12:09:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentRelation_Content]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentRelation]'))
ALTER TABLE [artseed].[ContentRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_ContentRelation_Content] FOREIGN KEY([ContentId])
REFERENCES [artseed].[Content] ([ContentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentRelation_Content]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentRelation]'))
ALTER TABLE [artseed].[ContentRelation] CHECK CONSTRAINT [FK_ContentRelation_Content]
GO
/****** Object:  ForeignKey [FK_ContentRelation_Content1]    Script Date: 04/25/2010 12:09:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentRelation_Content1]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentRelation]'))
ALTER TABLE [artseed].[ContentRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_ContentRelation_Content1] FOREIGN KEY([RelatedId])
REFERENCES [artseed].[Content] ([ContentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentRelation_Content1]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentRelation]'))
ALTER TABLE [artseed].[ContentRelation] CHECK CONSTRAINT [FK_ContentRelation_Content1]
GO
/****** Object:  ForeignKey [FK_Navigation_Content]    Script Date: 04/25/2010 12:09:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_Content]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation]  WITH CHECK ADD  CONSTRAINT [FK_Navigation_Content] FOREIGN KEY([ContentId])
REFERENCES [artseed].[Content] ([ContentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_Content]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation] CHECK CONSTRAINT [FK_Navigation_Content]
GO
/****** Object:  ForeignKey [FK_Navigation_ContentCategory1]    Script Date: 04/25/2010 12:09:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_ContentCategory1]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation]  WITH CHECK ADD  CONSTRAINT [FK_Navigation_ContentCategory1] FOREIGN KEY([CategoryId])
REFERENCES [artseed].[ContentCategory] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_ContentCategory1]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation] CHECK CONSTRAINT [FK_Navigation_ContentCategory1]
GO
/****** Object:  ForeignKey [FK_Navigation_Navigation]    Script Date: 04/25/2010 12:09:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_Navigation]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation]  WITH NOCHECK ADD  CONSTRAINT [FK_Navigation_Navigation] FOREIGN KEY([ParentId])
REFERENCES [artseed].[Navigation] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_Navigation]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation] CHECK CONSTRAINT [FK_Navigation_Navigation]
GO
/****** Object:  ForeignKey [FK_PollQuestion_Poll]    Script Date: 04/25/2010 12:09:42 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_PollQuestion_Poll]') AND parent_object_id = OBJECT_ID(N'[artseed].[PollQuestion]'))
ALTER TABLE [artseed].[PollQuestion]  WITH NOCHECK ADD  CONSTRAINT [FK_PollQuestion_Poll] FOREIGN KEY([PollId])
REFERENCES [artseed].[Poll] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_PollQuestion_Poll]') AND parent_object_id = OBJECT_ID(N'[artseed].[PollQuestion]'))
ALTER TABLE [artseed].[PollQuestion] CHECK CONSTRAINT [FK_PollQuestion_Poll]
GO
/****** Object:  ForeignKey [FK_UserInRole_Role]    Script Date: 04/25/2010 12:09:43 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_UserInRole_Role]') AND parent_object_id = OBJECT_ID(N'[artseed].[UserInRole]'))
ALTER TABLE [artseed].[UserInRole]  WITH NOCHECK ADD  CONSTRAINT [FK_UserInRole_Role] FOREIGN KEY([RoleId])
REFERENCES [artseed].[Role] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_UserInRole_Role]') AND parent_object_id = OBJECT_ID(N'[artseed].[UserInRole]'))
ALTER TABLE [artseed].[UserInRole] CHECK CONSTRAINT [FK_UserInRole_Role]
GO
/****** Object:  ForeignKey [FK_UserInRole_User]    Script Date: 04/25/2010 12:09:43 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_UserInRole_User]') AND parent_object_id = OBJECT_ID(N'[artseed].[UserInRole]'))
ALTER TABLE [artseed].[UserInRole]  WITH NOCHECK ADD  CONSTRAINT [FK_UserInRole_User] FOREIGN KEY([UserId])
REFERENCES [artseed].[User] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_UserInRole_User]') AND parent_object_id = OBJECT_ID(N'[artseed].[UserInRole]'))
ALTER TABLE [artseed].[UserInRole] CHECK CONSTRAINT [FK_UserInRole_User]
GO

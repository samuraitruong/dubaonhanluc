/****** Object:  ForeignKey [FK_Content_ContentCategory]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Content_ContentCategory]') AND parent_object_id = OBJECT_ID(N'[artseed].[Content]'))
ALTER TABLE [artseed].[Content] DROP CONSTRAINT [FK_Content_ContentCategory]
GO
/****** Object:  ForeignKey [FK_ContentCategory_ContentCategory]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentCategory_ContentCategory]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
ALTER TABLE [artseed].[ContentCategory] DROP CONSTRAINT [FK_ContentCategory_ContentCategory]
GO
/****** Object:  ForeignKey [FK_ContentRelation_Content]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentRelation_Content]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentRelation]'))
ALTER TABLE [artseed].[ContentRelation] DROP CONSTRAINT [FK_ContentRelation_Content]
GO
/****** Object:  ForeignKey [FK_ContentRelation_Content1]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentRelation_Content1]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentRelation]'))
ALTER TABLE [artseed].[ContentRelation] DROP CONSTRAINT [FK_ContentRelation_Content1]
GO
/****** Object:  ForeignKey [FK_Navigation_Content]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_Content]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation] DROP CONSTRAINT [FK_Navigation_Content]
GO
/****** Object:  ForeignKey [FK_Navigation_ContentCategory1]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_ContentCategory1]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation] DROP CONSTRAINT [FK_Navigation_ContentCategory1]
GO
/****** Object:  ForeignKey [FK_Navigation_Navigation]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_Navigation]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation] DROP CONSTRAINT [FK_Navigation_Navigation]
GO
/****** Object:  ForeignKey [FK_PollQuestion_Poll]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_PollQuestion_Poll]') AND parent_object_id = OBJECT_ID(N'[artseed].[PollQuestion]'))
ALTER TABLE [artseed].[PollQuestion] DROP CONSTRAINT [FK_PollQuestion_Poll]
GO
/****** Object:  ForeignKey [FK_UserInRole_Role]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_UserInRole_Role]') AND parent_object_id = OBJECT_ID(N'[artseed].[UserInRole]'))
ALTER TABLE [artseed].[UserInRole] DROP CONSTRAINT [FK_UserInRole_Role]
GO
/****** Object:  ForeignKey [FK_UserInRole_User]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_UserInRole_User]') AND parent_object_id = OBJECT_ID(N'[artseed].[UserInRole]'))
ALTER TABLE [artseed].[UserInRole] DROP CONSTRAINT [FK_UserInRole_User]
GO
/****** Object:  Table [artseed].[UserInRole]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[UserInRole]') AND type in (N'U'))
DROP TABLE [artseed].[UserInRole]
GO
/****** Object:  Table [artseed].[ContentRelation]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[ContentRelation]') AND type in (N'U'))
DROP TABLE [artseed].[ContentRelation]
GO
/****** Object:  Table [artseed].[Navigation]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Navigation]') AND type in (N'U'))
DROP TABLE [artseed].[Navigation]
GO
/****** Object:  Table [artseed].[Content]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Content]') AND type in (N'U'))
DROP TABLE [artseed].[Content]
GO
/****** Object:  Table [artseed].[PollQuestion]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[PollQuestion]') AND type in (N'U'))
DROP TABLE [artseed].[PollQuestion]
GO
/****** Object:  Table [artseed].[Contact]    Script Date: 04/25/2010 11:26:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Contact]') AND type in (N'U'))
DROP TABLE [artseed].[Contact]
GO
/****** Object:  Table [artseed].[Role]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Role]') AND type in (N'U'))
DROP TABLE [artseed].[Role]
GO
/****** Object:  Table [artseed].[Job]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Job]') AND type in (N'U'))
DROP TABLE [artseed].[Job]
GO
/****** Object:  Table [artseed].[ContentCategory]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[ContentCategory]') AND type in (N'U'))
DROP TABLE [artseed].[ContentCategory]
GO
/****** Object:  Table [artseed].[Banner]    Script Date: 04/25/2010 11:26:22 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Banner]') AND type in (N'U'))
DROP TABLE [artseed].[Banner]
GO
/****** Object:  Table [artseed].[User]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[User]') AND type in (N'U'))
DROP TABLE [artseed].[User]
GO
/****** Object:  Table [artseed].[Link]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Link]') AND type in (N'U'))
DROP TABLE [artseed].[Link]
GO
/****** Object:  Table [artseed].[Poll]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Poll]') AND type in (N'U'))
DROP TABLE [artseed].[Poll]
GO
/****** Object:  Table [artseed].[Supporter]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[artseed].[Supporter]') AND type in (N'U'))
DROP TABLE [artseed].[Supporter]
GO
/****** Object:  Default [DF_ContentCategory_IsFeatured]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_ContentCategory_IsFeatured]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContentCategory_IsFeatured]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[ContentCategory] DROP CONSTRAINT [DF_ContentCategory_IsFeatured]
END


End
GO
/****** Object:  Default [DF_ContentCategory_ShowOnHP]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_ContentCategory_ShowOnHP]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContentCategory_ShowOnHP]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[ContentCategory] DROP CONSTRAINT [DF_ContentCategory_ShowOnHP]
END


End
GO
/****** Object:  Default [DF_ContentCategory_Invisible]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_ContentCategory_Invisible]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContentCategory_Invisible]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[ContentCategory] DROP CONSTRAINT [DF_ContentCategory_Invisible]
END


End
GO
/****** Object:  Default [DF_Job_CreatedDate]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Job_CreatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[Job]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Job] DROP CONSTRAINT [DF_Job_CreatedDate]
END


End
GO
/****** Object:  Default [DF_Job_Deadline]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Job_Deadline]') AND parent_object_id = OBJECT_ID(N'[artseed].[Job]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_Deadline]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Job] DROP CONSTRAINT [DF_Job_Deadline]
END


End
GO
/****** Object:  Default [DF_Job_UpdatedDate]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Job_UpdatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[Job]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Job] DROP CONSTRAINT [DF_Job_UpdatedDate]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageUser]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageUser]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageUser]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageUser]
END


End
GO
/****** Object:  Default [DF_Role_AllowManagePoll]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManagePoll]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManagePoll]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManagePoll]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageContact]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageContact]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageContact]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageContact]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageLink]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageLink]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageLink]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageLink]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageOnlineSupporter]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageOnlineSupporter]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageOnlineSupporter]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageOnlineSupporter]
END


End
GO
/****** Object:  Default [DF_Role_IsFullPermission]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_IsFullPermission]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_IsFullPermission]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_IsFullPermission]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageAllContent]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageAllContent]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageAllContent]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageAllContent]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageBanner]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageBanner]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageBanner]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageBanner]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageMenu]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageMenu]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageMenu]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageMenu]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageRole]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageRole]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageRole]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] DROP CONSTRAINT [DF_Role_AllowManageRole]
END


End
GO
/****** Object:  Default [DF_User_CreatedDate]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_User_CreatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[User]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[User] DROP CONSTRAINT [DF_User_CreatedDate]
END


End
GO
/****** Object:  Default [DF_User_UpdatedDate]    Script Date: 04/25/2010 11:26:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_User_UpdatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[User]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[User] DROP CONSTRAINT [DF_User_UpdatedDate]
END


End
GO
/****** Object:  Schema [artseed]    Script Date: 04/25/2010 11:26:24 ******/
IF  EXISTS (SELECT * FROM sys.schemas WHERE name = N'artseed')
DROP SCHEMA [artseed]
GO
/****** Object:  Role [artseed]    Script Date: 04/25/2010 11:26:23 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'artseed')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'artseed' AND type = 'R')
CREATE ROLE [artseed]

END
GO
/****** Object:  Schema [artseed]    Script Date: 04/25/2010 11:26:24 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'artseed')
EXEC sys.sp_executesql N'CREATE SCHEMA [artseed] AUTHORIZATION [artseed]'
GO
/****** Object:  Table [artseed].[Supporter]    Script Date: 04/25/2010 11:26:23 ******/
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
/****** Object:  Table [artseed].[Poll]    Script Date: 04/25/2010 11:26:23 ******/
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
/****** Object:  Table [artseed].[Link]    Script Date: 04/25/2010 11:26:23 ******/
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
/****** Object:  Table [artseed].[User]    Script Date: 04/25/2010 11:26:23 ******/
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
/****** Object:  Table [artseed].[Banner]    Script Date: 04/25/2010 11:26:22 ******/
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
/****** Object:  Table [artseed].[ContentCategory]    Script Date: 04/25/2010 11:26:23 ******/
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
/****** Object:  Table [artseed].[Job]    Script Date: 04/25/2010 11:26:23 ******/
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
/****** Object:  Table [artseed].[Role]    Script Date: 04/25/2010 11:26:23 ******/
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
/****** Object:  Table [artseed].[Contact]    Script Date: 04/25/2010 11:26:22 ******/
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
/****** Object:  Table [artseed].[PollQuestion]    Script Date: 04/25/2010 11:26:23 ******/
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
/****** Object:  Table [artseed].[Content]    Script Date: 04/25/2010 11:26:23 ******/
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
/****** Object:  Table [artseed].[Navigation]    Script Date: 04/25/2010 11:26:23 ******/
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
/****** Object:  Table [artseed].[ContentRelation]    Script Date: 04/25/2010 11:26:23 ******/
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
/****** Object:  Table [artseed].[UserInRole]    Script Date: 04/25/2010 11:26:23 ******/
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
/****** Object:  Default [DF_ContentCategory_IsFeatured]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_ContentCategory_IsFeatured]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContentCategory_IsFeatured]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[ContentCategory] ADD  CONSTRAINT [DF_ContentCategory_IsFeatured]  DEFAULT ((0)) FOR [IsFeatured]
END


End
GO
/****** Object:  Default [DF_ContentCategory_ShowOnHP]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_ContentCategory_ShowOnHP]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContentCategory_ShowOnHP]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[ContentCategory] ADD  CONSTRAINT [DF_ContentCategory_ShowOnHP]  DEFAULT ((0)) FOR [ShowOnHP]
END


End
GO
/****** Object:  Default [DF_ContentCategory_Invisible]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_ContentCategory_Invisible]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_ContentCategory_Invisible]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[ContentCategory] ADD  CONSTRAINT [DF_ContentCategory_Invisible]  DEFAULT ((0)) FOR [Invisible]
END


End
GO
/****** Object:  Default [DF_Job_CreatedDate]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Job_CreatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[Job]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Job] ADD  CONSTRAINT [DF_Job_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END


End
GO
/****** Object:  Default [DF_Job_Deadline]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Job_Deadline]') AND parent_object_id = OBJECT_ID(N'[artseed].[Job]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_Deadline]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Job] ADD  CONSTRAINT [DF_Job_Deadline]  DEFAULT (getdate()) FOR [Deadline]
END


End
GO
/****** Object:  Default [DF_Job_UpdatedDate]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Job_UpdatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[Job]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Job_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Job] ADD  CONSTRAINT [DF_Job_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageUser]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageUser]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageUser]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageUser]  DEFAULT ((0)) FOR [AllowManageUser]
END


End
GO
/****** Object:  Default [DF_Role_AllowManagePoll]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManagePoll]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManagePoll]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManagePoll]  DEFAULT ((0)) FOR [AllowManagePoll]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageContact]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageContact]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageContact]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageContact]  DEFAULT ((0)) FOR [AllowManageContact]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageLink]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageLink]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageLink]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageLink]  DEFAULT ((0)) FOR [AllowManageLink]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageOnlineSupporter]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageOnlineSupporter]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageOnlineSupporter]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageOnlineSupporter]  DEFAULT ((0)) FOR [AllowManageOnlineSupporter]
END


End
GO
/****** Object:  Default [DF_Role_IsFullPermission]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_IsFullPermission]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_IsFullPermission]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_IsFullPermission]  DEFAULT ((0)) FOR [IsFullPermission]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageAllContent]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageAllContent]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageAllContent]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageAllContent]  DEFAULT ((0)) FOR [AllowManageAllContent]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageBanner]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageBanner]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageBanner]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageBanner]  DEFAULT ((0)) FOR [AllowManageBanner]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageMenu]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageMenu]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageMenu]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageMenu]  DEFAULT ((0)) FOR [AllowManageMenu]
END


End
GO
/****** Object:  Default [DF_Role_AllowManageRole]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_Role_AllowManageRole]') AND parent_object_id = OBJECT_ID(N'[artseed].[Role]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_Role_AllowManageRole]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[Role] ADD  CONSTRAINT [DF_Role_AllowManageRole]  DEFAULT ((0)) FOR [AllowManageRole]
END


End
GO
/****** Object:  Default [DF_User_CreatedDate]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_User_CreatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[User]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_CreatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
END


End
GO
/****** Object:  Default [DF_User_UpdatedDate]    Script Date: 04/25/2010 11:26:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[artseed].[DF_User_UpdatedDate]') AND parent_object_id = OBJECT_ID(N'[artseed].[User]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_User_UpdatedDate]') AND type = 'D')
BEGIN
ALTER TABLE [artseed].[User] ADD  CONSTRAINT [DF_User_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
END


End
GO
/****** Object:  ForeignKey [FK_Content_ContentCategory]    Script Date: 04/25/2010 11:26:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Content_ContentCategory]') AND parent_object_id = OBJECT_ID(N'[artseed].[Content]'))
ALTER TABLE [artseed].[Content]  WITH NOCHECK ADD  CONSTRAINT [FK_Content_ContentCategory] FOREIGN KEY([CategoryId])
REFERENCES [artseed].[ContentCategory] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Content_ContentCategory]') AND parent_object_id = OBJECT_ID(N'[artseed].[Content]'))
ALTER TABLE [artseed].[Content] CHECK CONSTRAINT [FK_Content_ContentCategory]
GO
/****** Object:  ForeignKey [FK_ContentCategory_ContentCategory]    Script Date: 04/25/2010 11:26:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentCategory_ContentCategory]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
ALTER TABLE [artseed].[ContentCategory]  WITH NOCHECK ADD  CONSTRAINT [FK_ContentCategory_ContentCategory] FOREIGN KEY([ParentCategoryId])
REFERENCES [artseed].[ContentCategory] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentCategory_ContentCategory]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentCategory]'))
ALTER TABLE [artseed].[ContentCategory] CHECK CONSTRAINT [FK_ContentCategory_ContentCategory]
GO
/****** Object:  ForeignKey [FK_ContentRelation_Content]    Script Date: 04/25/2010 11:26:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentRelation_Content]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentRelation]'))
ALTER TABLE [artseed].[ContentRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_ContentRelation_Content] FOREIGN KEY([ContentId])
REFERENCES [artseed].[Content] ([ContentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentRelation_Content]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentRelation]'))
ALTER TABLE [artseed].[ContentRelation] CHECK CONSTRAINT [FK_ContentRelation_Content]
GO
/****** Object:  ForeignKey [FK_ContentRelation_Content1]    Script Date: 04/25/2010 11:26:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentRelation_Content1]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentRelation]'))
ALTER TABLE [artseed].[ContentRelation]  WITH NOCHECK ADD  CONSTRAINT [FK_ContentRelation_Content1] FOREIGN KEY([RelatedId])
REFERENCES [artseed].[Content] ([ContentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_ContentRelation_Content1]') AND parent_object_id = OBJECT_ID(N'[artseed].[ContentRelation]'))
ALTER TABLE [artseed].[ContentRelation] CHECK CONSTRAINT [FK_ContentRelation_Content1]
GO
/****** Object:  ForeignKey [FK_Navigation_Content]    Script Date: 04/25/2010 11:26:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_Content]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation]  WITH CHECK ADD  CONSTRAINT [FK_Navigation_Content] FOREIGN KEY([ContentId])
REFERENCES [artseed].[Content] ([ContentId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_Content]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation] CHECK CONSTRAINT [FK_Navigation_Content]
GO
/****** Object:  ForeignKey [FK_Navigation_ContentCategory1]    Script Date: 04/25/2010 11:26:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_ContentCategory1]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation]  WITH CHECK ADD  CONSTRAINT [FK_Navigation_ContentCategory1] FOREIGN KEY([CategoryId])
REFERENCES [artseed].[ContentCategory] ([ID])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_ContentCategory1]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation] CHECK CONSTRAINT [FK_Navigation_ContentCategory1]
GO
/****** Object:  ForeignKey [FK_Navigation_Navigation]    Script Date: 04/25/2010 11:26:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_Navigation]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation]  WITH NOCHECK ADD  CONSTRAINT [FK_Navigation_Navigation] FOREIGN KEY([ParentId])
REFERENCES [artseed].[Navigation] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_Navigation_Navigation]') AND parent_object_id = OBJECT_ID(N'[artseed].[Navigation]'))
ALTER TABLE [artseed].[Navigation] CHECK CONSTRAINT [FK_Navigation_Navigation]
GO
/****** Object:  ForeignKey [FK_PollQuestion_Poll]    Script Date: 04/25/2010 11:26:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_PollQuestion_Poll]') AND parent_object_id = OBJECT_ID(N'[artseed].[PollQuestion]'))
ALTER TABLE [artseed].[PollQuestion]  WITH NOCHECK ADD  CONSTRAINT [FK_PollQuestion_Poll] FOREIGN KEY([PollId])
REFERENCES [artseed].[Poll] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_PollQuestion_Poll]') AND parent_object_id = OBJECT_ID(N'[artseed].[PollQuestion]'))
ALTER TABLE [artseed].[PollQuestion] CHECK CONSTRAINT [FK_PollQuestion_Poll]
GO
/****** Object:  ForeignKey [FK_UserInRole_Role]    Script Date: 04/25/2010 11:26:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_UserInRole_Role]') AND parent_object_id = OBJECT_ID(N'[artseed].[UserInRole]'))
ALTER TABLE [artseed].[UserInRole]  WITH NOCHECK ADD  CONSTRAINT [FK_UserInRole_Role] FOREIGN KEY([RoleId])
REFERENCES [artseed].[Role] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_UserInRole_Role]') AND parent_object_id = OBJECT_ID(N'[artseed].[UserInRole]'))
ALTER TABLE [artseed].[UserInRole] CHECK CONSTRAINT [FK_UserInRole_Role]
GO
/****** Object:  ForeignKey [FK_UserInRole_User]    Script Date: 04/25/2010 11:26:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_UserInRole_User]') AND parent_object_id = OBJECT_ID(N'[artseed].[UserInRole]'))
ALTER TABLE [artseed].[UserInRole]  WITH NOCHECK ADD  CONSTRAINT [FK_UserInRole_User] FOREIGN KEY([UserId])
REFERENCES [artseed].[User] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[artseed].[FK_UserInRole_User]') AND parent_object_id = OBJECT_ID(N'[artseed].[UserInRole]'))
ALTER TABLE [artseed].[UserInRole] CHECK CONSTRAINT [FK_UserInRole_User]
GO

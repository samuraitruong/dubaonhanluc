CREATE DATABASE [DBNL]
GO
USE [DBNL]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 04/01/2010 18:04:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](250) NOT NULL,
	[ContentPermission] [nvarchar](250) NULL,
	[ComponentPermission] [nvarchar](250) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04/01/2010 18:04:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Name] [nchar](10) NOT NULL,
	[Password] [nvarchar](32) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 04/01/2010 18:04:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supporter]    Script Date: 04/01/2010 18:04:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Supporter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[NickName] [nvarchar](100) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Supporter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poll]    Script Date: 04/01/2010 18:04:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Poll](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PollName] [nvarchar](250) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Poll] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Link]    Script Date: 04/01/2010 18:04:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Link](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Url] [nvarchar](250) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Link] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banner]    Script Date: 04/01/2010 18:04:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Banner](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Url] [nvarchar](150) NOT NULL,
	[BannerImage] [nvarchar](150) NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[BannerPosition] [nvarchar](50) NULL,
 CONSTRAINT [PK_Banner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentCategory]    Script Date: 04/01/2010 18:04:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ContentCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](150) NOT NULL,
	[Key] [nvarchar](150) NOT NULL,
	[ParentCategory] [int] NULL,
 CONSTRAINT [PK_ContentCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Navigation]    Script Date: 04/01/2010 18:04:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [Navigation](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](250) NULL,
	[ParentId] [int] NULL,
	[Position] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NOT NULL,
	[RelativeUrl] [nvarchar](50) NULL,
	[DisplayOrder] [int] NULL,
	[Image] [nvarchar](150) NULL,
	[ContentId] [int] NULL,
	[Component] [nvarchar](50) NULL,
	[ExternalUrl] [varchar](250) NULL,
	[Action] [nvarchar](100) NULL,
	[Controller] [nvarchar](100) NULL,
	[Area] [nvarchar](100) NULL,
 CONSTRAINT [PK_Navigation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContentRelation]    Script Date: 04/01/2010 18:04:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ContentRelation](
	[ContentId] [int] NOT NULL,
	[RelatedId] [int] NOT NULL,
 CONSTRAINT [PK_ContentRelation] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC,
	[RelatedId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserInRole]    Script Date: 04/01/2010 18:04:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UserInRole](
	[RoleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserInRole] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PollQuestion]    Script Date: 04/01/2010 18:04:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PollQuestion](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](250) NOT NULL,
	[PollId] [int] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[Responses] [int] NOT NULL,
 CONSTRAINT [PK_PollQuestion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Content]    Script Date: 04/01/2010 18:04:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Content](
	[ContentId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Content] [ntext] NULL,
	[CategoryId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[IsFeatured] [bit] NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Count] [int] NOT NULL,
	[UniqueKey] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](255) NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_Content_ContentCategory]    Script Date: 04/01/2010 18:04:27 ******/
ALTER TABLE [Content]  WITH CHECK ADD  CONSTRAINT [FK_Content_ContentCategory] FOREIGN KEY([CategoryId])
REFERENCES [ContentCategory] ([ID])
GO
ALTER TABLE [Content] CHECK CONSTRAINT [FK_Content_ContentCategory]
GO
/****** Object:  ForeignKey [FK_ContentCategory_ContentCategory]    Script Date: 04/01/2010 18:04:29 ******/
ALTER TABLE [ContentCategory]  WITH CHECK ADD  CONSTRAINT [FK_ContentCategory_ContentCategory] FOREIGN KEY([ParentCategory])
REFERENCES [ContentCategory] ([ID])
GO
ALTER TABLE [ContentCategory] CHECK CONSTRAINT [FK_ContentCategory_ContentCategory]
GO
/****** Object:  ForeignKey [FK_ContentRelation_Content]    Script Date: 04/01/2010 18:04:30 ******/
ALTER TABLE [ContentRelation]  WITH CHECK ADD  CONSTRAINT [FK_ContentRelation_Content] FOREIGN KEY([ContentId])
REFERENCES [Content] ([ContentId])
GO
ALTER TABLE [ContentRelation] CHECK CONSTRAINT [FK_ContentRelation_Content]
GO
/****** Object:  ForeignKey [FK_ContentRelation_Content1]    Script Date: 04/01/2010 18:04:30 ******/
ALTER TABLE [ContentRelation]  WITH CHECK ADD  CONSTRAINT [FK_ContentRelation_Content1] FOREIGN KEY([RelatedId])
REFERENCES [Content] ([ContentId])
GO
ALTER TABLE [ContentRelation] CHECK CONSTRAINT [FK_ContentRelation_Content1]
GO
/****** Object:  ForeignKey [FK_Navigation_Content]    Script Date: 04/01/2010 18:04:37 ******/
ALTER TABLE [Navigation]  WITH CHECK ADD  CONSTRAINT [FK_Navigation_Content] FOREIGN KEY([ContentId])
REFERENCES [Content] ([ContentId])
GO
ALTER TABLE [Navigation] CHECK CONSTRAINT [FK_Navigation_Content]
GO
/****** Object:  ForeignKey [FK_Navigation_Navigation]    Script Date: 04/01/2010 18:04:37 ******/
ALTER TABLE [Navigation]  WITH CHECK ADD  CONSTRAINT [FK_Navigation_Navigation] FOREIGN KEY([ParentId])
REFERENCES [Navigation] ([Id])
GO
ALTER TABLE [Navigation] CHECK CONSTRAINT [FK_Navigation_Navigation]
GO
/****** Object:  ForeignKey [FK_PollQuestion_Poll]    Script Date: 04/01/2010 18:04:41 ******/
ALTER TABLE [PollQuestion]  WITH CHECK ADD  CONSTRAINT [FK_PollQuestion_Poll] FOREIGN KEY([PollId])
REFERENCES [Poll] ([Id])
GO
ALTER TABLE [PollQuestion] CHECK CONSTRAINT [FK_PollQuestion_Poll]
GO
/****** Object:  ForeignKey [FK_UserInRole_Role]    Script Date: 04/01/2010 18:04:48 ******/
ALTER TABLE [UserInRole]  WITH CHECK ADD  CONSTRAINT [FK_UserInRole_Role] FOREIGN KEY([RoleId])
REFERENCES [Role] ([Id])
GO
ALTER TABLE [UserInRole] CHECK CONSTRAINT [FK_UserInRole_Role]
GO
/****** Object:  ForeignKey [FK_UserInRole_User]    Script Date: 04/01/2010 18:04:48 ******/
ALTER TABLE [UserInRole]  WITH CHECK ADD  CONSTRAINT [FK_UserInRole_User] FOREIGN KEY([UserId])
REFERENCES [User] ([Id])
GO
ALTER TABLE [UserInRole] CHECK CONSTRAINT [FK_UserInRole_User]
GO

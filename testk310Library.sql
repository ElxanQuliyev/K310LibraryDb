USE [LibraryK310]
GO
/****** Object:  Table [dbo].[Janr]    Script Date: 5/24/2021 8:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Janr](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 5/24/2021 8:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[JanrId] [int] NULL,
	[PublishHouseId] [int] NULL,
	[publishDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SelectBookWithJanr]    Script Date: 5/24/2021 8:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create View [dbo].[SelectBookWithJanr] as
select bs.Name[Book Name],bs.publishDate,js.Name[Janr Name] from Books bs
Join Janr js
on js.Id=bs.JanrId
GO
/****** Object:  Table [dbo].[Readers]    Script Date: 5/24/2021 8:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Readers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Ibn] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reader_To_Book]    Script Date: 5/24/2021 8:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reader_To_Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ReaderId] [int] NULL,
	[BookId] [int] NULL,
	[fromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[SelectReaderWithBook]    Script Date: 5/24/2021 8:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[SelectReaderWithBook]  as 
select rs.Name[Reader Name],rs.Ibn,bs.Name[Book Name],
 js.Name[Janr Name]  ,CONVERT(varchar(11),DATEDIFF(DAY,rtb.fromDate,rtb.ToDate))+' Day' as DateDiff
  from Reader_To_Book rtb
Join Readers rs
on rs.Id=rtb.ReaderId
Join Books bs
on bs.Id=rtb.BookId
Join Janr js
on bs.JanrId= js.Id
GO
/****** Object:  Table [dbo].[PublishHouse]    Script Date: 5/24/2021 8:26:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PublishHouse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Name], [JanrId], [PublishHouseId], [publishDate]) VALUES (4, N'Leyli və Məcnun', 2, 2, CAST(N'2020-05-04' AS Date))
INSERT [dbo].[Books] ([Id], [Name], [JanrId], [PublishHouseId], [publishDate]) VALUES (5, N'Cinayət və Cəza', 3, 1, CAST(N'2020-09-10' AS Date))
INSERT [dbo].[Books] ([Id], [Name], [JanrId], [PublishHouseId], [publishDate]) VALUES (6, N'Sherlock', 4, 1, CAST(N'2020-10-20' AS Date))
INSERT [dbo].[Books] ([Id], [Name], [JanrId], [PublishHouseId], [publishDate]) VALUES (7, N'Lod Ecverin ölümü', 3, 2, CAST(N'2020-12-18' AS Date))
INSERT [dbo].[Books] ([Id], [Name], [JanrId], [PublishHouseId], [publishDate]) VALUES (8, N'İblislərin ənənələri', 2, 2, CAST(N'2020-10-25' AS Date))
INSERT [dbo].[Books] ([Id], [Name], [JanrId], [PublishHouseId], [publishDate]) VALUES (9, N'Zəif Ürək', 1, 2, CAST(N'2020-01-12' AS Date))
INSERT [dbo].[Books] ([Id], [Name], [JanrId], [PublishHouseId], [publishDate]) VALUES (10, N'Yaxın Sahil', 2, 3, CAST(N'2020-02-12' AS Date))
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Janr] ON 

INSERT [dbo].[Janr] ([Id], [Name]) VALUES (1, N'Klassiklər')
INSERT [dbo].[Janr] ([Id], [Name]) VALUES (2, N'Bədii Əsər')
INSERT [dbo].[Janr] ([Id], [Name]) VALUES (3, N'Dram')
INSERT [dbo].[Janr] ([Id], [Name]) VALUES (4, N'Dedektiv')
SET IDENTITY_INSERT [dbo].[Janr] OFF
GO
SET IDENTITY_INSERT [dbo].[PublishHouse] ON 

INSERT [dbo].[PublishHouse] ([Id], [Name]) VALUES (1, N'Araz')
INSERT [dbo].[PublishHouse] ([Id], [Name]) VALUES (2, N'Güvən')
INSERT [dbo].[PublishHouse] ([Id], [Name]) VALUES (3, N'Ələddin')
INSERT [dbo].[PublishHouse] ([Id], [Name]) VALUES (4, N'Bizim')
SET IDENTITY_INSERT [dbo].[PublishHouse] OFF
GO
SET IDENTITY_INSERT [dbo].[Reader_To_Book] ON 

INSERT [dbo].[Reader_To_Book] ([Id], [ReaderId], [BookId], [fromDate], [ToDate]) VALUES (1, 1, 4, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-05-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Reader_To_Book] ([Id], [ReaderId], [BookId], [fromDate], [ToDate]) VALUES (2, 1, 5, CAST(N'2021-06-07T00:00:00.000' AS DateTime), CAST(N'2021-07-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Reader_To_Book] ([Id], [ReaderId], [BookId], [fromDate], [ToDate]) VALUES (3, 2, 6, CAST(N'2021-05-04T00:00:00.000' AS DateTime), CAST(N'2021-06-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Reader_To_Book] ([Id], [ReaderId], [BookId], [fromDate], [ToDate]) VALUES (4, 3, 7, CAST(N'2021-06-04T00:00:00.000' AS DateTime), CAST(N'2021-07-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Reader_To_Book] ([Id], [ReaderId], [BookId], [fromDate], [ToDate]) VALUES (5, 4, 5, CAST(N'2021-08-09T00:00:00.000' AS DateTime), CAST(N'2021-09-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reader_To_Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Readers] ON 

INSERT [dbo].[Readers] ([Id], [Name], [Ibn]) VALUES (1, N'Mehdi', 515105)
INSERT [dbo].[Readers] ([Id], [Name], [Ibn]) VALUES (2, N'Rəvan', 65659)
INSERT [dbo].[Readers] ([Id], [Name], [Ibn]) VALUES (3, N'Kamran', 8491698)
INSERT [dbo].[Readers] ([Id], [Name], [Ibn]) VALUES (4, N'Nəriman', 4484484)
SET IDENTITY_INSERT [dbo].[Readers] OFF
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([JanrId])
REFERENCES [dbo].[Janr] ([Id])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([PublishHouseId])
REFERENCES [dbo].[PublishHouse] ([Id])
GO
ALTER TABLE [dbo].[Reader_To_Book]  WITH CHECK ADD FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Reader_To_Book]  WITH CHECK ADD FOREIGN KEY([ReaderId])
REFERENCES [dbo].[Readers] ([Id])
GO

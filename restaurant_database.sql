USE [Restaurant]
GO
/****** Object:  Table [dbo].[RES_User]    Script Date: 07/19/2017 16:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RES_User](
	[userID] [char](10) NOT NULL,
	[password] [varchar](30) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[phone] [char](11) NULL,
	[role] [tinyint] NOT NULL,
 CONSTRAINT [PK_RES_Employee] PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: Manager
1: Host
2: Waiter
3: Chef
4: Bus boy' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RES_User'
GO
INSERT [dbo].[RES_User] ([userID], [password], [name], [phone], [role]) VALUES (N'admin     ', N'admin', N'admin', N'12345678   ', 0)
INSERT [dbo].[RES_User] ([userID], [password], [name], [phone], [role]) VALUES (N'busboy    ', N'busboy', N'Bus Boy', N'11510515184', 4)
INSERT [dbo].[RES_User] ([userID], [password], [name], [phone], [role]) VALUES (N'chef      ', N'chef', N'Chef', N'64684489484', 3)
INSERT [dbo].[RES_User] ([userID], [password], [name], [phone], [role]) VALUES (N'host      ', N'host', N'Host', N'01651514514', 1)
INSERT [dbo].[RES_User] ([userID], [password], [name], [phone], [role]) VALUES (N'waiter    ', N'waiter', N'waiter', N'00165165151', 2)
INSERT [dbo].[RES_User] ([userID], [password], [name], [phone], [role]) VALUES (N'waiter2   ', N'waiter2', N'waiter2', N'3545454534 ', 2)
/****** Object:  Table [dbo].[RES_Table]    Script Date: 07/19/2017 16:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RES_Table](
	[tableID] [int] NOT NULL,
	[tableStatus] [tinyint] NOT NULL,
 CONSTRAINT [PK_RES_Tables] PRIMARY KEY CLUSTERED 
(
	[tableID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[RES_Table] ([tableID], [tableStatus]) VALUES (1, 0)
INSERT [dbo].[RES_Table] ([tableID], [tableStatus]) VALUES (2, 2)
INSERT [dbo].[RES_Table] ([tableID], [tableStatus]) VALUES (3, 1)
INSERT [dbo].[RES_Table] ([tableID], [tableStatus]) VALUES (5, 1)
INSERT [dbo].[RES_Table] ([tableID], [tableStatus]) VALUES (6, 1)
INSERT [dbo].[RES_Table] ([tableID], [tableStatus]) VALUES (7, 1)
INSERT [dbo].[RES_Table] ([tableID], [tableStatus]) VALUES (8, 1)
/****** Object:  Table [dbo].[RES_Food]    Script Date: 07/19/2017 16:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RES_Food](
	[itemID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
 CONSTRAINT [PK_RES_Menu] PRIMARY KEY CLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[RES_Food] ON
INSERT [dbo].[RES_Food] ([itemID], [name], [price]) VALUES (1, N'Đùi gà chiên', 25000)
INSERT [dbo].[RES_Food] ([itemID], [name], [price]) VALUES (2, N'Đậu hủ chiên', 15000)
INSERT [dbo].[RES_Food] ([itemID], [name], [price]) VALUES (3, N'Gà kho gừng', 20000)
INSERT [dbo].[RES_Food] ([itemID], [name], [price]) VALUES (4, N'Thịt heo kho tộ', 30000)
INSERT [dbo].[RES_Food] ([itemID], [name], [price]) VALUES (5, N'Bò nướng lá lốt', 30000)
INSERT [dbo].[RES_Food] ([itemID], [name], [price]) VALUES (6, N'Vịt xào măng', 10000)
INSERT [dbo].[RES_Food] ([itemID], [name], [price]) VALUES (7, N'Rau muốn xào tỏi', 20000)
INSERT [dbo].[RES_Food] ([itemID], [name], [price]) VALUES (8, N'Bò xào bông lý', 50000)
INSERT [dbo].[RES_Food] ([itemID], [name], [price]) VALUES (9, N'Chả trứng', 10000)
SET IDENTITY_INSERT [dbo].[RES_Food] OFF
/****** Object:  Table [dbo].[RES_Order]    Script Date: 07/19/2017 16:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RES_Order](
	[orderID] [bigint] IDENTITY(1,1) NOT NULL,
	[waiterID] [char](10) NOT NULL,
	[tableID] [int] NOT NULL,
	[orderTime] [datetime] NOT NULL,
	[paidTime] [datetime] NULL,
 CONSTRAINT [PK_RES_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RES_Order] ON
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (2, N'waiter    ', 1, CAST(0x0000A7AF012F25F3 AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (3, N'waiter    ', 3, CAST(0x0000A7AF012F4463 AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (4, N'waiter    ', 8, CAST(0x0000A7AF012F464F AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (5, N'waiter    ', 7, CAST(0x0000A7AF012F47A1 AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (6, N'waiter    ', 6, CAST(0x0000A7AF012F48A7 AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (7, N'waiter    ', 2, CAST(0x0000A7AF012F4969 AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (8, N'waiter    ', 1, CAST(0x0000A7B1004CC5CE AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (9, N'waiter    ', 2, CAST(0x0000A7B100509F0D AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (10, N'host      ', 7, CAST(0x0000A7B1012C1CFB AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (11, N'waiter    ', 1, CAST(0x0000A7B1014608A3 AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (12, N'waiter    ', 3, CAST(0x0000A7B20017B4B6 AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (13, N'waiter    ', 5, CAST(0x0000A7B300E8BBCD AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (16, N'waiter    ', 1, CAST(0x0000A7B30109479E AS DateTime), CAST(0x0000A7B200000000 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (19, N'waiter    ', 3, CAST(0x0000A7B200000000 AS DateTime), CAST(0x0000A7B30110C705 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (20, N'waiter    ', 1, CAST(0x0000A7B3010CEA68 AS DateTime), CAST(0x0000A7B30110CE55 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (21, N'waiter    ', 2, CAST(0x0000A7B30110D37D AS DateTime), CAST(0x0000A7B30110E93D AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (22, N'waiter    ', 1, CAST(0x0000A7B30111771A AS DateTime), CAST(0x0000A7B3011258FC AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (23, N'waiter    ', 1, CAST(0x0000A7B30112B2D6 AS DateTime), CAST(0x0000A7B3017F53BB AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (24, N'waiter    ', 2, CAST(0x0000A7B40001C9BD AS DateTime), CAST(0x0000A7B4000260D6 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (25, N'waiter    ', 1, CAST(0x0000A7B500BA2C08 AS DateTime), CAST(0x0000A7B500BAF407 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (26, N'waiter    ', 1, CAST(0x0000A7B500F0F0D7 AS DateTime), CAST(0x0000A7B500F18890 AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (27, N'waiter    ', 1, CAST(0x0000A7B50101BE25 AS DateTime), CAST(0x0000A7B50101CADE AS DateTime))
INSERT [dbo].[RES_Order] ([orderID], [waiterID], [tableID], [orderTime], [paidTime]) VALUES (28, N'waiter    ', 2, CAST(0x0000A7B50105463B AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[RES_Order] OFF
/****** Object:  Table [dbo].[RES_Status]    Script Date: 07/19/2017 16:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RES_Status](
	[userID] [char](10) NOT NULL,
	[tableID] [int] NOT NULL,
	[status] [tinyint] NOT NULL,
	[time] [datetime] NOT NULL,
 CONSTRAINT [PK_RES_ComeIn] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[tableID] ASC,
	[time] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 1, 4, CAST(0x0000A7B301115752 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 1, 0, CAST(0x0000A7B301127996 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 1, 4, CAST(0x0000A7B301805598 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 1, 4, CAST(0x0000A7B500BB67A4 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 1, 0, CAST(0x0000A7B500BB7239 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 1, 4, CAST(0x0000A7B500F19CA9 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 1, 0, CAST(0x0000A7B500F1A032 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 1, 4, CAST(0x0000A7B501023DBF AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 1, 0, CAST(0x0000A7B5010245B9 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 2, 4, CAST(0x0000A7B30111595A AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 2, 4, CAST(0x0000A7B500BBE100 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 2, 0, CAST(0x0000A7B500BBE7B3 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'busboy    ', 3, 4, CAST(0x0000A7B301115A77 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 1, 1, CAST(0x0000A7B1004C8DEE AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 1, 1, CAST(0x0000A7B301093E08 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 1, 1, CAST(0x0000A7B3010CE170 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 1, 1, CAST(0x0000A7B301116602 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 1, 1, CAST(0x0000A7B3011295AB AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 1, 1, CAST(0x0000A7B500BA1C5E AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 1, 1, CAST(0x0000A7B500F0DDA6 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 1, 1, CAST(0x0000A7B500F21F71 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 2, 1, CAST(0x0000A7B100509A4E AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 2, 1, CAST(0x0000A7B3010FE918 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 2, 1, CAST(0x0000A7B301116780 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 2, 1, CAST(0x0000A7B500F0DF0A AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 3, 1, CAST(0x0000A7B2000E3936 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 3, 1, CAST(0x0000A7B301100833 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 3, 1, CAST(0x0000A7B500BA216C AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 5, 1, CAST(0x0000A7B500F0E01D AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 6, 1, CAST(0x0000A7B500F21EB9 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 7, 1, CAST(0x0000A7B500F21DF7 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'host      ', 8, 1, CAST(0x0000A7B500F21B11 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'waiter    ', 1, 2, CAST(0x0000A7B500BA2C08 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'waiter    ', 1, 3, CAST(0x0000A7B500BAF405 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'waiter    ', 1, 2, CAST(0x0000A7B500F0F0D6 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'waiter    ', 1, 3, CAST(0x0000A7B500F1888E AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'waiter    ', 1, 2, CAST(0x0000A7B50101BE24 AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'waiter    ', 1, 3, CAST(0x0000A7B50101CADE AS DateTime))
INSERT [dbo].[RES_Status] ([userID], [tableID], [status], [time]) VALUES (N'waiter    ', 2, 2, CAST(0x0000A7B50105463A AS DateTime))
/****** Object:  Table [dbo].[RES_OrderDetail]    Script Date: 07/19/2017 16:36:01 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RES_OrderDetail](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[orderID] [bigint] NOT NULL,
	[itemID] [int] NOT NULL,
	[chefID] [char](10) NULL,
	[isTaken] [bit] NOT NULL,
	[timeReady] [datetime] NULL,
 CONSTRAINT [PK_RES_OrderDetail_1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[RES_OrderDetail] ON
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (1, 8, 1, N'chef      ', 0, CAST(0x0000A7B1004E1733 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (2, 8, 3, N'chef      ', 0, CAST(0x0000A7B1014F7D10 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (3, 8, 4, N'chef      ', 0, CAST(0x0000A7B1014F79D2 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (4, 8, 5, N'chef      ', 0, CAST(0x0000A7B1014F77BB AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (5, 8, 6, N'chef      ', 0, CAST(0x0000A7B30142A92D AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (6, 9, 1, N'chef      ', 0, CAST(0x0000A7B3017690BF AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (7, 9, 1, N'chef      ', 0, CAST(0x0000A7B301082C46 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (8, 9, 1, N'chef      ', 0, CAST(0x0000A7B301769170 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (9, 9, 2, N'chef      ', 0, CAST(0x0000A7B3017691F8 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (10, 9, 2, N'chef      ', 0, CAST(0x0000A7B301769240 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (11, 9, 2, N'chef      ', 0, CAST(0x0000A7B30108299A AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (12, 9, 3, N'chef      ', 0, CAST(0x0000A7B30176928D AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (13, 9, 3, N'chef      ', 0, CAST(0x0000A7B3017692E1 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (14, 9, 5, N'chef      ', 0, CAST(0x0000A7B301769318 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (16, 16, 1, N'chef      ', 0, CAST(0x0000A7B301769357 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (17, 16, 1, N'chef      ', 0, CAST(0x0000A7B301769385 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (18, 16, 1, N'chef      ', 0, CAST(0x0000A7B3017693BD AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (19, 16, 1, N'chef      ', 0, CAST(0x0000A7B3017693F0 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (20, 16, 1, N'chef      ', 0, CAST(0x0000A7B301769455 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (21, 16, 1, N'chef      ', 0, CAST(0x0000A7B3017694E3 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (22, 16, 2, N'chef      ', 0, CAST(0x0000A7B301769584 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (23, 16, 2, N'chef      ', 0, CAST(0x0000A7B30176962B AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (24, 16, 2, N'chef      ', 0, CAST(0x0000A7B30172FC46 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (25, 16, 2, N'chef      ', 0, CAST(0x0000A7B30173024E AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (26, 20, 1, N'chef      ', 0, CAST(0x0000A7B30142DA81 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (27, 19, 1, N'chef      ', 0, CAST(0x0000A7B30172E13E AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (28, 21, 1, N'chef      ', 0, CAST(0x0000A7B301111151 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (29, 21, 2, N'chef      ', 0, CAST(0x0000A7B3011113BD AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (30, 21, 3, N'chef      ', 0, CAST(0x0000A7B30111162F AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (31, 21, 8, N'chef      ', 0, CAST(0x0000A7B301111833 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (32, 21, 8, N'chef      ', 0, CAST(0x0000A7B30111196F AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (33, 21, 8, N'chef      ', 0, CAST(0x0000A7B301111B13 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (34, 22, 1, N'chef      ', 1, CAST(0x0000A7B30111B9F5 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (35, 22, 2, N'chef      ', 1, CAST(0x0000A7B30111BD1A AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (36, 22, 7, N'chef      ', 1, CAST(0x0000A7B30111BF23 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (37, 23, 1, N'chef      ', 1, CAST(0x0000A7B30171C9F8 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (38, 23, 1, N'chef      ', 1, CAST(0x0000A7B301705C91 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (39, 23, 6, N'chef      ', 1, CAST(0x0000A7B301452C94 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (40, 23, 8, N'chef      ', 1, CAST(0x0000A7B301452BC1 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (41, 23, 1, N'chef      ', 1, CAST(0x0000A7B3014529A7 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (42, 23, 2, N'chef      ', 1, CAST(0x0000A7B301446A83 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (43, 23, 3, N'chef      ', 1, CAST(0x0000A7B3014521A9 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (44, 23, 5, N'chef      ', 1, CAST(0x0000A7B301441482 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (45, 23, 5, N'chef      ', 1, CAST(0x0000A7B301444E27 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (46, 23, 6, N'chef      ', 1, CAST(0x0000A7B30143A633 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (47, 23, 8, N'chef      ', 1, CAST(0x0000A7B30143B5B2 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (48, 23, 3, N'chef      ', 1, CAST(0x0000A7B3014352CF AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (49, 23, 3, N'chef      ', 1, CAST(0x0000A7B3014311EA AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (50, 23, 3, N'chef      ', 1, CAST(0x0000A7B301430244 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (51, 23, 4, N'chef      ', 1, CAST(0x0000A7B301392C7A AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (52, 23, 8, N'chef      ', 1, CAST(0x0000A7B3017305C9 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (53, 23, 8, N'chef      ', 1, CAST(0x0000A7B30172ECC6 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (54, 23, 8, N'chef      ', 1, CAST(0x0000A7B30172E348 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (55, 23, 8, N'chef      ', 1, CAST(0x0000A7B30177A22E AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (56, 23, 8, N'chef      ', 1, CAST(0x0000A7B30177D347 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (57, 23, 8, N'chef      ', 0, CAST(0x0000A7B30177D44E AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (58, 23, 8, N'chef      ', 0, CAST(0x0000A7B30177D5DD AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (59, 23, 7, N'chef      ', 0, CAST(0x0000A7B301781568 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (60, 23, 8, N'chef      ', 0, CAST(0x0000A7B301782DEA AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (61, 23, 8, N'chef      ', 0, CAST(0x0000A7B301783016 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (62, 23, 8, N'chef      ', 0, CAST(0x0000A7B301782EC6 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (63, 24, 1, N'chef      ', 1, CAST(0x0000A7B400025717 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (64, 24, 2, N'chef      ', 1, CAST(0x0000A7B40002578C AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (65, 24, 2, N'chef      ', 1, CAST(0x0000A7B4000257EE AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (66, 24, 7, N'chef      ', 1, CAST(0x0000A7B4000258FF AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (67, 25, 2, N'chef      ', 1, CAST(0x0000A7B500BA72C8 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (68, 25, 2, N'chef      ', 1, CAST(0x0000A7B500BA8922 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (69, 25, 2, N'chef      ', 1, CAST(0x0000A7B500BA8E91 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (70, 25, 2, N'chef      ', 1, CAST(0x0000A7B500BA9CC2 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (71, 25, 2, N'chef      ', 1, CAST(0x0000A7B500BA9FB9 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (72, 25, 2, N'chef      ', 1, CAST(0x0000A7B500BAA2DF AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (73, 25, 2, N'chef      ', 1, CAST(0x0000A7B500BAA576 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (74, 25, 2, N'chef      ', 1, CAST(0x0000A7B500BAE2BE AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (75, 25, 2, N'chef      ', 0, CAST(0x0000A7B500F15581 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (76, 25, 2, N'chef      ', 0, CAST(0x0000A7B500F155EF AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (77, 25, 2, N'chef      ', 0, CAST(0x0000A7B500F15658 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (78, 25, 2, N'chef      ', 0, CAST(0x0000A7B500F156EA AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (79, 25, 2, N'chef      ', 0, CAST(0x0000A7B500F15743 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (80, 25, 6, N'chef      ', 0, CAST(0x0000A7B500F157B2 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (81, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15820 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (82, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F1588D AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (83, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F158FE AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (84, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F159A4 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (85, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15A0D AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (86, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15A79 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (87, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15AEA AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (88, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15B5A AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (89, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15BCD AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (90, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15C39 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (91, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15CA4 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (92, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15D0F AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (93, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15D81 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (94, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15DEF AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (95, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15E5F AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (96, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15ECC AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (97, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15F3B AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (98, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F15FAD AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (99, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F16051 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (100, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F160BE AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (101, 25, 9, N'chef      ', 0, CAST(0x0000A7B500F1612C AS DateTime))
GO
print 'Processed 100 total records'
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (102, 25, 1, N'chef      ', 0, CAST(0x0000A7B500F161A4 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (103, 25, 2, N'chef      ', 0, CAST(0x0000A7B500F1627B AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (104, 26, 1, N'chef      ', 1, CAST(0x0000A7B500F16884 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (105, 26, 1, N'chef      ', 1, CAST(0x0000A7B500F168E4 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (106, 26, 1, N'chef      ', 1, CAST(0x0000A7B500F16951 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (107, 26, 1, N'chef      ', 1, CAST(0x0000A7B500F169C5 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (108, 26, 1, N'chef      ', 1, CAST(0x0000A7B500F16A32 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (109, 26, 1, N'chef      ', 1, CAST(0x0000A7B500F16AA2 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (110, 26, 1, N'chef      ', 1, CAST(0x0000A7B500F16B16 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (111, 26, 1, N'chef      ', 1, CAST(0x0000A7B500F16B51 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (112, 26, 1, N'chef      ', 1, CAST(0x0000A7B500F16B90 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (113, 26, 1, N'chef      ', 1, CAST(0x0000A7B500F16C01 AS DateTime))
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (114, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (115, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (116, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (117, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (118, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (119, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (120, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (121, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (122, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (123, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (124, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (125, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (126, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (127, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (128, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (129, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (130, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (131, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (132, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (133, 26, 3, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (134, 26, 4, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (135, 26, 5, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (136, 26, 6, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (137, 27, 1, NULL, 0, NULL)
INSERT [dbo].[RES_OrderDetail] ([id], [orderID], [itemID], [chefID], [isTaken], [timeReady]) VALUES (138, 27, 6, NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[RES_OrderDetail] OFF
/****** Object:  Default [DF_RES_OrderDetail_isTaken]    Script Date: 07/19/2017 16:36:01 ******/
ALTER TABLE [dbo].[RES_OrderDetail] ADD  CONSTRAINT [DF_RES_OrderDetail_isTaken]  DEFAULT ((0)) FOR [isTaken]
GO
/****** Object:  ForeignKey [FK_RES_Order_RES_Employee]    Script Date: 07/19/2017 16:36:01 ******/
ALTER TABLE [dbo].[RES_Order]  WITH CHECK ADD  CONSTRAINT [FK_RES_Order_RES_Employee] FOREIGN KEY([waiterID])
REFERENCES [dbo].[RES_User] ([userID])
GO
ALTER TABLE [dbo].[RES_Order] CHECK CONSTRAINT [FK_RES_Order_RES_Employee]
GO
/****** Object:  ForeignKey [FK_RES_Order_RES_Table]    Script Date: 07/19/2017 16:36:01 ******/
ALTER TABLE [dbo].[RES_Order]  WITH CHECK ADD  CONSTRAINT [FK_RES_Order_RES_Table] FOREIGN KEY([tableID])
REFERENCES [dbo].[RES_Table] ([tableID])
GO
ALTER TABLE [dbo].[RES_Order] CHECK CONSTRAINT [FK_RES_Order_RES_Table]
GO
/****** Object:  ForeignKey [FK_RES_ComeIn_RES_Employee]    Script Date: 07/19/2017 16:36:01 ******/
ALTER TABLE [dbo].[RES_Status]  WITH CHECK ADD  CONSTRAINT [FK_RES_ComeIn_RES_Employee] FOREIGN KEY([userID])
REFERENCES [dbo].[RES_User] ([userID])
GO
ALTER TABLE [dbo].[RES_Status] CHECK CONSTRAINT [FK_RES_ComeIn_RES_Employee]
GO
/****** Object:  ForeignKey [FK_RES_ComeIn_RES_Table]    Script Date: 07/19/2017 16:36:01 ******/
ALTER TABLE [dbo].[RES_Status]  WITH CHECK ADD  CONSTRAINT [FK_RES_ComeIn_RES_Table] FOREIGN KEY([tableID])
REFERENCES [dbo].[RES_Table] ([tableID])
GO
ALTER TABLE [dbo].[RES_Status] CHECK CONSTRAINT [FK_RES_ComeIn_RES_Table]
GO
/****** Object:  ForeignKey [FK_RES_OrderDetail_RES_Employee]    Script Date: 07/19/2017 16:36:01 ******/
ALTER TABLE [dbo].[RES_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_RES_OrderDetail_RES_Employee] FOREIGN KEY([chefID])
REFERENCES [dbo].[RES_User] ([userID])
GO
ALTER TABLE [dbo].[RES_OrderDetail] CHECK CONSTRAINT [FK_RES_OrderDetail_RES_Employee]
GO
/****** Object:  ForeignKey [FK_RES_OrderDetail_RES_Menu]    Script Date: 07/19/2017 16:36:01 ******/
ALTER TABLE [dbo].[RES_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_RES_OrderDetail_RES_Menu] FOREIGN KEY([itemID])
REFERENCES [dbo].[RES_Food] ([itemID])
GO
ALTER TABLE [dbo].[RES_OrderDetail] CHECK CONSTRAINT [FK_RES_OrderDetail_RES_Menu]
GO
/****** Object:  ForeignKey [FK_RES_OrderDetail_RES_Order]    Script Date: 07/19/2017 16:36:01 ******/
ALTER TABLE [dbo].[RES_OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_RES_OrderDetail_RES_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[RES_Order] ([orderID])
GO
ALTER TABLE [dbo].[RES_OrderDetail] CHECK CONSTRAINT [FK_RES_OrderDetail_RES_Order]
GO

create database BTLwebNC
USE [BTLwebNC]
GO
/****** Object:  Table [dbo].[tblBinhluan]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBinhluan](
	[PK_iBinhluanID] [int] IDENTITY(1,1) NOT NULL,
	[sNoidung] [nvarchar](max) NOT NULL,
	[FK_iBaidangID] [int] NOT NULL,
	[FK_sName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblBinhluan] PRIMARY KEY CLUSTERED 
(
	[PK_iBinhluanID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[iUserID] [int] IDENTITY(1,1) NOT NULL,
	[sName] [nvarchar](50) NOT NULL,
	[sPassword] [varchar](50) NOT NULL,
	[sAnh] [nvarchar](50) NULL,
	[bQuyen] [bit] NOT NULL,
	[sTen] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[sName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vNguoibinhluan]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vNguoibinhluan]
AS
SELECT        dbo.tblUser.sTen, dbo.tblBinhluan.sNoidung, dbo.tblBinhluan.FK_iBaidangID, dbo.tblUser.sAnh, dbo.tblUser.iUserID, dbo.tblUser.sName, dbo.tblBinhluan.PK_iBinhluanID
FROM            dbo.tblBinhluan INNER JOIN
                         dbo.tblUser ON dbo.tblBinhluan.FK_sName = dbo.tblUser.sName
GO
/****** Object:  Table [dbo].[tblBaidang]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBaidang](
	[PK_iBaidangID] [int] IDENTITY(1,1) NOT NULL,
	[sTieude] [nvarchar](200) NOT NULL,
	[sNoidung] [nvarchar](max) NOT NULL,
	[iLuotxem] [int] NULL,
	[dNgaydang] [datetime] NULL,
	[FK_iChudeID] [int] NULL,
	[sAnh] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblBaidang] PRIMARY KEY CLUSTERED 
(
	[PK_iBaidangID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblChude]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChude](
	[PK_iChudeID] [int] NOT NULL,
	[sTenchude] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_tblChude] PRIMARY KEY CLUSTERED 
(
	[PK_iChudeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tblBaidang] ON 

INSERT [dbo].[tblBaidang] ([PK_iBaidangID], [sTieude], [sNoidung], [iLuotxem], [dNgaydang], [FK_iChudeID], [sAnh]) VALUES (3, N'Đội hình cực mạnh của Arsenal mùa tới khi có Hazard lẫn Jovic', N'Theo đó, tờ Marca tiết lộ rằng Arsenal và Everton đều đang ngắm đến tiền đạo Luka Jovic của Real Madrid. Cầu thủ 24 tuổi là một trong những tiền đạo trẻ thú vị nhất châu Âu vài năm trước. Tuy nhiên, sự nghiệp của anh đã chững lại khi đầu quân cho Real Madrid với giá 53 triệu bảng cách đây 3 mùa bóng. Jovic chỉ đá chính trong 6 trận tại La Liga cho Los Blancos kể từ thời điểm đó.

Tờ Marca, được Sport Witness dẫn lại, tuyên bố Jovic đã ''chán ngấy'' với tình cảnh ở Bernabeu. Anh sẽ "chờ các cuộc đàm phán được tổ chức và xem phương án nào sẽ được vạch ra".

Báo cáo cho biết thêm rằng, mặc dù còn quá sớm ở tháng 3 để tính đến chuyện hoàn tất một thương vụ nhưng đây là thời điểm quan trọng để chiếm lòng tin của các bên. 

Cựu huấn luyện viên Frankfurt Adi Hutter từng mô tả Jovic là "một tiền đạo đẳng cấp thế giới, người mang lại khả năng phi thường" vào tháng 2 năm 2021. Hiện tại, anh được trang Transfermarkt định giá gần 15 triệu bảng. ', 5, CAST(N'2022-03-23T00:00:00.000' AS DateTime), 2, N'anh1.jpg')
INSERT [dbo].[tblBaidang] ([PK_iBaidangID], [sTieude], [sNoidung], [iLuotxem], [dNgaydang], [FK_iChudeID], [sAnh]) VALUES (4, N'Việt Nam đấu Oman: Nơi tin nhất bỗng hóa âu lo', N'Những năm qua, dù đá với bất kỳ sơ đồ chiến thuật hay cách chơi nào tuyến thi đấu mà HLV Park Hang Seo luôn đặt nặng, cũng như chăm chút nhất cho tuyển Việt Nam không nằm ngoài khu vực giữa sân.

Dưới thời chiến lược gia người Hàn Quốc, tuyển Việt Nam luôn chơi tốt và có được kết quả khả quan hay chiến thắng phần nhiều nhờ tới sự ổn định của các tiền vệ.

Việt Nam đấu Oman: Nơi tin nhất bỗng hóa âu lo - Bóng Đá
Hàng tiền vệ, đặc biệt có sự trở lại của Hùng Dũng luôn là tuyến thi đấu quyết định thành bại của HLV Park Hang Seo. 
Từ màn trình diễn xuất sắc, ổn định của Hùng Dũng đến những pha bóng xuất thần mà Quang Hải tạo ra và sau này có thêm một Hoàng Đức tiến bộ rất nhanh giúp tuyển Việt Nam bay rất cao trong chặng đường đã qua.

Dụng Quang Nho làm đội phó ở U23 Việt Nam
Tuyển Oman tổn thất lực lượng trước trận gặp Việt Nam
Có thể khẳng định rằng, hàng tiền vệ mà HLV Park Hang Seo kỳ công xây dựng không khác gì chìa khoá mở ra chiến thắng cho tuyển Việt Nam. Mỗi khi tuyến thi đấu này xộc xệch thì mọi thứ rất khác, điển hình như tại AFF Cup 2020 vừa qua.

... bỗng hoá âu lo

Ở lần tập trung chuẩn bị cho các trận đấu cuối tại vòng loại World Cup 2022, số lượng các tiền vệ được HLV Park Hang Seo triệu tập rất nhiều, chỉ sau hàng phòng ngự về số lượng.

Tuy nhiên mọi chuyện đang khiến chiến lược gia người Hàn Quốc rối bời khi hàng loạt cầu thủ ở hàng tiền vệ chấn thương hoặc khó có thể ra sân ở trận gặp Oman vì dương tính với Covid-19.

Việt Nam đấu Oman: Nơi tin nhất bỗng hóa âu lo - Bóng Đá
Nhưng với hàng loạt biến số xảy ra đang khiến chiến lược gia người Hàn Quốc âu lo.
Ngoài Văn Vũ, Phan Văn Đức phải nói lời từ giã tuyển Việt Nam từ sớm thuyền trưởng người Hàn Quốc còn nhận thêm tin buồn từ Xuân Trường, Hải Huy sau khi tập trung được ít ngày. Chính vì vậy, thầy Park buộc phải gọi gấp Lý Công Hoàng Anh từ U23 Việt Nam lên lấp chỗ trống.

Nếu tính cả Hoàng Anh, hàng tiền vệ của HLV Park Hang Seo chỉ còn đúng 6 người. Không chỉ ít, một vấn đề khác đang khiến chiến lược gia người Hàn Quốc đau đầu là phong độ.

Ngoại trừ Hùng Dũng, Hoàng Đức đang cho thấy rất ổn thì phần còn lại vẫn là dấu hỏi đối với HLV Park Hang Seo, đặc biệt với Nguyễn Tuấn Anh khi tiền vệ đang khoác áo HAGL chơi không tốt trong cả 4 lần ra sân (cả đá chính lẫn dự bị) tại V-League.

Những người còn lại như Đức Huy, Quang Hải, Hoàng Anh trên thực tế cũng mới đá rất ít tại V-League trước khi lên tuyển Việt Nam, do vậy chưa có gì đảm bảo tốt nhất nếu được điền tên vào danh sách đấu với Oman.

Giải pháp đương nhiên HLV Park Hang Seo vẫn có, cũng như các cầu thủ nói trên kịp tìm lại phong độ khi lên khoác áo tuyển Việt Nam, nhưng rõ ràng âu lo thì khó tránh.

Hy vọng rằng, những gì đã nhìn thấy từ hàng tiền vệ của tuyển Việt Nam lúc này là... ảo để trận đấu tới thầy trò HLV Park Hang Seo chơi thăng hoa và đánh bại Oman một cách thuyết phục nhất. Còn ngược lại rất đáng lo đấy.', 72, CAST(N'2022-03-23T11:10:00.000' AS DateTime), 2, N'anh1.jpg')
INSERT [dbo].[tblBaidang] ([PK_iBaidangID], [sTieude], [sNoidung], [iLuotxem], [dNgaydang], [FK_iChudeID], [sAnh]) VALUES (5, N'Bóng đá siêu hay', N'Còn với Anthony Davis, chúng tôi sẽ kiểm tra lại tình hình khoảng 12 tiếng sau buổi tập để xem cậu ta có bị sưng hay đau gì không. Từ đó, chúng tôi sẽ quyết định khả năng ra sân cho Davis".Đây là thông tin rất mừng cho các CĐV Los Angeles Lakers vì đội bóng đang trong tình thế vô cùng khó khăn.', 9, CAST(N'2022-03-05T00:00:00.000' AS DateTime), 1, N'anh2.jpg')
INSERT [dbo].[tblBaidang] ([PK_iBaidangID], [sTieude], [sNoidung], [iLuotxem], [dNgaydang], [FK_iChudeID], [sAnh]) VALUES (6, N'Ronaldo phá dớp ở play-off World Cup?', N'<p><a href="https://vnexpress.net/the-thao/du-lieu-bong-da/doi-bong/bo-dao-nha-27" rel="dofollow">Bồ Đ&agrave;o Nha</a>&nbsp;sẽ đ&aacute; b&aacute;n kết play-off với&nbsp;<a href="https://vnexpress.net/the-thao/du-lieu-bong-da/doi-bong/tho-nhi-ky-777" rel="dofollow">Thổ Nhĩ Kỳ</a>. Ronaldo từng gặp đối thủ n&agrave;y hai lần, nhưng đều tịt ng&ograve;i. Lần đầu l&agrave; v&ograve;ng bảng Euro 2008. Anh đ&aacute; đủ 90 ph&uacute;t, nhưng chỉ một lần dứt điểm tr&uacute;ng khung gỗ. D&ugrave; vậy, h&ocirc;m đ&oacute; Bồ Đ&agrave;o Nha thắng 2-0 nhờ c&aacute;c b&agrave;n của Pepe v&agrave; Raul Meireles.</p>

<p>Trong trận giao hữu chuẩn bị cho Euro 2012, Ronaldo tiếp tục tịt ng&ograve;i trước Thổ Nhĩ Kỳ. Sau khi Umut Bulut lập c&uacute; đ&uacute;p gi&uacute;p đội kh&aacute;ch dẫn hai b&agrave;n v&agrave; Nani r&uacute;t ngắn tỷ số xuống 1-2 cho Bồ Đ&agrave;o Nha, ph&uacute;t 65 Ronaldo lỡ cơ hội gỡ h&ograve;a với c&uacute; đ&aacute; phạt đền hỏng. Tới ph&uacute;t 88, Pepe phản lưới, khiến Bồ Đ&agrave;o Nha thua 1-3.</p>

<p><img alt="Nếu ghi bàn vào lưới Thổ Nhĩ Kỳ, Ronaldo sẽ không chỉ phá dớp, mà còn đưa Bồ Đào Nha tiến gần đến vé dự World Cup. Ảnh: Reuters." src="https://i1-thethao.vnecdn.net/2022/03/23/New-Project-54-5918-1648015217.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=UZIULRogSDK4ENOHtIBTgQ" /></p>

<p><iframe frameborder="0" height="1" id="google_ads_iframe_/27973503/Vnexpress/Desktop/Inimage/Thethao/Thethao.bongda.detail_0" name="google_ads_iframe_/27973503/Vnexpress/Desktop/Inimage/Thethao/Thethao.bongda.detail_0" scrolling="no" tabindex="0" title="3rd party ad content" width="1"></iframe></p>

<p>Nếu ghi b&agrave;n v&agrave;o lưới Thổ Nhĩ Kỳ, Ronaldo sẽ kh&ocirc;ng chỉ ph&aacute; dớp, m&agrave; c&ograve;n đưa Bồ Đ&agrave;o Nha tiến gần đến v&eacute; dự World Cup. Ảnh:&nbsp;<em>Reuters</em>.</p>

<p>Nếu vượt qua Thổ Nhĩ Kỳ, Bồ Đ&agrave;o Nha sẽ gặp đội thắng trong cặp&nbsp;<a href="https://vnexpress.net/the-thao/du-lieu-bong-da/doi-bong/italy-768" rel="dofollow">Italy</a>&nbsp;- Bắc Macedonia ở chung kết play-off ng&agrave;y 29/3. Trước Italy, Ronaldo đ&atilde; hai trận tịt ng&ograve;i. Đ&oacute; đều l&agrave; giao hữu, nơi Bồ Đ&agrave;o Nha thua 1-2 năm 2004 v&agrave; thua 1-3 năm 2008.</p>

<p>Ở hai lần gần nhất Bồ Đ&agrave;o Nha đối đầu Italy, trong khu&ocirc;n khổ bảng A1 Nations League m&ugrave;a 2018-2019, Ronaldo vắng mặt. Bồ Đ&agrave;o Nha khi đ&oacute; thắng 1-0 tr&ecirc;n s&acirc;n nh&agrave; rồi ho&agrave; 0-0 tr&ecirc;n đất Italy.</p>

<p>Nếu đối thủ l&agrave; Bắc Macedonia, Ronaldo cũng chưa bao giờ ghi b&agrave;n. Khi c&ograve;n mang t&ecirc;n Macedonia, đội tuyển n&agrave;y từng h&ograve;a 0-0 trước Bồ Đ&agrave;o Nha trong trận giao hữu năm 2012.</p>

<p>Bồ Đ&agrave;o Nha c&oacute; lợi thế chơi tr&ecirc;n s&acirc;n nh&agrave; Dragao trong trận b&aacute;n kết play-off với Thổ Nhĩ Kỳ. Nếu thắng, Ronaldo v&agrave; đồng đội sẽ tiếp tục chơi tại đ&acirc;y trong trận chung kết gặp Italy hoặc Bắc Macedonia. Đội sẽ gi&agrave;nh v&eacute; dự&nbsp;<a href="https://vnexpress.net/chu-de/world-cup-2022-903" rel="dofollow">World Cup 2022</a>.</p>

<p>Ronaldo đ&atilde; ghi 115 b&agrave;n trong 184 trận chơi cho Bồ Đ&agrave;o Nha. Đ&acirc;y l&agrave; kỷ lục ghi b&agrave;n ở cấp độ quốc tế của mọi đội tuyển.</p>
', 9, CAST(N'2022-03-23T23:03:47.630' AS DateTime), 1, N'anh2.jpg')
INSERT [dbo].[tblBaidang] ([PK_iBaidangID], [sTieude], [sNoidung], [iLuotxem], [dNgaydang], [FK_iChudeID], [sAnh]) VALUES (8, N'Xin chào t?t c? các b?n', N'Các b?n hãy xin chào t?t c?!!!', 1, CAST(N'2020-05-05T00:00:00.000' AS DateTime), 2, N'anh2.jpg')
INSERT [dbo].[tblBaidang] ([PK_iBaidangID], [sTieude], [sNoidung], [iLuotxem], [dNgaydang], [FK_iChudeID], [sAnh]) VALUES (9, N'Bạn biết gì về thể thao điện tử esport?', N'Thể thao điện tử esport sau nhiều năm du nhập vào Việt Nam đã tạo nên những dấu ấn riêng biệt và nổi bật. Hiểu hơn về chúng sẽ là điều cần thiết cho mỗi chúng ta.
Hiện nay, tại các icafe hay cyber game cao cấp, esport là một phần không thể thiếu phục vụ nhu cầu giải trí của không chỉ các game thủ mà còn cả những người thích xem livestream game. Vậy thể thao điện tử là gì? Tại sao nó lại có “sức hút” đến thế? Câu trả lời sẽ có trong bài viết này!
Thể thao điện tử là gì?
Thể thao điện tử – esport là một dạng trò chơi online được tổ chức giữa nhiều game thủ với hình thức thi đấu bằng livestream. Các giải đấu được tổ chức thường có trọng tài, luật lệ cụ thể mang tới tính cạnh tranh và thi đua đầy phấn khích.
 Thể thao điện tử thu hút nhiều người chơi và xem livestream (Ảnh minh họa)
Esport ra đời từ rất sớm nhưng chỉ ở những năm gần đây, môn thể thao điện tử này mới có cơ hội “du nhập” vào Việt Nam và được nhiều người biết đến. Cho tới nay, esport đang phát triển với “tốc độ ánh sáng”. Trở thành lựa chọn hàng đầu với hàng tỷ game thủ và “vượt mặt” cả “người anh em” đã có vị thế trước đó là bộ môn khúc côn cầu.
Sức hấp dẫn từ thể thao điện tử esport tại Việt Nam
Là một môn thể thao điện tử olympic được đưa vào giải đấu mang tầm quốc tế, esport hội tụ đông đảo game thủ kỳ cựu đến từ nhiều quốc gia. Bên cạnh đó, esport còn thu hút sự quan tâm, chú ý từ dư luận khi dõi theo và cổ vũ hết mình cho từng cuộc đua. Đặc biệt hơn, với cả những người không biết chơi game, họ vẫn có thể theo sát các chặn đấu một cách hứng thú và say mê bằng hình thức xem livestream.
 Giải đấu esport tầm cỡ quốc tế (Ảnh minh họa)
Điều đó cho thấy rằng, khác với các game online thông thường, esport có một “sức hút” dữ dội. Sức hút không chỉ với người chơi game, mê mạng xã hội mà còn với cả những ai không biết về game online.
Đi cùng với thời đại “số hóa” và sự trỗi dậy của công nghệ, trong tương lai không xa, esport được dự đoán sẽ vươn lên trở thành môn thể thao điện tử hàng đầu trong “làng” game. Cũng theo vài phân tích mới đây, tại Việt Nam:
•	Việc xem livestream game không đơn giản chỉ là thói quen, mà với một bộ phận người Việt, nó đã trở thành phần không thể thiếu trong cuộc sống hàng ngày của họ. Theo đó, it nhất 1 lần trong tuần họ sẽ sắp xếp thời gian để thỏa mãn được sở thích này.
•	Hơn 67% trong số những người thích xem livestream game dành hơn 1 tiếng mỗi ngày cho việc này.
 Người không biết chơi vẫn thích xem livestream game (Ảnh minh họa)
Đây là những nhìn nhận có cơ sở từ Appota – công ty công nghệ giải trí hàng đầu tại Việt Nam. Những minh chứng cụ thể này phần nào khẳng định sức hút cũng như tiềm năng phát triển của thể thao điện tử tại Việt Nam.
Đầu tư vào thể thao điện tử esport, tại sao không?
Sự phát triển của thể thao điện tử từ những phân tích trên cũng như thực tế hiện nay cho thấy rằng:
•	Trong tương lai gần, đầu tư vào esport sẽ là một hướng đi đúng cho các nhà kinh doanh với mô hình icafe hay cyber game hiện có.
•	Đối tượng khách hàng mà nhà đầu tư hướng tới không chỉ có các game thủ. Mà hơn hết, đấy là đại bộ phận người Việt có nhu cầu giải trí cao cùng hình thức livestream game. Do đó, tạo lập một không gian có kết hợp giữa phòng net vip, sàn esport rộng, thoáng cùng dịch vụ cà phê, ẩm thực… sẽ là gợi ý lý tưởng cho con đường kinh doanh mang về lợi nhuận cao.
 Icafe có sự kết hợp giữa phòng game cao cấp, esport, cà phê và ẩm thực (Ảnh minh họa)
Nghị luận về thể thao điện tử quá nhiều dễ gây cảm giác mơ hồ. Vì thế, chúng tôi chỉ chia sẻ đến đây. Muốn biết rõ hơn về esport cũng như những vấn đề liên quan, bạn đọc đừng ngần ngại liên hệ cho chúng tôi tại:
', 4, CAST(N'2022-03-23T23:12:10.637' AS DateTime), 5, N'anh2.jpg')
INSERT [dbo].[tblBaidang] ([PK_iBaidangID], [sTieude], [sNoidung], [iLuotxem], [dNgaydang], [FK_iChudeID], [sAnh]) VALUES (10, N'Vận động viên thể thao điện tử có được coi là một nghề?', N'Trên thực tế, vận động viên theo khái niệm là những người được đào tạo để thi đấu các môn thể thao đòi hỏi sức bền, sức khỏe và tốc độ. Vận động viên có thể là người thi đấu thể thao chuyên nghiệp, nghiệp dư hay bán chuyên nghiệp.
 
Ngày nay, khi các tựa game eSports xuất hiện, cách gọi vận động viên thể thao điện tử cũng được sử dụng rộng rãi với tần suất nhiều hơn.
Như thế nào được coi là vận động viên thể thao điện tử?
Hiện nay, có không ít tựa game bị đánh đồng chung là thể thao điện tử. Tuy nhiên, để được coi là một bộ môn thi đấu vẫn có những quy chuẩn nhất định và cần có sự công nhận rộng rãi.
Theo khái niệm chung, thể thao điện tử (eSports/e-sports, Electronic-Sports, game đối kháng, hay các pro gaming) là hình thức tổ chức cuộc thi chơi điện tử giữa nhiều người chơi, đặc biệt giữa những tuyển thủ chuyên nghiệp.
Các thể loại trò chơi video phổ biến nhất liên quan đến thể thao điện tử là MMO nhiều người chơi, trò chơi chiến đấu sử dụng chiến lược thời gian thực (MOBA) và thể loại game bắn súng góc nhìn người thứ nhất (FPS), nhưng thể loại FPS chỉ được gọi là đặc trưng của eSports khi chưa phát triển, khi các thể loại MOBA lên ngôi thì FPS không còn nằm trong danh mục được đăng ký tham gia eSports.
 
Đại diện Việt Nam giành chức vô địch Arena of Valor World Championship
Định nghĩa một cách đơn giản thì eSports (Electronic Sports) – thể thao điện tử là thuật ngữ để chỉ những tựa game mang tính chất đối kháng mà tại đó xuất phát điểm của các người chơi là như nhau. Lưu ý rằng, eSport không phải là những game đơn thuần chơi để giải trí mà nó cần phải có niềm đam mê và sự cố gắng thật nhiều.
Như vậy, game thủ tham gia thi đấu chuyên nghiệp ở những tựa game thuộc dạng này có thể được coi là vận động viên thể thao điện tử.
Vì sao khó trở thành vận động viên thể thao điện tử?
Thực tế, để trở thành vận động viên thể thao điện tử không hề đơn giản. Ngoài yêu cầu đầu tiên là tham gia thi đấu chuyên nghiệp ở những tựa game phù hợp với tiêu chí kể trên, các vận động viên còn phải đáp ứng được nhiều yếu tố khác, chẳng hạn như về độ tuổi và phong độ, kinh nghiệm thi đấu.
Tất nhiên, hầu hết các tuyển thủ game tham gia thi đấu chuyên nghiệp và bán chuyên nghiệp tại Việt Nam đều có kỹ năng khá cao, cùng khả năng nắm bắt tình huống và hợp tác cùng đồng đội. Trong số đó, đa số đều ở độ tuổi rất trẻ.
Với sự phát triển của thể loại sinh tồn, MOBA và FPS những năm gần đây, game thủ Việt thường xuyên được góp mặt ở những giải đấu mở rộng tổ chức định kỳ. Họ cũng có nhiều cơ hội để thi đấu cọ xát để trau dồi và học hỏi kinh nghiệm lẫn nhau.
Vấn đề chính và cũng là hạn chế mà hầu hết các tuyển thủ/ vận động viên gặp phải nằm ở phong độ không ổn định. Không giống những bộ môn thể thao truyền thống, vận động viên sẽ liên tục rèn luyện và nâng cao kỹ năng thi đấu qua thời gian, thể thao điện tử lại khác.
Do đặc thù của thể thao điện tử bản chất là game, sẽ luôn có những bản cập nhật về nội dung và Meta khiến người chơi phải liên tục thay đổi để phù hợp. Ngoài ra, phong độ thi đấu của các tuyển thủ khá bất ổn khiến cho sự nghiệp thi đấu của họ không thể kéo dài.
 
', 3, CAST(N'2022-03-23T23:12:10.637' AS DateTime), 5, N'anh2.jpg')
INSERT [dbo].[tblBaidang] ([PK_iBaidangID], [sTieude], [sNoidung], [iLuotxem], [dNgaydang], [FK_iChudeID], [sAnh]) VALUES (11, N'Arsenal tiếp đà thăng hoa', N'Leicester đã vượt qua một Brentford kiên cường với tỷ số 2-1, trong khi đội bóng của HLV Mikel Arteta cũng giành chiến thắng trước Aston Villa với tỷ số 3-1. Hai bàn thắng của Youri Tielemans và James Maddison đã giúp đoàn quân của HLV Brendan Rodgers giành trọn 3 điểm ở Ngoại hạng Anh.
Bốn trận bất bại tại Ngoại hạng Anh, giành được 8 trên tổng số 12 điểm, Leicester hiện đang xếp vị trí thứ 9 trên bảng xếp hạng, ngay trên đối thủ trực tiếp của họ trong lượt trận này là Arsenal.
 
Trong chuỗi 4 trận bất bại, "Bầy cáo" ghi được ít nhất 2 bàn mỗi trận, thế nhưng đội bóng của HLV Brendan Rodgers cũng không thể giữ sạch lưới trong các trận đấu kể từ đầu mùa giải đến hiện tại. Đây là điểm mấu chốt mà hàng công của Arsenal có thể khai thác.
Trong khi đó, đội bóng thành London từng thua cả 3 vòng đầu tiên, thậm chí rơi xuống vị trí cuối bảng tại Ngoại hạng Anh. Nhưng kể từ tháng 9, các học trò của HLV Mikel Arteta đã dần tìm lại sức sống và lối chơi gắn kết. 6 vòng gần đây, Arsenal thắng đến 4 và hòa 2. "Pháo thủ" giờ đã vươn lên vị trí thứ 10 với 14 điểm, chỉ ít hơn 3 điểm so với tốp 4. Mục tiêu đoạt vé dự Champions League lại mở ra với thầy trò Arteta.
 
Kể từ năm 2018, Leicester đã có 4 chiến thắng trước Arsenal trong 8 cuộc đối đầu. Thế nhưng trong 2 lần chạm trán gần nhất trên sân nhà, "Bầy cáo" lại là đội bóng thất bại.
Chấn thương của ngôi sao Jamie Vardy hiện là nỗi lo lớn nhất của Rodgers. HLV người Bắc Ailen hy vọng rằng chân sút người Anh sẽ kịp trở lại trong trận đấu quan trọng với Arsenal. Trong khi đó, Arsenal lại đang sở hữu một đội hình đồng đều hơn bởi họ không có chấn thương đáng kể nào. Đặc biệt, đoàn quân của HLV Mikel Arteta đang trên đà thăng hoa với phong độ ấn tượng trong thời gian gần đây.
 
Cách sắp xếp đội hình hiện tại của HLV Mikel Arteta hy vọng sẽ một lần nữa mang lại hiệu quả cho các "Pháo thủ" và giúp họ có được tự tin vào một chiến thắng trước đội chủ nhà Leicester. Dự đoán Arsenal sẽ có được chiến thắng với tỷ số 2-1 trên sân King Power.

', 6, CAST(N'2022-03-23T22:59:28.673' AS DateTime), 1, N'anh2.jpg')
INSERT [dbo].[tblBaidang] ([PK_iBaidangID], [sTieude], [sNoidung], [iLuotxem], [dNgaydang], [FK_iChudeID], [sAnh]) VALUES (12, N'LeBron chấn thương, Anthony Davis sẵn sàng ra sân để cứu Los Angeles Lakers?', N'<p>&ldquo;<em>LeBron đ&atilde; kh&ocirc;ng tập ng&agrave;y h&ocirc;m nay để tiếp tục qu&aacute; tr&igrave;nh trị liệu, hy vọng kịp hồi phục cho trận đấu kế tiếp</em>&rdquo;, HLV Frank Vogel cập nhật với ESPN.</p>

<p>&ldquo;<em>C&ograve;n với Anthony Davis, ch&uacute;ng t&ocirc;i sẽ kiểm tra lại t&igrave;nh h&igrave;nh khoảng 12 tiếng sau buổi tập để xem cậu ta c&oacute; bị sưng hay đau g&igrave; kh&ocirc;ng. Từ đ&oacute;, ch&uacute;ng t&ocirc;i sẽ quyết định khả năng ra s&acirc;n cho Davis</em>&quot;.</p>

<p>Đ&acirc;y l&agrave; th&ocirc;ng tin rất mừng cho c&aacute;c CĐV Los Angeles Lakers v&igrave; đội b&oacute;ng đang trong t&igrave;nh thế v&ocirc; c&ugrave;ng kh&oacute; khăn.</p>

<p>Họ đang đứng ở vị tr&iacute; thứ 10 tr&ecirc;n BXH, vừa bị New Orleans Pelicans vượt mặt v&agrave; đang chịu sức &eacute;p rất lớn từ San Antonio Spurs ở ngay b&ecirc;n dưới.</p>

<p><img src="https://cdnmedia.webthethao.vn/uploads/2022-03-29/Anthony-Davis-sap-tai-xuat-8.jpeg" /></p>

<p><em><strong>Los Angeles Lakers ho&agrave;n to&agrave;n c&oacute; khả năng bị rơi ra khỏi nh&oacute;m play-in với sức &eacute;p cực kỳ lớn của San Antonio Spurs, đội b&oacute;ng c&oacute; lịch thi đấu tương đối nhẹ ở cuối Regular Season</strong></em></p>

<p>C&oacute; vẻ như mỗi khi mọi thứ được cải thiện, lập tức vận xui v&agrave; sự đi xuống về phong độ lại xảy đến với tập thể Lakers.</p>

<p>Vừa c&oacute; đ&ocirc;i ch&uacute;t t&iacute;ch cực nhờ 2 chiến thắng trước Cavaliers, Toronto Raptors v&agrave; cộng th&ecirc;m tin vui của Anthony Davis sắp t&aacute;i xuất, Lakers lại nhận 2 thất bại li&ecirc;n tiếp (trước 76ers v&agrave; Pelicans) đi k&egrave;m chấn thương của LeBron James.</p>

<p>&ldquo;<em>Đ&oacute; l&agrave; những g&igrave; ch&uacute;ng t&ocirc;i đ&atilde; phải đương đầu xuy&ecirc;n suốt m&ugrave;a giải. Chuyện thiếu may mắn l&agrave; thứ m&agrave; đội b&oacute;ng kh&ocirc;ng thể kiểm so&aacute;t, v&igrave; vậy ch&uacute;ng t&ocirc;i chỉ biết nỗ lực nhiều hơn ở những trận đấu sống c&ograve;n sắp tới</em>&quot;, &ocirc;ng Frank Vogel n&oacute;i.</p>

<p>&ldquo;<em>Với t&igrave;nh h&igrave;nh xếp hạng như hiện nay, to&agrave;n đội cần thể hiện được sự quyết t&acirc;m ngay từ đầu trận v&agrave; cố gắng duy tr&igrave; n&oacute; đến khi tiếng c&ograve;i m&atilde;n cuộc vang l&ecirc;n. Ở trận trước, ch&uacute;ng t&ocirc;i đ&atilde; nhập cuộc rất tốt nhưng lại kết th&uacute;c n&oacute; rất tồi</em>&quot;.</p>

<p><img src="https://cdnmedia.webthethao.vn/uploads/2022-03-29/Anthony-Davis-sap-tai-xuat-3.jpeg" /></p>

<p><em><strong>Anthony Davis sẽ c&oacute; thể t&aacute;i xuất ngay trong tuần n&agrave;y để gi&uacute;p đỡ một tập thể Lakers đang gần như tuyệt vọng với 15 thất bại ở 20 trận gần nhất</strong></em></p>

<p>Anthony Davis trở lại sớm sẽ l&agrave; tin vui cho Lakers, nhưng đội b&oacute;ng r&otilde; r&agrave;ng c&oacute; nhiều điều cần l&agrave;m hơn để nỗ lực gi&agrave;nh chiến thắng.</p>

<p>Trong 8 trận đấu cuối c&ugrave;ng của Regular Season, những đối thủ của họ bao gồm Dallas, Utah, New Orleans, Denver, Phoenix, Golden State, Oklahoma v&agrave; gặp lại Denver.</p>

<p>Đ&acirc;y đều l&agrave; những đội b&oacute;ng mạnh hoặc nếu kh&ocirc;ng cũng đều l&agrave; những tập thể đ&atilde; từng đ&aacute;nh bại Lakers ngay trong m&ugrave;a n&agrave;y (Pelicans v&agrave; Thunder).</p>
', 10, CAST(N'2022-03-31T11:32:19.500' AS DateTime), 2, N'anh6.jpg            ')
INSERT [dbo].[tblBaidang] ([PK_iBaidangID], [sTieude], [sNoidung], [iLuotxem], [dNgaydang], [FK_iChudeID], [sAnh]) VALUES (14, N'LeBron chấn thương, Anthony Davis sẵn sàng ra sân để cứu Los Angeles Lakers?', N'<p>&ldquo;<em>LeBron đ&atilde; kh&ocirc;ng tập ng&agrave;y h&ocirc;m nay để tiếp tục qu&aacute; tr&igrave;nh trị liệu, hy vọng kịp hồi phục cho trận đấu kế tiếp</em>&rdquo;, HLV Frank Vogel cập nhật với ESPN.</p>

<p>&ldquo;<em>C&ograve;n với Anthony Davis, ch&uacute;ng t&ocirc;i sẽ kiểm tra lại t&igrave;nh h&igrave;nh khoảng 12 tiếng sau buổi tập để xem cậu ta c&oacute; bị sưng hay đau g&igrave; kh&ocirc;ng. Từ đ&oacute;, ch&uacute;ng t&ocirc;i sẽ quyết định khả năng ra s&acirc;n cho Davis</em>&quot;.</p>

<p>Đ&acirc;y l&agrave; th&ocirc;ng tin rất mừng cho c&aacute;c CĐV Los Angeles Lakers v&igrave; đội b&oacute;ng đang trong t&igrave;nh thế v&ocirc; c&ugrave;ng kh&oacute; khăn.</p>

<p>Họ đang đứng ở vị tr&iacute; thứ 10 tr&ecirc;n BXH, vừa bị New Orleans Pelicans vượt mặt v&agrave; đang chịu sức &eacute;p rất lớn từ San Antonio Spurs ở ngay b&ecirc;n dưới.</p>

<p><img src="https://cdnmedia.webthethao.vn/uploads/2022-03-29/Anthony-Davis-sap-tai-xuat-8.jpeg" /></p>

<p><em><strong>Los Angeles Lakers ho&agrave;n to&agrave;n c&oacute; khả năng bị rơi ra khỏi nh&oacute;m play-in với sức &eacute;p cực kỳ lớn của San Antonio Spurs, đội b&oacute;ng c&oacute; lịch thi đấu tương đối nhẹ ở cuối Regular Season</strong></em></p>

<p>C&oacute; vẻ như mỗi khi mọi thứ được cải thiện, lập tức vận xui v&agrave; sự đi xuống về phong độ lại xảy đến với tập thể Lakers.</p>

<p>Vừa c&oacute; đ&ocirc;i ch&uacute;t t&iacute;ch cực nhờ 2 chiến thắng trước Cavaliers, Toronto Raptors v&agrave; cộng th&ecirc;m tin vui của Anthony Davis sắp t&aacute;i xuất, Lakers lại nhận 2 thất bại li&ecirc;n tiếp (trước 76ers v&agrave; Pelicans) đi k&egrave;m chấn thương của LeBron James.</p>

<p>&ldquo;<em>Đ&oacute; l&agrave; những g&igrave; ch&uacute;ng t&ocirc;i đ&atilde; phải đương đầu xuy&ecirc;n suốt m&ugrave;a giải. Chuyện thiếu may mắn l&agrave; thứ m&agrave; đội b&oacute;ng kh&ocirc;ng thể kiểm so&aacute;t, v&igrave; vậy ch&uacute;ng t&ocirc;i chỉ biết nỗ lực nhiều hơn ở những trận đấu sống c&ograve;n sắp tới</em>&quot;, &ocirc;ng Frank Vogel n&oacute;i.</p>

<p>&ldquo;<em>Với t&igrave;nh h&igrave;nh xếp hạng như hiện nay, to&agrave;n đội cần thể hiện được sự quyết t&acirc;m ngay từ đầu trận v&agrave; cố gắng duy tr&igrave; n&oacute; đến khi tiếng c&ograve;i m&atilde;n cuộc vang l&ecirc;n. Ở trận trước, ch&uacute;ng t&ocirc;i đ&atilde; nhập cuộc rất tốt nhưng lại kết th&uacute;c n&oacute; rất tồi</em>&quot;.</p>

<p><img src="https://cdnmedia.webthethao.vn/uploads/2022-03-29/Anthony-Davis-sap-tai-xuat-3.jpeg" /></p>

<p><em><strong>Anthony Davis sẽ c&oacute; thể t&aacute;i xuất ngay trong tuần n&agrave;y để gi&uacute;p đỡ một tập thể Lakers đang gần như tuyệt vọng với 15 thất bại ở 20 trận gần nhất</strong></em></p>

<p>Anthony Davis trở lại sớm sẽ l&agrave; tin vui cho Lakers, nhưng đội b&oacute;ng r&otilde; r&agrave;ng c&oacute; nhiều điều cần l&agrave;m hơn để nỗ lực gi&agrave;nh chiến thắng.</p>

<p>Trong 8 trận đấu cuối c&ugrave;ng của Regular Season, những đối thủ của họ bao gồm Dallas, Utah, New Orleans, Denver, Phoenix, Golden State, Oklahoma v&agrave; gặp lại Denver.</p>

<p>Đ&acirc;y đều l&agrave; những đội b&oacute;ng mạnh hoặc nếu kh&ocirc;ng cũng đều l&agrave; những tập thể đ&atilde; từng đ&aacute;nh bại Lakers ngay trong m&ugrave;a n&agrave;y (Pelicans v&agrave; Thunder).</p>
', 26, CAST(N'2022-03-31T11:55:46.143' AS DateTime), 2, N'11-55anh7.jpg')
INSERT [dbo].[tblBaidang] ([PK_iBaidangID], [sTieude], [sNoidung], [iLuotxem], [dNgaydang], [FK_iChudeID], [sAnh]) VALUES (15, N'LeBron chấn thương, Anthony Davis sẵn sàng ra sân để cứu Los Angeles Lakers?', N'<p>Trong những v&ograve;ng đấu cuối c&ugrave;ng của v&ograve;ng bảng LPL M&ugrave;a Xu&acirc;n 2022, JD Gaming đ&atilde; hồi sinh một c&aacute;ch ngoạn mục để c&oacute; mặt ở v&ograve;ng Playoffs. Từ một đội nằm ngo&agrave;i Top 10, Kanavi c&ugrave;ng c&aacute;c đồng đội đ&atilde; c&oacute; chuỗi 6 trận thắng li&ecirc;n tiếp để vượt qua WBG, LNG v&agrave; TES v&agrave; chễm trệ ở Top 3 v&ograve;ng bảng LPL M&ugrave;a Xu&acirc;n 2022.</p>

<p><img src="https://cdnmedia.webthethao.vn/uploads/2022-03-30/jdg-doi-hinh-2022.jpg" /></p>

<p><em><strong>Đội h&igrave;nh JD Gaming tại LPL M&ugrave;a Xu&acirc;n 2022</strong></em></p>

<p>Weibo Gaming cũng l&agrave; một trong những bại tướng của JDG ở những v&ograve;ng cuối. Đ&oacute; l&agrave; một trận đấu m&agrave; cả đội h&igrave;nh của WBG đều thi đấu bạc nhược. Tuy nhi&ecirc;n, WBG đ&atilde; chứng tỏ họ kh&ocirc;ng phải l&agrave; tay mơ khi đ&atilde; nhanh ch&oacute;ng thiết lập lại phong độ với m&agrave;n huỷ diệt nh&agrave; vua EDG ng&agrave;y h&ocirc;m qua để xin JDG một c&aacute;i hẹn v&agrave;o ng&agrave;y mai, liệu WBG c&oacute; thể trả lại m&oacute;n nợ của JDG?</p>

<p>Đội h&igrave;nh JD Gaming:</p>

<p>- Đường tr&ecirc;n: 369</p>

<p>- Đi rừng: Kanavi</p>

<p>- Đường giữa: YaGao</p>

<p>- Xạ thủ: Hope</p>

<p>- Hỗ trợ: Missing</p>

<p><strong>Đường tr&ecirc;n: 369</strong></p>

<p>Bể tướng của 369 kh&ocirc;ng c&oacute; qu&aacute; nhiều thay đổi so với những m&ugrave;a giải trước đ&oacute;. ngoại trừ việc anh đ&atilde; hạn chế sử dụng những vị tướng mang thi&ecirc;n hướng carry như Gankglank v&agrave; tập trung v&agrave;o những vị tướng mang thi&ecirc;n hướng mở giao tranh như Kennen, Gragas hay Sion. Đặc biệt, Malphite trong tay 369 đang sở hữu tỷ lệ thắng l&ecirc;n đến 100% với KDA 13,5.</p>

<p><img src="https://cdnmedia.webthethao.vn/uploads/2022-03-30/jdg-369.jpg" /></p>

<p><em><strong>369 vẫn thất thường v&agrave; v&ocirc; c&ugrave;ng nguy hiểm</strong></em></p>

<p>369 kh&ocirc;ng được đ&aacute;nh gi&aacute; cao về phong độ cũng như kỹ năng giống như TheShy, v&agrave; đ&acirc;y c&oacute; thể l&agrave; vị tr&iacute; m&agrave; WBG sẽ khai th&aacute;c giống như c&aacute;ch m&agrave; họ đ&atilde; đ&aacute;nh bại EDG. Dẫu vậy, trong một ng&agrave;y đẹp trời, 369 ho&agrave;n to&agrave;n c&oacute; thể tạo n&ecirc;n những t&igrave;nh huống đầy đột biến khiến đối thủ v&agrave; người h&acirc;m mộ phải bất ngờ. Tuy nhi&ecirc;n, sự ổn định của tuyển thủ n&agrave;y vẫn l&agrave; dấu hỏi lớn.</p>

<p><strong>Đi rừng: Kanavi</strong></p>

<p>Ở những m&ugrave;a giải trước đ&oacute;, Kanavi thường thể hiện khả năng kiểm so&aacute;t bản đồ v&agrave; hỗ trợ đồng đội cực kỳ tốt c&ugrave;ng lối chơi rất chắc chắn, nhưng mang thi&ecirc;n hướng &quot;ăn cỏ&quot; nhiều hơn. Nhưng ở m&ugrave;a giải năm nay, tuyển thủ người H&agrave;n Quốc đang th&iacute;ch nghi rất tốt với meta đi rừng &quot;ăn thịt&quot; v&agrave; đặc biệt nguy hiểm với những vị tướng đấu sĩ như Viego, Lee Sin, Hecarim v&agrave; Trundle.&nbsp;</p>

<p><img src="https://cdnmedia.webthethao.vn/uploads/2022-03-30/kanavi-jdg-1.jpg" /></p>

<p><em><strong>Kanavi vẫn l&agrave; tuyển thủ quan trọng nhất trong đội h&igrave;nh JDG</strong></em></p>

<p>Tại v&ograve;ng bảng LPL M&ugrave;a Xu&acirc;n 2022, Kanavi đ&atilde; được vinh danh trong đội h&igrave;nh ti&ecirc;u biểu của giải đấu. Anh ch&iacute;nh l&agrave; người đi rừng dẫn đầu về c&aacute;c chỉ số như điểm hạ gục trung b&igrave;nh mỗi trận v&agrave; lượng s&aacute;t thương trung b&igrave;nh g&acirc;y ra mỗi ph&uacute;t. Anh cũng l&agrave; tuyển thủ quan trọng nhất trong đội h&igrave;nh của JDG v&agrave; nếu WBG gi&agrave;nh chiến thắng, SofM v&agrave; c&aacute;c đồng dội sẽ phải gi&agrave;nh sự quan t&acirc;m đặc biệt trong việc khắc chế đường đi nước bước của Kanavi.</p>

<p><strong>Đường giữa: YaGao</strong></p>

<p>YaGao kh&ocirc;ng c&ograve;n thi đấu qu&aacute; nổi bật như những m&ugrave;a giải trước đ&oacute;, tuy nhi&ecirc;n anh vẫn duy tr&igrave; được sự ổn định với những vị tướng ph&aacute;p sư đường giữa. Yagao l&agrave; người sở hữu kỹ năng cực tốt, thậm ch&iacute; c&oacute; thể ngang ngửa với những ng&ocirc;i sao đường giữa kh&aacute;c của LPL. Tuy nhi&ecirc;n thời gian gần đ&acirc;y, anh thường c&oacute; xu hướng hỗ trợ nhiều hơn cho Kanavi.</p>

<p><strong>Xạ thủ: Hope</strong></p>

<p>Từng bị đ&aacute;nh gi&aacute; l&agrave; nỗi thất vọng lớn khi c&ograve;n thi đấu ở EDward Gaming, nhưng Hope đ&atilde; thể hiện sự tiến bộ lớn trong m&agrave;u &aacute;o JD Gaming. Anh sở hữu c&aacute;c th&ocirc;ng số kh&aacute; ấn tượng như KDA 6,2 chỉ số l&iacute;nh mỗi ph&uacute;t 9,5, đ&oacute;ng g&oacute;p v&agrave;o 76,8% điểm hạ gục của JDG với lượng s&aacute;t thương trung b&igrave;nh mỗi ph&uacute;t l&agrave; 557,7.</p>

<p><img src="https://cdnmedia.webthethao.vn/uploads/2022-03-30/jdg-hope.jpg" /></p>

<p><em><strong>Hope - Ng&ocirc;i sao mới của JD Gaming</strong></em></p>

<p>D&ugrave; Hope cho thấy sự tự tin v&agrave; khả năng đi đường của một xạ thủ h&agrave;ng đầu, nhưng bể tướng đang l&agrave; vấn đề lớn nhất của tuyển thủ n&agrave;y. Trong suốt m&ugrave;a giải vừa qua, Hope chỉ sử dụng c&oacute; 4 vị tướng l&agrave; Jinx, Aphelios, Jhin v&agrave; Zeri. Điểm mạnh nhất của xạ thủ n&agrave;y vẫn l&agrave; khả năng chọn vị tr&iacute; v&agrave; g&acirc;y s&aacute;t thương trong giao tranh, tuy nhi&ecirc;n, những th&ocirc;ng số của anh lại cho thấy anh vẫn c&ograve;n kh&aacute; non nớt trong giai đoạn đi đường.&nbsp;</p>

<p><strong>Hỗ trợ: Missing</strong></p>

<p>Ở Missing, người ta thấy h&igrave;nh ảnh của một hỗ trợ mở giao tranh kiểu hiện đại. Ch&agrave;ng trai n&agrave;y lu&ocirc;n chủ động di chuyển để t&igrave;m kiếm cơ hội, thay v&igrave; chỉ tập trung kiểm so&aacute;t tầm nh&igrave;n. Với những con b&agrave;i như Leona, Alistar v&agrave; Braum, Missing tạo ra h&agrave;ng t&aacute; cơ hội cho đồng đội lập c&ocirc;ng.</p>

<p>Mặc d&ugrave;, rất mạnh mẽ v&agrave; t&aacute;o bạo trong giao tranh nhưng khả năng bảo k&ecirc; xạ thủ của Missing vẫn c&ograve;n hạn chế. &nbsp;Do đ&oacute;, anh n&ecirc;n c&acirc;n bằng giữa c&ocirc;ng v&agrave; thủ để JD Gaming kh&ocirc;ng bi đối phương khai th&aacute;c hở sườn.</p>
', 217, CAST(N'2022-03-31T12:58:26.803' AS DateTime), 4, N'12-58anh10.jpg')
INSERT [dbo].[tblBaidang] ([PK_iBaidangID], [sTieude], [sNoidung], [iLuotxem], [dNgaydang], [FK_iChudeID], [sAnh]) VALUES (16, N'Chiến thần trở lại, Mikel Arteta sẵn sàng tung ngón đòn bí mật', N'<p>Hậu vệ tr&aacute;i&nbsp;Kieran Tierney đ&atilde; gặp một chấn thương đầu gối trong lần hội qu&acirc;n gần nhất c&ugrave;ng đội tuyển Scotland. Tờ The Athletic tiết lộ, Tierney sẽ phải l&ecirc;n b&agrave;n mổ v&agrave;o cuối tuần n&agrave;y v&agrave; dự kiến bỏ lỡ phần c&ograve;n lại của m&ugrave;a giải.</p>

<p><img alt="Chiến thần trở lại, Mikel Arteta sẵn sàng tung ngón đòn bí mật - Bóng Đá" src="https://media.bongda.com.vn/files/phi.do/2022/04/07/4-1117.jpg" style="height:378px; width:630px" /></p>

<h2>&nbsp;Takehiro Tomiyasu đang hồi phục rất tốt.</h2>

<p>Sự thiếu vắng Tierney ngay lập tức g&acirc;y ra kh&oacute; khăn cho Ph&aacute;o thủ. Trước Crystal Place, Mikel Arteta phải sử dụng đến&nbsp;Nuno Tavares, nhưng t&acirc;n binh n&agrave;y chỉ trụ tr&ecirc;n s&acirc;n đ&uacute;ng 45 ph&uacute;t, trước khi bị thay ra.&nbsp;Sau đ&oacute;, Arteta chữa ch&aacute;y bằng việc k&eacute;o Xhaka về đ&aacute; hậy vệ tr&aacute;i, song kết quả kh&ocirc;ng như &yacute;.</p>

<p>Tin vui cho NHM Arsenal l&agrave; tuyển thủ người Nhật,&nbsp;Takehiro Tomiyasu&nbsp;đ&atilde; c&oacute; thể trở lại trong thời gian tới. Được biết,&nbsp;Tomiyasu đ&atilde; kh&ocirc;ng l&ecirc;n tuyển trong th&aacute;ng 3 vừa qua để to&agrave;n t&acirc;m to&agrave;n &yacute; tập hồi phục tại Colney. V&agrave; chấn thương của Tierney nhiều khả năng sẽ mở ra cho cựu cầu thủ Bologna một vai tr&ograve; mới.&nbsp;</p>

<p><strong>Theo đ&oacute;, c&oacute; thể Arteta sẽ mang anh sang đ&aacute; hậu vệ tr&aacute;i trong bối cảnh thiếu hụt nh&acirc;n sự.&nbsp;</strong>Ph&aacute;t biểu trong cuộc phỏng vấn đầu ti&ecirc;n tại Arsenal, Tomiyasu khẳng định m&igrave;nh t&igrave;nh nguyện đảm nhận bất kỳ vai tr&ograve; n&agrave;o m&agrave; đội b&oacute;ng cần.&nbsp;</p>

<p><em>&quot;Đối với t&ocirc;i, điều đ&oacute; kh&ocirc;ng quan trọng,&quot;</em>&nbsp;Tomiyasu chia sẻ khi được hỏi vị tr&iacute; tốt nhất của anh ấy l&agrave; ở đ&acirc;u.&nbsp;<em>&quot;Bởi v&igrave; điều quan trọng nhất l&agrave; tham gia v&agrave;o trận đấu. Thế n&ecirc;n, nếu huấn luyện vi&ecirc;n n&oacute;i với t&ocirc;i như: &#39;Bạn phải chơi tiền đạo th&igrave; t&ocirc;i sẽ chơi tiền đạo.&nbsp;V&acirc;ng, đối với t&ocirc;i, t&ocirc;i chơi ở vị tr&iacute; n&agrave;o kh&ocirc;ng quan trọng.&quot;</em></p>

<p>Tr&ecirc;n thực tế, Tomiyasu đ&atilde; hai lần thi đấu ở vị tr&iacute; hậu vệ tr&aacute;i cho Bologna&nbsp;thời c&ograve;n thi đấu tại Serie A&nbsp;v&agrave; bất bại trong cả hai trận. Đầu ti&ecirc;n l&agrave; trận h&ograve;a 2-2 với Spezia v&agrave; thứ hai l&agrave; trận h&ograve;a 1-1 với Torino.</p>

<p><img alt="Chiến thần trở lại, Mikel Arteta sẵn sàng tung ngón đòn bí mật - Bóng Đá" src="https://media.bongda.com.vn/files/phi.do/2022/04/07/tomiyasu-1117.png" style="height:460px; width:630px" /></p>

<h2>&nbsp;Arteta c&oacute; thể sẽ mang Tomiyasu sang c&aacute;nh tr&aacute;i.</h2>

<p>Nếu điều n&agrave;y thực sự xảy ra, Arteta vẫn sẽ giữ được khả năng tấn c&ocirc;ng của&nbsp;Cedric ở c&aacute;nh phải, người c&oacute; những đường tạt b&oacute;ng chất lượng hơn&nbsp;Tomiyasu ở một phần ba s&acirc;n đối phương.&nbsp;</p>

<p>Dĩ nhi&ecirc;n, đ&acirc;y vẫn chỉ l&agrave; một thử nghiệm bất đắc dĩ m&agrave; chiến lược gia người T&acirc;y Ban Nha buộc phải đưa ra. Nhưng suy cho c&ugrave;ng, kh&ocirc;ng đội b&oacute;ng n&agrave;o ho&agrave;n to&agrave;n l&agrave;nh lặn từ đầu m&ugrave;a cho đến cuối m&ugrave;a.</p>

<p>Như Carlo Ancelotti n&oacute;i, khả năng xoay tua sẽ ảnh hưởng trực tiếp đến kết quả cuối c&ugrave;ng của một giải đấu đường trường. Arsenal&nbsp;vẫn c&oacute; những qu&acirc;n b&agrave;i chất lượng ở trong tay. Giờ l&agrave; l&uacute;c để Arteta mạnh dạn thay đổi v&agrave; l&agrave;m bất ngờ đối thủ.</p>
', 235, CAST(N'2022-04-07T23:12:32.453' AS DateTime), 1, N'11-12tomiyasu-1117.png')
SET IDENTITY_INSERT [dbo].[tblBaidang] OFF
GO
SET IDENTITY_INSERT [dbo].[tblBinhluan] ON 

INSERT [dbo].[tblBinhluan] ([PK_iBinhluanID], [sNoidung], [FK_iBaidangID], [FK_sName]) VALUES (1, N'Quá hay', 4, N'huy24                                             ')
INSERT [dbo].[tblBinhluan] ([PK_iBinhluanID], [sNoidung], [FK_iBaidangID], [FK_sName]) VALUES (9, N'người ta thấy hình ảnh của một hỗ trợ mở giao tranh kiểu hiện đại. Chàng trai này luôn chủ động di chuyển để tìm kiếm cơ hội, thay vì chỉ tập trung kiểm soát tầm nhìn. Với những con bài như Leona, Alistar và Braum, Missing tạo ra hàng tá cơ hội cho đồng đội lập công.', 15, N'')
INSERT [dbo].[tblBinhluan] ([PK_iBinhluanID], [sNoidung], [FK_iBaidangID], [FK_sName]) VALUES (10, N'người ta thấy hình ảnh của một hỗ trợ mở giao tranh kiểu hiện đại. Chàng trai này luôn chủ động di chuyển để tìm kiếm cơ hội, thay vì chỉ tập trung kiểm soát tầm nhìn. Với những con bài như Leona, Alistar và Braum, Missing tạo ra hàng tá cơ hội cho đồng đội lập công.', 15, N'huy24')
INSERT [dbo].[tblBinhluan] ([PK_iBinhluanID], [sNoidung], [FK_iBaidangID], [FK_sName]) VALUES (11, N'người ta thấy hình ảnh của một hỗ trợ mở giao tranh kiểu hiện đại. Chàng trai này luôn chủ động di chuyển để tìm kiếm cơ hội, thay vì chỉ tập trung kiểm soát tầm nhìn. Với những con bài như Leona, Alistar và Braum, Missing tạo ra hàng tá cơ hội cho đồng đội lập công.', 3, N'')
INSERT [dbo].[tblBinhluan] ([PK_iBinhluanID], [sNoidung], [FK_iBaidangID], [FK_sName]) VALUES (12, N'người ta thấy hình ảnh của một hỗ trợ mở giao tranh kiểu hiện đại. Chàng trai này luôn chủ động di chuyển để tìm kiếm cơ hội, thay vì chỉ tập trung kiểm soát tầm nhìn. Với những con bài như Leona, Alistar và Braum, Missing tạo ra hàng tá cơ hội cho đồng đội lập công.', 3, N'')
INSERT [dbo].[tblBinhluan] ([PK_iBinhluanID], [sNoidung], [FK_iBaidangID], [FK_sName]) VALUES (14, N'người ta thấy hình ảnh của một hỗ trợ mở giao tranh kiểu hiện đại. Chàng trai này luôn chủ động di chuyển để tìm kiếm cơ hội, thay vì chỉ tập trung kiểm soát tầm nhìn. Với những con bài như Leona, Alistar và Braum, Missing tạo ra hàng tá cơ hội cho đồng đội lập công.', 16, N'')
INSERT [dbo].[tblBinhluan] ([PK_iBinhluanID], [sNoidung], [FK_iBaidangID], [FK_sName]) VALUES (15, N'người ta thấy hình ảnh của một hỗ trợ mở giao tranh kiểu hiện đại. Chàng trai này luôn chủ động di chuyển để tìm kiếm cơ hội, thay vì chỉ tập trung kiểm soát tầm nhìn. Với những con bài như Leona, Alistar và Braum, Missing tạo ra hàng tá cơ hội cho đồng đội lập công.', 16, N'huy0000')
INSERT [dbo].[tblBinhluan] ([PK_iBinhluanID], [sNoidung], [FK_iBaidangID], [FK_sName]) VALUES (16, N'Dĩ nhiên, đây vẫn chỉ là một thử nghiệm bất đắc dĩ mà chiến lược gia người Tây Ban Nha buộc phải đưa ra. Nhưng suy cho cùng, không đội bóng nào hoàn toàn lành lặn từ đầu mùa cho đến cuối mùa.', 16, N'huy0000')
INSERT [dbo].[tblBinhluan] ([PK_iBinhluanID], [sNoidung], [FK_iBaidangID], [FK_sName]) VALUES (17, N'Dĩ nhiên, đây vẫn chỉ là một thử nghiệm bất đắc dĩ mà chiến lược gia người Tây Ban Nha buộc phải đưa ra. Nhưng suy cho cùng, không đội bóng nào hoàn toàn lành lặn từ đầu mùa cho đến cuối mùa.', 12, N'huy0000')
SET IDENTITY_INSERT [dbo].[tblBinhluan] OFF
GO
INSERT [dbo].[tblChude] ([PK_iChudeID], [sTenchude]) VALUES (1, N'Bóng đá')
INSERT [dbo].[tblChude] ([PK_iChudeID], [sTenchude]) VALUES (2, N'Bóng rổ')
INSERT [dbo].[tblChude] ([PK_iChudeID], [sTenchude]) VALUES (3, N'Bóng chuyền')
INSERT [dbo].[tblChude] ([PK_iChudeID], [sTenchude]) VALUES (4, N'Bơi lội')
INSERT [dbo].[tblChude] ([PK_iChudeID], [sTenchude]) VALUES (5, N'Thể thao điện tử')
GO
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([iUserID], [sName], [sPassword], [sAnh], [bQuyen], [sTen]) VALUES (8, N'                                                  ', N'123456', N'nam.jpg', 0, N'Ð? Quang')
INSERT [dbo].[tblUser] ([iUserID], [sName], [sPassword], [sAnh], [bQuyen], [sTen]) VALUES (12, N'huy0000', N'123123', N'nam.jpg', 0, N'Huy Đỗ')
INSERT [dbo].[tblUser] ([iUserID], [sName], [sPassword], [sAnh], [bQuyen], [sTen]) VALUES (7, N'huy123', N'123456', N'nam.jpg', 0, N'Kang')
INSERT [dbo].[tblUser] ([iUserID], [sName], [sPassword], [sAnh], [bQuyen], [sTen]) VALUES (10, N'huy20', N'123123', N'nu.jpg', 0, N'Huy Quang')
INSERT [dbo].[tblUser] ([iUserID], [sName], [sPassword], [sAnh], [bQuyen], [sTen]) VALUES (11, N'huy2000', N'123123', N'nam.jpg', 0, N'Đỗ Quang Huy')
INSERT [dbo].[tblUser] ([iUserID], [sName], [sPassword], [sAnh], [bQuyen], [sTen]) VALUES (1, N'huy24', N'123456', N'nam.jpg', 1, N'Huy')
INSERT [dbo].[tblUser] ([iUserID], [sName], [sPassword], [sAnh], [bQuyen], [sTen]) VALUES (6, N'huydo', N'123456', N'nam.jpg', 0, N'Hee')
INSERT [dbo].[tblUser] ([iUserID], [sName], [sPassword], [sAnh], [bQuyen], [sTen]) VALUES (5, N'huydo24', N'123456', N'nam.jpg', 0, N'Quang')
INSERT [dbo].[tblUser] ([iUserID], [sName], [sPassword], [sAnh], [bQuyen], [sTen]) VALUES (9, N'huydo2424', N'123123', N'nu.jpg', 0, N'Kang Hee')
SET IDENTITY_INSERT [dbo].[tblUser] OFF
GO
ALTER TABLE [dbo].[tblBaidang]  WITH CHECK ADD  CONSTRAINT [FK_tblBaidang_tblChude] FOREIGN KEY([FK_iChudeID])
REFERENCES [dbo].[tblChude] ([PK_iChudeID])
GO
ALTER TABLE [dbo].[tblBaidang] CHECK CONSTRAINT [FK_tblBaidang_tblChude]
GO
ALTER TABLE [dbo].[tblBinhluan]  WITH CHECK ADD  CONSTRAINT [FK_tblBinhluan_tblBaidang] FOREIGN KEY([FK_iBaidangID])
REFERENCES [dbo].[tblBaidang] ([PK_iBaidangID])
GO
ALTER TABLE [dbo].[tblBinhluan] CHECK CONSTRAINT [FK_tblBinhluan_tblBaidang]
GO
ALTER TABLE [dbo].[tblBinhluan]  WITH CHECK ADD  CONSTRAINT [FK_tblBinhluan_tblUser1] FOREIGN KEY([FK_sName])
REFERENCES [dbo].[tblUser] ([sName])
GO
ALTER TABLE [dbo].[tblBinhluan] CHECK CONSTRAINT [FK_tblBinhluan_tblUser1]
GO
/****** Object:  StoredProcedure [dbo].[spBaidang_delete]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spBaidang_delete] (@PK_iBaidangID int)
As
Begin
	DELETE FROM tblBaidang
	WHERE PK_iBaidangID=@PK_iBaidangID

END
GO
/****** Object:  StoredProcedure [dbo].[spBaidang_find]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spBaidang_find](@sTieude nvarchar(200), @dNgaydang nvarchar(200))
As
Begin
	Select*from tblBaidang
	Where lower (sTieude) like '%'+lower(trim(@sTieude))+'%'
	or (dNgaydang) < convert(datetime,(@dNgaydang))
end
GO
/****** Object:  StoredProcedure [dbo].[spBaidang_getbyChude]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spBaidang_getbyChude] (@FK_iChudeID int)
As
Begin
	Select*from tblBaidang
	where FK_iChudeID=@FK_iChudeID
End
GO
/****** Object:  StoredProcedure [dbo].[spBaidang_getbyID]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spBaidang_getbyID](@PK_iBaidangID int = 0)
As
	If @PK_iBaidangID>0
		Select*from tblBaidang where PK_iBaidangID=@PK_iBaidangID
	else
		Select*from tblBaidang where 1 =1
Return 0
GO
/****** Object:  StoredProcedure [dbo].[spBaidang_Hienluotxem]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spBaidang_Hienluotxem](@PK_iBaidangID int, @iLuotxem int output)
As
Begin
	Select @iLuotxem=iLuotxem from tblBaidang where PK_iBaidangID=@PK_iBaidangID
End
GO
/****** Object:  StoredProcedure [dbo].[spBaidang_Insert]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spBaidang_Insert] (@sTieude nvarchar(200),@sNoidung nvarchar(MAX),@iLuotxem int, @dNgaydang datetime, @FK_iChudeID int,@sAnh nvarchar(50))
AS
Begin
	Insert into tblBaidang
	Values (@sTieude,@sNoidung,@iLuotxem, @dNgaydang, @FK_iChudeID,@sAnh)
End
GO
/****** Object:  StoredProcedure [dbo].[spBaidang_Luotxem]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spBaidang_Luotxem] (@iLuotxem int , @PK_iBaidangID int)
As
Begin
	Update tblBaidang Set iLuotxem = @iLuotxem where PK_iBaidangID = @PK_iBaidangID
End
GO
/****** Object:  StoredProcedure [dbo].[spBaidang_new]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spBaidang_new]
As
Begin
	Select top 10 *From tblBaidang order by PK_iBaidangID desc
End
GO
/****** Object:  StoredProcedure [dbo].[spBaidang_random]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spBaidang_random]
As
Begin
	Select * from tblBaidang tablesample (10 rows)
End
GO
/****** Object:  StoredProcedure [dbo].[spBaidang_randomTop5]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spBaidang_randomTop5]
As
Begin
	Select top 10 * from tblBaidang tablesample (5 rows)

ORDER BY PK_iBaidangID
End
GO
/****** Object:  StoredProcedure [dbo].[spBaidang_Update]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spBaidang_Update] (@PK_iBaidangID int, @sTieude nvarchar(200),@sNoidung nvarchar(MAX),@iLuotxem int, @dNgaydang datetime, @FK_iChudeID int,@sAnh nvarchar(50))
As
Begin
	Update tblBaidang
	Set sTieude=@sTieude, sNoidung=@sNoidung, iLuotxem=@iLuotxem, dNgaydang=@dNgaydang, FK_iChudeID=@FK_iChudeID,sAnh=@sAnh
	Where PK_iBaidangID=@PK_iBaidangID
End
GO
/****** Object:  StoredProcedure [dbo].[spBinhluan_delete]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[spBinhluan_delete](@PK_iBinhluanID int)
as
begin
	Delete from tblBinhluan
	where PK_iBinhluanID=@PK_iBinhluanID
end
GO
/****** Object:  StoredProcedure [dbo].[spBinhluan_getbyBaidang]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spBinhluan_getbyBaidang](@FK_iBaidangID int)
As
Begin
	Select * from vNguoibinhluan
	where FK_iBaidangID = @FK_iBaidangID
End
GO
/****** Object:  StoredProcedure [dbo].[spBinhluan_getbyBaidangID]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spBinhluan_getbyBaidangID](@FK_iBaidangID int)
As
Begin
	Select * from tblBinhluan 
	where @FK_iBaidangID=FK_iBaidangID
End
GO
/****** Object:  StoredProcedure [dbo].[spBinhluan_Insert]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spBinhluan_Insert](@sNoidung nvarchar(max), @FK_iBaidangID int, @FK_sName nvarchar(50))
As
Begin
	Insert into tblBinhluan
	values ( @sNoidung, @FK_iBaidangID, @FK_sName)
End
GO
/****** Object:  StoredProcedure [dbo].[spChude_get]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spChude_get]
As
BEGIN
	SELECT * FROM tblChude
END
GO
/****** Object:  StoredProcedure [dbo].[spChude_getbyID]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[spChude_getbyID](@PK_iChudeID int = 0)
As
	If @PK_iChudeID>0
		Select*from tblChude where PK_iChudeID=@PK_iChudeID
	else
		Select*from tblChude where 1 =1
Return 0
GO
/****** Object:  StoredProcedure [dbo].[spLogin_delete]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spLogin_delete] (@sName nvarchar(50))
As
Begin
	DELETE FROM tblUser
	WHERE sName=@sName

END
GO
/****** Object:  StoredProcedure [dbo].[spLogin_get]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spLogin_get](@sName nvarchar(50), @sPassword varchar(50))
As
Begin
	Select * from tblUser where sName=@sName and sPassword=@sPassword
End
GO
/****** Object:  StoredProcedure [dbo].[spLogin_getName]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spLogin_getName](@sName nvarchar(50))
As
Begin
	Select * from tblUser where sName=@sName 
End
GO
/****** Object:  StoredProcedure [dbo].[spLogin_insert]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spLogin_insert](@sName nvarchar(50), @sPassword varchar(50),@sAnh nvarchar(50),@bQuyen bit,@sTen nvarchar(50))
AS
Begin
	Insert into tblUser
	Values (@sName, @sPassword, @sAnh, @bQuyen,@sTen)
End
GO
/****** Object:  StoredProcedure [dbo].[spLogin_Update]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spLogin_Update](@sName nvarchar(50), @sPassword varchar(50),@sAnh nvarchar(50),@bQuyen bit,@sTen nvarchar(50))
As
Begin
	Update tblUser
	Set sName=@sName,sPassword=@sPassword,sAnh=@sAnh,bQuyen=@bQuyen,sTen=@sTen
End
GO
/****** Object:  StoredProcedure [dbo].[spLogin_Update1]    Script Date: 08/04/2022 13:40:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[spLogin_Update1] (@sName nvarchar(50),@sPassword varchar(50), @sTen nvarchar(50))
as
begin
	Update tblUser
	Set sPassword=@sPassword,sTen=@sTen
	where sName=@sName
End
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblBaidang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tblBinhluan"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tblUser"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vNguoibinhluan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vNguoibinhluan'
GO

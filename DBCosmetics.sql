/*---- COSMETICS MANAH ----
DO AN MON HOC CONG NGHE WEB (T4 7-11)
		115 - 381 - 076
*/
create database DA
go
use DA
go
/* -- SAN PHAM -- */
--Create Table DanhMuc
--(
--	MaDM nchar(10) NOT NULL Primary key,
--	TenDM nvarchar(MAX)
--)
go
Create Table LoaiSP
(
	MaLoaiSP nchar(10) NOT NULL Primary key,
	TenLoai nvarchar(MAX),
	MaDM nchar(10),
)
go
Create Table SanPham
(
	MaSP int IDENTITY(1,1) primary key NOT NULL,
	TenSP nvarchar(MAX),
	Hinh nvarchar(MAX),
	MaLoaiSP nchar(10),
	Thuonghieu nvarchar(MAX),
	Mota nvarchar(MAX),
	SoLuongCon int,
	Gia int,
)

/* -- END SAN PHAM -- */
go
/* -- KHACH HANG -- */
Create Table KhachHang
(
	MaKH int identity(1,1) Primary key,
	HoTen nvarchar(MAX) NOT NULL,
	TaiKhoan varchar(50),
	MatKhau varchar(50),
	DiaChi nvarchar(MAX) NOT NULL,
	GioiTinh nvarchar(5) NOT NULL,
	DienThoai nvarchar(MAX),
	NgaySinh datetime,
	Email nvarchar(MAX) NOT NULL
)

/* -- END KHACH HANG -- */

/* -- ORDER -- */

Create table DonDatHang
(
	MaDH  int identity(1,1) primary key,
	Dathanhtoan bit,
	Tinhtranggiaohang bit,
	Ngaydat datetime,
	Ngaygiao datetime,
	MaKH int not null,
	GhiChu nvarchar(MAX),
	Constraint FK_DonDatHangKhachHang foreign key(MaKH) references KhachHang(MaKH),
)

Create table ChiTietDonHang
(
	MaDH int,
	MaSP nchar(10),
	Soluong int,
	Dongia int,
	primary key (maDH,MaSP),
	Constraint FK_ChiTietDonHangKhachHang foreign key(MaDH) references DonDatHang(MaDH),
	Constraint FK_ChiTietDonHangSanPham foreign key(MaSP) references SanPham(MaSP),
)
/* -- END ORDER -- */

go
Create table TheLoaiTinTuc
(
	MaTL char(10) primary key not null,
	TenLoai nvarchar(50)
)
go
create table TinTuc
(
	MaTin int IDENTITY(1,1) primary key NOT NULL,
	MaTL char(10) NOT NULL,
	HinhMinhHoa nvarchar(max),
	TieuDeTin nvarchar(max),
	NoiDungTin nvarchar(max),
	LanXem int,
	NgayDang datetime,
)
Create table Admin
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30),
	HoTenn Nvarchar(50),
)

Insert into Admin 
values	('nhan123','123456',N'Hoàng Thái Thanh Nhàn'),
		('huy456','123456',N'Phạm Quang Huy'),
		('man789','123456',N'Phạm Nguyễn Tuệ Mẫn'),
		('admin','admin',N'Đặng Lê Nam')

/* Khoa ngoai */

-- Loai SP --
--Alter Table LoaiSP
--Add Constraint Fk_DM_LoaiSP Foreign key (MaDM) References DanhMuc(MaDM)

-- San Pham --
Alter Table SanPham
Add Constraint Fk_MaLoai_SanPham Foreign key (MaLoaiSP) References LoaiSP(MaLoaiSP)


-- Order --
-- Tin tuc --
Alter Table TinTuc
Add constraint Fk_TheLoaiTinTuc_TinTuc Foreign key (MaTL) references TheLoaiTinTuc(MaTL)

set dateformat DMY

--insert DanhMuc values ('DM01', N'Makeup')
--insert DanhMuc values ('DM02', N'Chăm sóc da')

insert LoaiSP values ('L01', N'Mắt', 'DM01')
insert LoaiSP values ('L02', N'Môi', 'DM01')
insert LoaiSP values ('L03', N'Da', 'DM01')
insert LoaiSP values ('L04', N'Phụ Kiện', 'DM01')
insert LoaiSP values ('L05', N'Sữa rửa mặt', 'DM02')
insert LoaiSP values ('L06', N'Tẩy Trang', 'DM02')
insert LoaiSP values ('L07', N'Dưỡng Da', 'DM02')
insert LoaiSP values ('L08', N'Mặt nạ', 'DM02')

insert SanPham values ( N'Nước tẩy trang sạch thoáng Senka All Clear Water Fresh Anti Shine Micellar Formula 230ml', 'SP01.PNG', 'L06',N'Senka', N'Nước tẩy trang sạch thoáng Senka All Clear Water Fresh Anti Shine Micellar Formula – nước tẩy trang thế hệ mới với công nghệ Nhật Bản nhẹ nhàng làm sạch lớp trang điểm, bụi bẩn và bã nhờn sâu bên trong lỗ chân lông, loại bỏ dâu thừa và không gây kích ứng trên da ', 18,97000)
insert SanPham values ( N'Nước Tẩy Trang LOreal Paris Micellar Water 3in1 (400ml)', 'SP02.PNG', 'L06',N'Loreal', N'Nước Tẩy Trang Dưỡng Ẩm LOreal Paris Micellar Water 3in1 (400ml) có tác dụng 3 trong 1 thanh sạch lớp nền, trang điểm, bụi bẩn và bã nhờn. Sản phẩm bao gồm 2 loại thiết kế chuyên biệt cho 2 loại da khác nhau. Phù hợp với cả da nhạy cảm. ', 22,114000)
insert SanPham values ( N'Nước Tẩy Trang Làm Sạch Da, Kháng Khuẩn Derladie Cleansing Water Witch Hazel 500ml', 'SP03.PNG', 'L06',N'Derladie', N'Derladie Cleansing Water Witch Hazel là sản phẩm đẩu tiên trên thế giới có chứa chiết xuất từ cây phỉ và được đông đảo người tiêu dùng lựa chọn sử dùng. Sản phẩm rất giàu các dưỡng chất vitamin và khoáng chất sẽ làm lạch sâu làn da 1 cách nhẹ nhàng và cấp nước cho da tức thời ', 11,250000)
insert SanPham values ( N'Nước Tẩy Trang La Roche-Posay Micellar Water Ultra Sensitive Skin', 'SP04.PNG', 'L06',N'La Roche-Posay', N'Nước tẩy trang MICELLAR là loại nước tẩy trang tân tiển không cần phải rửa lại với nước. Nước Tẩy Trang Cho Da Nhạy Cảm La Roche-Posay Micellar Water Ultra Sensitive Skin được thiết kế thanh sạch. Từ đó thích hợp cho tất cả mọi loại da, đặc biệt là da nhạy cảm. Sản phẩm không những làm sạch gần như hoàn toàn cặn trang điểm, bụi bẩn siêu nhỏ chỉ trong 1 lần lau với bông cotton. Đặc biệt còn xoa dịu và giảm kích ứng, không làm khô da. ',0,400000)
insert SanPham values ( N'Son Kem Lì Black Rouge Air Fit Velvet Tint', 'SP05.PNG', 'L02',N'Black Rouge', N' Son Kem Lì Black Rouge Air Fit Velvet Tint với chất son kem vô cùng mềm, mịn, mướt, bền màu lâu, không gây cảm giác nứt nẻ khô môi nhưng vẫn đủ lì tạo nên một bờ môi căng mọng đầy quyến rũ.', 8,99000)
insert SanPham values ( N' Son 3CE Matte Lip Color', 'SP06.PNG', 'L02',N'3CE', N'Stylenanda lại tiếp tục nhá hàng dòng son thỏi mới toanh mang tên 3CE Matte Lip Color làm thổn thức thế giới. Đặc biệt hơn, bắt nhịp màu tím đang hot của năm 2018. ', 30,249000)
insert SanPham values ( N'[Siêu Phẩm 2019] Son Kem Lì "Siêu Hot" 3CE Cloud Lip Tint', 'SP07.PNG', 'L02',N'3CE', N'Nhân dịp hè 2019, hãng STYLENANDA đã cho ra đời Siêu Phẩm Son làm mưa làm gió thu hút đông đảo sự chú ý của phái đẹp. Sản phẩm sang trọng và xịn sò từ bao bì đến chất son và mong muốn mở ra khung trời mới cho chất son. Bảng màu son mĩ miều khiến bạn gái chao đảo, "đổ" đứ đừ.  ', 33,369000)
insert SanPham values ( N'[NEW 2019] Son Thỏi Lì Bbia Last Lipstick Red Series 4', 'SP08.PNG', 'L02',N'Bbia', N'Bbia Last Lipstick Red Series 4 thuộc dòng son Matte và có bổ sung một chutas dưỡng không làm khô môi và được xem là dòng son hot nhất hiện nay, dành cho các bạn gái đam mê sắc đỏ huyền bí và quyến rũ. ', 17,139000)
insert SanPham values ( N'Son Kem Lì Lên Màu Siêu Chuẩn, Siêu Mịn Mịn Carenel Ruby Airfit Velvet Tint', 'SP09.PNG', 'L02',N'Carenel', N'Carenel Ruby Airfit Velvet Tint được xem là đại diện cho dòng son kem lì duy nhất của đại gia đình Carenel, đồng thời lại là \"đứa con cưng mới nhất\" nên cũng không khó hiểu vì sao khi em này được đầu tư kỹ càng nhất như vậy từ chất lượng bên trong cho đến kiểu dáng bên ngoài. ', 21,159000)
insert SanPham values ( N'Son Dưỡng Môi Vaseline Lip', 'SP10.PNG', 'L02',N'Vaseline', N'Sản phẩm son dưỡng môi Vaseline Lip của tập đoàn Unilever giúp cung cấp chất dinh dưỡng, mang lại cho bạn làn da môi mềm mại. Nó có chức năng vừa là son dưỡng môi vừa trị nứt nẻ hiệu quả. Son dưỡng môi Vaseline Lip cho bạn một đôi môi và làn da mềm, mượt hơn. ',55,49000)
insert SanPham values ( N'Sữa Rửa Mặt Muối Biển Innisfree Sea Salt Perfect Cleanser (130ml)', 'SP11.PNG', 'L05',N'Innisfree', N'Innisfree Sea Salt Perfect Cleanser là dòng sữa rửa mặt đến từ thương hiệu mỹ phẩm \"thân thiện với môi trường\" Innisfree',12,200000)
insert SanPham values ( N'Sữa Rửa Mặt Simple Kind To Skin Refreshing Facial Wash Gel', 'SP12.PNG', 'L05',N'Simple',N'Simple Refreshing Facial Wash Gel là sự lựa chọn lý tưởng dành cho da mụn. Vì nó không gây kích ứng mụn, không làm bít lỗ chân lông nên không khiến mụn lây lan hay kích ứng.',15,87000)
insert SanPham values ( N'[NEW UPDATE 2019] Sữa Rữa Mặt Tẩy Tế Báo Chết Innisfree Jeju Volcanic Pore Scrub Foam', 'SP13.PNG', 'L05',N'Innisfree', N'Jeju Volcanic Pore Scrub Foam Innisfree là loại sữa rửa mặt dành riêng cho da có mụn cám, mụn đầu đen, da có lỗ chân lông to. Tác dụng của sữa rửa mặt này cũng tương tự Jeju Volcanic pore cleansing foam, nhưng tác dụng làm sạch thì hơn hẳn do có các hạt matxa giúp lấy đi bụi bẩn tận sâu lỗ chân lông.',10,185000)
insert SanPham values ( N'Bọt Rửa Mặt Trà Trắng Shirochasou White Tea Foaming Wash (150g)', 'SP14.PNG', 'L05',N'ROHTO PHARMACEUTICAL', N'Sữa Rửa Mặt Tạo Bọt Chiết Xuất Trà Trắng Shirochasou là sản phẩm đến từ ROHTO PHARMACEUTICAL (JAPAN) Nhật Bản. Tập đoàn có bề dày lịch sử hơn 100 năm sản xuất các sản phẩm chăm sóc toàn thân từ tóc, da đầu, chăm sóc da.. Sản phẩm chiết xuất từ lá trà trắng quý hiếm cùng Diếp cá và Quýt Nhật hỗ trợ kháng viêm, làm sạch da và ngăn ngừa mụn hiệu quả. Đặc biệt, sản phẩm có vòi xịt tạo bọt bông mịn màng. ',0,195000)
insert SanPham values ( N'Sữa Rửa Mặt Shiseido Senka Perfect Whip Cleansing Foam', 'SP15.PNG', 'L05',N'Senka', N'Perfect Whip là loại sữa rửa mặt tạo bọt có chứa Sericin giúp loại bỏ các tạp chất như bụi bẩn và bã nhờn mà không loại bỏ độ ẩm của da.',1,63000)
insert SanPham values ( N'[NEW UPDATE 2019] Kẻ Mắt Chống Thấm Nước Innisfree Powerproof Brush Liner - #1 Black', 'SP16.PNG', 'L01',N'Innisfree', N'Cọ Kẻ Mắt Chống Thấm Nước Innisfree Powerproof Brush Liner giúp bạn sỡ hữu một đường viền mắt thanh mảnh, sắc nét, cho bạn sỡ hữu một đôi mắt to tròn, ấn tượng suốt cả ngày dài mà không sợ lem trôi khi gặp nước.',9,143000)
insert SanPham values ( N'Chì Kẻ Mắt Chống Thấm Nước Innisfree Skinny Micro Liner', 'SP17.PNG', 'L01',N'Innisfree',N'Chì Kẻ Mắt Chống Thấm Nước Innisfree Skinny Micro Liner với đầu chì siêu mảnh chỉ 2mm, cho đường kẻ mắt cực chính xác và rõ ràng. Đường kẻ với chì kẻ thế hệ mới này sẽ cực mỏng hơn so với các loại chì bình thường tạo nên đường nét tự nhiên, tinh tế và đôi mắt sắc nét. Chất chì tựa như gel, chỉ cần 1 lần kẻ nhẹ nhàng là sẽ cho ra đường nét rõ ràng',21,167000)
insert SanPham values ( N'[NEW UPDATE 2019] Mascara Làm Dài Mi Innisfree Skinny Longlongcara', 'SP18.PNG', 'L01',N'Innisfree', N'Mascara Innisfree Skinny Longlongcara là một siêu phẩm đến từ hãng mỹ phẩm nổi tiếng Hàn Quốc Innisfree mang tới cho bạn đôi mi dài gấp 1,5 lần và duy trì mi cong tới tận 12 tiếng với thành phần hoàn toàn tự nhiên, không gây kích ứng da.',24,145000)
insert SanPham values ( N'Phấn Nước Che Phủ Hoàn Hảo Missha Velvet Finish Cushion', 'SP19.PNG', 'L03',N'Missha', N'Missha Velvet Finish Cushion có khả năng làm đều màu những phần da bị sạm, khiến da trắng sáng một cách tự nhiên',3,119000)
insert SanPham values ( N'Kem Lót Nyx Can’t Stop Won’t Stop Matte Primer 25ml', 'SP20.PNG', 'L03',N'NYX',N'Kem Lót Nyx Can’t Stop Won’t Stop Matte Primer tạo được hiệu ứng lì mịn trên da ngay khi vừa trang điểm. Duy trì lớp nền mịn căng suốt cả ngày. Nhờ thành phần đất sét và dầu khoáng hút đi dầu thừa.', 7,256000)
insert SanPham values ( N'Phấn Trang Điểm Đa Năng Má Hồng Và Môi Innisfree My Lip And Cheek Airy', 'SP21.PNG', 'L03',N'Innisfree',N'Sở hữu ngay trong tay sản phẩm đa chức năng 2 in 1 tô điểm cho môi nàng thêm thắm tươi và đôi má thêm hồng hào cùng Innisfree My Lip and Cheek Airy',4,129000)
insert SanPham values ( N'Phấn Má Hồng Missha Cotton Blush', 'SP22.PNG', 'L03',N'Missha',N'Phấn Má Hồng Missha Cotton Blush với bảng màu đa dạng các tone màu cực tẻ trung, tự nhiên sẽ là lựa chọn rất tuyệt vời để tô điểm lên gương mặt của bạn trông thêm phầm rạng rỡ và tươi tắn hơn.',16,119000)
insert SanPham values ( N'Má hồng 3CE Mood Recipe On & On Face Blush', 'SP23.PNG', 'L03',N'3CE',N'Má hồng 3CE Mood Recipe On & On Face Blush vừa được tung ra thị trường. Sản phẩm thuộc bộ sưu tập Mood Receip mới ra mắt của 3CE với những ưu điểm vượt trội như: thiết kế đơn giản, chất phấn siêu mềm mịn, khả năng bám da cực tốt, giúp bạn gái sở hữu làn da tươi sáng, mềm mịn suốt cả ngày.',12,229000)
insert SanPham values ( N'Bộ Cọ Vacosi My Darling (6 cây)', 'SP24.PNG', 'L04',N'VACOSI',N'Bộ cọ Vacosi My Darling (6 cây) được làm từ lông tự nhiên, mềm mại, độ đàn hồi tốt. Với thiết kế hộp sắt đựng cọ màu đen mini nhỏ nhắn, xinh xắn, tiện dụng mang theo bên người, đặc biệt khi đi du lịch.',6,116000)
insert SanPham values ( N'Bông phấn hồ lô Vacosi Pear Blender', 'SP25.PNG', 'L04',N'VACOSI',N'Bông phấn ướt hồ lô VACOSI Cùng cảm nhận độ dẻo dai và mềm mịn của bông phấn VACOSI được sản xuất theo tiêu chuẩn Hàn Quốc.Bông phấn ướt hồ lô VACOSI dùng để đánh phấn lót và phấn nền dạng nước hoặc dạng kem, giúp tán đều phấn và mang lại một lớp nền hoàn hảo cho những lớp trang điểm tiếp theo.',7,30000)
insert SanPham values ( N'[New 2019] Kem Dưỡng Innisfree Green Tea Balancing Cream EX', 'SP26.PNG', 'L07',N'Innisfree',N'Cho dù là làn da khô, da dầu hay da hỗn hợp thì tình trạng thiếu ẩm vẫn thường xuyên xuất hiện và gây nhiều tác hại xấu lên da. Hãy nâng niu làn da bạn với kem dưỡng Innisfree Green Tea Balancing Cream', 0,285000)
insert SanPham values ( N'Kem Dưỡng Ẩm Simple Kind To Skin Hydrating Light Moisturiser 125ml', 'SP27.PNG', 'L07',N'Simple',N'Kem dưỡng ẩm Simple Kind To Skin Hydrating Light Moisturiser với các thành phần lành tín không gây kích ứng cho làn da nhạy cảm nhất, đem lại làn da ẩm mượt, căng bóng như sương. Đặc biệt kem dưỡng Simple Hydrating có chất kem nhẹ dễ dàng thẩm thấu vào da hơn vì thế rất thích hợp cho những cô nàng da dầu và mụn',0,160000)
insert SanPham values ( N'Kem Dưỡng Da Chống Lão Hóa Innisfree Jeju Orchid Gel Cream', 'SP28.PNG', 'L07',N'Innisfree',N'Kem Dưỡng Da Chống Lão Hóa Innisfree Jeju Orchid Gel Cream 50ml với chiết xuất tinh chất hoa lan tím giúp nuôi dưỡng và phục hồi làn da hư tổn. Chất kem dạng gel trong suốt, hoàn toàn oil-free nên sẽ không làm bí tắc lỗ chân lông. Kết cấu gel mỏng nhẹ, thoa đến đâu là thấm đến đấy. Cho bạn cảm giác như không hề bôi kem, cực thoáng và mịn da',23,429000)
insert SanPham values ( N'Tẩy Tế Bào Chết Huxley Secret Of Sahara Scrub Mask Sweet Therapy', 'SP29.PNG', 'L08',N'Huxley',N'Chăm sóc da hai bước liên tiếp, vừa tẩy tế bào chết dư thừa vừa cung cấp các chất dinh dưỡng cho da với mặt nạ tẩy tế bào chết Huxley Secret Of Sahara Scrub Mask Sweet. Nhất là những bạn gái có làn da dầu',25,109000)
insert SanPham values ( N'[NEW UPDATE 2019] Mặt Nạ Innisfree Super Volcanic Peel Off Mask 2X 100ml', 'SP30.PNG', 'L08',N'Innisfree',N'Innisfree Super Volcanic Peel Off Mask 2X (100ml) là mặt nạ chăm sóc da ở dạng lột, có công dụng làm sạch da, giúp da thông thoáng, loại bỏ các tế bào chết và bã nhờn. Từ đó, bạn sẽ có làn da căng bóng và mịn màng không tì vết',13,249000)

--insert KhachHang values ( N'Nguyễn Thị Yến Nhi', N'Bến Tre', N'Nữ','0397930211','nhiy@gmail.com'),
--(N'Nguyễn Thị Thúy Lam', N'Bến Tre', N'Nữ','09782349113','lamlam@gmail.com'),
--( N'Phạm Nguyễn Tuệ Mẫn', N'Bến Tre', N'Nữ','0397835202','tueman@gmail.com'),
--(N'Trần Thanh Cảnh', N'Bình Thuận', N'Nữ','0911883321','canhcanh@gamilcom'),
--( N'Nguyễn Thành Đạt', N'Bình Định', N'Nam','0397825288','datdat@gmail.com'),
--( N'Hoàng Thái Thanh Nhàn', N'Bến Tre', N'Nữ','0888877220','nhanhan@gmail.com'),
--(N'Phạm Quang Huy', N'Vũng Tàu', N'Nam','0888192344','huyhuy@gmail.com'),
--( N'Nguyễn Trường Giang', N'Dak Nông', N'Nam','0937937210','gianggiang@gmail.com'),
--( N'Nguyễn Thị Mỹ Hạnh', N'Bến Tre', N'Nữ','0839019301','hanhhanh@gmail.com'),
--( N'Thị Bô Pha', N'Tây Ninh', N'Nữ','0839183758','phapha@gmail.com'),
--( N'Lâm Hà Du Uyên', N'Nha Trang', N'Nữ','0819520757','uyendu@gmail.com'),
--( N'Bùi Thị Bích Ngọc', N'Bến Tre', N'Nữ','0815782843','ngocngoc@gmail.com'),
--( N'Nguyễn Thị Hồng Hà', N'Đồng Tháp', N'Nữ','0384805571','hongha@gmail.com'),
--( N'Cao Duy Triều', N'Quảng Trị', N'Nam','0364449725','caotrieu@gmail.com'),
--(N'Hồ Văn Phúc', N'Cà Mau', N'Nam','0387101485','phuccute@gmail.com'),
--( N'Nguyễn Đức Khiêm', N'An Giang', N'Nam','0392169114','khiemm@gmail.com'),
--( N'Nguyễn Văn Hiếu', N'Bến Tre', N'Nam','0368504385','hieuhieu@gmail.com'),
--( N'Nguyễn Thị Minh Châu', N'Kiên Giang', N'Nữ','0764436037','chauchau@gmail.com'),
--( N'Lê Quang Kiên', N'Kiên Giang', N'Nam','0764064051','kienle@gmail.com'),
--( N'Lê Quang Nghĩa', N'Kiên Giang', N'Nam','0763472880','nghiaaa@gmail.com')

 set dateformat DMY


insert into TheLoaiTinTuc
Values	(N'KM', N'Khuyến Mại'),
		(N'M', N'Mẹo')

Insert into TinTuc
Values	(N'M', N'meosonmoi.jpg', N'Chống son dính răng', N'Chẳng cô gái nào muốn mỉm cười để lộ ra hàm rằng dính đầy son. Sau khi đánh xong, hãy ngậm ngón tay như mẫu trong hình, sau đó kéo ngược trở ra...',27, 01/01/2019),
		(N'M', N'sonlautroi.jpg', N'Để son lâu trôi', N'Để son lâu không trôi các bạn cần thực hiện các bước như sau ...', 12,02/02/2019),
		(N'M', N'bangdinh.jpg', N'Đánh với băng dính', N'Sử dụng băng dính như một cách làm đẹp....', 17,03/03/2019),
		(N'KM', N'blackfri.png', N'Black Friday 50% tất cả các sản phẩm !!!', N'Khuyến mãi hot vào cuối năm những ...', 78,04/04/2019)

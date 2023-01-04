create database case_study;
use case_study;

/*
Bảng vi_tri lưu trữ thông tin vị trí làm tại resort của nhân viên.
*/

create table vi_tri (
ma_vi_tri int auto_increment primary key,
ten_vi_tri varchar(45) not null
);

insert into vi_tri(ten_vi_tri)
values
('Quản Lý'),
('Nhân Viên');

/*
Bảng trinh_do lưu trữ thông tin trình độ của nhân viên.
*/

create table trinh_do (
ma_trinh_do int auto_increment primary key,
ten_trinh_do varchar(45) not null
);

insert into trinh_do(ten_trinh_do)
values
('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đại Học');

/*
Bảng bo_phan lưu trữ thông tin nhân viên nào sẽ thuộc phòng ban nào.
*/

create table bo_phan (
ma_bo_phan int auto_increment primary key,
ten_bo_phan varchar(45) not null
);

insert into bo_phan(ten_bo_phan)
values
('Sale-Marketing'),
('Hành chính'),
('Phục vụ'),
('Quản lý');

/*
Bảng nhan_vien lưu trữ thông tin của nhân viên.
*/

create table nhan_vien (
ma_nhan_vien int auto_increment primary key,
ho_ten varchar (45)not null,
ngay_sinh date,
so_cmnd varchar(45),
luong double,
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_vi_tri int,
ma_trinh_do int,
ma_bo_phan int,
foreign key (ma_vi_tri) references vi_tri(ma_vi_tri),
foreign key (ma_trinh_do) references trinh_do(ma_trinh_do),
foreign key (ma_bo_phan) references bo_phan(ma_bo_phan)
);

insert into nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
values
('Nguyễn Văn An','1970-11-07',456231786,10000000,0901234121,'annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1),
('Lê Văn Bình','1997-04-09',654231234,7000000,0934212314,'binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2),
('Hồ Thị Yến','1995-12-12',999231723,14000000,0412352315,'thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2),
('Võ Công Toản','1980-04-04',123231365,17000000,0374443232,'toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4),
('Nguyễn Bỉnh Phát','1999-12-09',454363232,6000000,0902341231,'phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),
('Khúc Nguyễn An Nghi','2000-11-08',964542311,7000000,0978653213,'annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),
('Nguyễn Hữu Hà','1993-01-01',534323231,8000000,0941234553,'nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),
('Nguyễn Hà Đông','1989-09-03',234414123,9000000,0642123111,'donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),
('Tòng Hoang','1982-09-03',256781231,6000000,0245144444,'hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4),
('Nguyễn Công Đạo','1994-01-08',755434343,8000000,0988767111,'nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);

/*
Bảng loai_khach lưu trữ thông tin các loại khách hàng.
*/

create table loai_khach(
ma_loai_khach int auto_increment primary key,
ten_loai_khach varchar(45) not null
);

insert into loai_khach(ten_loai_khach)
values
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

/*
Bảng khach_hang lưu trữ thông tin của khách hàng.
*/

create table khach_hang(
ma_khach_hang int auto_increment primary key,
ho_ten varchar(45),
ngay_sinh date,
gioi_tinh varchar(45),
so_cmnd varchar(45),
so_dien_thoai varchar(45),
email varchar(45),
dia_chi varchar(45),
ma_loai_khach int,
foreign key (ma_loai_khach) references loai_khach (ma_loai_khach)
);

insert into khach_hang(ho_ten,ngay_sinh,gioi_tinh,so_cmnd,so_dien_thoai,email,dia_chi,ma_loai_khach)
values
('Nguyễn Thị Hào','1970-11-07','0','643431213','0945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng',5),
('Phạm Xuân Diệu','1992-08-08','1','865342123','0954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị',3),
('Trương Đình Nghệ','1990-02-27','1','488645199','0373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh',1),
('Dương Văn Quan','1981-07-08','1','543432111','0490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng',1),
('Hoàng Trần Nhi Nhi','1995-12-09','0','795453345','0312345678','nhinhi123@gmail.com','224 Lý Thái Tổ,Gia Lai',4),
('Tôn Nữ Mộc Châu','2005-12-06','0','732434215','0988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng',4),
('Nguyễn Mỹ Kim','1984-04-08','0','856453123','0912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh',1),
('Nguyễn Thị Hào','1999-04-08','0','965656433','0763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum',3),
('Trần Đại Danh','1994-07-01','1','432341235','0643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi',1),
('Nguyễn Tâm Đắc','1989-07-01','1','344343432','0987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng',2);


/*
Bảng kieu_thue lưu trữ các loại kiểu thuê như: theo giờ, theo ngày, theo tháng, theo năm.
*/

create table kieu_thue(
ma_kieu_thue int auto_increment primary key,
ten_kieu_thue varchar(45) not null
);

insert into kieu_thue(ten_kieu_thue)
values
('year'),
('month'),
('day'),
('hour');

/*
Bảng loai_dich_vu lưu trữ các loại dịch vụ ở resort.
*/

create table loai_dich_vu(
ma_loai_dich_vu int auto_increment primary key,
ten_loai_dich_vu varchar(45) not null
);

insert into loai_dich_vu(ten_loai_dich_vu)
values
('Villa'),
('House'),
('Room');

/*
Bảng dich_vu lưu trữ thông tin các dịch vụ mà resort cung cấp.
*/

create table dich_vu(
ma_dich_vu int auto_increment primary key,
ten_dich_vu varchar(45) not null,
dien_tich int,
chi_phi_thue double not null,
so_nguoi_toi_da int,
tieu_chuan_phong varchar(45),
mo_ta_tien_nghi_khac varchar(45),
dien_tich_ho_boi double,
so_tang int,
ma_kieu_thue int,
ma_loai_dich_vu int,
foreign key (ma_kieu_thue) references kieu_thue (ma_kieu_thue),
foreign key (ma_loai_dich_vu) references loai_dich_vu (ma_loai_dich_vu)
);

insert into dich_vu(ten_dich_vu,dien_tich,chi_phi_thue,so_nguoi_toi_da,tieu_chuan_phong,mo_ta_tien_nghi_khac,
dien_tich_ho_boi,so_tang,ma_kieu_thue,ma_loai_dich_vu)
values
('Villa Beach Front',25000,10000000,10,'vip','Có hồ bơi',500,4,3,1),
('House Princess 01',14000,5000000,7,'vip','Có thêm bếp nướng',null,3,2,2),
('Room Twin 01',5000,1000000,2,'normal','Có tivi',null,null,4,3),
('Villa No Beach Front',22000,9000000,8,'normal','Có hồ bơi',300,3,3,1),
('House Princess 02',10000,4000000,5,'normal','Có thêm bếp nướng',null,2,3,2),
('Room Twin 02',3000,900000,2,'normal','Có tivi',null,null,4,3);

/*
Bảng dich_vu_di_kem lưu trữ thông tin các dịch vụ đi kèm khi khách hàng
*/

create table dich_vu_di_kem(
ma_dich_vu_di_kem int auto_increment primary key,
ten_dich_vụ_di_kem varchar(45),
gia double,
don_vi varchar(10),
trang_thai varchar(45)
);

insert into dich_vu_di_kem(ten_dich_vụ_di_kem,gia,don_vi,trang_thai)
values
('Karaoke',	10000,'giờ','tiện nghi hiện tại'),
('Thuê xe máy',	10000,'chiếc','hỏng 1 xe'),
('Thuê xe đạp',20000,'chiếc','tốt'),
('Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn tráng miệng'),
('Buffet buổi trưa',90000,'suất', 'đầy đủ đồ ăn tráng miệng'),
('Buffet buổi tối',16000,'suất', 'đầy đủ đồ ăn tráng miệng');

/*
Bảng hop_dong lưu trữ thông tin khách hàng thực hiện thuê dịch vụ tại
resort.
*/

create table hop_dong(
ma_hop_dong int auto_increment primary key,
ngay_lam_hop_dong datetime,
ngay_ket_thuc datetime,
tien_dat_coc double,
ma_nhan_vien int,
ma_khach_hang int,
ma_dich_vu int,
foreign key (ma_nhan_vien) references nhan_vien (ma_nhan_vien),
foreign key (ma_khach_hang) references khach_hang (ma_khach_hang),
foreign key (ma_dich_vu) references dich_vu (ma_dich_vu)
);

insert into hop_dong(ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
values
('2020-12-08',	'2020-12-08',	0,	3,	1,	3),
('2020-07-14',	'2020-07-21',	200000,	7,	3,	1),
('2021-03-15',	'2021-03-17',	50000,	3,	4,	2),
('2021-01-14',	'2021-01-18',	100000,	7,	5,	5),
('2021-07-14',	'2021-07-15',	0,	7,	2,	6),
('2021-06-01',	'2021-06-03',	0,	7,	7,	6),
('2021-09-02',	'2021-09-05',	100000,	7,	4,	4),
('2021-06-17',	'2021-06-18',	150000,	3,	4,	1),
('2020-11-19',	'2020-11-19',	0,	3,	4,	3),
('2021-04-12',	'2021-04-14',	0,	10,	3,	5),
('2021-04-25',	'2021-04-25',	0,	2,	2,	1),
('2021-05-25',	'2021-05-27',	0,	7,	10,	1);


/*
Bảng hop_dong_chi_tiet lưu trữ thông tin một khách hàng có thể thuê nhiều
dịch vụ đi kèm.
*/

create table hop_dong_chi_tiet(
ma_hop_dong_chi_tiet int auto_increment primary key,
so_luong int,
ma_hop_dong int,
ma_dich_vu_di_kem int,
foreign key (ma_hop_dong) references hop_dong (ma_hop_dong),
foreign key (ma_dich_vu_di_kem) references dich_vu_di_kem (ma_dich_vu_di_kem)
);

insert into hop_dong_chi_tiet(so_luong,ma_hop_dong,ma_dich_vu_di_kem)
values
(5,2,4),
(8,2,5),
(15,2,6),
(1,3,1),
(11,3,2),
(1,1,3),
(2,1,2),
(2,12,2);

/* Task 2 - Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là
một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.*/

select 
	*
from 
	nhan_vien
where 
	ho_ten like 'H%' 
    or ho_ten like 'T%'
    or ho_ten like 'K%' 
    and char_length(ho_ten) <=15;

/* Task 3 - Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi 
và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”. */

select 
	ma_khach_hang,
    ho_ten,
    gioi_tinh,
    timestampdiff(year,ngay_sinh,now()) as age,
    so_dien_thoai,
    email,
    dia_chi
from 
	khach_hang
where 
	dia_chi like '%Đà Nẵng'
    or dia_chi like '%Quảng Trị'
group by 
	ma_khach_hang
having 
	age between 18 and 50;

/*Task 4 - Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”. */

select 
	k.ma_khach_hang, k.ho_ten, count(ma_hop_dong) as sl_hop_dong
from 
	khach_hang k
	inner join hop_dong h on k.ma_khach_hang = h.ma_khach_hang
	inner join loai_khach l on k.ma_loai_khach = l.ma_loai_khach
where 
	l.ten_loai_khach = 'diamond'
group by 
	k.ma_khach_hang
order by 
	sl_hop_dong asc;

/*Task 5 - Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
(Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, 
với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).*/

select 
	k.ma_khach_hang, k.ho_ten, l.ten_loai_khach, h.ma_hop_dong, d.ten_dich_vu, h.ngay_lam_hop_dong, h.ngay_ket_thuc, 
	if(h.ma_hop_dong is null ,chi_phi_thue ,chi_phi_thue + sum(so_luong*gia) ) as tong_tien
from 
	khach_hang k 
	left join loai_khach l using (ma_loai_khach)
	left join hop_dong h using (ma_khach_hang)
	left join dich_vu d using (ma_dich_vu)
	left join hop_dong_chi_tiet hd using (ma_hop_dong)
	left join dich_vu_di_kem dv using (ma_dich_vu_di_kem)
group by
	k.ma_khach_hang, h.ma_hop_dong;

/*Task 6 - Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).*/

select distinct 
	ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu
from 
	dich_vu
	inner join loai_dich_vu using (ma_loai_dich_vu)
where 
	ma_dich_vu not in (
		select 
			ma_dich_vu 
		from 
			hop_dong
		where 
			year(ngay_lam_hop_dong) = 2021 
			and month(ngay_lam_hop_dong) in (1,2,3) );

/*Task 7 - Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu 
của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021.*/

select 
	ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
from 
	dich_vu dv
	inner join loai_dich_vu using (ma_loai_dich_vu)
where 
	exists (
		select
			*
		from
			hop_dong
		where 
			dv.ma_dich_vu = ma_dich_vu 
			and year(ngay_lam_hop_dong) = 2020)
	and not exists (
		select
			*
		from
			hop_dong
		where
			dv.ma_dich_vu = ma_dich_vu 
			and year(ngay_lam_hop_dong) = 2021);

/*Task 8 - Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.*/

select distinct ho_ten from khach_hang;

select ho_ten from khach_hang group by ho_ten;

select ho_ten from khach_hang
union
select ho_ten from khach_hang;

/*Task 9 - Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.*/

select 
	month(ngay_lam_hop_dong) as thang, 
	count(ma_hop_dong) as so_hop_dong
from 
	hop_dong
where 
	year(ngay_lam_hop_dong) = 2021
group by 
	thang
order by 
	thang;

/*Task 10 -	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem 
(được tính dựa trên việc sum so_luong ở dich_vu_di_kem).*/

select 
	ma_hop_dong, 
	ngay_lam_hop_dong, 
	ngay_ket_thuc, 
	tien_dat_coc, 
	if(sum(so_luong) is null, 0 ,sum(so_luong)) as so_luong_dich_vu_di_kem
from 
	hop_dong hd
	left join hop_dong_chi_tiet using(ma_hop_dong)
	left join dich_vu_di_kem using(ma_dich_vu_di_kem)
group by 
	hd.ma_hop_dong;

/*Task 11 - Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.*/

select 
	ma_dich_vu_di_kem, ten_dich_vụ_di_kem
from 
	dich_vu_di_kem
	inner join hop_dong_chi_tiet using(ma_dich_vu_di_kem)
	inner join hop_dong using(ma_hop_dong)
	inner join khach_hang using(ma_khach_hang)
where 
	ma_loai_khach = '1' 
	and dia_chi like '%Vinh%' 
	or dia_chi like '%Quảng Ngãi%';

/*Task 12 - Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, 
so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.*/

select 
	ma_hop_dong, 
	nv.ho_ten as ho_ten_nhan_vien, 
	kh.ho_ten as ho_ten_khach_hang, 
	kh.so_dien_thoai, 
	ma_dich_vu, 
	ten_dich_vu, 
	if(sum(so_luong) is null,0,sum(so_luong)) as so_luong_dich_vu_di_kem, 
	tien_dat_coc
from
	hop_dong
	inner join nhan_vien nv using (ma_nhan_vien)
	inner join khach_hang kh using (ma_khach_hang)
	inner join dich_vu dv using (ma_dich_vu)
	left join hop_dong_chi_tiet hdct using (ma_hop_dong)	-- dùng left lấy luôn mã hợp đồng có thể null
where 
	exists (
		select 
			tien_dat_coc
		from 
			hop_dong
		where 
			dv.ma_dich_vu = ma_dich_vu 
			and year(ngay_lam_hop_dong) = 2020 
			and month(ngay_lam_hop_dong) in (10,11,12) )
	and not exists (
		select
			tien_dat_coc
		from 
			hop_dong 
		where 
			dv.ma_dich_vu = ma_dich_vu 
			and year(ngay_lam_hop_dong) = 2021 
			and month(ngay_lam_hop_dong) between 1 and 6)
group by ma_hop_dong;

/*Task 13 -	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).*/
-- sum xong max -> dung with temp

with temp as (
	select 
		ma_dich_vu_di_kem,ten_dich_vu_di_kem, sum(so_luong) as tong_so_luong
	from
		dich_vu_di_kem
		inner join hop_dong_chi_tiet using(ma_dich_vu_di_kem)
		group by ma_dich_vu_di_kem)
        
select 
	*
from
	temp
where 
	tong_so_luong = (
		select 
			max(tong_so_luong)
		from 
			temp);

/*Task 14 - Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất.
Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, 
so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).*/

select 
	ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, count(ma_dich_vu_di_kem) as so_lan_su_dung
from 
	hop_dong_chi_tiet
	inner join dich_vu_di_kem using(ma_dich_vu_di_kem)
	inner join hop_dong using(ma_hop_dong)
	inner join dich_vu using(ma_dich_vu)
	inner join loai_dich_vu using(ma_loai_dich_vu)
where 
	hop_dong_chi_tiet.ma_dich_vu_di_kem in(
		select 
			ma_dich_vu_di_kem 
		from 
			hop_dong_chi_tiet 
		group by 
			ma_dich_vu_di_kem 
		having 
			count(ma_dich_vu_di_kem) = 1)
group by hop_dong_chi_tiet.ma_hop_dong, hop_dong_chi_tiet.ma_hop_dong_chi_tiet;

/*Task 15 - Hiển thi thông tin của tất cả nhân viên bao gồm
 ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
 mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021..*/
 
select 
	ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi
from 
	nhan_vien
	inner join trinh_do using(ma_trinh_do)
	inner join vi_tri using(ma_vi_tri)
	inner join bo_phan using(ma_bo_phan)
	inner join hop_dong using(ma_nhan_vien)
group by 
	ma_nhan_vien
having 
	count(ma_hop_dong) <=3;
 
/*Task 16 - Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.*/
 
 delete from 
	nhan_vien nv
 where 
	not exists(
		select 
			* 
		from 
			hop_dong
		where 
			ma_nhan_vien = nv.ma_nhan_vien
			and year(ngay_lam_hop_dong) between 2019 and 2021
	);
 
/*Task 17 - Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ*/

update 
	khach_hang
set 
	ma_loai_khach = 1
where 
	ma_loai_khach in (
		select 
			tmp.ma_loai_khach
		from
			(select 
				ma_khach_hang,ho_ten,ma_loai_khach, (chi_phi_thue + sum(so_luong * gia)) as tong_tien
			from 
				khach_hang
				inner join hop_dong using (ma_khach_hang)
				inner join hop_dong_chi_tiet using (ma_hop_dong)
				inner join dich_vu_di_kem using (ma_dich_vu_di_kem)
				inner join dich_vu using (ma_dich_vu)
			where 
				ma_loai_khach = 2 
                and year(ngay_lam_hop_dong) = 2021
			group by 
				ma_khach_hang, ma_hop_dong
			having 
				tong_tien > 10000000
            ) tmp
	);

/*Task 18 - Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).*/
  
delete from
	khach_hang kh
where
	not exists(
		select 
			*
		from
			hop_dong
		where
			kh.ma_khach_hang = ma_khach_hang
			and year(ngay_lam_hop_dong) >= 2021
	);

/*Task 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.*/

update 
	dich_vu_di_kem
set 
	gia = gia * 2
where
	ma_dich_vu_di_kem in (
		select
			tmp.ma_dich_vu_di_kem
		from (
			select
				ma_dich_vu_di_kem,
				sum(so_luong)
			from
				dich_vu
				inner join hop_dong using (ma_dich_vu)
				inner join hop_dong_chi_tiet using (ma_hop_dong)
			group by 
				ma_dich_vu_di_kem
			having
				sum(so_luong) >10 
		) tmp
	);
                
/*Task 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.*/

select
	ma_nhan_vien as id, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from
	nhan_vien nv
union all
select
	ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
from
	khach_hang kh;

/*Task 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.*/
create view
	v_nhan_vien as
select
	ma_nhan_vien,
	ho_ten,
	dia_chi
from
	nhan_vien
where
	dia_chi like '%Hải Châu%'
	and ma_nhan_vien in (
		select
			tmp.ma_nhan_vien
		from (
			select
				ma_nhan_vien, 
				ngay_lam_hop_dong,
				count(ma_khach_hang) as sl_khach_hang
			from
				hop_dong
			where
				ngay_lam_hop_dong = '2021-12-12'
			group by 
				ma_nhan_vien, ma_hop_dong
			having
				sl_khach_hang >= 1
			) tmp 
	);

/*Task 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” 
đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.*/

update 
	v_nhan_vien
set
	dia_chi = '%Liên Chiểu'
    
/*Task 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó 
với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.*/

DELIMITER $$
CREATE PROCEDURE 
	sp_xoa_khach_hang(in p_ma_khach_hang int)
BEGIN
	delete from
		khach_hang
	where
		ma_khach_hang = p_ma_khach_hang;
END; $$
DELIMITER ;

/*Task 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu 
sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.*/

DELIMITER $$
create procedure sp_them_moi_hop_dong(
	in p_ma_hop_dong int,
	in ngay_lam_hop_dong date,
	in ngay_ket_thuc date,
	in tien_dat_coc double,
	in ma_nhan_vien int,
	in ma_khach_hang int,
	in ma_dich_vu int)
begin
	declare lastid int;
    select 
		max(ma_hop_dong) into lastid
	from
		hop_dong;
	
    if (p_ma_hop_dong <> lastid + 1) THEN
		signal sqlstate '02000' set message_text = 'Invalid Id';
    elseif (p_ngay_lam_hop_dong is null) THEN
		signal sqlstate '02000' set message_text = 'Invalid Start Date';
	elseif (p_ma_nhan_vien not in (select ma_nhan_vien from nhan_vien)) then
		signal sqlstate '02000' set message_text = 'Invalid Ma Nhan Vien';
	elseif (p_ma_khach_hang not in (select ma_khach_hang from khach_hang)) then
		signal sqlstate '02000' set message_text = 'Invalid Mha Khach Hang';
	elseif (p_ma_dich_vu not in (select ma_dich_vu from dich_vu)) then
		signal sqlstate '02000' set message_text = 'Invalid Ma Dich Vu';
	else 
		insert into hop_dong (
			ma_hop_dong,
			ngay_lam_hop_dong,
			ngay_ket_thuc,
			tien_dat_coc,
			ma_nhan_vien,
			ma_khach_hang,
			ma_dich_vu) 
        value(
			p_ma_hop_dong,
            p_ngay_lam_hop_dong,
            p_ngay_ket_thuc,
            p_tien_dat_coc,
            p_ma_nhan_vien,
            p_ma_khach_hang,
            p_ma_dich_vu);
	end if;
end;
DELIMITER $$

call sp_xoa_khach_hang();

/*Task 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong 
thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.*/



/*Task 27. tạo function
a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.
b.	Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng 
đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian 
dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). 
Mã của khách hàng được truyền vào như là 1 tham số của function này.*/

DELIMITER $$ 
create function func_dem_dich_vu()
returns int
DETERMINISTIC
begin
	declare res int;
    
	select
		count(*) into res
	from (
		select
			sum(chi_phi_thue) tong_chi_phi_thue
		from
			dich_vu
			inner join hop_dong using (ma_dich_vu)
		group by ma_dich_vu
		having tong_chi_phi_thue>2000000 
	) as tmp;
	return res;
end;
$$ DELIMITER ;
select func_dem_dich_vu();

DELIMITER $$ 
create function func_tinh_thoi_gian_hop_dong(p_ma_khach_hang int) 
returns int
DETERMINISTIC
begin
	declare res int;
	select
		max(tmp.ngay) into res
	from (
		select
			ma_khach_hang, timestampdiff(day,ngay_lam_hop_dong,ngay_ket_thuc) `ngay`
		from
			hop_dong
	) as tmp
	where ma_khach_hang = p_ma_khach_hang;
return res;
end ;
$$ DELIMITER ;

/*Task 28.	Tạo Stored Procedure sp_xoa_dich_vu_va_hd_room để tìm các dịch vụ được thuê 
bởi khách hàng với loại dịch vụ là “Room” từ đầu năm 2015 đến hết năm 2019 
để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng dich_vu) 
và xóa những hop_dong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng hop_dong) 
và những bản liên quan khác.*/


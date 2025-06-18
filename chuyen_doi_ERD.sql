create database chuyen_doi_ERD;
use chuyen_doi_ERD;
create table phieu_xuat(
so_phieu_xuat int,
ngay_xuat date,
primary key(so_phieu_xuat)
);
create table vat_tu(
ma_vat_tu varchar(30),
ten_vat_tu varchar(50),
primary key(ma_vat_tu)
);
create table chi_tiet_phieu_xuat(
don_gia_xuat decimal(10,2),
so_luon_xuat int,
so_phieu_xuat int,
ma_vat_tu varchar(30),
primary key(so_phieu_xuat, ma_vat_tu),
foreign key(so_phieu_xuat) references phieu_xuat(so_phieu_xuat),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu)
);
create table phieu_nhap(
so_phieu_nhap int,
ngay_nhap date,
primary key(so_phieu_nhap)
);
create table chi_tiet_phieu_nhap(
don_gia_nhap decimal(10,2),
so_luong_nhap int,
ma_vat_tu varchar(30),
so_phieu_nhap int,
primary key(ma_vat_tu, so_phieu_nhap),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_phieu_nhap) references phieu_nhap(so_phieu_nhap)
);
create table nha_cung_cap(
ma_nha_cung_cap varchar(30),
ten_nha_cung_cap varchar(30),
dia_chi varchar(30),
primary key(ma_nha_cung_cap)
);
create table don_dat_hang(
so_don_hang int,
ngay_dat_hang date,
ma_nha_cung_cap varchar(30),
primary key(so_don_hang),
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);
create table chi_tiet_don_dat_hang(
ma_vat_tu varchar(30),
so_don_hang int,
primary key(ma_vat_tu, so_don_hang),
foreign key(ma_vat_tu) references vat_tu(ma_vat_tu),
foreign key(so_don_hang) references don_dat_hang(so_don_hang)
);

create table sdt_nha_cung_cap(
so_dien_thoai varchar(30),
ma_nha_cung_cap varchar(30),
foreign key(ma_nha_cung_cap) references nha_cung_cap(ma_nha_cung_cap)
);
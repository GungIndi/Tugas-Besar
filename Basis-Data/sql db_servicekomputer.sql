/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.21-MariaDB : Database - db_servicekomputer
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_servicekomputer` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_servicekomputer`;

/*Table structure for table `tb_bagian` */

DROP TABLE IF EXISTS `tb_bagian`;

CREATE TABLE `tb_bagian` (
  `id_bagian` char(5) NOT NULL,
  `posisi` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_bagian`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_bagian` */

insert  into `tb_bagian`(`id_bagian`,`posisi`) values 
('AA001','kasir'),
('AA002','Teknisi'),
('AA003','manajer'),
('AA004','administrasi'),
('AA005','Manajer Operasional'),
('AA006','Manajer Penjualan'),
('AA007','Staf Keuangan'),
('AA008','Sosial Media Specialist'),
('AA009','Staf Penjualan'),
('AA010','Cleaning Service');

/*Table structure for table `tb_detailpembelian` */

DROP TABLE IF EXISTS `tb_detailpembelian`;

CREATE TABLE `tb_detailpembelian` (
  `no_faktur` char(5) DEFAULT NULL,
  `kode_barang` char(5) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga_beli` int(11) DEFAULT NULL,
  KEY `no_faktur` (`no_faktur`),
  KEY `kode_barang` (`kode_barang`),
  CONSTRAINT `tb_detailpembelian_ibfk_1` FOREIGN KEY (`no_faktur`) REFERENCES `tb_pembelian` (`no_faktur`),
  CONSTRAINT `tb_detailpembelian_ibfk_2` FOREIGN KEY (`kode_barang`) REFERENCES `tb_sparepart` (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_detailpembelian` */

insert  into `tb_detailpembelian`(`no_faktur`,`kode_barang`,`jumlah`,`harga_beli`) values 
('NO330','PR003',10,1000000),
('NO331','PR001',7,2700000),
('NO332','PR002',3,30000000),
('NO333','PR004',6,3600000),
('NO334','PR005',5,3000000),
('NO335','PR006',11,9900000),
('NO336','PR007',9,1080000),
('NO337','PR008',5,2750000),
('NO338','PR009',20,20000000),
('N0339','PR010',17,10880000);

/*Table structure for table `tb_detailservice` */

DROP TABLE IF EXISTS `tb_detailservice`;

CREATE TABLE `tb_detailservice` (
  `kode_barang` char(5) DEFAULT NULL,
  `no_service` char(5) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  KEY `kode_barang` (`kode_barang`),
  KEY `no_service` (`no_service`),
  CONSTRAINT `tb_detailservice_ibfk_1` FOREIGN KEY (`kode_barang`) REFERENCES `tb_sparepart` (`kode_barang`),
  CONSTRAINT `tb_detailservice_ibfk_2` FOREIGN KEY (`no_service`) REFERENCES `tb_service` (`no_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_detailservice` */

insert  into `tb_detailservice`(`kode_barang`,`no_service`,`jumlah`) values 
('PR003','SV001',1),
('PR004','SV002',1),
('PR006','SV002',1),
('PR005','SV003',1),
('PR010','SV004',1),
('PR008','SV005',1),
('PR010','SV005',1),
('PR003','SV005',1),
('PR007','SV006',1),
('PR003','SV007',1),
('PR009','SV007',1),
('PR009','SV008',1),
('PR010','SV009',1),
('PR007','SV009',1);

/*Table structure for table `tb_jenis` */

DROP TABLE IF EXISTS `tb_jenis`;

CREATE TABLE `tb_jenis` (
  `id_jenis` char(5) NOT NULL,
  `nama_jenis` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_jenis`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_jenis` */

insert  into `tb_jenis`(`id_jenis`,`nama_jenis`) values 
('JE001','memory RAM'),
('JE002','memory SSD'),
('JE003','memory HDD'),
('JE004','monitor'),
('JE005','keyboard'),
('JE006','Baterai'),
('JE007','CPU'),
('JE008','GPU'),
('JE009','motheboard'),
('JE010','speaker');

/*Table structure for table `tb_karyawan` */

DROP TABLE IF EXISTS `tb_karyawan`;

CREATE TABLE `tb_karyawan` (
  `id_karyawan` char(5) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  `JK` enum('pria','wanita') DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `id_bagian` char(5) DEFAULT NULL,
  PRIMARY KEY (`id_karyawan`),
  KEY `id_bagian` (`id_bagian`),
  CONSTRAINT `tb_karyawan_ibfk_1` FOREIGN KEY (`id_bagian`) REFERENCES `tb_bagian` (`id_bagian`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_karyawan` */

insert  into `tb_karyawan`(`id_karyawan`,`nama`,`alamat`,`JK`,`no_hp`,`id_bagian`) values 
('KA001','Dharmaadi','Denpasar','pria','082555082210','AA002'),
('KA002','Ayara','Gianyar','wanita','081311112222','AA001'),
('KA003','Jigen','Tabanan','pria','082266669999','AA003'),
('KA004','Komeng','Denpasar','pria','082109098181','AA002'),
('KA005','Ikai','Denpasar','wanita','087612125454','AA004'),
('KA006','Pudidi','Bangli','pria','082369690000','AA002'),
('KA007','Dora','Gianyar','wanita','081234567887','AA004'),
('KA008','Andi','Denpasar','pria','082345678955','AA002'),
('KA009','Nova','Tabanan','pria','087888234911','AA002'),
('KA010','Mona','Karangasem','wanita','085123498732','AA004');

/*Table structure for table `tb_member` */

DROP TABLE IF EXISTS `tb_member`;

CREATE TABLE `tb_member` (
  `id_member` char(5) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  `JK` varchar(30) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_member` */

insert  into `tb_member`(`id_member`,`nama`,`alamat`,`JK`,`no_hp`) values 
('MR001','Luxxy','Jimbaran','pria','082254543131'),
('MR002','Dina','Denpasar','wanita','082164542132'),
('MR003','Wahyu','Gianyar','pria','082265543149'),
('MR004','Pepe','Tabanan','pria','082254113100'),
('MR005','Tia','Buleleng','wanita','082262113188'),
('MR006','Anggun','Karangasem','wanita','087154549087'),
('MR007','Berto','Klungkung','pria','082254540976'),
('MR008','Cika','Gianyar','wanita','082254542189'),
('MR009','Anwar','Klungkung','pria','082254005444'),
('MR010','Luan','Denpasar','wanita','081190098821');

/*Table structure for table `tb_merk` */

DROP TABLE IF EXISTS `tb_merk`;

CREATE TABLE `tb_merk` (
  `id_merk` char(5) NOT NULL,
  `nama_merk` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_merk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_merk` */

insert  into `tb_merk`(`id_merk`,`nama_merk`) values 
('MM201','Asus'),
('MM202','Lenovo'),
('MM203','Windows'),
('MM204','Nvidia'),
('MM205','Sandisk'),
('MM206','AMD'),
('MM207','Adata'),
('MM208','Toshiba'),
('MM209','Acer'),
('MM210','Intel');

/*Table structure for table `tb_pembelian` */

DROP TABLE IF EXISTS `tb_pembelian`;

CREATE TABLE `tb_pembelian` (
  `no_faktur` char(5) NOT NULL,
  `tgl_beli` date DEFAULT NULL,
  `total_barang` int(11) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `tgl_terima` date DEFAULT NULL,
  `id_karyawan` char(5) DEFAULT NULL,
  `id_supplier` char(5) DEFAULT NULL,
  PRIMARY KEY (`no_faktur`),
  KEY `id_karyawan` (`id_karyawan`),
  KEY `id_supplier` (`id_supplier`),
  CONSTRAINT `tb_pembelian_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `tb_karyawan` (`id_karyawan`),
  CONSTRAINT `tb_pembelian_ibfk_2` FOREIGN KEY (`id_supplier`) REFERENCES `tb_supplier` (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_pembelian` */

insert  into `tb_pembelian`(`no_faktur`,`tgl_beli`,`total_barang`,`total_harga`,`tgl_terima`,`id_karyawan`,`id_supplier`) values 
('N0339','2021-10-12',17,10880000,'2021-10-14','KA010','SU110'),
('NO330','2021-04-21',10,1000000,'2021-04-22','KA001','SU119'),
('NO331','2021-01-11',7,27000000,'2021-01-11','KA002','SU118'),
('NO332','2021-07-14',3,30000000,'2021-07-16','KA003','SU117'),
('NO333','2021-03-23',6,3600000,'2021-03-23','KA004','SU116'),
('NO334','2021-02-19',5,3000000,'2021-02-19','KA005','SU115'),
('NO335','2021-09-21',11,9900000,'2021-09-22','KA006','SU114'),
('NO336','2021-06-27',9,1080000,'2021-06-27','KA007','SU113'),
('NO337','2021-05-17',5,2750000,'2021-05-17','KA008','SU112'),
('NO338','2021-08-20',20,20000000,'2021-08-21','KA009','SU111');

/*Table structure for table `tb_service` */

DROP TABLE IF EXISTS `tb_service`;

CREATE TABLE `tb_service` (
  `no_service` char(5) NOT NULL,
  `tgl_service` date DEFAULT NULL,
  `total_barang` int(11) DEFAULT NULL,
  `harga_service` int(11) DEFAULT NULL,
  `total_harga` int(11) DEFAULT NULL,
  `id_karyawan` char(5) DEFAULT NULL,
  `id_member` char(5) DEFAULT NULL,
  PRIMARY KEY (`no_service`),
  KEY `id_karyawan` (`id_karyawan`),
  KEY `id_member` (`id_member`),
  CONSTRAINT `tb_service_ibfk_1` FOREIGN KEY (`id_karyawan`) REFERENCES `tb_karyawan` (`id_karyawan`),
  CONSTRAINT `tb_service_ibfk_2` FOREIGN KEY (`id_member`) REFERENCES `tb_member` (`id_member`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_service` */

insert  into `tb_service`(`no_service`,`tgl_service`,`total_barang`,`harga_service`,`total_harga`,`id_karyawan`,`id_member`) values 
('SV001','2021-11-04',1,50000,150000,'KA001','MR010'),
('SV002','2021-11-04',2,70000,1570000,'KA004','MR007'),
('SV003','2021-11-05',1,50000,650000,'KA006','MR002'),
('SV004','2021-11-06',1,60000,700000,'KA008','MR009'),
('SV005','2021-11-06',3,150000,1490000,'KA009','MR001'),
('SV006','2021-11-07',1,80000,200000,'KA001','MR004'),
('SV007','2021-11-08',2,100000,1200000,'KA004','MR008'),
('SV008','2021-11-08',1,50000,1050000,'KA006','MR005'),
('SV009','2021-11-09',2,80000,840000,'KA008','MR003'),
('SV010','2021-11-10',1,300000,10300000,'KA009','MR006');

/*Table structure for table `tb_sparepart` */

DROP TABLE IF EXISTS `tb_sparepart`;

CREATE TABLE `tb_sparepart` (
  `kode_barang` char(5) NOT NULL,
  `nama_barang` char(30) DEFAULT NULL,
  `stok` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `id_jenis` char(5) DEFAULT NULL,
  `id_merk` char(5) DEFAULT NULL,
  PRIMARY KEY (`kode_barang`),
  KEY `id_jenis` (`id_jenis`),
  KEY `id_merk` (`id_merk`),
  CONSTRAINT `tb_sparepart_ibfk_1` FOREIGN KEY (`id_jenis`) REFERENCES `tb_jenis` (`id_jenis`),
  CONSTRAINT `tb_sparepart_ibfk_2` FOREIGN KEY (`id_merk`) REFERENCES `tb_merk` (`id_merk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_sparepart` */

insert  into `tb_sparepart`(`kode_barang`,`nama_barang`,`stok`,`harga`,`id_jenis`,`id_merk`) values 
('PR001','Nvidia GTX 1080',20,9000000,'JE008','MM204'),
('PR002','AMD Radeon RX 560X',20,10000000,'JE008','MM206'),
('PR003','Intel Celeron B815',10,100000,'JE007','MM210'),
('PR004','ADATA Memory DDR3 4GB 1600 SO-',20,600000,'JE001','MM207'),
('PR005','Thosiba SATA HDD 500GB',25,600000,'JE003','MM208'),
('PR006','SanDisk Ultra 3D SSD 500GB',15,900000,'JE002','MM205'),
('PR007','Keyboard Asus A Series',20,120000,'JE005','MM201'),
('PR008','LCD LED Laptop Acer Aspire Ser',10,550000,'JE004','MM209'),
('PR009','Acer Motherboard Aspire 4741',10,1000000,'JE009','MM209'),
('PR010','Asus Rog G531 Speaker Internal',15,640000,'JE010','MM201');

/*Table structure for table `tb_supplier` */

DROP TABLE IF EXISTS `tb_supplier`;

CREATE TABLE `tb_supplier` (
  `id_supplier` char(5) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `tb_supplier` */

insert  into `tb_supplier`(`id_supplier`,`nama`,`no_hp`,`alamat`) values 
('SU110','Fandy','081324567876','Denpasar'),
('SU111','Ayu','085214345678','Badung'),
('SU112','Kaizo','087987123451','Tabanan'),
('SU113','Made','08932134598','Denpasar'),
('SU114','Fanny','081745362112','Bangli'),
('SU115','Memet','082333456709','Gianyar'),
('SU116','Susi','081267431567','Buleleng'),
('SU117','Agus','089293848912','Jembrana'),
('SU118','Kadek','087394517482','Denpasar'),
('SU119','Sri','082364901587','Karangasem');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

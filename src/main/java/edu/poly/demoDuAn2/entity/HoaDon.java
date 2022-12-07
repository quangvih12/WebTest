/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.poly.demoDuAn2.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Nationalized;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

/**
 *
 * @author asus_vinh
 */
@Data
@Entity
@Table(name = "Hoa_Don")
public class HoaDon {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "IdKH")
	private KhachHang khachHang;

	@Column(name = "Ma")
	private String ma;

	@Column(name = "Ngay_Tao")
	private String ngayTao;

	@Column(name = "Ngay_Thanh_Toan")
	private String ngayThanhToan;

	@Column(name = "Ngay_Ship")
	private String ngayShip;

	@Column(name = "Ngay_Nhan")
	private String ngayNhan;

	@Column(name = "trang_thai")
	private Integer trangThai;

	@Nationalized
	@Column(name = "Ten_Nguoi_Nhan")
	private String tenNguoiNhan;

	@Nationalized
	@Column(name = "Dia_Chi")
	private String diaChi;

	@Column(name = "Sdt")
	private String sdt;

	@Column(name = "ngay_sua")
	private String ngaySua;

	@ManyToOne
	@JoinColumn(name = "IdNV")
	private NhanVien nhanVien;

	@Column(name = "TG_Tao")
	private String tgTao;

	@Column(name = "Tong_Tien")
	private BigDecimal tongTien;

	@Column(name = "Tien_Tra_Lai")
	private BigDecimal tienTraLai;

	@Column(name = "Trang_Thai_TT") // -1: Da huy, 0: Cho thanh toan, 1: Da thanh toan
	private Integer trangThaiTT;

	@ManyToOne
	@JoinColumn(name = "Phuong_Thuc_TT")
	private PhuongThucTT phuongThucTT;

	@ManyToOne
	@JoinColumn(name = "Hinh_Thuc_GH")
	private HinhThucGH HinhThucGH;

	@Nationalized
	@Column(name = "Ghi_Chu")
	private String ghiChu;

	@OneToMany(mappedBy = "hoaDon", fetch = FetchType.EAGER)
	private List<hoaDonChiTiet> lstHDCT = new ArrayList<>();

}

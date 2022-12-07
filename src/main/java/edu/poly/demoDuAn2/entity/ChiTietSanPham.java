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

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

import lombok.Data;

/**
 *
 * @author asus_vinh
 */
@Data
@Entity
@Table(name = "Chi_TietSP")
public class ChiTietSanPham {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private Integer id;

	@ManyToOne
	@JoinColumn(name = "IdSP")
	private SanPham sanPham;

	@ManyToOne
	@JoinColumn(name = "Id_Nsx")
	private NamSanXuat nSX;

	@ManyToOne
	@JoinColumn(name = "Id_Mau_Sac")
	private MauSac mauSac;

	@ManyToOne
	@JoinColumn(name = "Id_DongSP")
	private DongSp dongsp;

	@ManyToOne
	@JoinColumn(name = "id_Thuong_hieu")
	private thuongHieu thuongHieu;

	@Column(name = "Ma")
	private String ma;

	@Column(name = "NamBH")
	private int namBH;

	@Nationalized
	@Column(name = "Mo_Ta")
	private String moTa;

	@Column(name = "hinh_anh")
	private String hinhAnh;

	@Column(name = "So_Luong_Ton")
	private int soLuongTon;

	@Column(name = "Gia_Nhap")
	private BigDecimal giaNhap;

	@Column(name = "Gia_Ban")
	private BigDecimal giaBan;

	@Column(name = "trang_thai")
	private Integer trangThai;

	@Column(name = "ngay_tao")
	private String ngayTao;

	@Column(name = "ngay_sua")
	private String ngaySua;

	@OneToMany(mappedBy = "chiTietSP", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	List<hoaDonChiTiet> listt = new ArrayList<>();

	@OneToMany(mappedBy = "chiTietSP", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	List<GioHangChiTiet> listtt = new ArrayList<>();

	public ChiTietSanPham(Integer id) {
		this.id = id;
	}

	public ChiTietSanPham() {
	}

}

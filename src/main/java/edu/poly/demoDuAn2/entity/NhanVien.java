/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package edu.poly.demoDuAn2.entity;

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

import lombok.Data;

/**
 *
 * @author asus_vinh
 */
@Data
@Entity
@Table(name = "Nhan_Vien")
public class NhanVien {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private Integer id;

	@Column(name = "Ma")
	private String ma;

	@Nationalized
	@Column(name = "Ten")
	private String ten;

	@Nationalized
	@Column(name = "Ten_Dem")
	private String tenDem;

	@Nationalized
	@Column(name = "Ho")
	private String ho;

	@Nationalized
	@Column(name = "Gioi_Tinh")
	private String gioiTinh;

	@Column(name = "Ngay_Sinh")
	private String ngaySinh;

	@Nationalized
	@Column(name = "Dia_Chi")
	private String diaChi;

	@Column(name = "Sdt")
	private String sdt;

	@Column(name = "Mat_Khau")
	private String matKhau;

	@Column(name = "Email", unique = true)
	private String email;

	@Column(name = "Id_GuiBC")
	private String idGuiBC;

	@Column(name = "Trang_Thai")
	private Integer trangThai;

	@ManyToOne
	@JoinColumn(name = "IdCH")
	private CuaHang cuaHang;

	@ManyToOne
	@JoinColumn(name = "IdCV")
	private ChucVu chucVu;

	@Column(name = "ngay_tao")
	private String ngayTao;

	@Column(name = "ngay_sua")
	private String ngaySua;

	@OneToMany(mappedBy = "nhanVien", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<HoaDon> listt = new ArrayList<>();

	@OneToMany(mappedBy = "idNV", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<GioHang> lists = new ArrayList<>();
}

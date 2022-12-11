package edu.poly.demoDuAn2.entity;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

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

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

/**
 *
 * @author asus_vinh
 */
@Data
@Entity
@Table(name = "Khach_Hang")
public class KhachHang {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "Id")
	private Integer id;

	@Column(name = "Ma")
	private String ma;

	@Column(name = "email")
	private String email;

	@Nationalized
	@Column(name = "Ten")
	private String ten;

	@Nationalized
	@Column(name = "Ten_Dem")
	private String tenDem;

	@Nationalized
	@Column(name = "Ho")
	private String ho;

	@Column(name = "Ngay_Sinh")
	private String ngaySinh;

	@Nationalized
	@Column(name = "Dia_Chi")
	private String diaChi;

	@Column(name = "Sdt")
	private String sdt;

	@Column(name = "Mat_Khau")
	private String matKhau;

	@Nationalized
	@Column(name = "Thanh_Pho")
	private String thanhPho;

	@Nationalized
	@Column(name = "Quoc_Gia")
	private String quocGia;

	@Column(name = "trang_thai")
	private Integer trangthai;

	@Column(name = "ngay_tao")
	private String ngayTao;

	@Column(name = "ngay_sua")
	private String ngaySua;
	@JsonIgnore
	@OneToMany(mappedBy = "khachHang", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<HoaDon> list = new ArrayList<>();
	@JsonIgnore
	@OneToMany(mappedBy = "khachHang", fetch = FetchType.EAGER)
	@Fetch(value = FetchMode.SUBSELECT)
	private List<GioHang> listt = new ArrayList<>();

}

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
import javax.persistence.OneToMany;
import javax.persistence.Table;
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
@Table(name = "Cua_Hang")
public class CuaHang {

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
	@Column(name = "Dia_Chi")
	private String diaChi;

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
	@OneToMany(mappedBy = "cuaHang", fetch = FetchType.EAGER)
	List<NhanVien> list = new ArrayList<>();

}

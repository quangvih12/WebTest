package edu.poly.demoDuAn2.dto;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

import lombok.Data;

@Data
public class khachHangDTO {
	@Null
	private Integer id;
	@NotNull
	@NotBlank
	private String ma;
	@NotNull
	@NotBlank
	private String ten;

	@NotNull
	@NotBlank
	private String email;

	@NotNull
	@NotBlank
	private String matKhau;

	@NotNull
	private String quocGia;
}

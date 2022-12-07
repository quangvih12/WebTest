package edu.poly.demoDuAn2.Controller.khachHang;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.poly.demoDuAn2.entity.hoaDonChiTiet;
import edu.poly.demoDuAn2.reponsitory.hoaDonCTReponsitory;

@RestController
@RequestMapping(value = "/api")
public class ResHoaDonController {

	@Autowired
	hoaDonCTReponsitory hoaDon;

	@GetMapping(value = "/find/{id}")
	public hoaDonChiTiet find(@PathVariable("id") Integer id) {
		hoaDonChiTiet hd = null;
		try {
			hd = hoaDon.findById(id).orElse(null);
		} catch (Exception e) {

		}
		return hd;
	}

//	@GetMapping()
//	public String index() {
//
////		List<GioHangChiTiet> list = gioHangRepo.findAll();
////		models.addAttribute("listGioHangCT", list);
////		models.addAttribute("listHoaDonD", hoaDonCT);
//
//		return "khachHang/form";
//	}
}

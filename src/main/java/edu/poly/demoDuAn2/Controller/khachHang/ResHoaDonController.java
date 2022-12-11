package edu.poly.demoDuAn2.Controller.khachHang;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import edu.poly.demoDuAn2.Controller.LoginController;
import edu.poly.demoDuAn2.entity.HoaDon;
import edu.poly.demoDuAn2.entity.hoaDonChiTiet;
import edu.poly.demoDuAn2.reponsitory.hoaDonCTReponsitory;
import edu.poly.demoDuAn2.reponsitory.hoaDonRepository;

@RestController
@RequestMapping(value = "/api")
public class ResHoaDonController {

	@Autowired
	hoaDonCTReponsitory hoaDon;
	
	
	
	@Autowired
	hoaDonRepository hoaDonn;

	@GetMapping(value = "/find/{id}")
	public List<hoaDonChiTiet> find(@PathVariable("id") Integer id) {

		List<hoaDonChiTiet> hd = hoaDon.findAllByIdHoaDon(id);

		return hd;
	}

//	@GetMapping(value = "/find/{id}")
//	public  List<HoaDon> index(@PathVariable("id") Integer id) {
//	//	String tenKH = LoginController.getCurrentLoginUsername();
//		List<HoaDon> list = hoaDonn.findAllById(id);
//		return  list;
//	}
}

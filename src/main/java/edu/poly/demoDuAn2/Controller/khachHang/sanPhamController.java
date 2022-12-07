package edu.poly.demoDuAn2.Controller.khachHang;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.demoDuAn2.entity.ChiTietSanPham;
import edu.poly.demoDuAn2.entity.HoaDon;
import edu.poly.demoDuAn2.entity.SanPham;
import edu.poly.demoDuAn2.entity.hoaDonChiTiet;
import edu.poly.demoDuAn2.reponsitory.sanPhamReponsitory;

@Controller
@RequestMapping(value = "/sanPham")
public class sanPhamController {

	@Autowired
	private sanPhamReponsitory sapPhamRepo;

	@Autowired
	private HttpServletRequest request;

	@GetMapping()
	public String index(Model model) {

		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");

		int page = pageParam == null ? 0 : Integer.parseInt(pageParam);
		int limit = limitParam == null ? 10 : Integer.parseInt(limitParam);
		Pageable pageable = PageRequest.of(page, limit);

		Page pageData = this.sapPhamRepo.findAll(pageable);

		model.addAttribute("pageData", pageData);
		return "khachHang/sanPham";
	}

	@GetMapping(value = "/sanPhamCT/{id}")
	public String sanPhamCT(Model modes, @PathVariable("id") Integer id) {

		ChiTietSanPham sanPhamCT = this.sapPhamRepo.findAllById(id);
		modes.addAttribute("list", sanPhamCT);
//	    
		return "/khachHang/chitietsanpham";
	}

	@PostMapping(value = "/searh")
	public String sanPhamCT(Model modes, @RequestParam("ten") String ten) {

		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");

		int page = pageParam == null ? 0 : Integer.parseInt(pageParam);
		int limit = limitParam == null ? 10 : Integer.parseInt(limitParam);
		Pageable pageable = PageRequest.of(page, limit);
		if (ten.equals("")) {

			Page pageData = this.sapPhamRepo.findAll(pageable);

			modes.addAttribute("pageData", pageData);
			return "khachHang/sanPham";
		} else {

			Page pageData = this.sapPhamRepo.findAllBySanphamTen("%"+ten +"%", pageable);

			modes.addAttribute("pageData", pageData);
			return "khachHang/sanPham";

		}

//	    
	}

//	@GetMapping(value = "/formThanhToan/{id}")
//	public String formThanhToan(Model models, @PathVariable("id") Integer id, hoaDonChiTiet hoaDonCT) {
//		ChiTietSanPham sanPhamCT = this.sapPhamRepo.findAllById(id);
//		models.addAttribute("listHoaDon", hoaDonCT);
//		models.addAttribute("list", sanPhamCT);
//		return "khachHang/thanhToan";
//	}

}

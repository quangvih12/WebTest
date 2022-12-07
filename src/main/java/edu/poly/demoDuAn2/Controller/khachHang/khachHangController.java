package edu.poly.demoDuAn2.Controller.khachHang;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.poly.demoDuAn2.reponsitory.sanPhamReponsitory;

@Controller
@RequestMapping("/home")
public class khachHangController {
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
		return "/khachHang/index";
	}

//	@GetMapping(value = "/gioHang")
//	public String gioHang() {
//		return "khachHang/gioHang";
//	}

//	@GetMapping(value = "/hoaDon")
//	public String hoaDon() {
//		return "khachHang/hoaDon";
//	}

}

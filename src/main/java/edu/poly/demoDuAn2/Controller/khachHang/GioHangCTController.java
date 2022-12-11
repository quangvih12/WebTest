package edu.poly.demoDuAn2.Controller.khachHang;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.demoDuAn2.Controller.LoginController;
import edu.poly.demoDuAn2.entity.GioHang;
import edu.poly.demoDuAn2.entity.GioHangChiTiet;
import edu.poly.demoDuAn2.entity.KhachHang;
import edu.poly.demoDuAn2.reponsitory.GioHangCTRepository;
import edu.poly.demoDuAn2.reponsitory.GioHangReponsitory;

@Controller
@RequestMapping("/gioHang")
public class GioHangCTController {

	@Autowired
	private GioHangCTRepository gioHangCTRepo;

	@Autowired
	private GioHangReponsitory gioHangRepo;

	@ModelAttribute("gioHang")
	public List<GioHangChiTiet> gioHang() {
		return gioHangCTRepo.findAll();
	}

	@GetMapping()
	public String index(Model models) {
		String tenKH = LoginController.getCurrentLoginUsername();
		System.out.println(tenKH);
		List<GioHangChiTiet> list = gioHangCTRepo.findAllByTen(tenKH);
		models.addAttribute("listGioHang", list);
		 System.out.println(tenKH);
		return "khachHang/gioHang";
	}

	@GetMapping(value = "/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		this.gioHangCTRepo.deleteById(id);
		return "redirect:/gioHang";
	}

	@PostMapping(value = "/add")
	public String add(@RequestParam("soLuong") Integer soLuong, GioHangChiTiet ghCT) {
		GioHang gh = new GioHang();
		double v;
		double g = Double.valueOf(ghCT.getChiTietSP().getGiaBan() + "");
		// System.out.println(g);
		v = ghCT.getSoLuong() * g;
		System.out.printf("%f", v);

		Calendar c = Calendar.getInstance();
		String t = (c.get(Calendar.DATE) + "-" + (c.get(Calendar.MONTH) + 1) + "-" + c.get(Calendar.YEAR));
        
	// add khách hàng
		int IdKH = LoginController.getCurrentLoginId();
		KhachHang kh = new KhachHang();
		kh.setId(IdKH);
		gh.setKhachHang(kh);
		gh.setNgayTao(t);
		this.gioHangRepo.save(gh);

		ghCT.setGioHang(gh);
		ghCT.setSoLuong(soLuong);
		ghCT.setDonGia(BigDecimal.valueOf(v));
		System.out.println("gia: " + ghCT.getDonGia());

		this.gioHangCTRepo.save(ghCT);
		return "redirect:/gioHang";
	}

	@GetMapping(value = "/congSoLuong/{id}")
	public String CongSoLuong(@PathVariable("id") Integer id, Model models, GioHangChiTiet ghCT) {
		if (ghCT != null) {
			GioHangChiTiet gh = this.gioHangCTRepo.getById(id);

			if (gh != null) {

				int index = gh.getSoLuong() + 1;
				gh.setSoLuong(index);

				double v;
				double g = Double.valueOf(gh.getChiTietSP().getGiaBan() + "");
				// System.out.println(g);
				v = gh.getSoLuong() * g;
				gh.setDonGia(BigDecimal.valueOf(v));

				this.gioHangCTRepo.save(gh);
				return "redirect:/gioHang";
			}
		}
		return "";
	}

	@GetMapping(value = "/truSoLuong/{id}")
	public String truSoLuong(@PathVariable("id") Integer id, Model models, GioHangChiTiet ghCT) {
		if (ghCT != null) {
			GioHangChiTiet gh = this.gioHangCTRepo.getById(id);

			if (gh != null) {

				int index = gh.getSoLuong() - 1;
				if (index <= 0) {
					this.gioHangCTRepo.deleteById(id);
					return "redirect:/gioHang";
				} else {
					gh.setSoLuong(index);

					double v;
					double g = Double.valueOf(gh.getChiTietSP().getGiaBan() + "");
					// System.out.println(g);
					v = gh.getSoLuong() * g;
					gh.setDonGia(BigDecimal.valueOf(v));

					System.out.println(gh.getSoLuong());
					this.gioHangCTRepo.save(gh);
					return "redirect:/gioHang";
				}
				

			}
		}
		return "";
	}
}

package edu.poly.demoDuAn2.Controller.khachHang;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.demoDuAn2.Controller.LoginController;
import edu.poly.demoDuAn2.Controller.MailerController;
import edu.poly.demoDuAn2.Mail.Mailer;
import edu.poly.demoDuAn2.entity.ChiTietSanPham;
import edu.poly.demoDuAn2.entity.GioHangChiTiet;
import edu.poly.demoDuAn2.entity.HoaDon;
import edu.poly.demoDuAn2.entity.KhachHang;
import edu.poly.demoDuAn2.entity.NhanVien;
import edu.poly.demoDuAn2.entity.PhuongThucTT;
import edu.poly.demoDuAn2.entity.hoaDonChiTiet;
import edu.poly.demoDuAn2.reponsitory.GioHangCTRepository;
import edu.poly.demoDuAn2.reponsitory.hoaDonCTReponsitory;
import edu.poly.demoDuAn2.reponsitory.hoaDonRepository;
import edu.poly.demoDuAn2.reponsitory.khachHangReponsitory;
import edu.poly.demoDuAn2.reponsitory.sanPhamReponsitory;

@Controller
@RequestMapping("/hoaDon")
public class hoaDonCotroller {

	@Autowired
	private hoaDonCTReponsitory hoaDonCTRepo;

	@Autowired
	private hoaDonRepository hoaDonRepo;

	@Autowired
	private GioHangCTRepository gioHangRepo;

	@Autowired
	private sanPhamReponsitory sapPhamRepo;

	@Autowired
	private khachHangReponsitory khachhangRepo;

	@Autowired
	private MailerController mail;

	@GetMapping()
	public String hoaDon(Model models) {
		String tenKH = LoginController.getCurrentLoginUsername();
		List<HoaDon> list = hoaDonRepo.findAllByTen(tenKH);
		models.addAttribute("listHoaDon", list);

		return "khachHang/hoaDon";
	}
	
//	@GetMapping(value = "/getById/{id}")
//	public String hoaDonHuy(Model models, @PathVariable("id") Integer id) {
//		//String tenKH = LoginController.getCurrentLoginUsername();
//		System.out.println(id);
//		List<HoaDon> list =	 this.hoaDonRepo.findAllById(id);
//		models.addAttribute("listAllById", list);
//
//		return "";
//	}

	@PostMapping(value = "/update/{id}")
	public String updateHoaDon(Model models, @PathVariable("id") Integer id, HoaDon hoaDonn) {
		if (hoaDonn != null) {
			HoaDon hoaDon = this.hoaDonRepo.getById(id);
			System.out.println(hoaDon.getId());
			if (hoaDon != null) {
				hoaDon.setTrangThaiTT(-1);
				 System.out.println(hoaDon.getTrangThaiTT());
			//	hoaDon.setTrangThaiTT(id);
				this.hoaDonRepo.save(hoaDon);
			//	System.out.println("ok");
				return "";
			}
		}
		return "";
	}

//	@PostMapping(value = "/updateHoaDon/{id}")
//	public String updateHoa(Model models, @PathVariable("id") Integer id, hoaDonChiTiet hoaDonCT) {
//		if (hoaDonCT != null) {
//			hoaDonChiTiet hoaDon = this.hoaDonCTRepo.getById(id);
//			if (hoaDon != null) {
//
//				/// System.out.println(hoaDonCT.getTrangthai());
//
//				this.hoaDonCTRepo.save(hoaDon);
////				System.out.println("ok");
//				return "redirect:/hoaDon";
//			}
//		}
//		return "";
//	}

	@GetMapping(value = "/formThanhToanGH/{idGH}")
	public String formThanhToanGH(Model models, @PathVariable("idGH") Integer idGH, GioHangChiTiet gioHang) {

		GioHangChiTiet gioHangCT = this.gioHangRepo.findAllById(idGH);

		ChiTietSanPham sanPhamCT = this.sapPhamRepo.findAllById(gioHangCT.getChiTietSP().getId());

		System.out.println(gioHangCT.getSoLuong());
		models.addAttribute("listGioHang", gioHang);
		models.addAttribute("list", sanPhamCT);
		models.addAttribute("listt", gioHangCT);

		return "khachHang/thanhToanGH";
	}

	@GetMapping(value = "/form")
	public String formT(Model models, @RequestParam("id") Integer id, GioHangChiTiet gioHang, hoaDonChiTiet hoaDonCT) {

		if (id != 0) {
			GioHangChiTiet gioHangCT = this.gioHangRepo.findAllById(id);

			ChiTietSanPham sanPhamCT = this.sapPhamRepo.findAllById(gioHangCT.getChiTietSP().getId());
			models.addAttribute("listHoaDonD", hoaDonCT);
			System.out.println(gioHangCT.getSoLuong());
			models.addAttribute("listGioHang", gioHang);
			models.addAttribute("list", sanPhamCT);
			models.addAttribute("listt", gioHangCT);

			return "khachHang/thanhToanGH";
		} else {
			String tenKH = LoginController.getCurrentLoginUsername();

			List<GioHangChiTiet> list = gioHangRepo.findAllByTen(tenKH);
			models.addAttribute("listGioHangCT", list);
			models.addAttribute("listHoaDonD", hoaDonCT);

			return "khachHang/form";
		}

	}

//	@GetMapping(value = "/form")
//	public String index(Model models,hoaDonChiTiet hoaDonCT) {
//
//		List<GioHangChiTiet> list = gioHangRepo.findAll();
//		models.addAttribute("listGioHangCT", list);
//		models.addAttribute("listHoaDonD", hoaDonCT);
//
//		return "khachHang/form";
//	}

	@GetMapping(value = "/formThanhToan/{id}")
	public String formThanhToan(Model models, @PathVariable("id") Integer id, hoaDonChiTiet hoaDonCT) {
		ChiTietSanPham sanPhamCT = this.sapPhamRepo.findAllById(id);
		models.addAttribute("listHoaDonD", hoaDonCT);

		models.addAttribute("list", sanPhamCT);
		return "khachHang/thanhToan";
	}

	@GetMapping(value = "/XemChiTiet/{id}")
	public String xemChiTiet(Model models, @PathVariable("id") Integer id, hoaDonChiTiet hoaDonCTt) {
		System.out.println("ok");

		hoaDonChiTiet hoaDonCT = this.hoaDonCTRepo.findAllById(id);

		models.addAttribute("listHoaDonDd", hoaDonCTt);

		models.addAttribute("lists", hoaDonCT);
		return "";
	}

	@PostMapping(value = "/save")
	public String thanhToan(hoaDonChiTiet hoaDonCT, HoaDon hd, @RequestParam("email") String email) {

		double v;
		double g = Double.valueOf(hoaDonCT.getChiTietSP().getGiaBan() + "");
		System.out.println(g);
		v = hoaDonCT.getSoLuong() * g;
		System.out.printf("%f", v);

		// ngày hiện tại
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String da = df.format(date);

		// lấy thông tin của khách hàng bằng email
		KhachHang entity = this.khachhangRepo.findByEmail(email);

		// add thông tin khách hàng zô hóa đơn
		hd.setTenNguoiNhan(entity.getTen());

		hd.setSdt(entity.getSdt());

		hd.setDiaChi(entity.getDiaChi());

		hd.setKhachHang(entity);

		hd.setTgTao(da);
		hd.setTrangThaiTT(1);
		// hd.setMa("HD"+hd.getId());
		hd.setTongTien(BigDecimal.valueOf(v));
		PhuongThucTT phuongThucTT = new PhuongThucTT();
		phuongThucTT.setId(1);
		hd.setPhuongThucTT(phuongThucTT);
		NhanVien nv = new NhanVien();
		nv.setId(1);
		hd.setNhanVien(nv);

//	    tao hoa don
		HoaDon hdd = this.hoaDonRepo.save(hd);
		hdd.setMa("HD" + hdd.getId());
		// add hóa đơn và set trạng thái cho hóa đơn CT
		hoaDonCT.setTrangthai(0);
		hoaDonCT.setHoaDon(hdd);
		hoaDonCT.setDongia(BigDecimal.valueOf(v));
		System.out.println("gia: " + hoaDonCT.getDongia());
		hoaDonCT.setNgayTao(da);

		// tao hoa don ct
		hoaDonChiTiet hdv = this.hoaDonCTRepo.save(hoaDonCT);
//
//		// xoa sp trong gh
		String tenKH = LoginController.getCurrentLoginUsername();
		int idSP = hoaDonCT.getChiTietSP().getId();
		GioHangChiTiet gh = this.gioHangRepo.findAllByIdSanPham(idSP, tenKH);
		// System.out.println(gh.getId());
		this.gioHangRepo.deleteById(gh.getId());

		// gui mail
		boolean te = this.Javamailer(email, entity.getTen(), hdv.getChiTietSP().getSanPham().getTen(),
				hdv.getSoLuong() + "", hdv.getDongia() + "", entity.getSdt(), entity.getDiaChi(), entity.getTen());

		return "redirect:/gioHang";

	}

	@PostMapping(value = "/saveThuong")
	public String thanhToanThuong(hoaDonChiTiet hoaDonCT, HoaDon hd, @RequestParam("email") String email) {
//
		double v;
		double g = Double.valueOf(hoaDonCT.getChiTietSP().getGiaBan() + "");
		System.out.println(g);
		v = hoaDonCT.getSoLuong() * g;
		System.out.printf("%f", v);

		// ngày hiện tại

		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String da = df.format(date);
		System.out.println(da);

		// lấy thông tin của khách hàng bằng email
		KhachHang entity = this.khachhangRepo.findByEmail(email);

		// add thông tin khách hàng zô hóa đơn
		hd.setTenNguoiNhan(entity.getTen());

		hd.setSdt(entity.getSdt());

		hd.setDiaChi(entity.getDiaChi());

		hd.setKhachHang(entity);

		hd.setTgTao(da);
		hd.setTrangThaiTT(1);
		// hd.setMa("HD"+hd.getId());
		hd.setTongTien(BigDecimal.valueOf(v));
		PhuongThucTT phuongThucTT = new PhuongThucTT();
		phuongThucTT.setId(1);
		hd.setPhuongThucTT(phuongThucTT);
		NhanVien nv = new NhanVien();
		nv.setId(1);
		hd.setNhanVien(nv);
//	    tao hoa don
		HoaDon hdd = this.hoaDonRepo.save(hd);
		hdd.setMa("HD" + hdd.getId());
		// add hóa đơn và set trạng thái cho hóa đơn CT
		hoaDonCT.setTrangthai(0);
		hoaDonCT.setHoaDon(hdd);
		hoaDonCT.setDongia(BigDecimal.valueOf(v));
		System.out.println("gia: " + hoaDonCT.getDongia());
		hoaDonCT.setNgayTao(da);

		// tao hoa don ct
		hoaDonChiTiet hdv = this.hoaDonCTRepo.save(hoaDonCT);

		// gui mail
		boolean te = this.Javamailer(email, entity.getTen(), hdv.getChiTietSP().getSanPham().getTen(),
				hdv.getSoLuong() + "", hdv.getDongia() + "", entity.getSdt(), entity.getDiaChi(), entity.getTen());

		return "redirect:/gioHang";

	}

	@Autowired
	Mailer mailer;

	public Boolean Javamailer(String to, String ten, String tenSp, String soLuong, String donGia, String sdt,
			String diaChi, String subject) {
		try {
			subject = "Hóa đơn";
			String text = "tên người nhận: " + ten + " " + "\n\n tên SP: " + tenSp + " " + "\n\n số lượng: " + soLuong
					+ " " + "\n\n đơn giá: " + donGia + " " + "\n\n số điện thoại: " + sdt + " " + "\n\n Địa chỉ: "
					+ diaChi;
			mailer.sendMessageWithAttachment(to, subject, text);
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	@PostMapping(value = "/saveTong")
	public String saveTong(HoaDon hd, @RequestParam("email") String email) {
		// ngày hiện tại
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String da = df.format(date);

		// lấy thông tin của khách hàng bằng email
		KhachHang entity = this.khachhangRepo.findByEmail(email);

		// add thông tin khách hàng zô hóa đơn

		hd.setTenNguoiNhan(entity.getTen());

		hd.setSdt(entity.getSdt());

		hd.setDiaChi(entity.getDiaChi());

		hd.setKhachHang(entity);

		hd.setTgTao(da);

		hd.setTrangThaiTT(1);

		PhuongThucTT phuongThucTT = new PhuongThucTT();
		phuongThucTT.setId(1);
		hd.setPhuongThucTT(phuongThucTT);

		NhanVien nv = new NhanVien();
		nv.setId(1);
		hd.setNhanVien(nv);

		String tenKH = LoginController.getCurrentLoginUsername();

		List<GioHangChiTiet> list = gioHangRepo.findAllByTen(tenKH);
		for (GioHangChiTiet o : list) {
			// System.out.println(o.getChiTietSP().getId());
			double v;
			double g = Double.valueOf(o.getDonGia() + "");
			System.out.println(g);
			v = o.getSoLuong() * g;
			ChiTietSanPham ct = sapPhamRepo.getById(o.getChiTietSP().getId());
			// System.out.println(ct.getId());
			hoaDonChiTiet hoaDonCT = new hoaDonChiTiet();
			hoaDonCT.setChiTietSP(ct);

			hd.setTongTien(BigDecimal.valueOf(v));
			hd.setMa("HD" + o.getId());
			HoaDon hdd = this.hoaDonRepo.save(hd);
			hdd.setMa("HD" + hdd.getId());
			hoaDonCT.setHoaDon(hdd);
			hoaDonCT.setTrangthai(0);
			hoaDonCT.setNgayTao(da);
			// hoaDonCT.setId(o.getId());
			hoaDonCT.setSoLuong(o.getSoLuong());
			hoaDonCT.setDongia(BigDecimal.valueOf(v));
			this.hoaDonCTRepo.saveAll(List.of(hoaDonCT));

			// xoa sp trong gh

			int idSP = o.getChiTietSP().getId();
			// System.out.println(idSP);
			GioHangChiTiet gh = this.gioHangRepo.findAllByIdSanPham(idSP, tenKH);
			System.out.println(gh.getId());
			this.gioHangRepo.deleteById(gh.getId());

		}

		return "redirect:/gioHang";

	}

}

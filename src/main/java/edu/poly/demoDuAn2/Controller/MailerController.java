package edu.poly.demoDuAn2.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.demoDuAn2.Mail.Mailer;

@Controller
@RequestMapping(value = "/Mailer")
public class MailerController {

	@Autowired
	Mailer mailer;

//	@GetMapping()
//        public String mailer(ModelMap model,@RequestParam("email")String to,@RequestParam("gioHang.tenNguoiNhan")String ten
//        		,@RequestParam("soLuong")String soLuong,@RequestParam("donGia")String donGia
//        		,@RequestParam("gioHang.sdt")String sdt,@RequestParam("gioHang.diaChi")String diaChi,
//        		String text,String subject) {
//		try {
//			text = "tên người nhận: "+ ten +" "+ "số lượng: "+soLuong +" "+ "đơn giá: "+donGia+" "+ "số điện thoại: "+sdt;
//			mailer.sendMessageWithAttachment(to, subject, text);
//			model.addAttribute("message","ok");
//		} catch (Exception e) {
//			model.addAttribute("message","no");
//		}
//		
//		
//        	return "redirect:/hoaDon";
//        }

	
	
}

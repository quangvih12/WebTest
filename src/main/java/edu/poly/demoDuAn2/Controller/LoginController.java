package edu.poly.demoDuAn2.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.poly.demoDuAn2.entity.KhachHang;
import edu.poly.demoDuAn2.reponsitory.khachHangReponsitory;
import edu.poly.demoDuAn2.utils.HashUtil;

@Controller
public class LoginController {
	@Autowired
	private khachHangReponsitory khachhangRepo;

	@Autowired
	private HttpServletRequest request;

	private static String currentLoginUsername;
	private static Integer currentLoginId;

	@GetMapping("/login")
	public String getLoginForm() {
		return "/auth/login";
	}

	@PostMapping("/login")
	public String login(@RequestParam("email") String email, @RequestParam("password") String password) {

		KhachHang entity = this.khachhangRepo.findByEmail(email);
		currentLoginUsername = entity.getTen();
	//	System.out.println(currentLoginUsername);
		
		currentLoginId = entity.getId();
		HttpSession session = request.getSession();
		if (entity == null) {
			session.setAttribute("error", "Sai email hoặc mật khẩu");

			return "redirect:/login";
		}
//

		boolean checkPwd = HashUtil.verify(password, entity.getMatKhau());

		if (!checkPwd) {
			session.setAttribute("error", "Sai email hoặc mật khẩu");

			return "redirect:/login";

		}

		session.setAttribute("user", entity);
		return "redirect:/home";
	}

	public static String getCurrentLoginUsername() {
		return currentLoginUsername;
	}
	
	public static Integer getCurrentLoginId() {
		return currentLoginId;
	}

}

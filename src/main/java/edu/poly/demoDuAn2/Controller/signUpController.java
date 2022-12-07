package edu.poly.demoDuAn2.Controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.poly.demoDuAn2.ModelMapperConfig;
import edu.poly.demoDuAn2.dto.khachHangDTO;
import edu.poly.demoDuAn2.entity.KhachHang;
import edu.poly.demoDuAn2.mapper.khachHangMapper;
import edu.poly.demoDuAn2.reponsitory.khachHangReponsitory;
import edu.poly.demoDuAn2.utils.HashUtil;

@Controller
@RequestMapping("/dangky")
public class signUpController {
	
	@Autowired
	private khachHangReponsitory khachhangRepo;

	@Autowired
	private khachHangMapper mapper;

	@GetMapping()
	public String dangky(Model models, KhachHang kh) {
		khachHangDTO dto = this.mapper.convertToDTO(kh);
		models.addAttribute("user", dto);
		return "/auth/dangKy";
	}

	@PostMapping(value = "/store")
	public String store(Model models, @Valid khachHangDTO khachHang, BindingResult result) {

		KhachHang entity = this.mapper.convertToEntity(khachHang);

		String hashedPassword = HashUtil.hash(entity.getMatKhau());
		entity.setMatKhau(hashedPassword);

		this.khachhangRepo.save(entity);

		return "redirect:/login";

	}
}

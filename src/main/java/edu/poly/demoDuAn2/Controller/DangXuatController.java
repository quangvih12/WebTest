package edu.poly.demoDuAn2.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/DangXuat")
public class DangXuatController {
          @GetMapping
          public String dangXuat() {
        	  return "redirect:/login";
          }
}

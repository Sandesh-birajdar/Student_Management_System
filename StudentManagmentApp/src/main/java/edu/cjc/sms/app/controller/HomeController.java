package edu.cjc.sms.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import edu.cjc.sms.app.model.Student;
import edu.cjc.sms.app.service.StudentServiceI;



@Controller
public class HomeController {
	
	@Autowired
	StudentServiceI ssi;
	
	
	@RequestMapping("/")
	public String preLogin() {
		return "login";
	}
	
	@RequestMapping("/login")
	public String adminlogin(@RequestParam("username") String un ,@RequestParam("password") String ps,Model m) {
		if(un.equals("admin") && ps.equals("admin")) {
			return "adminscreen";
		}else {
			m.addAttribute("login_fail", "Enter Valid details");
			return "login";
		}
	}
	
	
	@RequestMapping("enroll_student")
	public String saveStudent(@ModelAttribute Student stu) {
		ssi.saveStudentData(stu);
		return "success";
		
	}
	

}

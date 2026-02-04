package edu.cjc.sms.app.controller;

import java.util.List;

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
			List<Student> list = ssi.getStudentData();
			m.addAttribute("data", list);
			return "adminscreen";
		}else {
			m.addAttribute("login_fail", "Enter Valid details");
			return "login";
		}
	}
	
	
	@RequestMapping("enroll_student")
	public String saveStudent(@ModelAttribute Student stu) {
		ssi.saveStudentData(stu);
		return "adminscreen";
		
	}
	
	@RequestMapping("/getall")
	public String getAllStudent(@ModelAttribute Student stu, Model m) {
		List<Student> list = ssi.getStudentData();
		m.addAttribute("data", list);
		return "adminscreen";
		
	}
	
	@RequestMapping("/delete")
	public String deleteStudent(@RequestParam("studentId") int studentId,Model m) {
		List<Student> list = ssi.removeStudent(studentId); 
		m.addAttribute("data", list);
		return "adminscreen";
		
	}
	
	
	@RequestMapping("/search")
	public String searchbyBatch(@RequestParam("batchNumber") String bn,@RequestParam("batchMode") String bm,Model m) {
		List<Student> list = ssi.searchStudentByBatchandMode(bn,bm);
		if(list.size() > 0) {
			m.addAttribute("data",list);
		}else {
			List<Student> stu = ssi.getStudentData();
			m.addAttribute("data",stu);
			m.addAttribute("message", "No record available for the Batch ' "+bn +"  'and ' "+bm +"  ' ..!");
		}
		return "adminscreen";
	}
	

}

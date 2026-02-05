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
	
	@RequestMapping("/logout")
	public String loginpage() {
		return "login";
		
	}
	
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
	public String searchbyBatch(@RequestParam("batchNumber") String bn,Model m) {
		List<Student> list = ssi.searchStudentByBatch(bn);
		if(list.size() > 0) {
			m.addAttribute("data",list);
		}else {
			List<Student> stu = ssi.getStudentData();
			m.addAttribute("data",stu);
			m.addAttribute("message", "No record available for the Batch ' "+bn +"  ' ..!");
		}
		return "adminscreen";
	}
	
	
	@RequestMapping("/paging")
	public String paging(@RequestParam("pageNo") int pageNo,Model m) {
		int size=2;
		
		List<Student> list = ssi.paging(pageNo,size);
		m.addAttribute("data",list);
		return "adminscreen";
	}
	
	@RequestMapping("/fees")
	public  String onFees(@RequestParam("id") int studentId,Model m) {
		Student st=ssi.getSingleStudent(studentId);
		m.addAttribute("st",st);
		return "fees";
		
	}
	
	@RequestMapping("/payfees")
	public String payfees(@RequestParam("studentId") int studentId,@RequestParam("amount") double amount,Model m) {
		
		ssi.updateStudentfee(studentId,amount);
		List<Student> list = ssi.getStudentData();
		return "adminscreen";
		
	}
	
	
	@RequestMapping("/batch")
	public  String onBatch(@RequestParam("id") int studentId,Model m) {
		Student st=ssi.getSingleStudent(studentId);
		m.addAttribute("st",st);
		return "batch";
		
	}
	
	@RequestMapping("/batchchange")
	public String batchChange(@RequestParam("studentId") int studentId,@RequestParam("batchNumber") String batchNumber,Model m) {
		ssi.updateStudentBatch(studentId,batchNumber);
		List<Student> list = ssi.getStudentData();
		return "adminscreen";
		
	}
	
	

}

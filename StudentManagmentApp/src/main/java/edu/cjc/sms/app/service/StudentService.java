package edu.cjc.sms.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.cjc.sms.app.model.Student;
import edu.cjc.sms.app.repositaray.StudentRepository;

@Service
public class StudentService  implements StudentServiceI{

	@Autowired
	StudentRepository sri;
	
	@Override
	public void saveStudentData(Student stu) {
		sri.save(stu);
		System.out.println("Data Saved succesfully");
		
	}

	@Override
	public List<Student> getStudentData() {
		return sri.findAll();
		
	}

	@Override
	public List<Student> removeStudent(int studentId) {
		sri.deleteById(studentId);
		List<Student> list = sri.findAll();
		return list;
		
	}

	@Override
	public List<Student> searchStudentByBatchandMode(String bn,String bm) {
		return sri.findAllByBatchNumberOrBatchMode(bn,bm);
		
		
	}

}

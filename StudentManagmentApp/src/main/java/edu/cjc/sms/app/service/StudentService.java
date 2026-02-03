package edu.cjc.sms.app.service;

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

}

package edu.cjc.sms.app.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
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
	public List<Student> searchStudentByBatch(String bn) {
		return sri.findAllByBatchNumber(bn);
		
		
	}

	@Override
	public List<Student> paging(int pageNo, int size) {
		  List<Student> l = sri.findAll(PageRequest.of(pageNo, size)).getContent();
		return l;
	}

	@Override
	public Student getSingleStudent(int studentId) {
		
		return sri.findById(studentId).get();
	}

	@Override
	public void updateStudentfee(int studentId, double amount) {
		Student s = sri.findById(studentId).get();
		s.setFeesPaid(s.getFeesPaid()+amount);
		sri.save(s);
		
	}

	@Override
	public void updateStudentBatch(int studentId, String batchNumber) {
		Student s= sri.findById(studentId).get();
		s.setBatchNumber(batchNumber);
		sri.save(s);
		
	}

}

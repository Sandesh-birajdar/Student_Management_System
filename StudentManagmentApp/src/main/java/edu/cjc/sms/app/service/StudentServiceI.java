package edu.cjc.sms.app.service;

import java.util.List;

import edu.cjc.sms.app.model.Student;

public interface StudentServiceI {
	
	public void saveStudentData(Student stu);
	public List<Student> getStudentData();
	public List<Student> removeStudent(int studentId);
	public List<Student> searchStudentByBatch(String bn);
	public List<Student> paging(int pageNo, int size);
	public Student getSingleStudent(int studentId);
	public void updateStudentfee(int studentId, double amount);
	public void updateStudentBatch(int studentId, String batchNumber);

}

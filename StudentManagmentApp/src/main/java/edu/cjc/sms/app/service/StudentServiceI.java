package edu.cjc.sms.app.service;

import java.util.List;

import edu.cjc.sms.app.model.Student;

public interface StudentServiceI {
	
	public void saveStudentData(Student stu);
	public List<Student> getStudentData();
	public List<Student> removeStudent(int studentId);
	public List<Student> searchStudentByBatchandMode(String bn,String bm);

}

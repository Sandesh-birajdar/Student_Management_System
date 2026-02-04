package edu.cjc.sms.app.repositaray;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import edu.cjc.sms.app.model.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer>{
	
	public List<Student> findAllByBatchNumberOrBatchMode(String bn ,String bm);

}

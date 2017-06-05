package com.yanwu.www.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanwu.www.dao.StudentDao;
import com.yanwu.www.domain.Student;
import com.yanwu.www.service.StudentService;

@Service
public class StudentServiceImpl  implements StudentService{
	
	@Autowired
	StudentDao studenDao;
	
	public Student login(Student student) {
		Student student0=studenDao.getStudent(student);
		return  student0;
	}

	public  void update(Student student) throws Exception {
		// TODO Auto-generated method stub
		try{
			
			studenDao.updateStudent(student);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			throw new Exception("update failed");
			
		}
		
	}

}

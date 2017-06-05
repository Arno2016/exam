package com.yanwu.www.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yanwu.www.domain.PageBean;
import com.yanwu.www.domain.Student;

@Repository
public interface StudentDao {
	/*
	 * 查询学习
	 */
	Student getStudent(Student student);
	
	/*
	 * 利用id进行唯一查询
	 */
	Student getStudentById(String id);
	
	/*
	 * 保存学生
	 */
	void saveStudent(Student student);
	
	/*
	 * 查询学生
	 */
	List<Student> getStudents(Student s_student,PageBean pageBean);
	
	/*
	 * 删除学生
	 */
	void studentDelete(Student student);
	
	/*
	 * 更新学生信息
	 * 
	 */
	void updateStudent(Student student);
	
	
}

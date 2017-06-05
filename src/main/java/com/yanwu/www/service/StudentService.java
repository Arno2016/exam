package com.yanwu.www.service;

import org.springframework.stereotype.Service;

import com.yanwu.www.domain.Student;

@Service
public interface StudentService {
	Student login(Student student);
	void update(Student student) throws Exception;
}

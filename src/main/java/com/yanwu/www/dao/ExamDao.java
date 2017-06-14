package com.yanwu.www.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yanwu.www.domain.Exam;
import com.yanwu.www.domain.PageBean;
import com.yanwu.www.domain.Student;

@Repository
public interface ExamDao {
	void saveExam(Exam exam)throws Exception;
	Map getExams(Student student,PageBean pageBean) throws Exception;
	int examCount(Exam s_exam)throws Exception;
}

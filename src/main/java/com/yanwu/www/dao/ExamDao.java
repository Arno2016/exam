package com.yanwu.www.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yanwu.www.domain.Exam;
import com.yanwu.www.domain.PageBean;

@Repository
public interface ExamDao {
	void saveExam(Exam exam)throws Exception;
	List<Exam> getExams(String id,PageBean pageBean) throws Exception;
	int examCount(Exam s_exam)throws Exception;
}

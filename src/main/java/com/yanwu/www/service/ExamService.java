package com.yanwu.www.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.yanwu.www.domain.Exam;
import com.yanwu.www.domain.PageBean;
import com.yanwu.www.domain.Student;

@Service
public interface ExamService {
	String list()throws Exception;
	Map getExams(Student student,PageBean page)throws Exception;
	int calScore(String questionId,String userAnswer,String type) throws Exception;
	void saveExam(Exam exam) throws Exception;
}

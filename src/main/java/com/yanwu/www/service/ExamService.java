package com.yanwu.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yanwu.www.domain.Exam;
import com.yanwu.www.domain.PageBean;

@Service
public interface ExamService {
	String list()throws Exception;
	List<Exam> getExams(String studentId,PageBean page)throws Exception;
	int calScore(String questionId,String userAnswer,String type) throws Exception;
}

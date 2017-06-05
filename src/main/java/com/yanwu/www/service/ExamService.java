package com.yanwu.www.service;

import org.springframework.stereotype.Service;

@Service
public interface ExamService {
	String list()throws Exception;
	String getExams()throws Exception;
	int calScore(String questionId,String userAnswer,String type) throws Exception;
}

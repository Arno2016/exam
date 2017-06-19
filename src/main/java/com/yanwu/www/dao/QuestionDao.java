package com.yanwu.www.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

import com.yanwu.www.domain.PageBean;
import com.yanwu.www.domain.Question;

@Repository
public interface QuestionDao {
	Question getQuestion(String questionId)throws Exception;
	Map getQuestions(PageBean pageBean)throws Exception;
	void questionDelete(Question question)throws Exception;
	void saveQuestion(Question question)throws Exception;
}

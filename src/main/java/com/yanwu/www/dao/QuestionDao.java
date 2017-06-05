package com.yanwu.www.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yanwu.www.domain.PageBean;
import com.yanwu.www.domain.Question;

@Repository
public interface QuestionDao {
	Question getQuestion(String questionId)throws Exception;
	List<Question> getQuestions(Question s_question,PageBean pageBean)throws Exception;
	void questionDelete(Question question)throws Exception;
	void saveQuestion(Question question)throws Exception;
}

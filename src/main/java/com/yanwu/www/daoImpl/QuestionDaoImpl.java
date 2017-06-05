package com.yanwu.www.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yanwu.www.dao.QuestionDao;
import com.yanwu.www.domain.PageBean;
import com.yanwu.www.domain.Question;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	
	@Autowired
	private SessionFactory sessionFactory;


	public Question getQuestion(String questionId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Question> getQuestions(Question s_question, PageBean pageBean) throws Exception {
		// TODO Auto-generated method stub
		
		return null;
	}

	public void questionDelete(Question question) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void saveQuestion(Question question) throws Exception {
		// TODO Auto-generated method stub
		
	}

}

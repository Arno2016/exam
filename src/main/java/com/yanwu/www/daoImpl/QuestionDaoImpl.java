package com.yanwu.www.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		Session session=sessionFactory.getCurrentSession();
		String hql="from Question q where q.id=:id";
		Query query=session.createQuery(hql);
		query.setString("id", questionId);
		Question question=(Question) query.uniqueResult();
		return question;
	}

	public Map getQuestions(PageBean page) throws Exception {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql=new StringBuffer();
		hql.append("from Question q");
		Query query=session.createQuery(hql.toString());
		page.setCount(query.list().size());
		map.put("page", page);
		query.setFirstResult(page.getStart());
		query.setMaxResults(page.getPageSize());
		List<Question> questionList=query.list();
		map.put("questionList", questionList);
		return map;
	}

	public void questionDelete(Question question) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void saveQuestion(Question question) throws Exception {
		// TODO Auto-generated method stub
		
	}

}

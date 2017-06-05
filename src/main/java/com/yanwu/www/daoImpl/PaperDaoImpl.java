package com.yanwu.www.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yanwu.www.dao.PaperDao;
import com.yanwu.www.domain.Paper;

@Repository
public class PaperDaoImpl implements PaperDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	public List<Paper> getPapers() throws Exception {
		Session session=sessionFactory.getCurrentSession();
		String hql="from Paper p";
		Query query=session.createQuery(hql);
		List<Paper> paperList=query.list();
		return paperList;
	}

	public Paper getPaper(String paperId) throws Exception {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String hql="from Paper p where p.id=:paperId";
		Query query=session.createQuery(hql);
		query.setString("paperId", paperId);
		Paper paper=(Paper) query.uniqueResult();
		return paper;
	}

	public String paperDelete(Paper paper) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public String savePaper(Paper paper) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}

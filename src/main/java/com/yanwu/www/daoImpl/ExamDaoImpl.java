package com.yanwu.www.daoImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yanwu.www.dao.ExamDao;
import com.yanwu.www.domain.Exam;
import com.yanwu.www.domain.PageBean;

@Repository
public class ExamDaoImpl implements ExamDao {
	
	@Autowired
	SessionFactory sessionFactory;

	public void saveExam(Exam exam) throws Exception {
		// TODO Auto-generated method stub
		
		
	}

	public List<Exam> getExams(String studentId, PageBean page) throws Exception {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		String hql="from Exam e where e.student.id=:studentId order by e.examDate desc";
		Query query=session.createQuery(hql);
		query.setString("studentId", studentId);
		query.setFirstResult(page.getStart());
		query.setMaxResults(page.getPageSize());
		List<Exam> examList=query.list();
		return examList;
	}

	public int examCount(Exam s_exam) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}

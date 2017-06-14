package com.yanwu.www.daoImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yanwu.www.dao.ExamDao;
import com.yanwu.www.domain.Exam;
import com.yanwu.www.domain.PageBean;
import com.yanwu.www.domain.Student;

@Repository
public class ExamDaoImpl implements ExamDao {
	
	@Autowired
	SessionFactory sessionFactory;

	public void saveExam(Exam exam) throws Exception {
		// TODO Auto-generated method stub
		Session session =sessionFactory.getCurrentSession();
		session.save(exam);
	}

	public Map getExams(Student student, PageBean page) throws Exception {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		Session session=sessionFactory.getCurrentSession();
		StringBuffer hql=new StringBuffer();
		hql.append("from Exam e where 1=1 ");
		if(!student.getId().isEmpty() && student.getId()!=null && !"".equals(student.getId())){
			hql.append(" and e.student.id='"+student.getId()+"'");
		}
		if(!student.getName().isEmpty()){
			hql.append(" and e.student.name='"+student.getName()+"'");
		}
		hql.append(" order by e.examDate desc");
		Query query=session.createQuery(hql.toString());
		page.setCount(query.list().size());
		query.setFirstResult(page.getStart());
		query.setMaxResults(page.getPageSize());
		List<Exam> examList=query.list();
		map.put("examList", examList);
		map.put("page", page);
		return map;
	}

	public int examCount(Exam s_exam) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}

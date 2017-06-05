package com.yanwu.www.daoImpl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.FlushMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.yanwu.www.dao.StudentDao;
import com.yanwu.www.domain.PageBean;
import com.yanwu.www.domain.Student;

@Repository
public class StudentDaoImpl  implements StudentDao{
	

	@Autowired
	SessionFactory sessionFactory;
	
	public Student getStudent(Student student) {
		// TODO Auto-generated method stub
				Session session=sessionFactory.getCurrentSession();
				String hql="from Student s where s.id=:id and s.password=:password";
				Query query=session.createQuery(hql);
				query.setString("id", student.getId());
				query.setString("password", student.getPassword());
				Student resultStu=(Student)query.uniqueResult();
				return resultStu;
	}
	
	public Student getStudentById(String id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		System.out.println(session.getFlushMode());
		session.setFlushMode(FlushMode.AUTO);
		String hql="from Student s where s.id=:id";
		Query query=session.createQuery(hql);
		query.setString("id", id);
		Student resultStu=(Student)query.uniqueResult();
		return resultStu;
	}

	public void saveStudent(Student student) {
		Session session=sessionFactory.getCurrentSession();
		session.save(student);
	}

	public List<Student> getStudents(Student s_student, PageBean pageBean) {
		// TODO Auto-generated method stub
		return null;
	}

	public void studentDelete(Student student) {
		// TODO Auto-generated method stub
		
	}

	public void updateStudent(Student student) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		//session.setFlushMode(FlushMode.AUTO);
		String hql="update Student s set password=:password  where s.id=:id";
		Query query=session.createQuery(hql);
		query.setString("id", student.getId());
		query.setString("password", student.getPassword());
		query.executeUpdate();
		
	}

	
}

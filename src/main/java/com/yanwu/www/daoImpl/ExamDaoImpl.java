package com.yanwu.www.daoImpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yanwu.www.dao.ExamDao;
import com.yanwu.www.domain.Exam;
import com.yanwu.www.domain.PageBean;

@Repository
public class ExamDaoImpl implements ExamDao {

	public void saveExam(Exam exam) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public List<Exam> getExams(Exam s_exam, PageBean pageBean) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public int examCount(Exam s_exam) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}

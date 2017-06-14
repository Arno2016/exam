package com.yanwu.www.serviceImpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanwu.www.dao.ExamDao;
import com.yanwu.www.dao.QuestionDao;
import com.yanwu.www.domain.Exam;
import com.yanwu.www.domain.PageBean;
import com.yanwu.www.domain.Question;
import com.yanwu.www.domain.Student;
import com.yanwu.www.service.ExamService;

@Service
public class ExamServiceImpl implements ExamService{
	
	@Autowired
	private QuestionDao questionDao;
	
	@Autowired
	private ExamDao examDao;
	
	private final int singleScore=20; //单选得分
	private final int mulScore=30; //多选得分


	public String list() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Map getExams(Student student,PageBean page) throws Exception {
		// TODO Auto-generated method stub
		Map map=new HashMap();
		map=examDao.getExams(student, page);
		return map;
	}

	public int calScore(String questionId, String userAnswer, String type) throws Exception {
		// TODO Auto-generated method stub
		Question question =questionDao.getQuestion(questionId);
		if(question.getAnswer().equals(userAnswer)){
			if("1".equals(type)){
				return singleScore;
			}else if("2".equals(type)){
				return mulScore;
			}else{
				return 0;
			}
			
		}else{
			return 0;
		}
	}

	public void saveExam(Exam exam) throws Exception {
		// TODO Auto-generated method stub
		
		exam.setExamDate(new Date());
		
		examDao.saveExam(exam);
		
	}

}

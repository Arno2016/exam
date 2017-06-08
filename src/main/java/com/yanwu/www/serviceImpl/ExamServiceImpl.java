package com.yanwu.www.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanwu.www.dao.ExamDao;
import com.yanwu.www.dao.QuestionDao;
import com.yanwu.www.domain.Exam;
import com.yanwu.www.domain.PageBean;
import com.yanwu.www.domain.Question;
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

	public List<Exam> getExams(String studentId,PageBean page) throws Exception {
		// TODO Auto-generated method stub
		List<Exam> examList=examDao.getExams(studentId, page);
		return examList;
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

}

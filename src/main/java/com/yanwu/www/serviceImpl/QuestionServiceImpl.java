package com.yanwu.www.serviceImpl;

import java.util.ArrayList;

/*
 * @author harvey
 * 
 */

import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanwu.www.dao.QuestionDao;
import com.yanwu.www.domain.PageBean;
import com.yanwu.www.service.QuestionService;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	private QuestionDao questionDao;

	public Map questionPage(PageBean page) throws Exception {
		// TODO Auto-generated method stub
		Map map=new HashedMap();
		map=questionDao.getQuestions(page);
		return map;
	}

}

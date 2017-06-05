package com.yanwu.www.serviceImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yanwu.www.dao.PaperDao;
import com.yanwu.www.domain.Paper;
import com.yanwu.www.service.PaperService;

@Service
public class PaperServiceImpl  implements PaperService{
	
	@Autowired
	private PaperDao paperDao;

	public List<Paper> getPapers() throws Exception {
		// TODO Auto-generated method stub
		List<Paper> paperList=paperDao.getPapers();
		
		return paperList;
	}

	public Paper getPaper(String paperId) throws Exception {
		// TODO Auto-generated method stub
		Paper paper=paperDao.getPaper(paperId);
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

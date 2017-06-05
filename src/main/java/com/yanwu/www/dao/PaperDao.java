package com.yanwu.www.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.yanwu.www.domain.Paper;

@Repository
public interface PaperDao {
	List<Paper> getPapers() throws Exception;
	Paper getPaper(String paperId) throws Exception;
	String paperDelete(Paper paper) throws Exception;
	String savePaper(Paper paper) throws Exception;
}

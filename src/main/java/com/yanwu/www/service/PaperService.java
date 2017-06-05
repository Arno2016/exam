package com.yanwu.www.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yanwu.www.domain.Paper;

@Service
public interface PaperService {
	List<Paper> getPapers() throws Exception;
	Paper getPaper(String paperId) throws Exception;
	String paperDelete(Paper paper) throws Exception;
	String savePaper(Paper paper) throws Exception;
}

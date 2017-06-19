package com.yanwu.www.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.yanwu.www.domain.PageBean;
import com.yanwu.www.domain.Question;

@Service
public interface QuestionService {
	Map questionPage(PageBean page) throws Exception;
}

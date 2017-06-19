package com.yanwu.www.controller;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yanwu.www.domain.PageBean;
import com.yanwu.www.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	private String mainPage;
	
	@Autowired
	private QuestionService questionService; 
	
	@RequestMapping("/questionList")
	public String questionList(HttpServletRequest request,PageBean page,Model model){
		page.setPageSize(10);
		Map map=new HashMap();
		try {
			map=questionService.questionPage(page);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("map", map);
		mainPage="/WEB-INF/views/question/questionList.jsp";
		request.setAttribute("mainPage", mainPage);
		return "main";
	}
	
	
}

package com.yanwu.www.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yanwu.www.domain.Paper;
import com.yanwu.www.service.PaperService;

@Controller
@RequestMapping("/examPage")
public class ExamController {
	
	private String mainPage;
	
	@Autowired
	private PaperService paperService;
	
	@RequestMapping("selectPaper")
	public String selectPaper(HttpServletRequest request,Model model){
		
		try {
			List<Paper> paperList=paperService.getPapers();
			model.addAttribute("paperList", paperList);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mainPage="/WEB-INF/views/exam/selectPaper.jsp";
		request.setAttribute("mainPage", mainPage);
		return "main";
	}

}

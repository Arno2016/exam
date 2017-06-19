package com.yanwu.www.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yanwu.www.domain.Paper;
import com.yanwu.www.domain.Question;
import com.yanwu.www.service.PaperService;

@Controller
@RequestMapping("/paper")
public class PaperController {
	
	private String mainPage;
	
	@Autowired
	private PaperService paperService;
	
	@RequestMapping("/paperDetail")
	public String paperDetail(HttpServletRequest request,String paperId,Model model){
		List<Question> squestionList=new ArrayList<Question>();
		List<Question> mquestionList=new ArrayList<Question>();
		try {
			Paper paper=paperService.getPaper(paperId);
			List<Question> questionList=new ArrayList<Question>(paper.getQuestions());
			for(Question q:questionList){
				if("1".equals(q.getType())){
					squestionList.add(q);
				}else if("2".equals(q.getType())){
					mquestionList.add(q);
				}
			}
			model.addAttribute("paper", paper);
			model.addAttribute("squestionList", squestionList);
			model.addAttribute("mquestionList", mquestionList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mainPage="/WEB-INF/views/exam/Paper.jsp";
		request.setAttribute("mainPage", mainPage);
		return "main";
		
	}
	
	@RequestMapping("/paperList")
	public String paperList(HttpServletRequest request,Model model){
		List<Paper> paperList=new ArrayList<Paper>();
		try {
			paperList=paperService.getPapers();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("paperList", paperList);
		mainPage="/WEB-INF/views/paper/paperList.jsp";
		request.setAttribute("mainPage", mainPage);
		return "main";
	}
	
	@RequestMapping("/paperSave")
	public String paperSave(HttpServletRequest request,Paper paper){
		mainPage="/WEB-INF/views/paper/paperSave.jsp";
		request.setAttribute("mainPage", mainPage);
		return "main";
	}
	
	
	
	
}
